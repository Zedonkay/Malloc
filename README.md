# Malloc Lab: Custom Memory Allocator
## Project Overview

This repository contains my solution for the Malloc Lab, a fundamental computer systems programming assignment. The goal of this lab is to implement a dynamic memory allocator (i.e., `malloc`, `free`, `realloc`) from scratch. This project provides hands-on experience with memory management, heap organization, and performance optimization techniques, which are crucial for understanding how modern operating systems and applications manage memory.

## Features and Implementation Details

My implementation focuses on balancing throughput and memory utilization. Key features include:
*   **Implicit Free List Allocator**: Implemented a baseline allocator using an implicit free list, where all blocks (allocated or free) are linked implicitly. Provided foundational understanding of memory layout, block metadata, and linear allocation search.

*   **Explicit Free List Allocator**: *(Optional — not implemented)*

*   **Segregated Free Lists**: Implemented segregated free lists to categorize free blocks by size class, drastically improving allocation speed and reducing search time for suitable blocks.

*   **Optimizations**:
    *   Integrated **boundary tags** and **bi-directional coalescing** to reduce external fragmentation by merging adjacent free blocks during both allocation and free operations.
    *   Used **best-fit** and **first-fit within size class** strategies to enhance placement efficiency.
    *   Minimized fragmentation and improved performance for varied allocation sizes through precise block management and fast-fit strategies.

*   **Robustness**: The allocator is designed to handle various allocation patterns, including large and small requests, and provides mechanisms for error checking.

## Building and Running

To build the memory allocator and the driver program, simply navigate to the project root and run `make`:

```bash
make
```

Once built, you can test your solution using the provided `mdriver` program. The `mdriver` program simulates various memory allocation and deallocation patterns using trace files to evaluate the performance (throughput and utilization) and correctness of your `malloc` implementation.

To run the driver on a specific trace file:

```bash
./mdriver -V -f traces/malloc.rep
```

*   The `-V` option provides verbose output, showing helpful tracing information.
*   The `traces/` directory contains various trace files for testing. `XXX-short.rep` files are good for debugging.

For a full list of `mdriver` options:

```bash
./mdriver -h
```

### Debugging

You can test your code with debugging macros enabled (`dbg_printf`, etc.) and a lower optimization level by using `mdriver-dbg`:

```bash
./mdriver-dbg
```

### 64-bit Address Emulation

To test the correctness of your code in handling 64-bit addresses, use `mdriver-emulate`:

```bash
./mdriver-emulate
```

## Learning Outcomes

Through this project, I have gained a deeper understanding of:

*   **Memory Management**: The intricacies of allocating and deallocating memory at a low level.
*   **Data Structures**: Designing and implementing efficient data structures for managing free blocks (e.g., implicit lists, explicit lists, segregated lists).
*   **Performance Optimization**: Techniques to minimize fragmentation and improve throughput.
*   **System Programming**: Interacting with the operating system (e.g., `sbrk`) to manage the heap.
*   **Debugging**: Identifying and resolving complex memory-related bugs.
