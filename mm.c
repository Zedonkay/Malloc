/**
 * @file mm.c
 * @brief A 64-bit struct-based implicit free list memory allocator
 *
 * 15-213: Introduction to Computer Systems
 *
 * TODO: Free abd allocated blocks are all in the heap which is just a heap.
 * Whether a block is alloced,its prev is alloced,its a mini and its prev is a
 *mini are all packed into the header. Additionally, there are no footers except
 *with non mini unalloced blocks to allow traversing into these and also to
 *maximize utilization The free list is a list of lists where every free block
 *is sorted into one of the lists dependign on its size. Smaller lists increase
 *in size by a smaller amount (disize) Whereas larger lists increase in max size
 *by powers of two. This is doen to maximize score (find a good balance between
 *speed and space). ALl lists except for the mini block free list are doubly
 *linked lists that are null terminated on both ends. The mini block free list
 *is only singly linked Allocater manipulates the free list by prepending to
 *start of the linked list or removing and fixing pointers around it
 *
 *************************************************************************
 *
 * ADVICE FOR STUDENTS.
 * - Step 0: Please read the writeup!
 * - Step 1: Write your heap checker.
 * - Step 2: Write contracts / debugging assert statements.
 * - Good luck, and have fun!
 *
 *************************************************************************
 *
 * @author Your Name <ishikhar@andrew.cmu.edu>
 */

#include <assert.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "memlib.h"
#include "mm.h"

/* Do not change the following! */

#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#define memset mem_memset
#define memcpy mem_memcpy
#endif /* def DRIVER */

/* You can change anything from here onward */

/*
 *****************************************************************************
 * If DEBUG is defined (such as when running mdriver-dbg), these macros      *
 * are enabled. You can use them to print debugging output and to check      *
 * contracts only in debug mode.                                             *
 *                                                                           *
 * Only debugging macros with names beginning "dbg_" are allowed.            *
 * You may not define any other macros having arguments.                     *
 *****************************************************************************
 */
#ifdef DEBUG
/* When DEBUG is defined, these form aliases to useful functions */
#define dbg_requires(expr) assert(expr)
#define dbg_assert(expr) assert(expr)
#define dbg_ensures(expr) assert(expr)
#define dbg_printf(...) ((void)printf(__VA_ARGS__))
#define dbg_printheap(...) dbg_print_heap(__VA_ARGS__)
#else
/* When DEBUG is not defined, these should emit no code whatsoever,
 * not even from evaluation of argument expressions.  However,
 * argument expressions should still be syntax-checked and should
 * count as uses of any variables involved.  This used to use a
 * straightforward hack involving sizeof(), but that can sometimes
 * provoke warnings about misuse of sizeof().  I _hope_ that this
 * newer, less straightforward hack will be more robust.
 * Hat tip to Stack Overflow poster chqrlie (see
 * https://stackoverflow.com/questions/72647780).
 */
#define dbg_discard_expr_(...) ((void)((0) && printf(__VA_ARGS__)))
#define dbg_requires(expr) dbg_discard_expr_("%d", !(expr))
#define dbg_assert(expr) dbg_discard_expr_("%d", !(expr))
#define dbg_ensures(expr) dbg_discard_expr_("%d", !(expr))
#define dbg_printf(...) dbg_discard_expr_(__VA_ARGS__)
#define dbg_printheap(...) ((void)((0) && dbg_print_heap(__VA_ARGS__)))
#endif

/* Basic constants */

typedef uint64_t word_t;

/** @brief Word and header size (bytes) */
static const size_t wsize = sizeof(word_t);

/** @brief Double word size (bytes) */
static const size_t dsize = 2 * wsize;

/** @brief Minimum block size (bytes) */
static const size_t min_block_size = 2 * wsize;

static const size_t mini_size = min_block_size;
/**
 Chunksize is the minimum size by which we extend our heap
 */
static const size_t chunksize = (1 << 10);

/**
 * TODO: explain what alloc_mask is
 */
static const word_t alloc_mask = 0x1;

static const word_t mini_mask = 0x2;

static const word_t prev_alloc_mask = 0x4;

static const word_t prev_mini_mask = 0x8;

/**
 * TODO: explain what size_mask is
 * size mask si a mask that allows us to get the portion of our header that
 * encodes the size
 */
static const word_t size_mask = ~(word_t)0xF;

// static const word_t block_mask = size_mask & alloc_mask & mini_mask &
// prev_alloc_mask & prev_mini_mask;

/** @brief Represents the header and payload of one block in the heap */
typedef struct block {
    /** @brief Header contains size + allocation flag */
    word_t header;

    union {
        struct {
            struct block *next;
            struct block *prev;
        } pointers;
        char payload[0];
    };

} block_t;
/* Global variables */

/** @brief Pointer to first block in the heap */
static block_t *heap_start = NULL;
static block_t *heap_end = NULL;
static size_t seg_list_size = 14;
static block_t *seg_list[14];
static size_t seg_list_small_incr = 4;
static size_t better_fit_param = 4;

/*
 *****************************************************************************
 * The functions below are short wrapper functions to perform                *
 * bit manipulation, pointer arithmetic, and other helper operations.        *
 *                                                                           *
 * We've given you the function header comments for the functions below      *
 * to help you understand how this baseline code works.                      *
 *                                                                           *
 * Note that these function header comments are short since the functions    *
 * they are describing are short as well; you will need to provide           *
 * adequate details for the functions that you write yourself!               *
 **************************************************************nt***************
 */

/*
 * ---------------------------------------------------------------------------
 *                        BEGIN SHORT HELPER FUNCTIONS
 * ---------------------------------------------------------------------------
 */
/**
 * @brief Returns the seg list index for a given block size
 *
 * Loops through and finds the best fitting seg list
 *
 * @param[in] block_size (the size of the block we are trying to find which seg
 * list would contain blocks bigger than or equal to it)
 * @return The seg list index with blocks we can find a fit in
 */
static size_t get_list_ind(size_t block_size) {
    size_t size = 16;
    for (size_t index = 0; index < (seg_list_size - 1); index++) {
        if (block_size <= size) {
            return index;
        }
        if (index < seg_list_small_incr) {
            size += dsize;
        } else {
            size *= 2;
        }
    }
    return (seg_list_size - 1);
}

/**
 * @brief Returns the maximum of two integers.
 * @param[in] x
 * @param[in] y
 * @return `x` if `x > y`, and `y` otherwise.
 */
static size_t max(size_t x, size_t y) {
    return (x > y) ? x : y;
}

/**
 * @brief Rounds `size` up to next multiple of n
 * @param[in] size
 * @param[in] n
 * @return The size after rounding up
 */
static size_t round_up(size_t size, size_t n) {
    return n * ((size + (n - 1)) / n);
}

/**
 * @brief Packs the `size` and `alloc` of a block into a word suitable for
 *        use as a packed value.
 *
 * Packed values are used for both headers and footers.
 *
 * The allocation status is packed into the lowest bit of the word.
 *
 * @param[in] size The size of the block being represented
 * @param[in] alloc True if the block is allocated
 * @return The packed value
 */
static word_t pack(size_t size, bool prev_alloc, bool alloc, bool prev_mini,
                   bool mini) {
    word_t word = size;
    if (alloc) {
        word |= alloc_mask;
    }
    if (prev_alloc) {
        word |= (prev_alloc_mask);
    }
    if (mini) {
        word |= (mini_mask);
    }
    if (prev_mini) {
        word |= prev_mini_mask;
    }
    return word;
}
/**
 * @brief Returns the offset of a given block from a given start block
 *
 *  Does pointer arithmetic on the two blocks
 *
 * @param[in] offsetted - the offsetted block
 * @param[in] start - the start block
 * @return The offset between the two blocks
 */

static size_t get_offset(block_t *offsetted, block_t *start) {
    return (size_t)((char *)offsetted - (char *)start);
}
/**
 * @brief Returns the allocation status of a given header value.
 *
 * This is based on the lowest bit of the header value.
 *
 * @param[in] word
 * @return The allocation status correpsonding to the word
 */
static bool extract_alloc(word_t word) {
    return (bool)(word & alloc_mask);
}

/**
 * @brief Returns the allocation status of a block, based on its header.
 * @param[in] block
 * @return The allocation status of the block
 */
static bool get_alloc(block_t *block) {
    return extract_alloc(block->header);
}
/**
 * @brief Returns the prev allocation status of a block, based on its header.
 * @param[in] block
 * @return The prev allocation status of the block
 */
static bool get_prev_alloc(block_t *block) {
    if (block == heap_start) {
        return true;
    }
    return (bool)(block->header & prev_alloc_mask);
}
/**
 * @brief Returns the prev mini status of a block, based on its header.
 * @param[in] block
 * @return The prev mini status of the block
 */
static bool get_prev_mini(block_t *block) {
    if (block == heap_start) {
        return false;
    }
    return (bool)(block->header & prev_mini_mask);
}
/**
 * @brief Returns the mini status of a block, based on its header.
 * @param[in] block
 * @return The mini status of the block
 */
static bool get_mini(block_t *block) {
    return (bool)(block->header & mini_mask);
}
/**
 * @brief Extracts the size represented in a packed word.
 *
 * This function simply clears the lowest 4 bits of the word, as the heap
 * is 16-byte aligned.
 *
 * @param[in] word
 * @return The size of the block represented by the word
 */

static size_t extract_size(word_t word) {
    return (word & size_mask);
}

/**
 * @brief Extracts the size of a block from its header.
 * @param[in] block
 * @return The size of the block
 */
static size_t get_size(block_t *block) {
    dbg_requires(block != NULL);
    return extract_size(block->header);
}

/**
 * @brief Given a payload pointer, returns a pointer to the corresponding
 *        block.
 * @param[in] bp A pointer to a block's payload
 * @return The corresponding block
 */
static block_t *payload_to_header(void *bp) {
    return (block_t *)((char *)bp - offsetof(block_t, payload));
}

/**
 * @brief Given a block pointer, returns a pointer to the corresponding
 *        payload.
 * @param[in] block
 * @return A pointer to the block's payload
 * @pre The block must be a valid block, not a boundary tag.
 */
static void *header_to_payload(block_t *block) {
    dbg_requires(get_size(block) != 0);
    return (void *)(block->payload);
}

/**
 * @brief Given a block pointer, returns a pointer to the corresponding
 *        footer.
 * @param[in] block
 * @return A pointer to the block's footer
 * @pre The block must be a valid block, not a boundary tag.
 */
static word_t *header_to_footer(block_t *block) {
    dbg_requires(get_size(block) != 0 &&
                 "Called header_to_footer on the epilogue block");
    size_t block_size = get_size(block);
    return (word_t *)(block->payload + block_size - dsize);
}

/**
 * @brief Given a block footer, returns a pointer to the corresponding
 *        header.
 * @param[in] footer A pointer to the block's footer
 * @return A pointer to the start of the block
 * @pre The footer must be the footer of a valid block, not a boundary tag.
 */
static block_t *footer_to_header(word_t *footer) {
    size_t size = extract_size(*footer);
    dbg_assert(size != 0 && "Called footer_to_header on the prologue block");
    return (block_t *)((char *)footer + wsize - size);
}

/**
 * @brief Returns the payload size of a given block.
 *
 * The payload size is equal to the entire block size minus the sizes of the
 * block's header and footer.
 *
 * @param[in] block
 * @return The size of the block's payload
 */
static size_t get_payload_size(block_t *block) {
    size_t asize = get_size(block);
    return asize - wsize;
}

/**
 * @brief Writes an epilogue header at the given address.
 *
 * The epilogue header has size 0, and is marked as allocated.
 * @param[in] block - given block to write at
 * @param[in] prev_mini - whether or not the block before the epilogue is a mini
 *
 * @param[out] block The location to write the epilogue header
 */
static void write_epilogue(block_t *block, bool prev_mini) {
    dbg_requires(block != NULL);
    dbg_requires((char *)block == (char *)mem_heap_hi() - 7);
    bool prev_alloc = false;
    if (heap_end != NULL) {
        prev_alloc = get_alloc(heap_end);
    }
    block->header = pack(0, prev_alloc, true, prev_mini, false);
}

/**
 * @brief Finds the next consecutive block on the heap.
 *
 * This function accesses the next block in the "implicit list" of the heap
 * by adding the size of the block.
 *
 * @param[in] block A block in the heap
 * @return The next consecutive block on the heap
 * @pre The block is not the epilogue
 */
static block_t *find_next(block_t *block) {
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) != 0 &&
                 "Called find_next on the last block in the heap");
    size_t block_size = get_size(block);
    return (block_t *)((char *)block + block_size);
}
/**
 * @brief Finds the footer of the previous block on the heap.
 * @param[in] block A block in the heap
 * @return The location of the previous block's footer
 */
static word_t *find_prev_footer(block_t *block) {
    // Compute previous footer position as one word before the header
    return &(block->header) - 1;
}

/**
 * @brief Finds the previous consecutive block on the heap.
 *
 * This is the previous block in the "implicit list" of the heap.
 *
 * If the function is called on the first block in the heap, NULL will be
 * returned, since the first block in the heap has no previous block!
 *
 * The position of the previous block is found by reading the previous
 * block's footer to determine its size, then calculating the start of the
 * previous block based on its size.
 *
 * @param[in] block A block in the heap
 * @return The previous consecutive block in the heap.
 */
static block_t *find_prev(block_t *block) {
    dbg_requires(block != NULL);
    word_t *footerp = find_prev_footer(block);

    // Return NULL if called on first block in the heap
    if (extract_size(*footerp) == 0) {
        return NULL;
    }

    return footer_to_header(footerp);
}
/**
 * @brief Finds the previous consecutive block on the heap given that the
 * prevous block is a mini block
 *
 * This is the previous block in the "implicit list" of the heap.
 *
 *
 * The position of the previous block is found by doing pointer arithmetic using
 * the size of a mini block
 *
 * @param[in] block A block in the heap
 * @return The previous consecutive block in the heap.
 */

static block_t *find_prev_mini(block_t *block) {
    dbg_requires(block != NULL);
    return ((block_t *)(((char *)block) - mini_size));
}
/**
 * @brief Finds the epilogue
 *
 * Does pointer arithmetic on the mem heap hi to get the epiliogue
 *
 * @return The epilogue
 */
static block_t *find_epilogue() {
    return (block_t *)((char *)mem_heap_hi() - 7);
}
static block_t *find_prologue() {
    return (block_t *)(mem_heap_lo());
}

/**
 * @brief Writes the block at a given point
 *
 *
 *
 * Takes in all of the important information about the block and writes the
 * block into the heap
 *
 * @param[in] block An index representing the header of the new block to be
 * written
 * @param[in] size the size of the block to write
 * @param[in] prev_alloc the allocation status of the previous vblock
 * @param[in] alloc the allocation status of the block
 * @param[in] prev_mini the mini status of the prev block
 * @param[in] mini the mini status of the  block
 */
static void write_block(block_t *block, size_t size, bool prev_alloc,
                        bool alloc, bool prev_mini, bool mini) {
    dbg_requires(block != NULL);
    dbg_requires(size > 0);
    dbg_requires(!(block == heap_start && prev_mini));
    block->header = pack(size, prev_alloc, alloc, prev_mini, mini);
    if (!alloc && !mini) {
        word_t *footerp = header_to_footer(block);
        *footerp = pack(size, prev_alloc, alloc, prev_mini, mini);
    }
}
/**
 * @brief removes the block passed to it from the seg list
 *
 *
 * @param[in] block The block to be removed
 * @param[in] line - line function is called at
 */
static void remove_from_list(block_t *block, int line) {
    dbg_assert(!get_alloc(block));
    dbg_printf("removing block %p from list\n", (void *)block);
    if (get_size(block) > 16) {
        size_t index = get_list_ind(get_size(block));
        block_t *prev = block->pointers.prev;
        block_t *next = block->pointers.next;
        if (prev == NULL) {
            seg_list[index] = next;
            if (next != NULL) {
                (seg_list[index])->pointers.prev = NULL;
            }
        } else {
            if (next == NULL) {
                prev->pointers.next = NULL;
                dbg_printf("NEXT IS NULL AT LINE %i with block %p\n", line,
                           (void *)block);
            } else {
                prev->pointers.next = next;
                if (!get_mini(block)) {
                }
                next->pointers.prev = prev;
            }
        }
    } else {
        if (seg_list[0] == block) {
            seg_list[0] = block->pointers.next;
        } else {
            block_t *curr = seg_list[0];
            while (curr->pointers.next != block) {
                curr = curr->pointers.next;
            }
            curr->pointers.next = block->pointers.next;
        }
    }
}
/**
 * @brief adds a mini block block passed to it to the seg list
 *
 *
 * @param[in] block The mini block to be added
 * @param[in] line - line function is called at
 */
static void add_mini_to_seg_list(block_t *block, int line) {
    dbg_printf("adding mini block %p (size %lu) at line %i\n", (void *)block,
               get_size(block), line);
    if (seg_list[0] == block) {
        block->pointers.next = NULL;
    } else {
        block->pointers.next = seg_list[0];
    }
    seg_list[0] = block;
}
/**
 * @brief adds the block passed to it to a  given seg list
 *
 *
 * @param[in] block The block to be removed
 * @param[in] list - what list to add block too
 * @param[in] line - line function is called at
 */
static void add_to_seg_list(block_t *block, size_t list, int line) {
    dbg_printf("adding block %p (size %lu) to list %lu at line %i\n",
               (void *)block, get_size(block), list, line);

    if (seg_list[list] == block) {
        block->pointers.next = NULL;
    } else {
        block->pointers.next = seg_list[list];
    }
    block->pointers.prev = NULL;
    if (seg_list[list] != NULL) {
        seg_list[list]->pointers.prev = block;
    }
    seg_list[list] = block;
    dbg_printf("added block %p with size %lu\n", (void *)block,
               get_size(block));
}
/**
 * @brief adds the block passed to it to the seg list
 *
 *
 * @param[in] block The block to be removed
 * @param[in] line - line function is called at
 */
static void add_to_list(block_t *block, int line) {
    dbg_assert(block != NULL);
    if (get_size(block) > 0 && get_size(block) == 16) {
        add_mini_to_seg_list(block, line);
    } else if (get_size(block) > 0) {
        add_to_seg_list(block, get_list_ind(get_size(block)), line);
    } else {
        fprintf(stderr, "\ntried to add %p with size 0, (prologue is %p)",
                (void *)block, (void *)find_prologue());
    }
}
/**
 * @brief Writes a block starting at the given address.
 *
 * This function writes both a header and footer, where the location of the
 * footer is computed in relation to the header.
 *
 * TODO: Are there any preconditions or postconditions?
 *
 * @param[out] block The location to begin writing the block header
 * @param[in] size The size of the new block
 * @param[in] alloc The allocation status of the new block
 */
/**
 * @brief prints the heap
 */
static void print_heap() {
    dbg_printf("\nPrologue at %p has size %lu and is %s\n",
               (void *)find_prologue(), get_size(find_prologue()),
               (get_alloc(find_prologue()) ? "allocated" : "not allocated"));
    block_t *epilogue = find_epilogue();
    for (block_t *curr = heap_start; curr < epilogue; curr = find_next(curr)) {
        dbg_printf("Block %p- size %lu (footer size %lu at "
                   "%p). Is %s and prev is %s. It %s a mini block and its prev "
                   "%s a mini block\n",
                   (void *)curr, get_size(curr),
                   extract_size(*header_to_footer(curr)),
                   (void *)header_to_footer(curr),
                   (get_alloc(curr) ? "allocated" : "not allocated"),
                   (get_prev_alloc(curr) ? "allocated" : "not allocated"),
                   (get_mini(curr) ? "is" : "is not"),
                   (get_prev_mini(curr) ? "is" : "is not"));
    }
    dbg_printf("Epilogue at %p has size %lu and is %s\n\n", (void *)epilogue,
               get_size(epilogue),
               (get_alloc(epilogue) ? "allocated" : "not allocated"));
}
/**
 * @brief prints the list
 */
static void print_list() {
    dbg_printf("\nPrinting List");
    for (size_t i = 0; i < seg_list_size; i++) {
        dbg_printf("\nPrinting List: %lu", i);
        for (block_t *curr = seg_list[i]; curr != NULL;
             curr = curr->pointers.next) {
            dbg_printf(
                "\nBlock at %p has size %lu (footer size is %lu - footer is "
                "%p) and is %s\n",
                (void *)curr, get_size(curr),
                extract_size(*header_to_footer(curr)),
                (void *)header_to_footer(curr),
                (get_alloc(curr) ? "allocated" : "not allocated"));
            dbg_printf("Has prev pointer %p and next pointer %p\n",
                       (void *)curr->pointers.prev,
                       (void *)curr->pointers.next);
        }
    }

    dbg_printf("\n");
}

/*
 * ---------------------------------------------------------------------------
 *                        END SHORT HELPER FUNCTIONS
 * ---------------------------------------------------------------------------
 */

/******** The remaining content below are helper and debug routines ********/

/**
 * @brief
 *
 * <What does this function do?>
 * THis function COallesces all of the free blocks around the block being
 * coallesced into one large block <What are the function's arguments?> A block
 * around which everything should be coallescaed <What is the function's return
 * value?> the new coallesced block <Are there any preconditions or
 * postconditions?> Pre - BLock mustr be valid, heap must be valid except for
 * uncoallesced blocks being allowed Post - Heap must be valid
 *
 * @param[in] block
 * @return
 */
static block_t *coalesce_block(block_t *block) {
    if (block == NULL) {
        fprintf(stderr, "\nBlock: %p to coallesce is NULL", (void *)block);
    }
    dbg_printf("\nCoallescing block: %p\n", (void *)block);
    block_t *prev = NULL;

    bool prev_coalescable = !get_prev_alloc(block) &&
                            (get_prev_mini(block) || find_prev(block) != NULL);
    size_t prev_size = 0;
    if (prev_coalescable && !get_prev_mini(block)) {
        prev = find_prev(block);
        prev_size = get_size(prev);
    } else if (prev_coalescable && get_prev_mini(block)) {
        dbg_printf("Getting prev mini of block %p\n", (void *)block);
        prev = find_prev_mini(block);
        dbg_printf("Got prev mini as %p\n", (void *)prev);
        prev_size = mini_size;
    }

    block_t *next = find_next(block);

    bool next_coalescable =
        next != NULL && get_size(next) != 0 && !get_alloc(next);

    if (next_coalescable && get_size(find_next(next)) != 0) {
        block_t *next_next = find_next(next);
        write_block(next_next, get_size(next_next), false, get_alloc(next_next),
                    false, get_mini(next_next));
        dbg_printf("Adjusting coallesce for next next %p. (Prev alloc is %d)\n",
                   (void *)next_next, get_prev_alloc(next_next));
    } else if (next_coalescable) {
        block_t *epilogue = find_next(next);
        dbg_printf("Adjusting coallesce for epilogue %p\n", (void *)epilogue);
        write_epilogue(epilogue, false);
    }
    size_t next_size = get_size(next);
    size_t block_size = get_size(block);
    block_t *ret = block;

    if (prev_coalescable && next_coalescable) {
        dbg_printf(
            "Both blocks around %p are coallescable(prev: %p, next: %p)\n",
            (void *)block, (void *)prev, (void *)next);

        remove_from_list(prev, __LINE__);
        remove_from_list(block, __LINE__);
        remove_from_list(next, __LINE__);

        write_block(prev, prev_size + block_size + next_size,
                    get_prev_alloc(prev), false, get_prev_mini(prev), false);

        add_to_list(prev, __LINE__);

        ret = prev;
        if (heap_end == next || heap_end == block) {
            heap_end = prev;
        }
    } else if (prev_coalescable && !next_coalescable) {
        dbg_printf("Prev (%p) block of %p is coallescable\n", (void *)prev,
                   (void *)block);

        remove_from_list(prev, __LINE__);
        remove_from_list(block, __LINE__);

        write_block(prev, prev_size + block_size, get_prev_alloc(prev), false,
                    get_prev_mini(prev), false);

        add_to_list(prev, __LINE__);

        ret = prev;
        if (heap_end == block) {
            heap_end = prev;
        }
        if (next != NULL && prev != heap_end) {
            write_block(next, get_size(next), false, get_alloc(next), false,
                        get_mini(next));
        }
    } else if (!prev_coalescable && next_coalescable) {
        dbg_printf("Next (%p) block of %p is coallescable\n", (void *)next,
                   (void *)block);

        next_size = get_size(next);

        remove_from_list(block, __LINE__);
        remove_from_list(next, __LINE__);

        write_block(block, block_size + next_size, get_prev_alloc(block), false,
                    get_prev_mini(block), false);

        add_to_list(block, __LINE__);

        ret = block;
        if (heap_end == next) {
            heap_end = block;
        }
    } else {
        dbg_printf("Nothing around %p is coallescable\n", (void *)block);
        ret = block;
    }

    dbg_ensures(mm_checkheap(__LINE__));
    return ret;
}

/**
 * @brief
 *
 * <What does this function do?>
 * Extends the heap
 * <What are the function's arguments?>
 * Size - the size of the new chunk that will be extended
 *
 * <What is the function's return value?>
 * a block which is the extended block
 * <Are there any preconditions or postconditions?>
 * heap must be valid before and after
 *
 * @param[in] size
 * @return
 */
static block_t *extend_heap(size_t size) {
    dbg_printf("\nextending heap by %lu\n", size);
    dbg_requires(mm_checkheap(__LINE__));

    void *bp;
    // Allocate an even number of words to maintain alignment
    size = round_up(size, dsize);
    if ((bp = mem_sbrk((intptr_t)size)) == (void *)-1) {
        return NULL;
    }
    bool prev_alloc = true;
    bool prev_mini = false;
    if (heap_end != NULL) {
        prev_alloc = get_alloc(heap_end);
        prev_mini = get_mini(heap_end);
    }

    // Initialize free block header/footer
    block_t *block = payload_to_header(bp);
    write_block(block, size, prev_alloc, false, prev_mini, (size == mini_size));
    heap_end = block;

    add_to_list(block, __LINE__);

    // Create new epilogue header
    block_t *block_next = find_next(block);
    write_epilogue(block_next, (size == mini_size));

    // Coalesce in case the previous block was free

    block = coalesce_block(block);
    dbg_ensures(mm_checkheap(__LINE__));
    dbg_printf("extended block is %p\n", (void *)block);

    return block;
}

/**
 * @brief
 *
 * <What does this function do?>
 * splits a malloced block into two if there is enough unused space to make a
 * block out of it <What are the function's arguments?> block - block to be
 * split asize - size of block <What is the function's return value?> nothing
 * <Are there any preconditions or postconditions?>
 * heap must be valid before and after the block must be alloced before, the
 * block must be alloced afrer and the split block must be free
 *
 * @param[in] block
 * @param[in] asize
 */
static void split_block(block_t *block, size_t asize) {
    dbg_requires(get_alloc(block));
    dbg_requires(mm_checkheap(__LINE__));
    dbg_printf("\nsplitting block %p (size %lu) to get size %lu\n",
               (void *)block, get_size(block), asize);
    /* TODO: Can you write a precondition about the value of asize? */

    size_t block_size = get_size(block);

    if ((block_size - asize) >= min_block_size) {
        block_t *block_next;
        write_block(block, asize, get_prev_alloc(block), true,
                    get_prev_mini(block), (asize == 16));

        block_next = find_next(block);
        dbg_printf("Free part of split block (%p) has size %lu\n",
                   (void *)block_next, block_size - asize);
        write_block(block_next, block_size - asize, true, false, asize == 16,
                    (block_size - asize) == 16);
        add_to_list(block_next, __LINE__);
        if (block == heap_end) {
            heap_end = block_next;
        } else {
            block_t *next = find_next(block_next);
            write_block(next, get_size(next), false, get_alloc(next),
                        (block_size - asize) == 16, get_mini(next));
        }
    }

    dbg_ensures(mm_checkheap(__LINE__));
    dbg_ensures(get_alloc(block));
}

/**
 * @brief
 *
 * <What does this function do?>
 * finds a fit of at least size asize
 * <What are the function's arguments?>
 * asize- minimum size of the block to find a fit of
 * <What is the function's return value?>
 * the block representing the fit
 * <Are there any preconditions or postconditions?>
 * heap valid before and after and asize is at least 16
 *
 * @param[in] asize
 * @return
 */
static block_t *find_fit(size_t asize) {
    dbg_requires(mm_checkheap(__LINE__));
    dbg_printf("\nLooking for fit of size %lu\n", asize);

    size_t index = get_list_ind(asize);
    dbg_printf("best index = %lu\n", index);
    for (size_t i = index; i < seg_list_size; i++) {
        dbg_printf("looking in index = %lu\n", i);
        for (block_t *block = seg_list[i]; block != NULL;
             block = block->pointers.next) {
            if (asize <= get_size(block)) {
                block_t *better = block;
                for (size_t i = 0; i < better_fit_param; i++) {
                    if (better == NULL) {
                        break;
                    }
                    if (get_size(better) < get_size(block) &&
                        get_size(better) >= asize) {
                        block = better;
                        break;
                    }
                    better = better->pointers.next;
                }
                dbg_printf("found block: %p\n", (void *)block);
                return block;
            }
        }
    }

    return NULL; // no fit found
}

/**
 * @brief
 *
 * <What does this function do?>
 * checks the heap to see if its valid
 * <What are the function's arguments?>
 * line - line the function is called at
 * <What is the function's return value?>
 * a bool representing validity of the heap
 * <Are there any preconditions or postconditions?>
 * returns false iff the heap is invalid returns true iff the heap is valid
 *
 * @param[in] line
 * @return
 */
bool mm_checkheap(int line) {
    // Check for epilogue and prologue blocks.
    void *prologue = find_prev_footer(heap_start);
    if (prologue == NULL) {
        fprintf(stderr, "\nProlgue pointer is invalid, line %i \n", line);
        return false;
    }

    block_t *end = find_epilogue();
    if (end == NULL) {
        fprintf(stderr, "\nEnd pointer is null, line %i \n", line);
        return false;
    }
    if (get_size(prologue) != 0) {
        fprintf(stderr, "\nPrologue pointer is not prologue, line %i \n", line);
        return false;
    }
    if (get_size(end) != 0) {
        fprintf(stderr, "\nEnd pointer size is not 0, line %i \n", line);
        return false;
    }

    // Check blocks lie within heap boundaries.
    if (end > (block_t *)mem_heap_hi()) {
        fprintf(stderr, "\nEnd is out of bounds at line %i \n", line);
        return false;
    }
    // Check each blocks address alignment.
    block_t *start = heap_start;
    size_t free_count_traverse = 0;
    while (start < end) {
        size_t block_size = get_size(start);
        // Check blocks lie within heap boundaries
        if (start > (block_t *)mem_heap_hi()) {
            fprintf(stderr, "\nBlock out of bounds at line %i \n", line);
            dbg_printf("start: %p, current: %p, end: %p\n", (void *)heap_start,
                       (void *)start, (void *)end);
            dbg_printf("size of block: %lu\n", block_size);
            return false;
        }
        // Check each blocks address alignment.
        if (get_offset(start, heap_start) % dsize != 0) {
            fprintf(stderr, "\nBlock out of alignment at line %i \n", line);
            dbg_printf("start: %p, current: %p, end: %p\n", (void *)heap_start,
                       (void *)start, (void *)end);
            dbg_printf("size of block: %lu\n", block_size);
            return false;
        }

        // Check each blocks header and footer: size (minimum size),
        // previous/next allocate/free bit consistency, header and footer
        // matching each other.
        if (block_size < min_block_size) {
            fprintf(stderr, "\nBlock too small at line %i \n", line);
            dbg_printf("start: %p, current: %p, end: %p\n", (void *)heap_start,
                       (void *)start, (void *)end);
            dbg_printf("size of block: %lu\n", block_size);
            return false;
        }
        if (!get_alloc(start) && !get_mini(start)) {
            word_t *footer = header_to_footer(start);
            if (footer == NULL) {
                fprintf(stderr, "\nfooter is null at line %i \n", line);
                dbg_printf("start: %p, current: %p, end: %p\n",
                           (void *)heap_start, (void *)start, (void *)end);
                dbg_printf("size of block: %lu\n", block_size);
                return false;
            }
            if (((start->header)) != ((*footer))) {
                fprintf(stderr, "\nfooter is not equal to header at line %i \n",
                        line);
                dbg_printf("Header: %lx, Footer: %lx\n", start->header,
                           *footer);
                dbg_printf("start: %p, current: %p, end: %p\n",
                           (void *)heap_start, (void *)start, (void *)end);
                dbg_printf("size of block: %lu\n", block_size);
                return false;
            }
        }

        // Check coalescing: no consecutive free blocks in the heap.
        if (find_next(start) != end) {
            if (!get_alloc(start) && !get_alloc(find_next(start))) {
                fprintf(stderr, "\ncoallescable at line %i \n", line);
                dbg_printf("current: %p, next: %p\n", (void *)start,
                           (void *)find_next(start));
                dbg_printf("start: %p, current: %p, end: %p\n",
                           (void *)heap_start, (void *)start, (void *)end);
                dbg_printf("size of block: %lu\n", block_size);
                return false;
            }

            if (get_alloc(start) != get_prev_alloc(find_next(start))) {
                fprintf(stderr,
                        "prev alloc bit of %p (%d) does not match alloc bit of "
                        "%p (%d) at line %i\n",
                        (void *)find_next(start),
                        get_prev_alloc(find_next(start)), (void *)start,
                        get_alloc(start), line);
                return false;
            }
            if (get_mini(start) != get_prev_mini(find_next(start))) {
                fprintf(stderr,
                        "prev mini bit of %p (%d) does not match mini bit of "
                        "%p (%d) at line %i\n",
                        (void *)find_next(start),
                        get_prev_mini(find_next(start)), (void *)start,
                        get_mini(start), line);
                return false;
            }
        }
        // Count free blocks by iterating through every block and traversing
        // free list by pointers and see if they match.
        if (!get_alloc(start)) {
            free_count_traverse++;
        }
        start = find_next(start);
    }
    // All free list pointers are between mem_heap_lo() and mem_heap_high().
    size_t free_count_list = 0;
    for (size_t i = 0; i < seg_list_size; i++) {
        for (block_t *curr = seg_list[i]; curr != NULL;
             curr = curr->pointers.next) {
            // All free list pointers are between mem_heap_lo() and
            // mem_heap_high().
            if (curr > (block_t *)mem_heap_hi()) {
                fprintf(stderr, "\nBlock %p too high at line %i\n",
                        (void *)curr, line);
                return false;
            }
            if (curr < (block_t *)mem_heap_lo()) {
                fprintf(stderr, "\nBlock %p too low at line %i\n", (void *)curr,
                        line);
                return false;
            }
            // All blocks in each list bucket fall within bucket size range
            // (segregated list)
            if (get_list_ind(get_size(curr)) != i) {
                fprintf(stderr,
                        "Block %p in wrong list (is in list %lu and should be "
                        "in list %lu)",
                        (void *)curr, i, get_list_ind(get_size(curr)));
                return false;
            }

            // All next/previous pointers are consistent (if As next pointer
            // points to B, Bs previous pointer should point to A).
            if (i != 0) {
                block_t *prev = curr->pointers.prev;
                if (prev != NULL && prev->pointers.next != curr) {
                    fprintf(
                        stderr,
                        "Previous pointer: %p, does not point next to pointer: "
                        "%p. Instead points to %p. at line: %i\n",
                        (void *)prev, (void *)curr, (void *)prev->pointers.next,
                        line);
                    return false;
                }
                block_t *next = curr->pointers.next;
                if (next != NULL && next->pointers.prev != curr) {
                    fprintf(stderr,
                            "Next pointer: %p, does not point prev to pointer: "
                            "%p. Instead points to %p. at line: %i\n",
                            (void *)next, (void *)curr,
                            (void *)next->pointers.prev, line);
                    return false;
                }
            }

            // Count free blocks by iterating through every block and traversing
            // free list by pointers and see if they match.
            free_count_list++;
        }
    }
    // Count free blocks by iterating through every block and traversing free
    // list by pointers and see if they match.
    if (free_count_list != free_count_traverse) {
        fprintf(stderr,
                "There are %lu free blocks in the free list and %lu free "
                "blocks in the implicit list at line %i\n",
                free_count_list, free_count_traverse, line);
        return false;
    }
    return true;
}

/**
 * @brief
 *
 * <What does this function do?>
 * iniitilaizes the heap
 * <What are the function's arguments?>
 * void
 * <What is the function's return value?>
 * a bool representing if things worked
 * <Are there any preconditions or postconditions?>
 * initialized heap must be valid adn everythign msut be reset
 *
 * @return
 */
bool mm_init(void) {
    dbg_printf("\ninitializing\n");
    // Create the initial empty heap
    word_t *start = (word_t *)(mem_sbrk(2 * wsize));

    if (start == (void *)-1) {
        return false;
    }
    start[0] =
        pack(0, false, true, false, false); // Heap prologue (block footer)
    start[1] =
        pack(0, false, true, false, false); // Heap epilogue (block header)

    // Heap starts with first "block header", currently the epilogue
    heap_start = (block_t *)&(start[1]);
    heap_end = NULL;

    for (size_t index = 0; index < seg_list_size; index++) {
        seg_list[index] = NULL;
    }
    block_t *block = extend_heap(chunksize);

    // Extend the empty heap with a free block of chunksize bytes
    if (block == NULL) {
        return false;
    } else {
        heap_end = block;
    }
    dbg_printf("heap end: %p\n", (void *)heap_end);
    dbg_requires(mm_checkheap(__LINE__));

    return true;
}

/**
 * @brief
 *
 * <What does this function do?>
 * allocates a  block with a given size
 * <What are the function's arguments?>
 * size - size to be allocated
 * <What is the function's return value?>
 * a void* representing the apyload of the allocated block
 * <Are there any preconditions or postconditions?>
 * heap is valid before and after
 *
 * @param[in] size
 * @return
 */
void *malloc(size_t size) {
    dbg_printf("\nmallocing size: %lu\n", size);
    dbg_requires(mm_checkheap(__LINE__));

    size_t asize;      // Adjusted block size
    size_t extendsize; // Amount to extend heap if no fit is found
    block_t *block;
    void *bp = NULL;

    // Initialize heap if it isn't initialized
    if (heap_start == NULL) {
        if (!(mm_init())) {
            dbg_printf("Problem initializing heap. Likely due to sbrk");
            return NULL;
        }
    }

    // Ignore spurious request
    if (size == 0) {
        dbg_ensures(mm_checkheap(__LINE__));
        dbg_printf("malloc return %p\n", bp);
        return bp;
    }

    // Adjust block size to include overhead and to meet alignment requirements
    asize = round_up(size + wsize, dsize);
    asize = max(asize, min_block_size);

    // Search the free list for a fit
    block = find_fit(asize);

    // If no fit is found, request more memory, and then and place the block
    if (block == NULL) {
        // Always request at least chunksize
        extendsize = max(asize, chunksize);
        block = extend_heap(extendsize);
        // extend_heap returns an error
        if (block == NULL) {
            dbg_ensures(mm_checkheap(__LINE__));
            dbg_printf("malloc return %p\n", bp);
            return bp;
        }
    }

    // The block should be marked as free
    dbg_assert(!get_alloc(block));

    // Mark block as allocated
    size_t block_size = get_size(block);
    remove_from_list(block, __LINE__);
    write_block(block, block_size, get_prev_alloc(block), true,
                get_prev_mini(block), (block_size == 16));
    if (block != heap_end) {
        block_t *next = find_next(block);
        write_block(next, get_size(next), true, get_alloc(next),
                    get_mini(block), get_mini(next));
    }

    // Try to split the block if too large
    split_block(block, asize);

    bp = header_to_payload(block);

    dbg_ensures(mm_checkheap(__LINE__));
    dbg_printf("malloc return %p\n", bp);
    return bp;
}

/**
 * @brief
 *
 * <What does this function do?>
 * frees a block whos payload is at bp
 * <What are the function's arguments?>
 * bp - payload of the block to free
 * <What is the function's return value?>
 * none
 * <Are there any preconditions or postconditions?>
 * heap valid before and after
 *
 * @param[in] bp
 */
void free(void *bp) {
    dbg_printf("freeing payload: %p\n", bp);
    dbg_requires(mm_checkheap(__LINE__));

    if (bp == NULL) {
        return;
    }

    block_t *block = payload_to_header(bp);
    dbg_printf("freeing block: %p\n", (void *)block);
    size_t size = get_size(block);

    // The block should be marked as allocated
    dbg_assert(get_alloc(block));

    //  Mark the block as free
    write_block(block, size, get_prev_alloc(block), false, get_prev_mini(block),
                size == mini_size);
    if (block != heap_end) {
        block_t *next = find_next(block);
        write_block(next, get_size(next), false, get_alloc(next),
                    size == mini_size, get_mini(next));
    } else {
        block_t *epilogue = find_next(block);
        write_epilogue(epilogue, get_mini(block));
    }
    add_to_list(block, __LINE__);

    // Try to coalesce the block with its neighbors
    coalesce_block(block);

    dbg_ensures(mm_checkheap(__LINE__));
}

/**
 * @brief
 *
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * a void* representing the payload of the block we realloced
 * <Are there any preconditions or postconditions?>
 * heap balid before and after and
 * if size =0 then the block at ptr is free and we returned null
 * if ptr is null then we malloced a block with size size and returned the
 * payload of that bllock (size is correct) if malloc failed then we returned
 * null
 *
 * @param[in] ptr
 * @param[in] size
 * @return
 */
void *realloc(void *ptr, size_t size) {
    dbg_printf("reallocing block: %p with size: %lu\n", ptr, size);
    dbg_requires(mm_checkheap(__LINE__));
    block_t *block = payload_to_header(ptr);
    size_t copysize;
    void *newptr;

    // If size == 0, then free block and return NULL
    if (size == 0) {
        free(ptr);
        return NULL;
    }

    // If ptr is NULL, then equivalent to malloc
    if (ptr == NULL) {
        return malloc(size);
    }

    // Otherwise, proceed with reallocation
    newptr = malloc(size);

    // If malloc fails, the original block is left untouched
    if (newptr == NULL) {
        return NULL;
    }

    // Copy the old data
    copysize = get_payload_size(block); // gets size of old payload
    if (size < copysize) {
        copysize = size;
    }
    memcpy(newptr, ptr, copysize);

    // Free the old block
    free(ptr);

    dbg_ensures(mm_checkheap(__LINE__));
    return newptr;
}

/**
 * @brief
 *
 * <What does this function do?>
 * malllooc but sets all to 0
 * <What are the function's arguments?>
 * elements - num elements in the thing to calloc
 * size - size of each element
 * <What is the function's return value?>
 * a void* representing payload of alloced blok
 * <Are there any preconditions or postconditions?>
 * heap valid before and after
 *
 * @param[in] elements
 * @param[in] size
 * @return
 */
void *calloc(size_t elements, size_t size) {
    dbg_printf("callocing %lu elements each of size: %lu\n", elements, size);
    dbg_requires(mm_checkheap(__LINE__));
    void *bp;
    size_t asize = elements * size;

    if (elements == 0) {
        return NULL;
    }
    if (asize / elements != size) {
        // Multiplication overflowed
        return NULL;
    }

    bp = malloc(asize);
    if (bp == NULL) {
        return NULL;
    }

    // Initialize all bits to 0
    memset(bp, 0, asize);
    dbg_ensures(mm_checkheap(__LINE__));
    return bp;
}

/*
 *****************************************************************************
 * Do not delete the following super-secret(tm) lines!                       *
 *                                                                           *
 * 53 6f 20 79 6f 75 27 72 65 20 74 72 79 69 6e 67 20 74 6f 20               *
 *                                                                           *
 * 66 69 67 75 72 65 20 6f 75 74 20 77 68 61 74 20 74 68 65 20               *
 * 68 65 78 61 64 65 63 69 6d 61 6c 20 64 69 67 69 74 73 20 64               *
 * 6f 2e 2e 2e 20 68 61 68 61 68 61 21 20 41 53 43 49 49 20 69               *
 *                                                                           *
 * 73 6e 27 74 20 74 68 65 20 72 69 67 68 74 20 65 6e 63 6f 64               *
 * 69 6e 67 21 20 4e 69 63 65 20 74 72 79 2c 20 74 68 6f 75 67               *
 * 68 21 20 2d 44 72 2e 20 45 76 69 6c 0a c5 7c fc 80 6e 57 0a               *
 *                                                                           *
 *****************************************************************************
 */
