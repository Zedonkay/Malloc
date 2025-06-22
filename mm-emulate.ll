; ModuleID = 'mm.c'
source_filename = "mm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.block = type { i64, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { %struct.block*, %struct.block* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@heap_start = internal unnamed_addr global %struct.block* null, align 8, !dbg !0
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [45 x i8] c"\0APrologue pointer is not prologue, line %i \0A\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"\0AEnd pointer size is not 0, line %i \0A\00", align 1
@.str.4 = private unnamed_addr constant [35 x i8] c"\0AEnd is out of bounds at line %i \0A\00", align 1
@.str.5 = private unnamed_addr constant [34 x i8] c"\0ABlock out of bounds at line %i \0A\00", align 1
@.str.6 = private unnamed_addr constant [37 x i8] c"\0ABlock out of alignment at line %i \0A\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"\0ABlock too small at line %i \0A\00", align 1
@.str.9 = private unnamed_addr constant [44 x i8] c"\0Afooter is not equal to header at line %i \0A\00", align 1
@.str.10 = private unnamed_addr constant [27 x i8] c"\0Acoallescable at line %i \0A\00", align 1
@.str.11 = private unnamed_addr constant [74 x i8] c"prev alloc bit of %p (%d) does not match alloc bit of %p (%d) at line %i\0A\00", align 1
@.str.12 = private unnamed_addr constant [72 x i8] c"prev mini bit of %p (%d) does not match mini bit of %p (%d) at line %i\0A\00", align 1
@seg_list = internal unnamed_addr global [14 x %struct.block*] zeroinitializer, align 16, !dbg !51
@.str.13 = private unnamed_addr constant [31 x i8] c"\0ABlock %p too high at line %i\0A\00", align 1
@.str.14 = private unnamed_addr constant [30 x i8] c"\0ABlock %p too low at line %i\0A\00", align 1
@.str.15 = private unnamed_addr constant [66 x i8] c"Block %p in wrong list (is in list %lu and should be in list %lu)\00", align 1
@.str.16 = private unnamed_addr constant [93 x i8] c"Previous pointer: %p, does not point next to pointer: %p. Instead points to %p. at line: %i\0A\00", align 1
@.str.17 = private unnamed_addr constant [89 x i8] c"Next pointer: %p, does not point prev to pointer: %p. Instead points to %p. at line: %i\0A\00", align 1
@.str.18 = private unnamed_addr constant [96 x i8] c"There are %lu free blocks in the free list and %lu free blocks in the implicit list at line %i\0A\00", align 1
@heap_end = internal unnamed_addr global %struct.block* null, align 8, !dbg !71
@.str.19 = private unnamed_addr constant [47 x i8] c"\0Atried to add %p with size 0, (prologue is %p)\00", align 1
@.str.20 = private unnamed_addr constant [32 x i8] c"\0ABlock: %p to coallesce is NULL\00", align 1

; Function Attrs: nounwind uwtable
define dso_local zeroext i1 @mm_checkheap(i32 noundef %0) local_unnamed_addr #0 !dbg !82 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !87, metadata !DIExpression()), !dbg !110
  %2 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !111, !tbaa !112
  call void @llvm.dbg.value(metadata %struct.block* %2, metadata !116, metadata !DIExpression()), !dbg !121
  %3 = getelementptr inbounds %struct.block, %struct.block* %2, i64 0, i32 0, !dbg !123
  %4 = getelementptr inbounds i64, i64* %3, i64 -1, !dbg !124
  call void @llvm.dbg.value(metadata i64* %4, metadata !88, metadata !DIExpression()), !dbg !110
  %5 = tail call i8* @mem_heap_hi() #6, !dbg !125
  %6 = getelementptr inbounds i8, i8* %5, i64 -7, !dbg !131
  %7 = bitcast i8* %6 to %struct.block*, !dbg !132
  call void @llvm.dbg.value(metadata %struct.block* %7, metadata !89, metadata !DIExpression()), !dbg !110
  %8 = load i64, i64* %4, align 8, !dbg !133, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.value(metadata i64 %8, metadata !145, metadata !DIExpression()), !dbg !150
  %9 = icmp ult i64 %8, 16, !dbg !152
  br i1 %9, label %13, label %10, !dbg !153

10:                                               ; preds = %1
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !154, !tbaa !112
  %12 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %11, i8* noundef getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i64 0, i64 0), i32 noundef %0) #7, !dbg !156
  br label %283, !dbg !157

13:                                               ; preds = %1
  %14 = bitcast i8* %6 to i64*, !dbg !158
  %15 = load i64, i64* %14, align 8, !dbg !158, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.value(metadata i64 %15, metadata !145, metadata !DIExpression()), !dbg !162
  %16 = icmp ult i64 %15, 16, !dbg !164
  br i1 %16, label %20, label %17, !dbg !165

17:                                               ; preds = %13
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !166, !tbaa !112
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %18, i8* noundef getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i64 0, i64 0), i32 noundef %0) #7, !dbg !168
  br label %283, !dbg !169

20:                                               ; preds = %13
  %21 = tail call i8* @mem_heap_hi() #6, !dbg !170
  %22 = icmp ugt i8* %6, %21, !dbg !172
  br i1 %22, label %23, label %26, !dbg !173

23:                                               ; preds = %20
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !174, !tbaa !112
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %24, i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @.str.4, i64 0, i64 0), i32 noundef %0) #7, !dbg !176
  br label %283, !dbg !177

26:                                               ; preds = %20
  %27 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !178, !tbaa !112
  call void @llvm.dbg.value(metadata %struct.block* %27, metadata !90, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.value(metadata i64 0, metadata !91, metadata !DIExpression()), !dbg !110
  %28 = icmp ult %struct.block* %27, %7, !dbg !179
  br i1 %28, label %31, label %29, !dbg !180

29:                                               ; preds = %148, %26
  %30 = phi i64 [ 0, %26 ], [ %152, %148 ], !dbg !181
  call void @llvm.dbg.value(metadata i64 0, metadata !98, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i64 0, metadata !97, metadata !DIExpression()), !dbg !110
  br label %154, !dbg !183

31:                                               ; preds = %26, %148
  %32 = phi %struct.block* [ %149, %148 ], [ %27, %26 ]
  %33 = phi i64 [ %152, %148 ], [ 0, %26 ]
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !90, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.value(metadata i64 %33, metadata !91, metadata !DIExpression()), !dbg !110
  %34 = getelementptr %struct.block, %struct.block* %32, i64 0, i32 0, !dbg !184
  %35 = load i64, i64* %34, align 8, !dbg !184, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.value(metadata i64 %35, metadata !145, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.value(metadata i64 %35, metadata !92, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !189
  %36 = tail call i8* @mem_heap_hi() #6, !dbg !190
  %37 = bitcast i8* %36 to %struct.block*, !dbg !192
  %38 = icmp ugt %struct.block* %32, %37, !dbg !193
  br i1 %38, label %39, label %42, !dbg !194

39:                                               ; preds = %31
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !195, !tbaa !112
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %40, i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.5, i64 0, i64 0), i32 noundef %0) #7, !dbg !197
  br label %283, !dbg !198

42:                                               ; preds = %31
  %43 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !199, !tbaa !112
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !201, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.value(metadata %struct.block* %43, metadata !206, metadata !DIExpression()), !dbg !207
  %44 = ptrtoint %struct.block* %32 to i64, !dbg !209
  %45 = ptrtoint %struct.block* %43 to i64, !dbg !209
  %46 = sub i64 %44, %45, !dbg !209
  %47 = and i64 %46, 15, !dbg !210
  %48 = icmp eq i64 %47, 0, !dbg !211
  br i1 %48, label %52, label %49, !dbg !212

49:                                               ; preds = %42
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !213, !tbaa !112
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %50, i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str.6, i64 0, i64 0), i32 noundef %0) #7, !dbg !215
  br label %283, !dbg !216

52:                                               ; preds = %42
  %53 = icmp ult i64 %35, 16, !dbg !217
  br i1 %53, label %54, label %57, !dbg !219

54:                                               ; preds = %52
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !220, !tbaa !112
  %56 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %55, i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.7, i64 0, i64 0), i32 noundef %0) #7, !dbg !222
  br label %283, !dbg !223

57:                                               ; preds = %52
  %58 = load i64, i64* %34, align 8, !dbg !224, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.value(metadata i64 %58, metadata !232, metadata !DIExpression()), !dbg !237
  %59 = and i64 %58, 1, !dbg !239
  %60 = icmp ne i64 %59, 0, !dbg !240
  br i1 %60, label %81, label %61, !dbg !241

61:                                               ; preds = %57
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !242, metadata !DIExpression()), !dbg !245
  %62 = and i64 %58, 2, !dbg !247
  %63 = icmp eq i64 %62, 0, !dbg !248
  %64 = and i64 %58, -16, !dbg !189
  br i1 %63, label %65, label %76, !dbg !249

65:                                               ; preds = %61
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !250, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !258
  call void @llvm.dbg.value(metadata i64 %64, metadata !253, metadata !DIExpression()), !dbg !254
  %66 = getelementptr inbounds %struct.block, %struct.block* %32, i64 0, i32 1, !dbg !260
  %67 = getelementptr inbounds %union.anon, %union.anon* %66, i64 -1, !dbg !261
  %68 = bitcast %union.anon* %67 to i8*, !dbg !261
  %69 = getelementptr inbounds i8, i8* %68, i64 %64, !dbg !262
  %70 = bitcast i8* %69 to i64*, !dbg !263
  call void @llvm.dbg.value(metadata i64* %70, metadata !94, metadata !DIExpression()), !dbg !264
  %71 = load i64, i64* %70, align 8, !dbg !265, !tbaa !267
  %72 = icmp eq i64 %58, %71, !dbg !268
  br i1 %72, label %76, label %73, !dbg !269

73:                                               ; preds = %65
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !270, !tbaa !112
  %75 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %74, i8* noundef getelementptr inbounds ([44 x i8], [44 x i8]* @.str.9, i64 0, i64 0), i32 noundef %0) #7, !dbg !272
  br label %283

76:                                               ; preds = %61, %65
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !273, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !282
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i64 %64, metadata !278, metadata !DIExpression()), !dbg !279
  %77 = bitcast %struct.block* %32 to i8*, !dbg !286
  %78 = getelementptr inbounds i8, i8* %77, i64 %64, !dbg !287
  %79 = bitcast i8* %78 to %struct.block*, !dbg !288
  %80 = icmp eq i8* %78, %6, !dbg !289
  br i1 %80, label %148, label %87, !dbg !290

81:                                               ; preds = %57
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !273, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !282
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !284
  %82 = and i64 %58, -16, !dbg !291
  call void @llvm.dbg.value(metadata i64 %64, metadata !278, metadata !DIExpression()), !dbg !279
  %83 = bitcast %struct.block* %32 to i8*, !dbg !286
  %84 = getelementptr inbounds i8, i8* %83, i64 %82, !dbg !287
  %85 = bitcast i8* %84 to %struct.block*, !dbg !288
  %86 = icmp eq i8* %84, %6, !dbg !289
  br i1 %86, label %148, label %95, !dbg !290

87:                                               ; preds = %76
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !292
  call void @llvm.dbg.value(metadata i64 %58, metadata !232, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !273, metadata !DIExpression()), !dbg !298
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !300
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.value(metadata i64 %64, metadata !278, metadata !DIExpression()), !dbg !298
  %88 = bitcast i8* %78 to i64*, !dbg !304
  %89 = load i64, i64* %88, align 8, !dbg !304, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !305
  call void @llvm.dbg.value(metadata i64 %89, metadata !232, metadata !DIExpression()), !dbg !307
  %90 = and i64 %89, 1, !dbg !309
  %91 = icmp eq i64 %90, 0, !dbg !310
  br i1 %91, label %92, label %97, !dbg !311

92:                                               ; preds = %87
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !312, !tbaa !112
  %94 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %93, i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.10, i64 0, i64 0), i32 noundef %0) #7, !dbg !314
  br label %283, !dbg !315

95:                                               ; preds = %81
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !316
  call void @llvm.dbg.value(metadata i64 %58, metadata !232, metadata !DIExpression()), !dbg !319
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !273, metadata !DIExpression()), !dbg !321
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !323
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !325
  call void @llvm.dbg.value(metadata i64 %64, metadata !278, metadata !DIExpression()), !dbg !321
  call void @llvm.dbg.value(metadata %struct.block* %79, metadata !327, metadata !DIExpression()), !dbg !330
  %96 = icmp eq %struct.block* %43, %85, !dbg !332
  br i1 %96, label %105, label %108, !dbg !334

97:                                               ; preds = %87
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !316
  call void @llvm.dbg.value(metadata i64 %58, metadata !232, metadata !DIExpression()), !dbg !319
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !273, metadata !DIExpression()), !dbg !321
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !323
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !325
  call void @llvm.dbg.value(metadata i64 %64, metadata !278, metadata !DIExpression()), !dbg !321
  call void @llvm.dbg.value(metadata %struct.block* %79, metadata !327, metadata !DIExpression()), !dbg !330
  %98 = icmp eq %struct.block* %43, %79, !dbg !332
  br i1 %98, label %122, label %99, !dbg !334

99:                                               ; preds = %97
  %100 = bitcast i8* %78 to i64*, !dbg !335
  %101 = load i64, i64* %100, align 8, !dbg !335, !tbaa !135
  %102 = and i64 %101, 4, !dbg !336
  %103 = icmp ne i64 %102, 0, !dbg !337
  %104 = xor i1 %60, %103, !dbg !338
  br i1 %104, label %114, label %128, !dbg !339

105:                                              ; preds = %95
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !242, metadata !DIExpression()), !dbg !340
  %106 = and i64 %58, 2, !dbg !343
  %107 = icmp eq i64 %106, 0, !dbg !344
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !273, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !347
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i64 %64, metadata !278, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* %79, metadata !351, metadata !DIExpression()), !dbg !354
  br i1 %107, label %148, label %142, !dbg !356

108:                                              ; preds = %95
  %109 = bitcast i8* %84 to i64*, !dbg !335
  %110 = load i64, i64* %109, align 8, !dbg !335, !tbaa !135
  %111 = and i64 %110, 4, !dbg !336
  %112 = icmp ne i64 %111, 0, !dbg !337
  %113 = xor i1 %60, %112, !dbg !338
  br i1 %113, label %114, label %128, !dbg !339

114:                                              ; preds = %108, %99
  %115 = phi i8* [ %78, %99 ], [ %84, %108 ]
  %116 = phi i64 [ %101, %99 ], [ %110, %108 ]
  %117 = bitcast i8* %115 to %struct.block*, !dbg !288
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !273, metadata !DIExpression()), !dbg !357
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !360
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !362
  call void @llvm.dbg.value(metadata i64 %64, metadata !278, metadata !DIExpression()), !dbg !357
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !273, metadata !DIExpression()), !dbg !364
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !366
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !368
  call void @llvm.dbg.value(metadata i64 %64, metadata !278, metadata !DIExpression()), !dbg !364
  call void @llvm.dbg.value(metadata %struct.block* %79, metadata !327, metadata !DIExpression()), !dbg !370
  %118 = trunc i64 %116 to i32, !dbg !372
  %119 = lshr i32 %118, 2, !dbg !372
  %120 = and i32 %119, 1, !dbg !372
  %121 = trunc i64 %59 to i32, !dbg !372
  br label %122, !dbg !372

122:                                              ; preds = %97, %114
  %123 = phi i32 [ %121, %114 ], [ 0, %97 ]
  %124 = phi %struct.block* [ %117, %114 ], [ %43, %97 ]
  %125 = phi i32 [ %120, %114 ], [ 1, %97 ]
  %126 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !373, !tbaa !112
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !374
  call void @llvm.dbg.value(metadata i64 %58, metadata !232, metadata !DIExpression()), !dbg !376
  %127 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %126, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @.str.11, i64 0, i64 0), %struct.block* noundef %124, i32 noundef %125, %struct.block* noundef nonnull %32, i32 noundef %123, i32 noundef %0) #7, !dbg !378
  br label %283, !dbg !379

128:                                              ; preds = %99, %108
  %129 = phi i64 [ %101, %99 ], [ %110, %108 ]
  %130 = phi %struct.block* [ %79, %99 ], [ %85, %108 ]
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !242, metadata !DIExpression()), !dbg !340
  %131 = and i64 %58, 2, !dbg !343
  %132 = icmp ne i64 %131, 0, !dbg !344
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !273, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !347
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i64 %64, metadata !278, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata %struct.block* %79, metadata !351, metadata !DIExpression()), !dbg !354
  %133 = and i64 %129, 8, !dbg !380
  %134 = icmp ne i64 %133, 0, !dbg !381
  %135 = xor i1 %132, %134, !dbg !382
  br i1 %135, label %136, label %148, !dbg !356

136:                                              ; preds = %128
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !273, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !386
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !388
  call void @llvm.dbg.value(metadata i64 %64, metadata !278, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.value(metadata %struct.block* %32, metadata !273, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.value(metadata i64 %64, metadata !278, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata %struct.block* %79, metadata !351, metadata !DIExpression()), !dbg !396
  %137 = trunc i64 %129 to i32, !dbg !398
  %138 = lshr i32 %137, 3, !dbg !398
  %139 = and i32 %138, 1, !dbg !398
  %140 = lshr exact i64 %131, 1, !dbg !398
  %141 = trunc i64 %140 to i32, !dbg !398
  br label %142, !dbg !398

142:                                              ; preds = %105, %136
  %143 = phi %struct.block* [ %130, %136 ], [ %43, %105 ]
  %144 = phi i32 [ %141, %136 ], [ 1, %105 ]
  %145 = phi i32 [ %139, %136 ], [ 0, %105 ]
  %146 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !399, !tbaa !112
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !242, metadata !DIExpression()), !dbg !400
  %147 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %146, i8* noundef getelementptr inbounds ([72 x i8], [72 x i8]* @.str.12, i64 0, i64 0), %struct.block* noundef %143, i32 noundef %145, %struct.block* noundef nonnull %32, i32 noundef %144, i32 noundef %0) #7, !dbg !402
  br label %283, !dbg !403

148:                                              ; preds = %76, %128, %81, %105
  %149 = phi %struct.block* [ %85, %81 ], [ %130, %128 ], [ %79, %76 ], [ %43, %105 ]
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !404
  call void @llvm.dbg.value(metadata i64 %58, metadata !232, metadata !DIExpression()), !dbg !407
  %150 = xor i1 %60, true, !dbg !409
  %151 = zext i1 %150 to i64, !dbg !409
  %152 = add i64 %33, %151, !dbg !409
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !273, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.value(metadata i64 %58, metadata !145, metadata !DIExpression()), !dbg !414
  call void @llvm.dbg.value(metadata i64 %64, metadata !278, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.value(metadata %struct.block* %149, metadata !90, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.value(metadata i64 %152, metadata !91, metadata !DIExpression()), !dbg !110
  %153 = icmp ult %struct.block* %149, %7, !dbg !179
  br i1 %153, label %31, label %29, !dbg !180, !llvm.loop !416

154:                                              ; preds = %29, %274
  %155 = phi i64 [ 0, %29 ], [ %276, %274 ]
  %156 = phi i64 [ 0, %29 ], [ %275, %274 ]
  call void @llvm.dbg.value(metadata i64 %155, metadata !98, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i64 %156, metadata !97, metadata !DIExpression()), !dbg !110
  %157 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %155, !dbg !419
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !100, metadata !DIExpression()), !dbg !420
  %158 = load %struct.block*, %struct.block** %157, align 8, !dbg !420, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %158, metadata !100, metadata !DIExpression()), !dbg !420
  %159 = icmp eq %struct.block* %158, null, !dbg !422
  br i1 %159, label %274, label %160, !dbg !423

160:                                              ; preds = %154
  %161 = icmp eq i64 %155, 0
  br i1 %161, label %166, label %162, !dbg !424

162:                                              ; preds = %160
  call void @llvm.dbg.value(metadata i64 %156, metadata !97, metadata !DIExpression()), !dbg !110
  %163 = tail call i8* @mem_heap_hi() #6, !dbg !425
  %164 = bitcast i8* %163 to %struct.block*, !dbg !427
  %165 = icmp ugt %struct.block* %158, %164, !dbg !428
  br i1 %165, label %186, label %190, !dbg !429

166:                                              ; preds = %160, %181
  %167 = phi %struct.block* [ %184, %181 ], [ %158, %160 ]
  %168 = phi i64 [ %182, %181 ], [ %156, %160 ]
  call void @llvm.dbg.value(metadata i64 %168, metadata !97, metadata !DIExpression()), !dbg !110
  %169 = tail call i8* @mem_heap_hi() #6, !dbg !425
  %170 = bitcast i8* %169 to %struct.block*, !dbg !427
  %171 = icmp ugt %struct.block* %167, %170, !dbg !428
  br i1 %171, label %186, label %172, !dbg !429

172:                                              ; preds = %166
  %173 = tail call i8* @mem_heap_lo() #6, !dbg !430
  %174 = bitcast i8* %173 to %struct.block*, !dbg !432
  %175 = icmp ult %struct.block* %167, %174, !dbg !433
  br i1 %175, label %196, label %176, !dbg !434

176:                                              ; preds = %172
  %177 = getelementptr %struct.block, %struct.block* %167, i64 0, i32 0, !dbg !435
  %178 = load i64, i64* %177, align 8, !dbg !435, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i64 %178, metadata !145, metadata !DIExpression()), !dbg !439
  %179 = and i64 %178, -16, !dbg !441
  call void @llvm.dbg.value(metadata i64 %179, metadata !442, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.value(metadata i64 16, metadata !447, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.value(metadata i64 0, metadata !448, metadata !DIExpression()), !dbg !452
  %180 = icmp ugt i64 %179, 16
  br i1 %180, label %221, label %181, !dbg !453

181:                                              ; preds = %176
  %182 = add i64 %168, 1, !dbg !454
  call void @llvm.dbg.value(metadata i64 %182, metadata !97, metadata !DIExpression()), !dbg !110
  %183 = getelementptr inbounds %struct.block, %struct.block* %167, i64 0, i32 1, i32 0, i32 0, !dbg !455
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !100, metadata !DIExpression()), !dbg !420
  %184 = load %struct.block*, %struct.block** %183, align 8, !dbg !420, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %184, metadata !100, metadata !DIExpression()), !dbg !420
  %185 = icmp eq %struct.block* %184, null, !dbg !422
  br i1 %185, label %274, label %166, !dbg !423, !llvm.loop !456

186:                                              ; preds = %162, %267, %166
  %187 = phi %struct.block* [ %167, %166 ], [ %258, %267 ], [ %158, %162 ]
  %188 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !458, !tbaa !112
  %189 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %188, i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.13, i64 0, i64 0), %struct.block* noundef nonnull %187, i32 noundef %0) #7, !dbg !460
  br label %283, !dbg !461

190:                                              ; preds = %162, %267
  %191 = phi i64 [ %268, %267 ], [ %156, %162 ]
  %192 = phi %struct.block* [ %258, %267 ], [ %158, %162 ]
  call void @llvm.dbg.value(metadata i64 %191, metadata !97, metadata !DIExpression()), !dbg !110
  %193 = tail call i8* @mem_heap_lo() #6, !dbg !430
  %194 = bitcast i8* %193 to %struct.block*, !dbg !432
  %195 = icmp ult %struct.block* %192, %194, !dbg !433
  br i1 %195, label %196, label %200, !dbg !434

196:                                              ; preds = %190, %172
  %197 = phi %struct.block* [ %167, %172 ], [ %192, %190 ]
  %198 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !462, !tbaa !112
  %199 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %198, i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.14, i64 0, i64 0), %struct.block* noundef nonnull %197, i32 noundef %0) #7, !dbg !464
  br label %283, !dbg !465

200:                                              ; preds = %190
  %201 = getelementptr %struct.block, %struct.block* %192, i64 0, i32 0, !dbg !435
  %202 = load i64, i64* %201, align 8, !dbg !435, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i64 %202, metadata !145, metadata !DIExpression()), !dbg !439
  %203 = and i64 %202, -16, !dbg !441
  call void @llvm.dbg.value(metadata i64 %203, metadata !442, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.value(metadata i64 16, metadata !447, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.value(metadata i64 0, metadata !448, metadata !DIExpression()), !dbg !452
  %204 = icmp ugt i64 %203, 16
  br i1 %204, label %205, label %219, !dbg !453

205:                                              ; preds = %200, %205
  %206 = phi i64 [ %212, %205 ], [ 0, %200 ]
  %207 = phi i64 [ %211, %205 ], [ 16, %200 ]
  call void @llvm.dbg.value(metadata i64 %206, metadata !448, metadata !DIExpression()), !dbg !452
  call void @llvm.dbg.value(metadata i64 %207, metadata !447, metadata !DIExpression()), !dbg !450
  %208 = icmp ult i64 %206, 4, !dbg !466
  %209 = add i64 %207, 16, !dbg !470
  %210 = shl i64 %207, 1, !dbg !470
  %211 = select i1 %208, i64 %209, i64 %210, !dbg !470
  call void @llvm.dbg.value(metadata i64 %211, metadata !447, metadata !DIExpression()), !dbg !450
  %212 = add nuw nsw i64 %206, 1, !dbg !471
  call void @llvm.dbg.value(metadata i64 %212, metadata !448, metadata !DIExpression()), !dbg !452
  %213 = icmp ult i64 %206, 12, !dbg !472
  %214 = icmp ult i64 %211, %203
  %215 = select i1 %213, i1 %214, i1 false, !dbg !453
  br i1 %215, label %205, label %216, !dbg !453, !llvm.loop !473

216:                                              ; preds = %205
  %217 = select i1 %213, i64 %212, i64 13
  %218 = icmp eq i64 %217, %155, !dbg !475
  br i1 %218, label %245, label %221, !dbg !476

219:                                              ; preds = %200
  %220 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !477, !tbaa !112
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i64 %202, metadata !145, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.value(metadata i64 undef, metadata !442, metadata !DIExpression()), !dbg !483
  call void @llvm.dbg.value(metadata i64 16, metadata !447, metadata !DIExpression()), !dbg !483
  call void @llvm.dbg.value(metadata i64 0, metadata !448, metadata !DIExpression()), !dbg !485
  br label %239, !dbg !486

221:                                              ; preds = %216, %176
  %222 = phi i64 [ 0, %176 ], [ %155, %216 ]
  %223 = phi i64 [ %179, %176 ], [ %203, %216 ]
  %224 = phi %struct.block* [ %167, %176 ], [ %192, %216 ]
  %225 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !477, !tbaa !112
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i64 %202, metadata !145, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.value(metadata i64 %223, metadata !442, metadata !DIExpression()), !dbg !483
  call void @llvm.dbg.value(metadata i64 16, metadata !447, metadata !DIExpression()), !dbg !483
  call void @llvm.dbg.value(metadata i64 0, metadata !448, metadata !DIExpression()), !dbg !485
  br label %226, !dbg !486

226:                                              ; preds = %221, %226
  %227 = phi i64 [ %233, %226 ], [ 0, %221 ]
  %228 = phi i64 [ %232, %226 ], [ 16, %221 ]
  call void @llvm.dbg.value(metadata i64 %227, metadata !448, metadata !DIExpression()), !dbg !485
  call void @llvm.dbg.value(metadata i64 %228, metadata !447, metadata !DIExpression()), !dbg !483
  %229 = icmp ult i64 %227, 4, !dbg !487
  %230 = add i64 %228, 16, !dbg !488
  %231 = shl i64 %228, 1, !dbg !488
  %232 = select i1 %229, i64 %230, i64 %231, !dbg !488
  call void @llvm.dbg.value(metadata i64 %232, metadata !447, metadata !DIExpression()), !dbg !483
  %233 = add nuw nsw i64 %227, 1, !dbg !489
  call void @llvm.dbg.value(metadata i64 %233, metadata !448, metadata !DIExpression()), !dbg !485
  %234 = icmp ult i64 %227, 12, !dbg !490
  %235 = icmp ult i64 %232, %223
  %236 = select i1 %234, i1 %235, i1 false, !dbg !486
  br i1 %236, label %226, label %237, !dbg !486, !llvm.loop !491

237:                                              ; preds = %226
  %238 = select i1 %234, i64 %233, i64 13
  br label %239

239:                                              ; preds = %219, %237
  %240 = phi i64 [ %222, %237 ], [ %155, %219 ]
  %241 = phi %struct.block* [ %224, %237 ], [ %192, %219 ]
  %242 = phi %struct._IO_FILE* [ %225, %237 ], [ %220, %219 ]
  %243 = phi i64 [ %238, %237 ], [ 0, %219 ]
  %244 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %242, i8* noundef getelementptr inbounds ([66 x i8], [66 x i8]* @.str.15, i64 0, i64 0), %struct.block* noundef nonnull %241, i64 noundef %240, i64 noundef %243) #7, !dbg !493
  br label %283, !dbg !494

245:                                              ; preds = %216
  %246 = getelementptr inbounds %struct.block, %struct.block* %192, i64 0, i32 1, i32 0, i32 1, !dbg !495
  %247 = load %struct.block*, %struct.block** %246, align 8, !dbg !495, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %247, metadata !104, metadata !DIExpression()), !dbg !496
  %248 = icmp eq %struct.block* %247, null, !dbg !497
  br i1 %248, label %256, label %249, !dbg !499

249:                                              ; preds = %245
  %250 = getelementptr inbounds %struct.block, %struct.block* %247, i64 0, i32 1, i32 0, i32 0, !dbg !500
  %251 = load %struct.block*, %struct.block** %250, align 8, !dbg !500, !tbaa !421
  %252 = icmp eq %struct.block* %251, %192, !dbg !501
  br i1 %252, label %256, label %253, !dbg !502

253:                                              ; preds = %249
  %254 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !503, !tbaa !112
  %255 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %254, i8* noundef getelementptr inbounds ([93 x i8], [93 x i8]* @.str.16, i64 0, i64 0), %struct.block* noundef nonnull %247, %struct.block* noundef nonnull %192, %struct.block* noundef %251, i32 noundef %0) #7, !dbg !505
  br label %283, !dbg !506

256:                                              ; preds = %249, %245
  %257 = getelementptr inbounds %struct.block, %struct.block* %192, i64 0, i32 1, i32 0, i32 0, !dbg !507
  %258 = load %struct.block*, %struct.block** %257, align 8, !dbg !507, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %258, metadata !109, metadata !DIExpression()), !dbg !496
  %259 = icmp eq %struct.block* %258, null, !dbg !508
  br i1 %259, label %272, label %260, !dbg !510

260:                                              ; preds = %256
  %261 = getelementptr inbounds %struct.block, %struct.block* %258, i64 0, i32 1, i32 0, i32 1, !dbg !511
  %262 = load %struct.block*, %struct.block** %261, align 8, !dbg !511, !tbaa !421
  %263 = icmp eq %struct.block* %262, %192, !dbg !512
  br i1 %263, label %267, label %264, !dbg !513

264:                                              ; preds = %260
  %265 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !514, !tbaa !112
  %266 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %265, i8* noundef getelementptr inbounds ([89 x i8], [89 x i8]* @.str.17, i64 0, i64 0), %struct.block* noundef nonnull %258, %struct.block* noundef nonnull %192, %struct.block* noundef %262, i32 noundef %0) #7, !dbg !516
  br label %283, !dbg !517

267:                                              ; preds = %260
  %268 = add i64 %191, 1, !dbg !454
  call void @llvm.dbg.value(metadata %struct.block* %258, metadata !100, metadata !DIExpression()), !dbg !420
  call void @llvm.dbg.value(metadata i64 %268, metadata !97, metadata !DIExpression()), !dbg !110
  %269 = tail call i8* @mem_heap_hi() #6, !dbg !425
  %270 = bitcast i8* %269 to %struct.block*, !dbg !427
  %271 = icmp ugt %struct.block* %258, %270, !dbg !428
  br i1 %271, label %186, label %190, !dbg !429

272:                                              ; preds = %256
  %273 = add i64 %191, 1, !dbg !454
  call void @llvm.dbg.value(metadata i64 %268, metadata !97, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !100, metadata !DIExpression()), !dbg !420
  br label %274, !dbg !518

274:                                              ; preds = %181, %272, %154
  %275 = phi i64 [ %156, %154 ], [ %273, %272 ], [ %182, %181 ], !dbg !110
  %276 = add nuw nsw i64 %155, 1, !dbg !518
  call void @llvm.dbg.value(metadata i64 %276, metadata !98, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i64 %275, metadata !97, metadata !DIExpression()), !dbg !110
  %277 = icmp eq i64 %276, 14, !dbg !519
  br i1 %277, label %278, label %154, !dbg !183, !llvm.loop !520

278:                                              ; preds = %274
  call void @llvm.dbg.value(metadata i64 undef, metadata !97, metadata !DIExpression()), !dbg !110
  %279 = icmp eq i64 %275, %30, !dbg !522
  br i1 %279, label %283, label %280, !dbg !524

280:                                              ; preds = %278
  %281 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !525, !tbaa !112
  %282 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %281, i8* noundef getelementptr inbounds ([96 x i8], [96 x i8]* @.str.18, i64 0, i64 0), i64 noundef %275, i64 noundef %30, i32 noundef %0) #7, !dbg !527
  br label %283, !dbg !528

283:                                              ; preds = %73, %92, %142, %122, %54, %49, %39, %253, %264, %186, %196, %239, %10, %17, %23, %280, %278
  %284 = phi i1 [ false, %10 ], [ false, %17 ], [ false, %23 ], [ false, %280 ], [ true, %278 ], [ false, %239 ], [ false, %196 ], [ false, %186 ], [ false, %264 ], [ false, %253 ], [ false, %39 ], [ false, %49 ], [ false, %54 ], [ false, %122 ], [ false, %142 ], [ false, %92 ], [ false, %73 ], !dbg !110
  ret i1 %284, !dbg !529
}

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #1

declare !dbg !530 i8* @mem_heap_hi() local_unnamed_addr #2

declare !dbg !534 i8* @mem_heap_lo() local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local zeroext i1 @mm_init() local_unnamed_addr #0 !dbg !535 {
  %1 = tail call i8* @mem_sbrk(i64 noundef 16) #6, !dbg !543
  call void @llvm.dbg.value(metadata i8* %1, metadata !539, metadata !DIExpression()), !dbg !544
  %2 = icmp eq i8* %1, inttoptr (i64 -1 to i8*), !dbg !545
  br i1 %2, label %11, label %3, !dbg !547

3:                                                ; preds = %0
  call void @llvm.dbg.value(metadata i8* %1, metadata !539, metadata !DIExpression()), !dbg !544
  %4 = getelementptr inbounds i8, i8* %1, i64 8, !dbg !548
  %5 = bitcast i8* %1 to <2 x i64>*, !dbg !549
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 8, !dbg !549, !tbaa !267
  store i8* %4, i8** bitcast (%struct.block** @heap_start to i8**), align 8, !dbg !550, !tbaa !112
  store %struct.block* null, %struct.block** @heap_end, align 8, !dbg !551, !tbaa !112
  call void @llvm.dbg.value(metadata i64 0, metadata !540, metadata !DIExpression()), !dbg !552
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(112) bitcast ([14 x %struct.block*]* @seg_list to i8*), i8 0, i64 112, i1 false), !dbg !553, !tbaa !112
  call void @llvm.dbg.value(metadata i32 undef, metadata !540, metadata !DIExpression()), !dbg !552
  call void @llvm.dbg.value(metadata i32 undef, metadata !540, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !552
  %6 = tail call fastcc %struct.block* @extend_heap(i64 noundef 1024), !dbg !556
  call void @llvm.dbg.value(metadata %struct.block* %6, metadata !542, metadata !DIExpression()), !dbg !544
  %7 = icmp eq %struct.block* %6, null, !dbg !557
  br i1 %7, label %9, label %8, !dbg !559

8:                                                ; preds = %3
  store %struct.block* %6, %struct.block** @heap_end, align 8, !dbg !560, !tbaa !112
  br label %9, !dbg !562

9:                                                ; preds = %3, %8
  %10 = xor i1 %7, true
  br label %11

11:                                               ; preds = %0, %9
  %12 = phi i1 [ %10, %9 ], [ false, %0 ], !dbg !544
  ret i1 %12, !dbg !563
}

declare !dbg !564 i8* @mem_sbrk(i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define internal fastcc %struct.block* @extend_heap(i64 noundef %0) unnamed_addr #0 !dbg !567 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !571, metadata !DIExpression()), !dbg !577
  call void @llvm.dbg.value(metadata i64 %0, metadata !578, metadata !DIExpression()), !dbg !584
  call void @llvm.dbg.value(metadata i64 16, metadata !583, metadata !DIExpression()), !dbg !584
  %2 = add i64 %0, 15, !dbg !586
  %3 = and i64 %2, -16, !dbg !587
  call void @llvm.dbg.value(metadata i64 %3, metadata !571, metadata !DIExpression()), !dbg !577
  %4 = tail call i8* @mem_sbrk(i64 noundef %3) #6, !dbg !588
  call void @llvm.dbg.value(metadata i8* %4, metadata !572, metadata !DIExpression()), !dbg !577
  %5 = icmp eq i8* %4, inttoptr (i64 -1 to i8*), !dbg !590
  br i1 %5, label %139, label %6, !dbg !591

6:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i8 1, metadata !573, metadata !DIExpression()), !dbg !577
  call void @llvm.dbg.value(metadata i8 0, metadata !574, metadata !DIExpression()), !dbg !577
  %7 = load %struct.block*, %struct.block** @heap_end, align 8, !dbg !592, !tbaa !112
  %8 = icmp eq %struct.block* %7, null, !dbg !594
  br i1 %8, label %9, label %16, !dbg !595

9:                                                ; preds = %6
  call void @llvm.dbg.value(metadata i8 undef, metadata !574, metadata !DIExpression()), !dbg !577
  call void @llvm.dbg.value(metadata i8 undef, metadata !573, metadata !DIExpression()), !dbg !577
  call void @llvm.dbg.value(metadata i8* %4, metadata !596, metadata !DIExpression()), !dbg !601
  %10 = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !603
  %11 = bitcast i8* %10 to %struct.block*, !dbg !604
  call void @llvm.dbg.value(metadata %struct.block* %24, metadata !575, metadata !DIExpression()), !dbg !577
  %12 = icmp eq i64 %3, 16, !dbg !605
  call void @llvm.dbg.value(metadata %struct.block* %24, metadata !606, metadata !DIExpression()), !dbg !619
  call void @llvm.dbg.value(metadata i64 %3, metadata !611, metadata !DIExpression()), !dbg !619
  call void @llvm.dbg.value(metadata i1 %20, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !619
  call void @llvm.dbg.value(metadata i1 false, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !619
  call void @llvm.dbg.value(metadata i1 %22, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !619
  call void @llvm.dbg.value(metadata i1 %25, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !619
  call void @llvm.dbg.value(metadata i64 %3, metadata !621, metadata !DIExpression()), !dbg !631
  call void @llvm.dbg.value(metadata i1 %20, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !631
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !631
  call void @llvm.dbg.value(metadata i1 %22, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !631
  call void @llvm.dbg.value(metadata i1 %25, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !631
  call void @llvm.dbg.value(metadata i64 %3, metadata !630, metadata !DIExpression()), !dbg !631
  %13 = or i64 %3, 4, !dbg !633
  call void @llvm.dbg.value(metadata i64 %3, metadata !630, metadata !DIExpression()), !dbg !631
  %14 = select i1 %12, i64 22, i64 %13, !dbg !634
  call void @llvm.dbg.value(metadata !DIArgList(i64 %41, i64 %40), metadata !630, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !631
  %15 = bitcast i8* %10 to i64*, !dbg !635
  store i64 %14, i64* %15, align 8, !dbg !636, !tbaa !135
  br i1 %12, label %71, label %44, !dbg !637

16:                                               ; preds = %6
  %17 = getelementptr %struct.block, %struct.block* %7, i64 0, i32 0, !dbg !638
  %18 = load i64, i64* %17, align 8, !dbg !638, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !640
  call void @llvm.dbg.value(metadata i64 %18, metadata !232, metadata !DIExpression()), !dbg !642
  %19 = and i64 %18, 1, !dbg !644
  %20 = icmp eq i64 %19, 0, !dbg !645
  call void @llvm.dbg.value(metadata i1 %20, metadata !573, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !577
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !242, metadata !DIExpression()), !dbg !646
  %21 = and i64 %18, 2, !dbg !648
  %22 = icmp eq i64 %21, 0, !dbg !649
  call void @llvm.dbg.value(metadata i8 undef, metadata !574, metadata !DIExpression()), !dbg !577
  call void @llvm.dbg.value(metadata i8 undef, metadata !573, metadata !DIExpression()), !dbg !577
  call void @llvm.dbg.value(metadata i8* %4, metadata !596, metadata !DIExpression()), !dbg !601
  %23 = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !603
  %24 = bitcast i8* %23 to %struct.block*, !dbg !604
  call void @llvm.dbg.value(metadata %struct.block* %24, metadata !575, metadata !DIExpression()), !dbg !577
  %25 = icmp eq i64 %3, 16, !dbg !605
  call void @llvm.dbg.value(metadata %struct.block* %24, metadata !606, metadata !DIExpression()), !dbg !619
  call void @llvm.dbg.value(metadata i64 %3, metadata !611, metadata !DIExpression()), !dbg !619
  call void @llvm.dbg.value(metadata i1 %20, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !619
  call void @llvm.dbg.value(metadata i1 false, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !619
  call void @llvm.dbg.value(metadata i1 %22, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !619
  call void @llvm.dbg.value(metadata i1 %25, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !619
  call void @llvm.dbg.value(metadata i64 %3, metadata !621, metadata !DIExpression()), !dbg !631
  call void @llvm.dbg.value(metadata i1 %20, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !631
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !631
  call void @llvm.dbg.value(metadata i1 %22, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !631
  call void @llvm.dbg.value(metadata i1 %25, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !631
  call void @llvm.dbg.value(metadata i64 %3, metadata !630, metadata !DIExpression()), !dbg !631
  %26 = or i64 %3, 4, !dbg !633
  call void @llvm.dbg.value(metadata i64 %3, metadata !630, metadata !DIExpression()), !dbg !631
  call void @llvm.dbg.value(metadata i64 %3, metadata !630, metadata !DIExpression()), !dbg !631
  br i1 %20, label %39, label %27, !dbg !633

27:                                               ; preds = %16
  %28 = select i1 %25, i64 22, i64 %26, !dbg !634
  call void @llvm.dbg.value(metadata i64 %40, metadata !630, metadata !DIExpression()), !dbg !631
  br i1 %22, label %37, label %29, !dbg !650

29:                                               ; preds = %27
  %30 = or i64 %28, 8, !dbg !650
  call void @llvm.dbg.value(metadata !DIArgList(i64 %41, i64 %40), metadata !630, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !631
  %31 = bitcast i8* %23 to i64*, !dbg !635
  store i64 %30, i64* %31, align 8, !dbg !636, !tbaa !135
  br i1 %25, label %71, label %32, !dbg !637

32:                                               ; preds = %29
  call void @llvm.dbg.value(metadata %struct.block* %24, metadata !250, metadata !DIExpression()), !dbg !651
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata !DIArgList(i64 %41, i64 %40), metadata !145, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !655
  %33 = and i64 %28, -16, !dbg !657
  call void @llvm.dbg.value(metadata i64 %55, metadata !253, metadata !DIExpression()), !dbg !651
  %34 = getelementptr inbounds i8, i8* %4, i64 %33, !dbg !658
  %35 = getelementptr inbounds i8, i8* %34, i64 -16, !dbg !659
  %36 = bitcast i8* %35 to i64*, !dbg !660
  call void @llvm.dbg.value(metadata i64* %58, metadata !616, metadata !DIExpression()), !dbg !661
  call void @llvm.dbg.value(metadata i64 %3, metadata !621, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata i1 %20, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !662
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !662
  call void @llvm.dbg.value(metadata i1 %22, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !662
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !662
  call void @llvm.dbg.value(metadata i64 %3, metadata !630, metadata !DIExpression()), !dbg !662
  br label %59, !dbg !664

37:                                               ; preds = %27
  call void @llvm.dbg.value(metadata !DIArgList(i64 %41, i64 %40), metadata !630, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !631
  %38 = bitcast i8* %23 to i64*, !dbg !635
  store i64 %28, i64* %38, align 8, !dbg !636, !tbaa !135
  br i1 %25, label %71, label %44, !dbg !637

39:                                               ; preds = %16
  %40 = select i1 %25, i64 18, i64 %3, !dbg !634
  call void @llvm.dbg.value(metadata i64 %40, metadata !630, metadata !DIExpression()), !dbg !631
  %41 = shl nuw nsw i64 %21, 2, !dbg !650
  %42 = or i64 %41, %40, !dbg !650
  call void @llvm.dbg.value(metadata !DIArgList(i64 %41, i64 %40), metadata !630, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !631
  %43 = bitcast i8* %23 to i64*, !dbg !635
  store i64 %42, i64* %43, align 8, !dbg !636, !tbaa !135
  br i1 %25, label %71, label %54, !dbg !637

44:                                               ; preds = %37, %9
  %45 = phi i64* [ %15, %9 ], [ %38, %37 ]
  %46 = phi i64 [ %13, %9 ], [ %26, %37 ]
  %47 = phi i8* [ %10, %9 ], [ %23, %37 ]
  %48 = phi %struct.block* [ %11, %9 ], [ %24, %37 ]
  call void @llvm.dbg.value(metadata %struct.block* %24, metadata !250, metadata !DIExpression()), !dbg !651
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata !DIArgList(i64 %41, i64 %40), metadata !145, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !655
  call void @llvm.dbg.value(metadata i64 %55, metadata !253, metadata !DIExpression()), !dbg !651
  %49 = getelementptr inbounds %struct.block, %struct.block* %48, i64 0, i32 1, !dbg !665
  %50 = bitcast %union.anon* %49 to i8*, !dbg !666
  %51 = getelementptr inbounds i8, i8* %50, i64 %3, !dbg !658
  %52 = getelementptr inbounds i8, i8* %51, i64 -16, !dbg !659
  %53 = bitcast i8* %52 to i64*, !dbg !660
  call void @llvm.dbg.value(metadata i64* %58, metadata !616, metadata !DIExpression()), !dbg !661
  call void @llvm.dbg.value(metadata i64 %3, metadata !621, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata i1 %20, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !662
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !662
  call void @llvm.dbg.value(metadata i1 %22, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !662
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !662
  call void @llvm.dbg.value(metadata i64 %3, metadata !630, metadata !DIExpression()), !dbg !662
  br label %64, !dbg !664

54:                                               ; preds = %39
  call void @llvm.dbg.value(metadata %struct.block* %24, metadata !250, metadata !DIExpression()), !dbg !651
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.value(metadata !DIArgList(i64 %41, i64 %40), metadata !145, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !655
  %55 = and i64 %40, -16, !dbg !657
  call void @llvm.dbg.value(metadata i64 %55, metadata !253, metadata !DIExpression()), !dbg !651
  %56 = getelementptr inbounds i8, i8* %4, i64 %55, !dbg !658
  %57 = getelementptr inbounds i8, i8* %56, i64 -16, !dbg !659
  %58 = bitcast i8* %57 to i64*, !dbg !660
  call void @llvm.dbg.value(metadata i64* %58, metadata !616, metadata !DIExpression()), !dbg !661
  call void @llvm.dbg.value(metadata i64 %3, metadata !621, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata i1 %20, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !662
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !662
  call void @llvm.dbg.value(metadata i1 %22, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !662
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !662
  call void @llvm.dbg.value(metadata i64 %3, metadata !630, metadata !DIExpression()), !dbg !662
  br i1 %22, label %64, label %59, !dbg !664

59:                                               ; preds = %32, %54
  %60 = phi i64 [ %26, %32 ], [ %3, %54 ]
  %61 = phi i64* [ %36, %32 ], [ %58, %54 ]
  %62 = bitcast i8* %23 to i64*
  %63 = or i64 %60, 8, !dbg !664
  br label %64, !dbg !664

64:                                               ; preds = %44, %54, %59
  %65 = phi i64* [ %61, %59 ], [ %58, %54 ], [ %53, %44 ]
  %66 = phi %struct.block* [ %24, %59 ], [ %24, %54 ], [ %48, %44 ]
  %67 = phi i8* [ %23, %59 ], [ %23, %54 ], [ %47, %44 ]
  %68 = phi i64* [ %62, %59 ], [ %43, %54 ], [ %45, %44 ]
  %69 = phi i64 [ %63, %59 ], [ %3, %54 ], [ %46, %44 ]
  call void @llvm.dbg.value(metadata i64 %69, metadata !630, metadata !DIExpression()), !dbg !662
  store i64 %69, i64* %65, align 8, !dbg !667, !tbaa !267
  %70 = load i64, i64* %68, align 8, !dbg !668, !tbaa !135
  br label %71, !dbg !677

71:                                               ; preds = %9, %29, %37, %39, %64
  %72 = phi i64 [ 22, %37 ], [ %42, %39 ], [ %70, %64 ], [ %30, %29 ], [ 22, %9 ], !dbg !668
  %73 = phi i64* [ %38, %37 ], [ %43, %39 ], [ %68, %64 ], [ %31, %29 ], [ %15, %9 ]
  %74 = phi i8* [ %23, %37 ], [ %23, %39 ], [ %67, %64 ], [ %23, %29 ], [ %10, %9 ]
  %75 = phi %struct.block* [ %24, %37 ], [ %24, %39 ], [ %66, %64 ], [ %24, %29 ], [ %11, %9 ]
  %76 = phi i1 [ true, %37 ], [ true, %39 ], [ false, %64 ], [ true, %29 ], [ true, %9 ]
  store %struct.block* %75, %struct.block** @heap_end, align 8, !dbg !678, !tbaa !112
  call void @llvm.dbg.value(metadata %struct.block* %24, metadata !674, metadata !DIExpression()) #6, !dbg !679
  call void @llvm.dbg.value(metadata i32 undef, metadata !675, metadata !DIExpression()) #6, !dbg !679
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !680
  call void @llvm.dbg.value(metadata i64 %72, metadata !145, metadata !DIExpression()) #6, !dbg !682
  %77 = and i64 %72, -16, !dbg !684
  switch i64 %77, label %83 [
    i64 0, label %115
    i64 16, label %78
  ], !dbg !685

78:                                               ; preds = %71
  call void @llvm.dbg.value(metadata %struct.block* %24, metadata !686, metadata !DIExpression()) #6, !dbg !690
  call void @llvm.dbg.value(metadata i32 undef, metadata !689, metadata !DIExpression()) #6, !dbg !690
  %79 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !693, !tbaa !112
  %80 = icmp eq %struct.block* %79, %75, !dbg !695
  %81 = select i1 %80, %struct.block* null, %struct.block* %79, !dbg !696
  %82 = getelementptr inbounds %struct.block, %struct.block* %75, i64 0, i32 1, i32 0, i32 0, !dbg !697
  store %struct.block* %81, %struct.block** %82, align 8, !dbg !699
  store %struct.block* %75, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !700, !tbaa !112
  br label %111, !dbg !701

83:                                               ; preds = %71
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !702
  call void @llvm.dbg.value(metadata i64 %72, metadata !145, metadata !DIExpression()) #6, !dbg !705
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !707
  call void @llvm.dbg.value(metadata i64 %72, metadata !145, metadata !DIExpression()) #6, !dbg !710
  call void @llvm.dbg.value(metadata i64 %77, metadata !442, metadata !DIExpression()) #6, !dbg !712
  call void @llvm.dbg.value(metadata i64 16, metadata !447, metadata !DIExpression()) #6, !dbg !712
  call void @llvm.dbg.value(metadata i64 0, metadata !448, metadata !DIExpression()) #6, !dbg !714
  %84 = icmp ugt i64 %77, 16
  br i1 %84, label %85, label %98, !dbg !715

85:                                               ; preds = %83, %85
  %86 = phi i64 [ %92, %85 ], [ 0, %83 ]
  %87 = phi i64 [ %91, %85 ], [ 16, %83 ]
  call void @llvm.dbg.value(metadata i64 %86, metadata !448, metadata !DIExpression()) #6, !dbg !714
  call void @llvm.dbg.value(metadata i64 %87, metadata !447, metadata !DIExpression()) #6, !dbg !712
  %88 = icmp ult i64 %86, 4, !dbg !716
  %89 = add i64 %87, 16, !dbg !717
  %90 = shl i64 %87, 1, !dbg !717
  %91 = select i1 %88, i64 %89, i64 %90, !dbg !717
  call void @llvm.dbg.value(metadata i64 %91, metadata !447, metadata !DIExpression()) #6, !dbg !712
  %92 = add nuw nsw i64 %86, 1, !dbg !718
  call void @llvm.dbg.value(metadata i64 %92, metadata !448, metadata !DIExpression()) #6, !dbg !714
  %93 = icmp ult i64 %86, 12, !dbg !719
  %94 = icmp ult i64 %91, %77
  %95 = select i1 %93, i1 %94, i1 false, !dbg !715
  br i1 %95, label %85, label %96, !dbg !715, !llvm.loop !720

96:                                               ; preds = %85
  %97 = select i1 %93, i64 %92, i64 13
  br label %98

98:                                               ; preds = %96, %83
  %99 = phi i64 [ 0, %83 ], [ %97, %96 ]
  call void @llvm.dbg.value(metadata %struct.block* %24, metadata !722, metadata !DIExpression()) #6, !dbg !729
  call void @llvm.dbg.value(metadata i64 %99, metadata !727, metadata !DIExpression()) #6, !dbg !729
  call void @llvm.dbg.value(metadata i32 undef, metadata !728, metadata !DIExpression()) #6, !dbg !729
  %100 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %99, !dbg !731
  %101 = load %struct.block*, %struct.block** %100, align 8, !dbg !731, !tbaa !112
  %102 = icmp eq %struct.block* %101, %75, !dbg !733
  %103 = select i1 %102, %struct.block* null, %struct.block* %101, !dbg !734
  %104 = getelementptr inbounds %struct.block, %struct.block* %75, i64 0, i32 1, i32 0, i32 0, !dbg !735
  store %struct.block* %103, %struct.block** %104, align 8, !dbg !737
  %105 = getelementptr inbounds %struct.block, %struct.block* %75, i64 0, i32 1, i32 0, i32 1, !dbg !738
  store %struct.block* null, %struct.block** %105, align 8, !dbg !739, !tbaa !421
  %106 = load %struct.block*, %struct.block** %100, align 8, !dbg !740, !tbaa !112
  %107 = icmp eq %struct.block* %106, null, !dbg !742
  br i1 %107, label %110, label %108, !dbg !743

108:                                              ; preds = %98
  %109 = getelementptr inbounds %struct.block, %struct.block* %106, i64 0, i32 1, i32 0, i32 1, !dbg !744
  store %struct.block* %75, %struct.block** %109, align 8, !dbg !746, !tbaa !421
  br label %110, !dbg !747

110:                                              ; preds = %108, %98
  store %struct.block* %75, %struct.block** %100, align 8, !dbg !748, !tbaa !112
  br label %111, !dbg !749

111:                                              ; preds = %78, %110
  call void @llvm.dbg.value(metadata %struct.block* %24, metadata !273, metadata !DIExpression()), !dbg !750
  %112 = load i64, i64* %73, align 8, !dbg !752, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !753
  call void @llvm.dbg.value(metadata i64 %120, metadata !145, metadata !DIExpression()), !dbg !755
  %113 = and i64 %112, -16, !dbg !757
  call void @llvm.dbg.value(metadata i64 %121, metadata !278, metadata !DIExpression()), !dbg !750
  %114 = getelementptr inbounds i8, i8* %74, i64 %113, !dbg !758
  call void @llvm.dbg.value(metadata i8* %122, metadata !576, metadata !DIExpression()), !dbg !577
  call void @llvm.dbg.value(metadata i8* %122, metadata !759, metadata !DIExpression()), !dbg !766
  call void @llvm.dbg.value(metadata i1 %25, metadata !764, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !766
  call void @llvm.dbg.value(metadata i8 0, metadata !765, metadata !DIExpression()), !dbg !766
  br label %124, !dbg !768

115:                                              ; preds = %71
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !702
  call void @llvm.dbg.value(metadata i64 %72, metadata !145, metadata !DIExpression()) #6, !dbg !705
  %116 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !769, !tbaa !112
  %117 = tail call i8* @mem_heap_lo() #6, !dbg !771
  %118 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %116, i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @.str.19, i64 0, i64 0), %struct.block* noundef nonnull %75, i8* noundef %117) #8, !dbg !774
  %119 = load %struct.block*, %struct.block** @heap_end, align 8, !dbg !775, !tbaa !112
  call void @llvm.dbg.value(metadata %struct.block* %24, metadata !273, metadata !DIExpression()), !dbg !750
  %120 = load i64, i64* %73, align 8, !dbg !752, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !753
  call void @llvm.dbg.value(metadata i64 %120, metadata !145, metadata !DIExpression()), !dbg !755
  %121 = and i64 %120, -16, !dbg !757
  call void @llvm.dbg.value(metadata i64 %121, metadata !278, metadata !DIExpression()), !dbg !750
  %122 = getelementptr inbounds i8, i8* %74, i64 %121, !dbg !758
  call void @llvm.dbg.value(metadata i8* %122, metadata !576, metadata !DIExpression()), !dbg !577
  call void @llvm.dbg.value(metadata i8* %122, metadata !759, metadata !DIExpression()), !dbg !766
  call void @llvm.dbg.value(metadata i1 %25, metadata !764, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !766
  call void @llvm.dbg.value(metadata i8 0, metadata !765, metadata !DIExpression()), !dbg !766
  %123 = icmp eq %struct.block* %119, null, !dbg !777
  br i1 %123, label %132, label %124, !dbg !768

124:                                              ; preds = %111, %115
  %125 = phi i8* [ %114, %111 ], [ %122, %115 ]
  %126 = phi %struct.block* [ %75, %111 ], [ %119, %115 ]
  %127 = getelementptr %struct.block, %struct.block* %126, i64 0, i32 0, !dbg !778
  %128 = load i64, i64* %127, align 8, !dbg !778, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !780
  call void @llvm.dbg.value(metadata i64 %128, metadata !232, metadata !DIExpression()), !dbg !782
  %129 = and i64 %128, 1, !dbg !784
  %130 = icmp eq i64 %129, 0, !dbg !785
  call void @llvm.dbg.value(metadata i8 undef, metadata !765, metadata !DIExpression()), !dbg !766
  call void @llvm.dbg.value(metadata i64 0, metadata !621, metadata !DIExpression()), !dbg !786
  call void @llvm.dbg.value(metadata i1 %130, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !786
  call void @llvm.dbg.value(metadata i1 true, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !786
  call void @llvm.dbg.value(metadata i1 %25, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !786
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !786
  call void @llvm.dbg.value(metadata i64 1, metadata !630, metadata !DIExpression()), !dbg !786
  %131 = select i1 %130, i64 1, i64 5, !dbg !788
  br label %132, !dbg !788

132:                                              ; preds = %115, %124
  %133 = phi i8* [ %122, %115 ], [ %125, %124 ]
  %134 = phi i64 [ 1, %115 ], [ %131, %124 ]
  call void @llvm.dbg.value(metadata i64 %134, metadata !630, metadata !DIExpression()), !dbg !786
  %135 = or i64 %134, 8, !dbg !789
  %136 = select i1 %76, i64 %135, i64 %134, !dbg !789
  call void @llvm.dbg.value(metadata i64 %136, metadata !630, metadata !DIExpression()), !dbg !786
  %137 = bitcast i8* %133 to i64*, !dbg !790
  store i64 %136, i64* %137, align 8, !dbg !791, !tbaa !135
  %138 = tail call fastcc %struct.block* @coalesce_block(%struct.block* noundef nonnull %75), !dbg !792
  call void @llvm.dbg.value(metadata %struct.block* %138, metadata !575, metadata !DIExpression()), !dbg !577
  br label %139

139:                                              ; preds = %1, %132
  %140 = phi %struct.block* [ %138, %132 ], [ null, %1 ], !dbg !577
  ret %struct.block* %140, !dbg !793
}

; Function Attrs: nounwind uwtable
define dso_local i8* @mm_malloc(i64 noundef %0) local_unnamed_addr #0 !dbg !794 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !798, metadata !DIExpression()), !dbg !807
  call void @llvm.dbg.value(metadata i8* null, metadata !802, metadata !DIExpression()), !dbg !807
  %2 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !808, !tbaa !112
  %3 = icmp eq %struct.block* %2, null, !dbg !810
  br i1 %3, label %4, label %14, !dbg !811

4:                                                ; preds = %1
  %5 = tail call i8* @mem_sbrk(i64 noundef 16) #6, !dbg !812
  call void @llvm.dbg.value(metadata i8* %5, metadata !539, metadata !DIExpression()) #6, !dbg !816
  %6 = icmp eq i8* %5, inttoptr (i64 -1 to i8*), !dbg !817
  br i1 %6, label %313, label %7, !dbg !818

7:                                                ; preds = %4
  call void @llvm.dbg.value(metadata i8* %5, metadata !539, metadata !DIExpression()) #6, !dbg !816
  %8 = getelementptr inbounds i8, i8* %5, i64 8, !dbg !819
  %9 = bitcast i8* %5 to <2 x i64>*, !dbg !820
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 8, !dbg !820, !tbaa !267
  store i8* %8, i8** bitcast (%struct.block** @heap_start to i8**), align 8, !dbg !821, !tbaa !112
  store %struct.block* null, %struct.block** @heap_end, align 8, !dbg !822, !tbaa !112
  call void @llvm.dbg.value(metadata i64 0, metadata !540, metadata !DIExpression()) #6, !dbg !823
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(112) bitcast ([14 x %struct.block*]* @seg_list to i8*), i8 0, i64 112, i1 false) #6, !dbg !824, !tbaa !112
  call void @llvm.dbg.value(metadata i32 undef, metadata !540, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #6, !dbg !823
  %10 = tail call fastcc %struct.block* @extend_heap(i64 noundef 1024) #6, !dbg !825
  call void @llvm.dbg.value(metadata %struct.block* %10, metadata !542, metadata !DIExpression()) #6, !dbg !816
  %11 = icmp eq %struct.block* %10, null, !dbg !826
  br i1 %11, label %313, label %12, !dbg !827

12:                                               ; preds = %7
  store %struct.block* %10, %struct.block** @heap_end, align 8, !dbg !828, !tbaa !112
  %13 = icmp eq i64 %0, 0
  br i1 %13, label %313, label %16, !dbg !829

14:                                               ; preds = %1
  %15 = icmp eq i64 %0, 0, !dbg !830
  br i1 %15, label %313, label %16, !dbg !832

16:                                               ; preds = %12, %14
  call void @llvm.dbg.value(metadata i64 %0, metadata !578, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)), !dbg !833
  call void @llvm.dbg.value(metadata i64 16, metadata !583, metadata !DIExpression()), !dbg !833
  %17 = add i64 %0, 23, !dbg !835
  %18 = and i64 %17, -16, !dbg !836
  call void @llvm.dbg.value(metadata i64 %18, metadata !799, metadata !DIExpression()), !dbg !807
  call void @llvm.dbg.value(metadata i64 %18, metadata !837, metadata !DIExpression()), !dbg !841
  call void @llvm.dbg.value(metadata i64 16, metadata !840, metadata !DIExpression()), !dbg !841
  %19 = icmp ugt i64 %18, 16, !dbg !843
  %20 = select i1 %19, i64 %18, i64 16, !dbg !844
  call void @llvm.dbg.value(metadata i64 %20, metadata !799, metadata !DIExpression()), !dbg !807
  call void @llvm.dbg.value(metadata i64 %20, metadata !845, metadata !DIExpression()), !dbg !862
  call void @llvm.dbg.value(metadata i64 %20, metadata !442, metadata !DIExpression()), !dbg !864
  call void @llvm.dbg.value(metadata i64 16, metadata !447, metadata !DIExpression()), !dbg !864
  call void @llvm.dbg.value(metadata i64 0, metadata !448, metadata !DIExpression()), !dbg !866
  br i1 %19, label %21, label %34, !dbg !867

21:                                               ; preds = %16, %21
  %22 = phi i64 [ %28, %21 ], [ 0, %16 ]
  %23 = phi i64 [ %27, %21 ], [ 16, %16 ]
  call void @llvm.dbg.value(metadata i64 %22, metadata !448, metadata !DIExpression()), !dbg !866
  call void @llvm.dbg.value(metadata i64 %23, metadata !447, metadata !DIExpression()), !dbg !864
  %24 = icmp ult i64 %22, 4, !dbg !868
  %25 = add i64 %23, 16, !dbg !869
  %26 = shl i64 %23, 1, !dbg !869
  %27 = select i1 %24, i64 %25, i64 %26, !dbg !869
  call void @llvm.dbg.value(metadata i64 %27, metadata !447, metadata !DIExpression()), !dbg !864
  %28 = add nuw nsw i64 %22, 1, !dbg !870
  call void @llvm.dbg.value(metadata i64 %28, metadata !448, metadata !DIExpression()), !dbg !866
  %29 = icmp ult i64 %22, 12, !dbg !871
  %30 = icmp ult i64 %27, %20
  %31 = select i1 %29, i1 %30, i1 false, !dbg !867
  br i1 %31, label %21, label %32, !dbg !867, !llvm.loop !872

32:                                               ; preds = %21
  %33 = select i1 %29, i64 %28, i64 13
  br label %34

34:                                               ; preds = %32, %16
  %35 = phi i64 [ %33, %32 ], [ 0, %16 ]
  br label %36, !dbg !874

36:                                               ; preds = %34, %84
  %37 = phi i64 [ %85, %84 ], [ %35, %34 ]
  call void @llvm.dbg.value(metadata i64 %37, metadata !849, metadata !DIExpression()), !dbg !875
  %38 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %37, !dbg !876
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !851, metadata !DIExpression()), !dbg !877
  %39 = load %struct.block*, %struct.block** %38, align 8, !dbg !877, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %39, metadata !851, metadata !DIExpression()), !dbg !877
  %40 = icmp eq %struct.block* %39, null, !dbg !878
  br i1 %40, label %84, label %41, !dbg !879

41:                                               ; preds = %36, %80
  %42 = phi %struct.block* [ %82, %80 ], [ %39, %36 ]
  %43 = getelementptr %struct.block, %struct.block* %42, i64 0, i32 0, !dbg !880
  %44 = load i64, i64* %43, align 8, !dbg !880, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !881
  call void @llvm.dbg.value(metadata i64 %44, metadata !145, metadata !DIExpression()), !dbg !883
  %45 = and i64 %44, -16, !dbg !885
  %46 = icmp ult i64 %45, %20, !dbg !886
  br i1 %46, label %80, label %47, !dbg !887

47:                                               ; preds = %41
  call void @llvm.dbg.value(metadata %struct.block* %42, metadata !855, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.value(metadata i64 0, metadata !860, metadata !DIExpression()), !dbg !889
  %48 = getelementptr inbounds %struct.block, %struct.block* %42, i64 0, i32 1, i32 0, i32 0, !dbg !890
  %49 = load %struct.block*, %struct.block** %48, align 8, !dbg !890, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %49, metadata !855, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.value(metadata i64 0, metadata !860, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !889
  %50 = icmp eq %struct.block* %49, null
  br i1 %50, label %87, label %51, !dbg !893, !llvm.loop !894

51:                                               ; preds = %47
  call void @llvm.dbg.value(metadata i64 1, metadata !860, metadata !DIExpression()), !dbg !889
  %52 = getelementptr %struct.block, %struct.block* %49, i64 0, i32 0
  %53 = load i64, i64* %52, align 8, !dbg !896, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %49, metadata !855, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !898
  call void @llvm.dbg.value(metadata i64 %53, metadata !145, metadata !DIExpression()), !dbg !900
  %54 = and i64 %53, -16, !dbg !902
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !903
  call void @llvm.dbg.value(metadata i64 %44, metadata !145, metadata !DIExpression()), !dbg !905
  %55 = icmp uge i64 %54, %45, !dbg !907
  %56 = icmp ult i64 %54, %20
  %57 = or i1 %55, %56, !dbg !908
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !909
  call void @llvm.dbg.value(metadata i64 %53, metadata !145, metadata !DIExpression()), !dbg !911
  br i1 %57, label %58, label %94, !dbg !908

58:                                               ; preds = %51
  call void @llvm.dbg.value(metadata %struct.block* %49, metadata !855, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.value(metadata i64 1, metadata !860, metadata !DIExpression()), !dbg !889
  %59 = getelementptr inbounds %struct.block, %struct.block* %49, i64 0, i32 1, i32 0, i32 0, !dbg !890
  %60 = load %struct.block*, %struct.block** %59, align 8, !dbg !890, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %60, metadata !855, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.value(metadata i64 1, metadata !860, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !889
  %61 = icmp eq %struct.block* %60, null
  br i1 %61, label %87, label %62, !dbg !893, !llvm.loop !894

62:                                               ; preds = %58
  call void @llvm.dbg.value(metadata i64 2, metadata !860, metadata !DIExpression()), !dbg !889
  %63 = getelementptr %struct.block, %struct.block* %60, i64 0, i32 0
  %64 = load i64, i64* %63, align 8, !dbg !896, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %60, metadata !855, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !898
  call void @llvm.dbg.value(metadata i64 %64, metadata !145, metadata !DIExpression()), !dbg !900
  %65 = and i64 %64, -16, !dbg !902
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !903
  call void @llvm.dbg.value(metadata i64 %44, metadata !145, metadata !DIExpression()), !dbg !905
  %66 = icmp uge i64 %65, %45, !dbg !907
  %67 = icmp ult i64 %65, %20
  %68 = or i1 %66, %67, !dbg !908
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !909
  call void @llvm.dbg.value(metadata i64 %64, metadata !145, metadata !DIExpression()), !dbg !911
  br i1 %68, label %69, label %94, !dbg !908

69:                                               ; preds = %62
  call void @llvm.dbg.value(metadata %struct.block* %60, metadata !855, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.value(metadata i64 2, metadata !860, metadata !DIExpression()), !dbg !889
  %70 = getelementptr inbounds %struct.block, %struct.block* %60, i64 0, i32 1, i32 0, i32 0, !dbg !890
  %71 = load %struct.block*, %struct.block** %70, align 8, !dbg !890, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %71, metadata !855, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.value(metadata i64 2, metadata !860, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !889
  %72 = icmp eq %struct.block* %71, null
  br i1 %72, label %87, label %73, !dbg !893, !llvm.loop !894

73:                                               ; preds = %69
  call void @llvm.dbg.value(metadata i64 3, metadata !860, metadata !DIExpression()), !dbg !889
  %74 = getelementptr %struct.block, %struct.block* %71, i64 0, i32 0
  %75 = load i64, i64* %74, align 8, !dbg !896, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %71, metadata !855, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !898
  call void @llvm.dbg.value(metadata i64 %75, metadata !145, metadata !DIExpression()), !dbg !900
  %76 = and i64 %75, -16, !dbg !902
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !903
  call void @llvm.dbg.value(metadata i64 %44, metadata !145, metadata !DIExpression()), !dbg !905
  %77 = icmp uge i64 %76, %45, !dbg !907
  %78 = icmp ult i64 %76, %20
  %79 = or i1 %77, %78, !dbg !908
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !909
  call void @llvm.dbg.value(metadata i64 %75, metadata !145, metadata !DIExpression()), !dbg !911
  br i1 %79, label %87, label %94, !dbg !908, !llvm.loop !894

80:                                               ; preds = %41
  %81 = getelementptr inbounds %struct.block, %struct.block* %42, i64 0, i32 1, i32 0, i32 0, !dbg !913
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !851, metadata !DIExpression()), !dbg !877
  %82 = load %struct.block*, %struct.block** %81, align 8, !dbg !877, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %82, metadata !851, metadata !DIExpression()), !dbg !877
  %83 = icmp eq %struct.block* %82, null, !dbg !878
  br i1 %83, label %84, label %41, !dbg !879, !llvm.loop !914

84:                                               ; preds = %80, %36
  %85 = add nuw nsw i64 %37, 1, !dbg !916
  call void @llvm.dbg.value(metadata i64 %85, metadata !849, metadata !DIExpression()), !dbg !875
  %86 = icmp eq i64 %85, 14, !dbg !917
  br i1 %86, label %89, label %36, !dbg !874, !llvm.loop !918

87:                                               ; preds = %73, %69, %58, %47
  call void @llvm.dbg.value(metadata %struct.block* %42, metadata !801, metadata !DIExpression()), !dbg !807
  %88 = icmp eq %struct.block* %42, null, !dbg !920
  br i1 %88, label %89, label %94, !dbg !922

89:                                               ; preds = %84, %87
  call void @llvm.dbg.value(metadata i64 %20, metadata !837, metadata !DIExpression()), !dbg !923
  call void @llvm.dbg.value(metadata i64 1024, metadata !840, metadata !DIExpression()), !dbg !923
  %90 = icmp ugt i64 %20, 1024, !dbg !926
  %91 = select i1 %90, i64 %18, i64 1024, !dbg !927
  call void @llvm.dbg.value(metadata i64 %91, metadata !800, metadata !DIExpression()), !dbg !807
  %92 = tail call fastcc %struct.block* @extend_heap(i64 noundef %91), !dbg !928
  call void @llvm.dbg.value(metadata %struct.block* %92, metadata !801, metadata !DIExpression()), !dbg !807
  %93 = icmp eq %struct.block* %92, null, !dbg !929
  br i1 %93, label %313, label %94, !dbg !931

94:                                               ; preds = %51, %62, %73, %89, %87
  %95 = phi %struct.block* [ %92, %89 ], [ %42, %87 ], [ %49, %51 ], [ %60, %62 ], [ %71, %73 ], !dbg !807
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !801, metadata !DIExpression()), !dbg !807
  %96 = getelementptr %struct.block, %struct.block* %95, i64 0, i32 0, !dbg !932
  %97 = load i64, i64* %96, align 8, !dbg !932, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !933
  call void @llvm.dbg.value(metadata i64 %97, metadata !145, metadata !DIExpression()), !dbg !935
  %98 = and i64 %97, -16, !dbg !937
  call void @llvm.dbg.value(metadata i64 %98, metadata !803, metadata !DIExpression()), !dbg !807
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !938, metadata !DIExpression()), !dbg !951
  call void @llvm.dbg.value(metadata i32 undef, metadata !941, metadata !DIExpression()), !dbg !951
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !953
  call void @llvm.dbg.value(metadata i64 %97, metadata !145, metadata !DIExpression()), !dbg !955
  %99 = icmp ugt i64 %98, 16, !dbg !957
  br i1 %99, label %100, label %129, !dbg !958

100:                                              ; preds = %94, %100
  %101 = phi i64 [ %107, %100 ], [ 0, %94 ]
  %102 = phi i64 [ %106, %100 ], [ 16, %94 ]
  call void @llvm.dbg.value(metadata i64 %101, metadata !448, metadata !DIExpression()), !dbg !959
  call void @llvm.dbg.value(metadata i64 %102, metadata !447, metadata !DIExpression()), !dbg !961
  %103 = icmp ult i64 %101, 4, !dbg !962
  %104 = add i64 %102, 16, !dbg !963
  %105 = shl i64 %102, 1, !dbg !963
  %106 = select i1 %103, i64 %104, i64 %105, !dbg !963
  call void @llvm.dbg.value(metadata i64 %106, metadata !447, metadata !DIExpression()), !dbg !961
  %107 = add nuw nsw i64 %101, 1, !dbg !964
  call void @llvm.dbg.value(metadata i64 %107, metadata !448, metadata !DIExpression()), !dbg !959
  %108 = icmp ult i64 %101, 12, !dbg !965
  %109 = icmp ult i64 %106, %98
  %110 = select i1 %108, i1 %109, i1 false, !dbg !966
  br i1 %110, label %100, label %111, !dbg !966, !llvm.loop !967

111:                                              ; preds = %100
  call void @llvm.dbg.value(metadata i64 undef, metadata !942, metadata !DIExpression()), !dbg !969
  %112 = getelementptr inbounds %struct.block, %struct.block* %95, i64 0, i32 1, i32 0, i32 1, !dbg !970
  %113 = load %struct.block*, %struct.block** %112, align 8, !dbg !970, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %113, metadata !945, metadata !DIExpression()), !dbg !969
  %114 = getelementptr inbounds %struct.block, %struct.block* %95, i64 0, i32 1, i32 0, i32 0, !dbg !971
  %115 = load %struct.block*, %struct.block** %114, align 8, !dbg !971, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %115, metadata !946, metadata !DIExpression()), !dbg !969
  %116 = icmp eq %struct.block* %113, null, !dbg !972
  br i1 %116, label %117, label %123, !dbg !974

117:                                              ; preds = %111
  %118 = select i1 %108, i64 %107, i64 13
  call void @llvm.dbg.value(metadata i64 %118, metadata !942, metadata !DIExpression()), !dbg !969
  %119 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %118, !dbg !975
  store %struct.block* %115, %struct.block** %119, align 8, !dbg !977, !tbaa !112
  %120 = icmp eq %struct.block* %115, null, !dbg !978
  br i1 %120, label %144, label %121, !dbg !980

121:                                              ; preds = %117
  %122 = getelementptr inbounds %struct.block, %struct.block* %115, i64 0, i32 1, i32 0, i32 1, !dbg !981
  store %struct.block* null, %struct.block** %122, align 8, !dbg !983, !tbaa !421
  br label %144, !dbg !984

123:                                              ; preds = %111
  %124 = icmp eq %struct.block* %115, null, !dbg !985
  %125 = getelementptr inbounds %struct.block, %struct.block* %113, i64 0, i32 1, i32 0, i32 0, !dbg !988
  br i1 %124, label %126, label %127, !dbg !989

126:                                              ; preds = %123
  store %struct.block* null, %struct.block** %125, align 8, !dbg !990, !tbaa !421
  br label %144, !dbg !992

127:                                              ; preds = %123
  store %struct.block* %115, %struct.block** %125, align 8, !dbg !993, !tbaa !421
  %128 = getelementptr inbounds %struct.block, %struct.block* %115, i64 0, i32 1, i32 0, i32 1, !dbg !995
  store %struct.block* %113, %struct.block** %128, align 8, !dbg !996, !tbaa !421
  br label %144

129:                                              ; preds = %94
  %130 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !997, !tbaa !112
  %131 = icmp eq %struct.block* %130, %95, !dbg !998
  br i1 %131, label %132, label %135, !dbg !999

132:                                              ; preds = %129
  %133 = getelementptr inbounds %struct.block, %struct.block* %95, i64 0, i32 1, i32 0, i32 0, !dbg !1000
  %134 = load %struct.block*, %struct.block** %133, align 8, !dbg !1000, !tbaa !421
  store %struct.block* %134, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1002, !tbaa !112
  br label %144, !dbg !1003

135:                                              ; preds = %129, %135
  %136 = phi %struct.block* [ %138, %135 ], [ %130, %129 ], !dbg !1004
  call void @llvm.dbg.value(metadata %struct.block* %136, metadata !947, metadata !DIExpression()), !dbg !1004
  %137 = getelementptr inbounds %struct.block, %struct.block* %136, i64 0, i32 1, i32 0, i32 0, !dbg !1005
  %138 = load %struct.block*, %struct.block** %137, align 8, !dbg !1005, !tbaa !421
  %139 = icmp eq %struct.block* %138, %95, !dbg !1006
  br i1 %139, label %140, label %135, !dbg !1007, !llvm.loop !1008

140:                                              ; preds = %135
  %141 = getelementptr inbounds %struct.block, %struct.block* %136, i64 0, i32 1, i32 0, i32 0, !dbg !1005
  %142 = getelementptr inbounds %struct.block, %struct.block* %95, i64 0, i32 1, i32 0, i32 0, !dbg !1010
  %143 = load %struct.block*, %struct.block** %142, align 8, !dbg !1010, !tbaa !421
  store %struct.block* %143, %struct.block** %141, align 8, !dbg !1011, !tbaa !421
  br label %144

144:                                              ; preds = %117, %121, %126, %127, %132, %140
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !327, metadata !DIExpression()), !dbg !1012
  %145 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !1014, !tbaa !112
  %146 = icmp eq %struct.block* %145, %95, !dbg !1015
  br i1 %146, label %147, label %149, !dbg !1016

147:                                              ; preds = %144
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !351, metadata !DIExpression()), !dbg !1017
  %148 = icmp eq i64 %98, 16, !dbg !1019
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !606, metadata !DIExpression()), !dbg !1020
  call void @llvm.dbg.value(metadata i64 %98, metadata !611, metadata !DIExpression()), !dbg !1020
  call void @llvm.dbg.value(metadata i1 %152, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1020
  call void @llvm.dbg.value(metadata i1 true, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1020
  call void @llvm.dbg.value(metadata i1 %154, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1020
  call void @llvm.dbg.value(metadata i1 %155, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1020
  call void @llvm.dbg.value(metadata i64 %98, metadata !621, metadata !DIExpression()), !dbg !1022
  call void @llvm.dbg.value(metadata i1 %152, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1022
  call void @llvm.dbg.value(metadata i1 true, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1022
  call void @llvm.dbg.value(metadata i1 %154, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1022
  call void @llvm.dbg.value(metadata i1 %155, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1022
  call void @llvm.dbg.value(metadata i64 %156, metadata !630, metadata !DIExpression()), !dbg !1022
  br label %157, !dbg !1024

149:                                              ; preds = %144
  %150 = load i64, i64* %96, align 8, !dbg !1025, !tbaa !135
  %151 = and i64 %150, 4, !dbg !1026
  %152 = icmp eq i64 %151, 0, !dbg !1027
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !351, metadata !DIExpression()), !dbg !1017
  %153 = and i64 %150, 8, !dbg !1028
  %154 = icmp ne i64 %153, 0, !dbg !1029
  %155 = icmp eq i64 %98, 16, !dbg !1019
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !606, metadata !DIExpression()), !dbg !1020
  call void @llvm.dbg.value(metadata i64 %98, metadata !611, metadata !DIExpression()), !dbg !1020
  call void @llvm.dbg.value(metadata i1 %152, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1020
  call void @llvm.dbg.value(metadata i1 true, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1020
  call void @llvm.dbg.value(metadata i1 %154, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1020
  call void @llvm.dbg.value(metadata i1 %155, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1020
  call void @llvm.dbg.value(metadata i64 %98, metadata !621, metadata !DIExpression()), !dbg !1022
  call void @llvm.dbg.value(metadata i1 %152, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1022
  call void @llvm.dbg.value(metadata i1 true, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1022
  call void @llvm.dbg.value(metadata i1 %154, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1022
  call void @llvm.dbg.value(metadata i1 %155, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1022
  call void @llvm.dbg.value(metadata i64 %98, metadata !630, metadata !DIExpression()), !dbg !1022
  %156 = or i64 %98, 1, !dbg !1030
  call void @llvm.dbg.value(metadata i64 %156, metadata !630, metadata !DIExpression()), !dbg !1022
  br i1 %152, label %161, label %157, !dbg !1024

157:                                              ; preds = %147, %149
  %158 = phi i1 [ %148, %147 ], [ %155, %149 ]
  %159 = phi i1 [ false, %147 ], [ %154, %149 ]
  %160 = or i64 %98, 5, !dbg !1024
  br label %161, !dbg !1024

161:                                              ; preds = %149, %157
  %162 = phi i1 [ %158, %157 ], [ %155, %149 ]
  %163 = phi i1 [ %159, %157 ], [ %154, %149 ]
  %164 = phi i64 [ %160, %157 ], [ %156, %149 ]
  call void @llvm.dbg.value(metadata i64 %164, metadata !630, metadata !DIExpression()), !dbg !1022
  %165 = or i64 %164, 2, !dbg !1031
  %166 = select i1 %162, i64 %165, i64 %164, !dbg !1031
  call void @llvm.dbg.value(metadata i64 %166, metadata !630, metadata !DIExpression()), !dbg !1022
  %167 = or i64 %166, 8, !dbg !1032
  %168 = select i1 %163, i64 %167, i64 %166, !dbg !1032
  call void @llvm.dbg.value(metadata i64 %168, metadata !630, metadata !DIExpression()), !dbg !1022
  store i64 %168, i64* %96, align 8, !dbg !1033, !tbaa !135
  %169 = load %struct.block*, %struct.block** @heap_end, align 8, !dbg !1034, !tbaa !112
  %170 = icmp eq %struct.block* %95, %169, !dbg !1035
  br i1 %170, label %195, label %171, !dbg !1036

171:                                              ; preds = %161
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !273, metadata !DIExpression()), !dbg !1037
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1039
  call void @llvm.dbg.value(metadata i64 %168, metadata !145, metadata !DIExpression()), !dbg !1041
  %172 = and i64 %168, -16, !dbg !1043
  call void @llvm.dbg.value(metadata i64 %172, metadata !278, metadata !DIExpression()), !dbg !1037
  %173 = bitcast %struct.block* %95 to i8*, !dbg !1044
  %174 = getelementptr inbounds i8, i8* %173, i64 %172, !dbg !1045
  call void @llvm.dbg.value(metadata i8* %174, metadata !804, metadata !DIExpression()), !dbg !1046
  %175 = bitcast i8* %174 to i64*, !dbg !1047
  %176 = load i64, i64* %175, align 8, !dbg !1047, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 %176, metadata !145, metadata !DIExpression()), !dbg !1050
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !242, metadata !DIExpression()), !dbg !1052
  %177 = and i64 %168, 2, !dbg !1054
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !242, metadata !DIExpression()), !dbg !1055
  %178 = and i64 %176, 2, !dbg !1057
  call void @llvm.dbg.value(metadata i8* %174, metadata !606, metadata !DIExpression()), !dbg !1058
  call void @llvm.dbg.value(metadata i64 %176, metadata !611, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1058
  call void @llvm.dbg.value(metadata i1 true, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1058
  call void @llvm.dbg.value(metadata i1 undef, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1058
  call void @llvm.dbg.value(metadata i1 undef, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1058
  call void @llvm.dbg.value(metadata i1 undef, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1058
  call void @llvm.dbg.value(metadata i64 %176, metadata !621, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1060
  call void @llvm.dbg.value(metadata i1 true, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1060
  call void @llvm.dbg.value(metadata i1 undef, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1060
  call void @llvm.dbg.value(metadata i1 undef, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1060
  call void @llvm.dbg.value(metadata i1 undef, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1060
  call void @llvm.dbg.value(metadata i64 %176, metadata !630, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1060
  %179 = and i64 %176, -15, !dbg !1062
  call void @llvm.dbg.value(metadata !DIArgList(i64 %179, i64 undef), metadata !630, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !1060
  %180 = shl nuw nsw i64 %177, 2, !dbg !1063
  %181 = or i64 %180, %178, !dbg !1064
  %182 = or i64 %181, %179, !dbg !1063
  %183 = or i64 %182, 4, !dbg !1063
  call void @llvm.dbg.value(metadata !DIArgList(i64 %180, i64 %179, i64 undef), metadata !630, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !1060
  store i64 %183, i64* %175, align 8, !dbg !1065, !tbaa !135
  %184 = and i64 %176, 3, !dbg !1066
  %185 = icmp eq i64 %184, 0, !dbg !1066
  br i1 %185, label %186, label %195, !dbg !1066

186:                                              ; preds = %171
  %187 = icmp eq i64 %177, 0, !dbg !1067
  call void @llvm.dbg.value(metadata i1 %187, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1058
  call void @llvm.dbg.value(metadata i1 %187, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1060
  %188 = and i64 %176, -16, !dbg !1068
  call void @llvm.dbg.value(metadata i64 %188, metadata !611, metadata !DIExpression()), !dbg !1058
  call void @llvm.dbg.value(metadata i64 %188, metadata !621, metadata !DIExpression()), !dbg !1060
  call void @llvm.dbg.value(metadata i64 %188, metadata !630, metadata !DIExpression()), !dbg !1060
  call void @llvm.dbg.value(metadata i8* %174, metadata !804, metadata !DIExpression()), !dbg !1046
  call void @llvm.dbg.value(metadata i8* %174, metadata !606, metadata !DIExpression()), !dbg !1058
  call void @llvm.dbg.value(metadata i8* %174, metadata !250, metadata !DIExpression()), !dbg !1069
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1071
  call void @llvm.dbg.value(metadata !DIArgList(i64 %180, i64 %179, i64 undef), metadata !145, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value)), !dbg !1073
  call void @llvm.dbg.value(metadata i64 %188, metadata !253, metadata !DIExpression()), !dbg !1069
  %189 = getelementptr inbounds i8, i8* %174, i64 8, !dbg !1075
  %190 = getelementptr inbounds i8, i8* %189, i64 %188, !dbg !1076
  %191 = getelementptr inbounds i8, i8* %190, i64 -16, !dbg !1077
  %192 = bitcast i8* %191 to i64*, !dbg !1078
  call void @llvm.dbg.value(metadata i64* %192, metadata !616, metadata !DIExpression()), !dbg !1079
  call void @llvm.dbg.value(metadata i64 %176, metadata !621, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1080
  call void @llvm.dbg.value(metadata i1 true, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1080
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1080
  call void @llvm.dbg.value(metadata i1 undef, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1080
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1080
  call void @llvm.dbg.value(metadata i64 %188, metadata !630, metadata !DIExpression(DW_OP_constu, 4, DW_OP_or, DW_OP_stack_value)), !dbg !1080
  %193 = select i1 %187, i64 4, i64 12, !dbg !1082
  %194 = or i64 %188, %193, !dbg !1082
  call void @llvm.dbg.value(metadata i64 %194, metadata !630, metadata !DIExpression()), !dbg !1080
  store i64 %194, i64* %192, align 8, !dbg !1083, !tbaa !267
  br label %195, !dbg !1084

195:                                              ; preds = %186, %171, %161
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !1085, metadata !DIExpression()) #6, !dbg !1098
  call void @llvm.dbg.value(metadata i64 %20, metadata !1090, metadata !DIExpression()) #6, !dbg !1098
  %196 = load i64, i64* %96, align 8, !dbg !1100, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1101
  call void @llvm.dbg.value(metadata i64 %196, metadata !145, metadata !DIExpression()) #6, !dbg !1103
  %197 = and i64 %196, -16, !dbg !1105
  call void @llvm.dbg.value(metadata i64 %197, metadata !1091, metadata !DIExpression()) #6, !dbg !1098
  %198 = sub i64 %197, %20, !dbg !1106
  %199 = icmp eq i64 %198, 0, !dbg !1107
  br i1 %199, label %310, label %200, !dbg !1108

200:                                              ; preds = %195
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !327, metadata !DIExpression()) #6, !dbg !1109
  br i1 %146, label %201, label %203, !dbg !1111

201:                                              ; preds = %200
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !351, metadata !DIExpression()) #6, !dbg !1112
  %202 = icmp ult i64 %18, 17, !dbg !1114
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !606, metadata !DIExpression()) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i64 %20, metadata !611, metadata !DIExpression()) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i1 %205, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i1 true, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i1 %207, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i1 %208, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i64 %20, metadata !621, metadata !DIExpression()) #6, !dbg !1117
  call void @llvm.dbg.value(metadata i1 %205, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1117
  call void @llvm.dbg.value(metadata i1 true, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1117
  call void @llvm.dbg.value(metadata i1 %207, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1117
  call void @llvm.dbg.value(metadata i1 %208, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1117
  call void @llvm.dbg.value(metadata i64 %209, metadata !630, metadata !DIExpression()) #6, !dbg !1117
  br label %210, !dbg !1119

203:                                              ; preds = %200
  %204 = and i64 %196, 4, !dbg !1120
  %205 = icmp eq i64 %204, 0, !dbg !1121
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !351, metadata !DIExpression()) #6, !dbg !1112
  %206 = and i64 %196, 8, !dbg !1122
  %207 = icmp ne i64 %206, 0, !dbg !1123
  %208 = icmp ult i64 %18, 17, !dbg !1114
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !606, metadata !DIExpression()) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i64 %20, metadata !611, metadata !DIExpression()) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i1 %205, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i1 true, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i1 %207, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i1 %208, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1115
  call void @llvm.dbg.value(metadata i64 %20, metadata !621, metadata !DIExpression()) #6, !dbg !1117
  call void @llvm.dbg.value(metadata i1 %205, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1117
  call void @llvm.dbg.value(metadata i1 true, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1117
  call void @llvm.dbg.value(metadata i1 %207, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1117
  call void @llvm.dbg.value(metadata i1 %208, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1117
  call void @llvm.dbg.value(metadata i64 %20, metadata !630, metadata !DIExpression()) #6, !dbg !1117
  %209 = or i64 %20, 1, !dbg !1124
  call void @llvm.dbg.value(metadata i64 %209, metadata !630, metadata !DIExpression()) #6, !dbg !1117
  br i1 %205, label %214, label %210, !dbg !1119

210:                                              ; preds = %203, %201
  %211 = phi i1 [ %202, %201 ], [ %208, %203 ]
  %212 = phi i1 [ false, %201 ], [ %207, %203 ]
  %213 = or i64 %20, 5, !dbg !1119
  br label %214, !dbg !1119

214:                                              ; preds = %210, %203
  %215 = phi i1 [ %211, %210 ], [ %208, %203 ]
  %216 = phi i1 [ %212, %210 ], [ %207, %203 ]
  %217 = phi i64 [ %213, %210 ], [ %209, %203 ]
  call void @llvm.dbg.value(metadata i64 %217, metadata !630, metadata !DIExpression()) #6, !dbg !1117
  %218 = or i64 %217, 2, !dbg !1125
  %219 = select i1 %215, i64 %218, i64 %217, !dbg !1125
  call void @llvm.dbg.value(metadata i64 %219, metadata !630, metadata !DIExpression()) #6, !dbg !1117
  %220 = or i64 %219, 8, !dbg !1126
  %221 = select i1 %216, i64 %220, i64 %219, !dbg !1126
  call void @llvm.dbg.value(metadata i64 %221, metadata !630, metadata !DIExpression()) #6, !dbg !1117
  store i64 %221, i64* %96, align 8, !dbg !1127, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !273, metadata !DIExpression()) #6, !dbg !1128
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1130
  call void @llvm.dbg.value(metadata i64 %221, metadata !145, metadata !DIExpression()) #6, !dbg !1132
  %222 = and i64 %221, -16, !dbg !1134
  call void @llvm.dbg.value(metadata i64 %222, metadata !278, metadata !DIExpression()) #6, !dbg !1128
  %223 = bitcast %struct.block* %95 to i8*, !dbg !1135
  %224 = getelementptr inbounds i8, i8* %223, i64 %222, !dbg !1136
  %225 = bitcast i8* %224 to %struct.block*, !dbg !1137
  call void @llvm.dbg.value(metadata %struct.block* %225, metadata !1092, metadata !DIExpression()) #6, !dbg !1138
  %226 = icmp eq i64 %198, 16, !dbg !1139
  call void @llvm.dbg.value(metadata %struct.block* %225, metadata !606, metadata !DIExpression()) #6, !dbg !1140
  call void @llvm.dbg.value(metadata i64 %198, metadata !611, metadata !DIExpression()) #6, !dbg !1140
  call void @llvm.dbg.value(metadata i1 true, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1140
  call void @llvm.dbg.value(metadata i1 false, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1140
  call void @llvm.dbg.value(metadata i1 %208, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1140
  call void @llvm.dbg.value(metadata i1 %226, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1140
  call void @llvm.dbg.value(metadata i64 %198, metadata !621, metadata !DIExpression()) #6, !dbg !1142
  call void @llvm.dbg.value(metadata i1 true, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1142
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1142
  call void @llvm.dbg.value(metadata i1 %208, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1142
  call void @llvm.dbg.value(metadata i1 %226, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1142
  call void @llvm.dbg.value(metadata i64 %198, metadata !630, metadata !DIExpression()) #6, !dbg !1142
  %227 = or i64 %198, 4, !dbg !1144
  call void @llvm.dbg.value(metadata i64 %227, metadata !630, metadata !DIExpression()) #6, !dbg !1142
  %228 = select i1 %226, i64 22, i64 %227, !dbg !1145
  call void @llvm.dbg.value(metadata i64 %228, metadata !630, metadata !DIExpression()) #6, !dbg !1142
  %229 = or i64 %228, 8, !dbg !1146
  %230 = select i1 %215, i64 %229, i64 %228, !dbg !1146
  call void @llvm.dbg.value(metadata i64 %230, metadata !630, metadata !DIExpression()) #6, !dbg !1142
  %231 = bitcast i8* %224 to i64*, !dbg !1147
  store i64 %230, i64* %231, align 8, !dbg !1148, !tbaa !135
  br i1 %226, label %241, label %232, !dbg !1149

232:                                              ; preds = %214
  call void @llvm.dbg.value(metadata %struct.block* %225, metadata !250, metadata !DIExpression()) #6, !dbg !1150
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1152
  call void @llvm.dbg.value(metadata i64 %230, metadata !145, metadata !DIExpression()) #6, !dbg !1154
  %233 = and i64 %230, -16, !dbg !1156
  call void @llvm.dbg.value(metadata i64 %233, metadata !253, metadata !DIExpression()) #6, !dbg !1150
  %234 = getelementptr inbounds i8, i8* %224, i64 8, !dbg !1157
  %235 = getelementptr inbounds i8, i8* %234, i64 %233, !dbg !1158
  %236 = getelementptr inbounds i8, i8* %235, i64 -16, !dbg !1159
  %237 = bitcast i8* %236 to i64*, !dbg !1160
  call void @llvm.dbg.value(metadata i64* %237, metadata !616, metadata !DIExpression()) #6, !dbg !1161
  call void @llvm.dbg.value(metadata i64 %198, metadata !621, metadata !DIExpression()) #6, !dbg !1162
  call void @llvm.dbg.value(metadata i1 true, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1162
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1162
  call void @llvm.dbg.value(metadata i1 %208, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1162
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1162
  call void @llvm.dbg.value(metadata i64 %227, metadata !630, metadata !DIExpression()) #6, !dbg !1162
  %238 = or i64 %198, 12, !dbg !1164
  %239 = select i1 %215, i64 %238, i64 %227, !dbg !1164
  call void @llvm.dbg.value(metadata i64 %239, metadata !630, metadata !DIExpression()) #6, !dbg !1162
  store i64 %239, i64* %237, align 8, !dbg !1165, !tbaa !267
  %240 = load i64, i64* %231, align 8, !dbg !1166, !tbaa !135
  br label %241, !dbg !1168

241:                                              ; preds = %232, %214
  %242 = phi i64 [ %230, %214 ], [ %240, %232 ], !dbg !1166
  call void @llvm.dbg.value(metadata %struct.block* %225, metadata !674, metadata !DIExpression()) #6, !dbg !1169
  call void @llvm.dbg.value(metadata i32 undef, metadata !675, metadata !DIExpression()) #6, !dbg !1169
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1170
  call void @llvm.dbg.value(metadata i64 %242, metadata !145, metadata !DIExpression()) #6, !dbg !1172
  %243 = and i64 %242, -16, !dbg !1174
  switch i64 %243, label %250 [
    i64 0, label %282
    i64 16, label %244
  ], !dbg !1175

244:                                              ; preds = %241
  call void @llvm.dbg.value(metadata %struct.block* %225, metadata !686, metadata !DIExpression()) #6, !dbg !1176
  call void @llvm.dbg.value(metadata i32 undef, metadata !689, metadata !DIExpression()) #6, !dbg !1176
  %245 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1178, !tbaa !112
  %246 = icmp eq %struct.block* %245, %225, !dbg !1179
  %247 = select i1 %246, %struct.block* null, %struct.block* %245, !dbg !1180
  %248 = getelementptr inbounds i8, i8* %224, i64 8, !dbg !1181
  %249 = bitcast i8* %248 to %struct.block**, !dbg !1181
  store %struct.block* %247, %struct.block** %249, align 8, !dbg !1182
  store i8* %224, i8** bitcast ([14 x %struct.block*]* @seg_list to i8**), align 16, !dbg !1183, !tbaa !112
  br label %286, !dbg !1184

250:                                              ; preds = %241
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1185
  call void @llvm.dbg.value(metadata i64 %242, metadata !145, metadata !DIExpression()) #6, !dbg !1187
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1189
  call void @llvm.dbg.value(metadata i64 %242, metadata !145, metadata !DIExpression()) #6, !dbg !1191
  call void @llvm.dbg.value(metadata i64 %243, metadata !442, metadata !DIExpression()) #6, !dbg !1193
  call void @llvm.dbg.value(metadata i64 16, metadata !447, metadata !DIExpression()) #6, !dbg !1193
  call void @llvm.dbg.value(metadata i64 0, metadata !448, metadata !DIExpression()) #6, !dbg !1195
  %251 = icmp ugt i64 %243, 16
  br i1 %251, label %252, label %265, !dbg !1196

252:                                              ; preds = %250, %252
  %253 = phi i64 [ %259, %252 ], [ 0, %250 ]
  %254 = phi i64 [ %258, %252 ], [ 16, %250 ]
  call void @llvm.dbg.value(metadata i64 %253, metadata !448, metadata !DIExpression()) #6, !dbg !1195
  call void @llvm.dbg.value(metadata i64 %254, metadata !447, metadata !DIExpression()) #6, !dbg !1193
  %255 = icmp ult i64 %253, 4, !dbg !1197
  %256 = add i64 %254, 16, !dbg !1198
  %257 = shl i64 %254, 1, !dbg !1198
  %258 = select i1 %255, i64 %256, i64 %257, !dbg !1198
  call void @llvm.dbg.value(metadata i64 %258, metadata !447, metadata !DIExpression()) #6, !dbg !1193
  %259 = add nuw nsw i64 %253, 1, !dbg !1199
  call void @llvm.dbg.value(metadata i64 %259, metadata !448, metadata !DIExpression()) #6, !dbg !1195
  %260 = icmp ult i64 %253, 12, !dbg !1200
  %261 = icmp ult i64 %258, %243
  %262 = select i1 %260, i1 %261, i1 false, !dbg !1196
  br i1 %262, label %252, label %263, !dbg !1196, !llvm.loop !1201

263:                                              ; preds = %252
  %264 = select i1 %260, i64 %259, i64 13
  br label %265

265:                                              ; preds = %263, %250
  %266 = phi i64 [ 0, %250 ], [ %264, %263 ]
  call void @llvm.dbg.value(metadata %struct.block* %225, metadata !722, metadata !DIExpression()) #6, !dbg !1203
  call void @llvm.dbg.value(metadata i64 %266, metadata !727, metadata !DIExpression()) #6, !dbg !1203
  call void @llvm.dbg.value(metadata i32 undef, metadata !728, metadata !DIExpression()) #6, !dbg !1203
  %267 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %266, !dbg !1205
  %268 = load %struct.block*, %struct.block** %267, align 8, !dbg !1205, !tbaa !112
  %269 = icmp eq %struct.block* %268, %225, !dbg !1206
  %270 = select i1 %269, %struct.block* null, %struct.block* %268, !dbg !1207
  %271 = getelementptr inbounds i8, i8* %224, i64 8, !dbg !1208
  %272 = bitcast i8* %271 to %struct.block**, !dbg !1208
  store %struct.block* %270, %struct.block** %272, align 8, !dbg !1209
  %273 = getelementptr inbounds i8, i8* %224, i64 16, !dbg !1210
  %274 = bitcast i8* %273 to %struct.block**, !dbg !1210
  store %struct.block* null, %struct.block** %274, align 8, !dbg !1211, !tbaa !421
  %275 = load %struct.block*, %struct.block** %267, align 8, !dbg !1212, !tbaa !112
  %276 = icmp eq %struct.block* %275, null, !dbg !1213
  br i1 %276, label %280, label %277, !dbg !1214

277:                                              ; preds = %265
  %278 = getelementptr inbounds %struct.block, %struct.block* %275, i64 0, i32 1, i32 0, i32 1, !dbg !1215
  %279 = bitcast %struct.block** %278 to i8**, !dbg !1216
  store i8* %224, i8** %279, align 8, !dbg !1216, !tbaa !421
  br label %280, !dbg !1217

280:                                              ; preds = %277, %265
  %281 = bitcast %struct.block** %267 to i8**, !dbg !1218
  store i8* %224, i8** %281, align 8, !dbg !1218, !tbaa !112
  br label %286, !dbg !1219

282:                                              ; preds = %241
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1185
  call void @llvm.dbg.value(metadata i64 %242, metadata !145, metadata !DIExpression()) #6, !dbg !1187
  %283 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1220, !tbaa !112
  %284 = tail call i8* @mem_heap_lo() #6, !dbg !1221
  %285 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %283, i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @.str.19, i64 0, i64 0), i8* noundef nonnull %224, i8* noundef %284) #8, !dbg !1223
  br label %286

286:                                              ; preds = %282, %280, %244
  %287 = load %struct.block*, %struct.block** @heap_end, align 8, !dbg !1224, !tbaa !112
  %288 = icmp eq %struct.block* %287, %95, !dbg !1225
  br i1 %288, label %289, label %290, !dbg !1226

289:                                              ; preds = %286
  store i8* %224, i8** bitcast (%struct.block** @heap_end to i8**), align 8, !dbg !1227, !tbaa !112
  br label %310, !dbg !1229

290:                                              ; preds = %286
  call void @llvm.dbg.value(metadata %struct.block* %225, metadata !273, metadata !DIExpression()) #6, !dbg !1230
  %291 = load i64, i64* %231, align 8, !dbg !1232, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1233
  call void @llvm.dbg.value(metadata i64 %291, metadata !145, metadata !DIExpression()) #6, !dbg !1235
  %292 = and i64 %291, -16, !dbg !1237
  call void @llvm.dbg.value(metadata i64 %292, metadata !278, metadata !DIExpression()) #6, !dbg !1230
  %293 = getelementptr inbounds i8, i8* %224, i64 %292, !dbg !1238
  call void @llvm.dbg.value(metadata i8* %293, metadata !1095, metadata !DIExpression()) #6, !dbg !1239
  %294 = bitcast i8* %293 to i64*, !dbg !1240
  %295 = load i64, i64* %294, align 8, !dbg !1240, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1241
  call void @llvm.dbg.value(metadata i64 %295, metadata !145, metadata !DIExpression()) #6, !dbg !1243
  %296 = and i64 %295, -16, !dbg !1245
  call void @llvm.dbg.value(metadata i8* %293, metadata !606, metadata !DIExpression()) #6, !dbg !1246
  call void @llvm.dbg.value(metadata i64 %296, metadata !611, metadata !DIExpression()) #6, !dbg !1246
  call void @llvm.dbg.value(metadata i1 false, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1246
  call void @llvm.dbg.value(metadata i1 undef, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1246
  call void @llvm.dbg.value(metadata i1 %226, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1246
  call void @llvm.dbg.value(metadata i1 undef, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1246
  call void @llvm.dbg.value(metadata i64 %296, metadata !621, metadata !DIExpression()) #6, !dbg !1248
  call void @llvm.dbg.value(metadata i1 false, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1248
  call void @llvm.dbg.value(metadata i1 undef, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1248
  call void @llvm.dbg.value(metadata i1 %226, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1248
  call void @llvm.dbg.value(metadata i1 undef, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1248
  call void @llvm.dbg.value(metadata i64 %295, metadata !630, metadata !DIExpression(DW_OP_constu, 18446744073709551601, DW_OP_and, DW_OP_stack_value)) #6, !dbg !1248
  %297 = and i64 %295, -13, !dbg !1250
  call void @llvm.dbg.value(metadata i64 %297, metadata !630, metadata !DIExpression()) #6, !dbg !1248
  %298 = or i64 %297, 8, !dbg !1251
  %299 = select i1 %226, i64 %298, i64 %297, !dbg !1251
  call void @llvm.dbg.value(metadata i64 %299, metadata !630, metadata !DIExpression()) #6, !dbg !1248
  store i64 %299, i64* %294, align 8, !dbg !1252, !tbaa !135
  %300 = and i64 %295, 3, !dbg !1253
  %301 = icmp eq i64 %300, 0, !dbg !1253
  br i1 %301, label %302, label %310, !dbg !1253

302:                                              ; preds = %290
  call void @llvm.dbg.value(metadata i8* %293, metadata !1095, metadata !DIExpression()) #6, !dbg !1239
  call void @llvm.dbg.value(metadata i8* %293, metadata !606, metadata !DIExpression()) #6, !dbg !1246
  call void @llvm.dbg.value(metadata i8* %293, metadata !250, metadata !DIExpression()) #6, !dbg !1254
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1256
  call void @llvm.dbg.value(metadata i64 %299, metadata !145, metadata !DIExpression()) #6, !dbg !1258
  %303 = and i64 %299, -16, !dbg !1260
  call void @llvm.dbg.value(metadata i64 %303, metadata !253, metadata !DIExpression()) #6, !dbg !1254
  %304 = getelementptr inbounds i8, i8* %293, i64 8, !dbg !1261
  %305 = getelementptr inbounds i8, i8* %304, i64 %303, !dbg !1262
  %306 = getelementptr inbounds i8, i8* %305, i64 -16, !dbg !1263
  %307 = bitcast i8* %306 to i64*, !dbg !1264
  call void @llvm.dbg.value(metadata i64* %307, metadata !616, metadata !DIExpression()) #6, !dbg !1265
  call void @llvm.dbg.value(metadata i64 %296, metadata !621, metadata !DIExpression()) #6, !dbg !1266
  call void @llvm.dbg.value(metadata i1 false, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1266
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1266
  call void @llvm.dbg.value(metadata i1 %226, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1266
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1266
  call void @llvm.dbg.value(metadata i64 %296, metadata !630, metadata !DIExpression()) #6, !dbg !1266
  %308 = or i64 %296, 8, !dbg !1268
  %309 = select i1 %226, i64 %308, i64 %296, !dbg !1268
  call void @llvm.dbg.value(metadata i64 %309, metadata !630, metadata !DIExpression()) #6, !dbg !1266
  store i64 %309, i64* %307, align 8, !dbg !1269, !tbaa !267
  br label %310, !dbg !1270

310:                                              ; preds = %195, %289, %290, %302
  call void @llvm.dbg.value(metadata %struct.block* %95, metadata !1271, metadata !DIExpression()), !dbg !1276
  %311 = getelementptr inbounds %struct.block, %struct.block* %95, i64 0, i32 1, !dbg !1278
  %312 = bitcast %union.anon* %311 to i8*, !dbg !1279
  call void @llvm.dbg.value(metadata i8* %312, metadata !802, metadata !DIExpression()), !dbg !807
  br label %313

313:                                              ; preds = %7, %4, %89, %14, %12, %310
  %314 = phi i8* [ %312, %310 ], [ null, %12 ], [ null, %14 ], [ null, %89 ], [ null, %4 ], [ null, %7 ], !dbg !807
  ret i8* %314, !dbg !1280
}

; Function Attrs: nounwind uwtable
define dso_local void @mm_free(i8* noundef %0) local_unnamed_addr #0 !dbg !1281 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !1285, metadata !DIExpression()), !dbg !1293
  %2 = icmp eq i8* %0, null, !dbg !1294
  br i1 %2, label %129, label %3, !dbg !1296

3:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i8* %0, metadata !596, metadata !DIExpression()), !dbg !1297
  %4 = getelementptr inbounds i8, i8* %0, i64 -8, !dbg !1299
  %5 = bitcast i8* %4 to %struct.block*, !dbg !1300
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !1286, metadata !DIExpression()), !dbg !1293
  %6 = bitcast i8* %4 to i64*, !dbg !1301
  %7 = load i64, i64* %6, align 8, !dbg !1301, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1302
  call void @llvm.dbg.value(metadata i64 %7, metadata !145, metadata !DIExpression()), !dbg !1304
  %8 = and i64 %7, -16, !dbg !1306
  call void @llvm.dbg.value(metadata i64 %8, metadata !1287, metadata !DIExpression()), !dbg !1293
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !327, metadata !DIExpression()), !dbg !1307
  %9 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !1309, !tbaa !112
  %10 = icmp eq %struct.block* %9, %5, !dbg !1310
  br i1 %10, label %11, label %15, !dbg !1311

11:                                               ; preds = %3
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !351, metadata !DIExpression()), !dbg !1312
  %12 = icmp eq i64 %8, 16, !dbg !1314
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !606, metadata !DIExpression()), !dbg !1315
  call void @llvm.dbg.value(metadata i64 %8, metadata !611, metadata !DIExpression()), !dbg !1315
  call void @llvm.dbg.value(metadata i1 %17, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1315
  call void @llvm.dbg.value(metadata i1 false, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1315
  call void @llvm.dbg.value(metadata i1 %19, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1315
  call void @llvm.dbg.value(metadata i1 %20, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1315
  call void @llvm.dbg.value(metadata i64 %8, metadata !621, metadata !DIExpression()), !dbg !1317
  call void @llvm.dbg.value(metadata i1 %17, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1317
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1317
  call void @llvm.dbg.value(metadata i1 %19, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1317
  call void @llvm.dbg.value(metadata i1 %20, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1317
  call void @llvm.dbg.value(metadata i64 %8, metadata !630, metadata !DIExpression()), !dbg !1317
  %13 = or i64 %8, 4, !dbg !1319
  call void @llvm.dbg.value(metadata i64 %8, metadata !630, metadata !DIExpression()), !dbg !1317
  %14 = select i1 %12, i64 22, i64 %13, !dbg !1320
  call void @llvm.dbg.value(metadata !DIArgList(i64 %18, i64 %33), metadata !630, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !1317
  store i64 %14, i64* %6, align 8, !dbg !1321, !tbaa !135
  br i1 %12, label %52, label %35, !dbg !1322

15:                                               ; preds = %3
  %16 = and i64 %7, 4, !dbg !1323
  %17 = icmp eq i64 %16, 0, !dbg !1324
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !351, metadata !DIExpression()), !dbg !1312
  %18 = and i64 %7, 8, !dbg !1325
  %19 = icmp eq i64 %18, 0, !dbg !1326
  %20 = icmp eq i64 %8, 16, !dbg !1314
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !606, metadata !DIExpression()), !dbg !1315
  call void @llvm.dbg.value(metadata i64 %8, metadata !611, metadata !DIExpression()), !dbg !1315
  call void @llvm.dbg.value(metadata i1 %17, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1315
  call void @llvm.dbg.value(metadata i1 false, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1315
  call void @llvm.dbg.value(metadata i1 %19, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1315
  call void @llvm.dbg.value(metadata i1 %20, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1315
  call void @llvm.dbg.value(metadata i64 %8, metadata !621, metadata !DIExpression()), !dbg !1317
  call void @llvm.dbg.value(metadata i1 %17, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1317
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1317
  call void @llvm.dbg.value(metadata i1 %19, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1317
  call void @llvm.dbg.value(metadata i1 %20, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1317
  call void @llvm.dbg.value(metadata i64 %8, metadata !630, metadata !DIExpression()), !dbg !1317
  %21 = or i64 %8, 4, !dbg !1319
  call void @llvm.dbg.value(metadata i64 %8, metadata !630, metadata !DIExpression()), !dbg !1317
  call void @llvm.dbg.value(metadata i64 %8, metadata !630, metadata !DIExpression()), !dbg !1317
  br i1 %17, label %32, label %22, !dbg !1319

22:                                               ; preds = %15
  %23 = select i1 %20, i64 22, i64 %21, !dbg !1320
  call void @llvm.dbg.value(metadata i64 %33, metadata !630, metadata !DIExpression()), !dbg !1317
  br i1 %19, label %31, label %24, !dbg !1327

24:                                               ; preds = %22
  %25 = or i64 %23, 8, !dbg !1327
  call void @llvm.dbg.value(metadata !DIArgList(i64 %18, i64 %33), metadata !630, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !1317
  store i64 %25, i64* %6, align 8, !dbg !1321, !tbaa !135
  br i1 %20, label %52, label %26, !dbg !1322

26:                                               ; preds = %24
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !250, metadata !DIExpression()), !dbg !1328
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1330
  call void @llvm.dbg.value(metadata !DIArgList(i64 %18, i64 %33), metadata !145, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !1332
  %27 = and i64 %23, -16, !dbg !1334
  call void @llvm.dbg.value(metadata i64 %41, metadata !253, metadata !DIExpression()), !dbg !1328
  %28 = getelementptr inbounds i8, i8* %0, i64 %27, !dbg !1335
  %29 = getelementptr inbounds i8, i8* %28, i64 -16, !dbg !1336
  %30 = bitcast i8* %29 to i64*, !dbg !1337
  call void @llvm.dbg.value(metadata i64* %44, metadata !616, metadata !DIExpression()), !dbg !1338
  call void @llvm.dbg.value(metadata i64 %8, metadata !621, metadata !DIExpression()), !dbg !1339
  call void @llvm.dbg.value(metadata i1 %17, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1339
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1339
  call void @llvm.dbg.value(metadata i1 %19, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1339
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1339
  call void @llvm.dbg.value(metadata i64 %8, metadata !630, metadata !DIExpression()), !dbg !1339
  br label %45, !dbg !1341

31:                                               ; preds = %22
  call void @llvm.dbg.value(metadata !DIArgList(i64 %18, i64 %33), metadata !630, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !1317
  store i64 %23, i64* %6, align 8, !dbg !1321, !tbaa !135
  br i1 %20, label %52, label %35, !dbg !1322

32:                                               ; preds = %15
  %33 = select i1 %20, i64 18, i64 %8, !dbg !1320
  call void @llvm.dbg.value(metadata i64 %33, metadata !630, metadata !DIExpression()), !dbg !1317
  %34 = or i64 %33, %18, !dbg !1327
  call void @llvm.dbg.value(metadata !DIArgList(i64 %18, i64 %33), metadata !630, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !1317
  store i64 %34, i64* %6, align 8, !dbg !1321, !tbaa !135
  br i1 %20, label %52, label %40, !dbg !1322

35:                                               ; preds = %31, %11
  %36 = phi i64 [ %13, %11 ], [ %21, %31 ]
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !250, metadata !DIExpression()), !dbg !1328
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1330
  call void @llvm.dbg.value(metadata !DIArgList(i64 %18, i64 %33), metadata !145, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !1332
  call void @llvm.dbg.value(metadata i64 %41, metadata !253, metadata !DIExpression()), !dbg !1328
  %37 = getelementptr inbounds i8, i8* %0, i64 %8, !dbg !1335
  %38 = getelementptr inbounds i8, i8* %37, i64 -16, !dbg !1336
  %39 = bitcast i8* %38 to i64*, !dbg !1337
  call void @llvm.dbg.value(metadata i64* %44, metadata !616, metadata !DIExpression()), !dbg !1338
  call void @llvm.dbg.value(metadata i64 %8, metadata !621, metadata !DIExpression()), !dbg !1339
  call void @llvm.dbg.value(metadata i1 %17, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1339
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1339
  call void @llvm.dbg.value(metadata i1 %19, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1339
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1339
  call void @llvm.dbg.value(metadata i64 %8, metadata !630, metadata !DIExpression()), !dbg !1339
  br label %49, !dbg !1341

40:                                               ; preds = %32
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !250, metadata !DIExpression()), !dbg !1328
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1330
  call void @llvm.dbg.value(metadata !DIArgList(i64 %18, i64 %33), metadata !145, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value)), !dbg !1332
  %41 = and i64 %33, -16, !dbg !1334
  call void @llvm.dbg.value(metadata i64 %41, metadata !253, metadata !DIExpression()), !dbg !1328
  %42 = getelementptr inbounds i8, i8* %0, i64 %41, !dbg !1335
  %43 = getelementptr inbounds i8, i8* %42, i64 -16, !dbg !1336
  %44 = bitcast i8* %43 to i64*, !dbg !1337
  call void @llvm.dbg.value(metadata i64* %44, metadata !616, metadata !DIExpression()), !dbg !1338
  call void @llvm.dbg.value(metadata i64 %8, metadata !621, metadata !DIExpression()), !dbg !1339
  call void @llvm.dbg.value(metadata i1 %17, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1339
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1339
  call void @llvm.dbg.value(metadata i1 %19, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1339
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1339
  call void @llvm.dbg.value(metadata i64 %8, metadata !630, metadata !DIExpression()), !dbg !1339
  br i1 %19, label %49, label %45, !dbg !1341

45:                                               ; preds = %26, %40
  %46 = phi i64 [ %21, %26 ], [ %8, %40 ]
  %47 = phi i64* [ %30, %26 ], [ %44, %40 ]
  %48 = or i64 %46, 8, !dbg !1341
  br label %49, !dbg !1341

49:                                               ; preds = %35, %40, %45
  %50 = phi i64* [ %47, %45 ], [ %44, %40 ], [ %39, %35 ]
  %51 = phi i64 [ %48, %45 ], [ %8, %40 ], [ %36, %35 ]
  call void @llvm.dbg.value(metadata i64 %51, metadata !630, metadata !DIExpression()), !dbg !1339
  store i64 %51, i64* %50, align 8, !dbg !1342, !tbaa !267
  br label %52, !dbg !1343

52:                                               ; preds = %11, %24, %31, %32, %49
  %53 = phi i1 [ true, %31 ], [ true, %32 ], [ false, %49 ], [ true, %24 ], [ true, %11 ]
  %54 = load %struct.block*, %struct.block** @heap_end, align 8, !dbg !1344, !tbaa !112
  %55 = icmp eq %struct.block* %54, %5, !dbg !1345
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !273, metadata !DIExpression()), !dbg !1346
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !273, metadata !DIExpression()), !dbg !1348
  %56 = load i64, i64* %6, align 8, !dbg !1350, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1351
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1353
  call void @llvm.dbg.value(metadata i64 %56, metadata !145, metadata !DIExpression()), !dbg !1355
  call void @llvm.dbg.value(metadata i64 %56, metadata !145, metadata !DIExpression()), !dbg !1357
  %57 = and i64 %56, -16, !dbg !1350
  call void @llvm.dbg.value(metadata i64 %57, metadata !278, metadata !DIExpression()), !dbg !1346
  call void @llvm.dbg.value(metadata i64 %57, metadata !278, metadata !DIExpression()), !dbg !1348
  %58 = getelementptr inbounds i8, i8* %4, i64 %57, !dbg !1350
  br i1 %55, label %76, label %59, !dbg !1359

59:                                               ; preds = %52
  call void @llvm.dbg.value(metadata i8* %58, metadata !1288, metadata !DIExpression()), !dbg !1360
  %60 = bitcast i8* %58 to i64*, !dbg !1361
  %61 = load i64, i64* %60, align 8, !dbg !1361, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1362
  call void @llvm.dbg.value(metadata i64 %61, metadata !145, metadata !DIExpression()), !dbg !1364
  %62 = and i64 %61, -16, !dbg !1366
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !1367
  call void @llvm.dbg.value(metadata i64 %61, metadata !232, metadata !DIExpression()), !dbg !1369
  call void @llvm.dbg.value(metadata i8* %58, metadata !606, metadata !DIExpression()), !dbg !1371
  call void @llvm.dbg.value(metadata i64 %62, metadata !611, metadata !DIExpression()), !dbg !1371
  call void @llvm.dbg.value(metadata i1 false, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1371
  call void @llvm.dbg.value(metadata i1 undef, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1371
  call void @llvm.dbg.value(metadata i1 %20, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1371
  call void @llvm.dbg.value(metadata i1 undef, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1371
  call void @llvm.dbg.value(metadata i64 %62, metadata !621, metadata !DIExpression()), !dbg !1373
  call void @llvm.dbg.value(metadata i1 false, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1373
  call void @llvm.dbg.value(metadata i1 undef, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1373
  call void @llvm.dbg.value(metadata i1 %20, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1373
  call void @llvm.dbg.value(metadata i1 undef, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1373
  call void @llvm.dbg.value(metadata i64 %62, metadata !630, metadata !DIExpression()), !dbg !1373
  call void @llvm.dbg.value(metadata i64 %61, metadata !630, metadata !DIExpression(DW_OP_constu, 18446744073709551601, DW_OP_and, DW_OP_stack_value)), !dbg !1373
  %63 = and i64 %61, -13, !dbg !1375
  call void @llvm.dbg.value(metadata i64 %63, metadata !630, metadata !DIExpression()), !dbg !1373
  %64 = or i64 %63, 8, !dbg !1376
  %65 = select i1 %53, i64 %64, i64 %63, !dbg !1376
  call void @llvm.dbg.value(metadata i64 %65, metadata !630, metadata !DIExpression()), !dbg !1373
  store i64 %65, i64* %60, align 8, !dbg !1377, !tbaa !135
  %66 = and i64 %61, 3, !dbg !1378
  %67 = icmp eq i64 %66, 0, !dbg !1378
  br i1 %67, label %68, label %84, !dbg !1378

68:                                               ; preds = %59
  call void @llvm.dbg.value(metadata i8* %58, metadata !1288, metadata !DIExpression()), !dbg !1360
  call void @llvm.dbg.value(metadata i8* %58, metadata !606, metadata !DIExpression()), !dbg !1371
  call void @llvm.dbg.value(metadata i8* %58, metadata !250, metadata !DIExpression()), !dbg !1379
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1381
  call void @llvm.dbg.value(metadata i64 %65, metadata !145, metadata !DIExpression()), !dbg !1383
  %69 = and i64 %65, -16, !dbg !1385
  call void @llvm.dbg.value(metadata i64 %69, metadata !253, metadata !DIExpression()), !dbg !1379
  %70 = getelementptr inbounds i8, i8* %58, i64 8, !dbg !1386
  %71 = getelementptr inbounds i8, i8* %70, i64 %69, !dbg !1387
  %72 = getelementptr inbounds i8, i8* %71, i64 -16, !dbg !1388
  %73 = bitcast i8* %72 to i64*, !dbg !1389
  call void @llvm.dbg.value(metadata i64* %73, metadata !616, metadata !DIExpression()), !dbg !1390
  call void @llvm.dbg.value(metadata i64 %62, metadata !621, metadata !DIExpression()), !dbg !1391
  call void @llvm.dbg.value(metadata i1 false, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1391
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1391
  call void @llvm.dbg.value(metadata i1 %20, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1391
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1391
  call void @llvm.dbg.value(metadata i64 %62, metadata !630, metadata !DIExpression()), !dbg !1391
  %74 = or i64 %62, 8, !dbg !1393
  %75 = select i1 %53, i64 %74, i64 %62, !dbg !1393
  call void @llvm.dbg.value(metadata i64 %75, metadata !630, metadata !DIExpression()), !dbg !1391
  store i64 %75, i64* %73, align 8, !dbg !1394, !tbaa !267
  br label %84, !dbg !1395

76:                                               ; preds = %52
  call void @llvm.dbg.value(metadata i8* %58, metadata !1291, metadata !DIExpression()), !dbg !1396
  call void @llvm.dbg.value(metadata i8* %58, metadata !759, metadata !DIExpression()), !dbg !1397
  call void @llvm.dbg.value(metadata i1 undef, metadata !764, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1397
  call void @llvm.dbg.value(metadata i8 0, metadata !765, metadata !DIExpression()), !dbg !1397
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !1399
  call void @llvm.dbg.value(metadata i64 %56, metadata !232, metadata !DIExpression()), !dbg !1401
  %77 = and i64 %56, 1, !dbg !1403
  %78 = icmp eq i64 %77, 0, !dbg !1404
  call void @llvm.dbg.value(metadata i8 undef, metadata !765, metadata !DIExpression()), !dbg !1397
  call void @llvm.dbg.value(metadata i64 0, metadata !621, metadata !DIExpression()), !dbg !1405
  call void @llvm.dbg.value(metadata i1 %78, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1405
  call void @llvm.dbg.value(metadata i1 true, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1405
  call void @llvm.dbg.value(metadata i1 undef, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1405
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1405
  call void @llvm.dbg.value(metadata i64 1, metadata !630, metadata !DIExpression()), !dbg !1405
  %79 = select i1 %78, i64 1, i64 5, !dbg !1407
  call void @llvm.dbg.value(metadata i64 %79, metadata !630, metadata !DIExpression()), !dbg !1405
  %80 = shl i64 %56, 2, !dbg !1408
  %81 = and i64 %80, 8, !dbg !1408
  %82 = or i64 %79, %81, !dbg !1408
  call void @llvm.dbg.value(metadata i64 %82, metadata !630, metadata !DIExpression()), !dbg !1405
  %83 = bitcast i8* %58 to i64*, !dbg !1409
  store i64 %82, i64* %83, align 8, !dbg !1410, !tbaa !135
  br label %84

84:                                               ; preds = %68, %59, %76
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !674, metadata !DIExpression()) #6, !dbg !1411
  call void @llvm.dbg.value(metadata i32 undef, metadata !675, metadata !DIExpression()) #6, !dbg !1411
  %85 = load i64, i64* %6, align 8, !dbg !1413, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1414
  call void @llvm.dbg.value(metadata i64 %85, metadata !145, metadata !DIExpression()) #6, !dbg !1416
  %86 = and i64 %85, -16, !dbg !1418
  switch i64 %86, label %92 [
    i64 0, label %123
    i64 16, label %87
  ], !dbg !1419

87:                                               ; preds = %84
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !686, metadata !DIExpression()) #6, !dbg !1420
  call void @llvm.dbg.value(metadata i32 undef, metadata !689, metadata !DIExpression()) #6, !dbg !1420
  %88 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1422, !tbaa !112
  %89 = icmp eq %struct.block* %88, %5, !dbg !1423
  %90 = select i1 %89, %struct.block* null, %struct.block* %88, !dbg !1424
  %91 = bitcast i8* %0 to %struct.block**, !dbg !1425
  store %struct.block* %90, %struct.block** %91, align 8, !dbg !1426
  store i8* %4, i8** bitcast ([14 x %struct.block*]* @seg_list to i8**), align 16, !dbg !1427, !tbaa !112
  br label %127, !dbg !1428

92:                                               ; preds = %84
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1429
  call void @llvm.dbg.value(metadata i64 %85, metadata !145, metadata !DIExpression()) #6, !dbg !1431
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1433
  call void @llvm.dbg.value(metadata i64 %85, metadata !145, metadata !DIExpression()) #6, !dbg !1435
  call void @llvm.dbg.value(metadata i64 %86, metadata !442, metadata !DIExpression()) #6, !dbg !1437
  call void @llvm.dbg.value(metadata i64 16, metadata !447, metadata !DIExpression()) #6, !dbg !1437
  call void @llvm.dbg.value(metadata i64 0, metadata !448, metadata !DIExpression()) #6, !dbg !1439
  %93 = icmp ugt i64 %86, 16
  br i1 %93, label %94, label %107, !dbg !1440

94:                                               ; preds = %92, %94
  %95 = phi i64 [ %101, %94 ], [ 0, %92 ]
  %96 = phi i64 [ %100, %94 ], [ 16, %92 ]
  call void @llvm.dbg.value(metadata i64 %95, metadata !448, metadata !DIExpression()) #6, !dbg !1439
  call void @llvm.dbg.value(metadata i64 %96, metadata !447, metadata !DIExpression()) #6, !dbg !1437
  %97 = icmp ult i64 %95, 4, !dbg !1441
  %98 = add i64 %96, 16, !dbg !1442
  %99 = shl i64 %96, 1, !dbg !1442
  %100 = select i1 %97, i64 %98, i64 %99, !dbg !1442
  call void @llvm.dbg.value(metadata i64 %100, metadata !447, metadata !DIExpression()) #6, !dbg !1437
  %101 = add nuw nsw i64 %95, 1, !dbg !1443
  call void @llvm.dbg.value(metadata i64 %101, metadata !448, metadata !DIExpression()) #6, !dbg !1439
  %102 = icmp ult i64 %95, 12, !dbg !1444
  %103 = icmp ult i64 %100, %86
  %104 = select i1 %102, i1 %103, i1 false, !dbg !1440
  br i1 %104, label %94, label %105, !dbg !1440, !llvm.loop !1445

105:                                              ; preds = %94
  %106 = select i1 %102, i64 %101, i64 13
  br label %107

107:                                              ; preds = %105, %92
  %108 = phi i64 [ 0, %92 ], [ %106, %105 ]
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !722, metadata !DIExpression()) #6, !dbg !1447
  call void @llvm.dbg.value(metadata i64 %108, metadata !727, metadata !DIExpression()) #6, !dbg !1447
  call void @llvm.dbg.value(metadata i32 undef, metadata !728, metadata !DIExpression()) #6, !dbg !1447
  %109 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %108, !dbg !1449
  %110 = load %struct.block*, %struct.block** %109, align 8, !dbg !1449, !tbaa !112
  %111 = icmp eq %struct.block* %110, %5, !dbg !1450
  %112 = select i1 %111, %struct.block* null, %struct.block* %110, !dbg !1451
  %113 = bitcast i8* %0 to %struct.block**, !dbg !1452
  store %struct.block* %112, %struct.block** %113, align 8, !dbg !1453
  %114 = getelementptr inbounds i8, i8* %0, i64 8, !dbg !1454
  %115 = bitcast i8* %114 to %struct.block**, !dbg !1454
  store %struct.block* null, %struct.block** %115, align 8, !dbg !1455, !tbaa !421
  %116 = load %struct.block*, %struct.block** %109, align 8, !dbg !1456, !tbaa !112
  %117 = icmp eq %struct.block* %116, null, !dbg !1457
  br i1 %117, label %121, label %118, !dbg !1458

118:                                              ; preds = %107
  %119 = getelementptr inbounds %struct.block, %struct.block* %116, i64 0, i32 1, i32 0, i32 1, !dbg !1459
  %120 = bitcast %struct.block** %119 to i8**, !dbg !1460
  store i8* %4, i8** %120, align 8, !dbg !1460, !tbaa !421
  br label %121, !dbg !1461

121:                                              ; preds = %118, %107
  %122 = bitcast %struct.block** %109 to i8**, !dbg !1462
  store i8* %4, i8** %122, align 8, !dbg !1462, !tbaa !112
  br label %127, !dbg !1463

123:                                              ; preds = %84
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1429
  call void @llvm.dbg.value(metadata i64 %85, metadata !145, metadata !DIExpression()) #6, !dbg !1431
  %124 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1464, !tbaa !112
  %125 = tail call i8* @mem_heap_lo() #6, !dbg !1465
  %126 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %124, i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @.str.19, i64 0, i64 0), i8* noundef nonnull %4, i8* noundef %125) #8, !dbg !1467
  br label %127

127:                                              ; preds = %87, %121, %123
  %128 = tail call fastcc %struct.block* @coalesce_block(%struct.block* noundef nonnull %5), !dbg !1468
  br label %129

129:                                              ; preds = %1, %127
  ret void, !dbg !1469
}

; Function Attrs: nounwind uwtable
define internal fastcc %struct.block* @coalesce_block(%struct.block* noundef %0) unnamed_addr #0 !dbg !1470 {
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !1472, metadata !DIExpression()), !dbg !1487
  %2 = icmp eq %struct.block* %0, null, !dbg !1488
  br i1 %2, label %11, label %3, !dbg !1490

3:                                                ; preds = %1
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !1473, metadata !DIExpression()), !dbg !1487
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !327, metadata !DIExpression()), !dbg !1491
  %4 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !1493, !tbaa !112
  %5 = icmp eq %struct.block* %4, %0, !dbg !1494
  br i1 %5, label %42, label %6, !dbg !1495

6:                                                ; preds = %3
  %7 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 0, !dbg !1496
  %8 = load i64, i64* %7, align 8, !dbg !1496, !tbaa !135
  %9 = and i64 %8, 4, !dbg !1497
  %10 = icmp eq i64 %9, 0, !dbg !1498
  br i1 %10, label %16, label %42, !dbg !1499

11:                                               ; preds = %1
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1500, !tbaa !112
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %12, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.20, i64 0, i64 0), i8* noundef null) #7, !dbg !1502
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !1473, metadata !DIExpression()), !dbg !1487
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !327, metadata !DIExpression()), !dbg !1503
  %14 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !1505, !tbaa !112
  %15 = icmp eq %struct.block* %14, null, !dbg !1506
  call void @llvm.assume(i1 %15), !dbg !1507
  br label %42, !dbg !1507

16:                                               ; preds = %6
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !351, metadata !DIExpression()), !dbg !1508
  %17 = and i64 %8, 8, !dbg !1510
  %18 = icmp eq i64 %17, 0, !dbg !1511
  br i1 %18, label %19, label %23, !dbg !1512

19:                                               ; preds = %16
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !1513, metadata !DIExpression()), !dbg !1517
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !116, metadata !DIExpression()), !dbg !1519
  %20 = getelementptr inbounds i64, i64* %7, i64 -1, !dbg !1521
  call void @llvm.dbg.value(metadata i64* %20, metadata !1516, metadata !DIExpression()), !dbg !1517
  %21 = load i64, i64* %20, align 8, !dbg !1522, !tbaa !267
  call void @llvm.dbg.value(metadata i64 %21, metadata !145, metadata !DIExpression()), !dbg !1524
  %22 = icmp ult i64 %21, 16, !dbg !1526
  call void @llvm.dbg.value(metadata i1 %22, metadata !1474, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1487
  call void @llvm.dbg.value(metadata i64 0, metadata !1475, metadata !DIExpression()), !dbg !1487
  br i1 %22, label %42, label %23, !dbg !1527

23:                                               ; preds = %19, %16
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !351, metadata !DIExpression()), !dbg !1529
  %24 = and i64 %8, 8, !dbg !1531
  %25 = icmp eq i64 %24, 0, !dbg !1532
  br i1 %25, label %26, label %39, !dbg !1533

26:                                               ; preds = %23
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !1513, metadata !DIExpression()), !dbg !1534
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !116, metadata !DIExpression()), !dbg !1537
  %27 = getelementptr inbounds i64, i64* %7, i64 -1, !dbg !1539
  call void @llvm.dbg.value(metadata i64* %27, metadata !1516, metadata !DIExpression()), !dbg !1534
  %28 = load i64, i64* %27, align 8, !dbg !1540, !tbaa !267
  call void @llvm.dbg.value(metadata i64 %28, metadata !145, metadata !DIExpression()), !dbg !1541
  %29 = and i64 %28, -16, !dbg !1543
  %30 = icmp eq i64 %29, 0, !dbg !1544
  %31 = bitcast %struct.block* %0 to i8*, !dbg !1545
  %32 = sub i64 0, %29, !dbg !1545
  %33 = getelementptr inbounds i8, i8* %31, i64 %32, !dbg !1545
  %34 = bitcast i8* %33 to %struct.block*, !dbg !1545
  %35 = select i1 %30, %struct.block* null, %struct.block* %34, !dbg !1545
  call void @llvm.dbg.value(metadata %struct.block* %35, metadata !1473, metadata !DIExpression()), !dbg !1487
  %36 = getelementptr %struct.block, %struct.block* %35, i64 0, i32 0, !dbg !1546
  %37 = load i64, i64* %36, align 8, !dbg !1546, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1547
  call void @llvm.dbg.value(metadata i64 %37, metadata !145, metadata !DIExpression()), !dbg !1549
  %38 = and i64 %37, -16, !dbg !1551
  call void @llvm.dbg.value(metadata i64 %38, metadata !1475, metadata !DIExpression()), !dbg !1487
  br label %42, !dbg !1552

39:                                               ; preds = %23
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !351, metadata !DIExpression()), !dbg !1553
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !1556, metadata !DIExpression()), !dbg !1559
  %40 = getelementptr inbounds %struct.block, %struct.block* %0, i64 -1, i32 1, !dbg !1562
  %41 = bitcast %union.anon* %40 to %struct.block*, !dbg !1563
  call void @llvm.dbg.value(metadata %struct.block* %41, metadata !1473, metadata !DIExpression()), !dbg !1487
  call void @llvm.dbg.value(metadata i64 16, metadata !1475, metadata !DIExpression()), !dbg !1487
  br label %42, !dbg !1564

42:                                               ; preds = %11, %3, %6, %26, %39, %19
  %43 = phi %struct.block* [ %4, %39 ], [ %4, %26 ], [ %4, %19 ], [ %4, %6 ], [ %0, %3 ], [ null, %11 ]
  %44 = phi i1 [ true, %39 ], [ true, %26 ], [ false, %19 ], [ false, %6 ], [ false, %3 ], [ false, %11 ]
  %45 = phi i64 [ 16, %39 ], [ %38, %26 ], [ 0, %19 ], [ 0, %6 ], [ 0, %3 ], [ 0, %11 ], !dbg !1487
  %46 = phi %struct.block* [ %41, %39 ], [ %35, %26 ], [ null, %19 ], [ null, %6 ], [ null, %3 ], [ null, %11 ], !dbg !1487
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !1473, metadata !DIExpression()), !dbg !1487
  call void @llvm.dbg.value(metadata i64 %45, metadata !1475, metadata !DIExpression()), !dbg !1487
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !273, metadata !DIExpression()), !dbg !1565
  %47 = getelementptr %struct.block, %struct.block* %0, i64 0, i32 0, !dbg !1567
  %48 = load i64, i64* %47, align 8, !dbg !1567, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1568
  call void @llvm.dbg.value(metadata i64 %48, metadata !145, metadata !DIExpression()), !dbg !1570
  %49 = and i64 %48, -16, !dbg !1572
  call void @llvm.dbg.value(metadata i64 %49, metadata !278, metadata !DIExpression()), !dbg !1565
  %50 = bitcast %struct.block* %0 to i8*, !dbg !1573
  %51 = getelementptr inbounds i8, i8* %50, i64 %49, !dbg !1574
  %52 = bitcast i8* %51 to %struct.block*, !dbg !1575
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !1476, metadata !DIExpression()), !dbg !1487
  %53 = bitcast i8* %51 to i64*, !dbg !1576
  %54 = load i64, i64* %53, align 8, !dbg !1576, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1577
  call void @llvm.dbg.value(metadata i64 %54, metadata !145, metadata !DIExpression()), !dbg !1579
  %55 = icmp ugt i64 %54, 15, !dbg !1581
  %56 = and i64 %54, 1
  %57 = icmp eq i64 %56, 0
  %58 = and i1 %55, %57, !dbg !1582
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !1583
  call void @llvm.dbg.value(metadata i64 %54, metadata !232, metadata !DIExpression()), !dbg !1585
  call void @llvm.dbg.value(metadata i1 %57, metadata !1477, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1487
  br i1 %58, label %59, label %309, !dbg !1582

59:                                               ; preds = %42
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !273, metadata !DIExpression()), !dbg !1587
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1589
  call void @llvm.dbg.value(metadata i64 %54, metadata !145, metadata !DIExpression()), !dbg !1591
  %60 = and i64 %54, -16, !dbg !1593
  call void @llvm.dbg.value(metadata i64 %60, metadata !278, metadata !DIExpression()), !dbg !1587
  %61 = getelementptr inbounds i8, i8* %51, i64 %60, !dbg !1594
  %62 = bitcast i8* %61 to i64*, !dbg !1595
  %63 = load i64, i64* %62, align 8, !dbg !1595, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1596
  call void @llvm.dbg.value(metadata i64 %63, metadata !145, metadata !DIExpression()), !dbg !1598
  %64 = and i64 %63, -16, !dbg !1600
  %65 = icmp eq i64 %64, 0, !dbg !1601
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !273, metadata !DIExpression()), !dbg !1602
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !273, metadata !DIExpression()), !dbg !1604
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1606
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1608
  call void @llvm.dbg.value(metadata i64 %54, metadata !145, metadata !DIExpression()), !dbg !1610
  call void @llvm.dbg.value(metadata i64 %54, metadata !145, metadata !DIExpression()), !dbg !1612
  call void @llvm.dbg.value(metadata i64 %60, metadata !278, metadata !DIExpression()), !dbg !1602
  call void @llvm.dbg.value(metadata i64 %60, metadata !278, metadata !DIExpression()), !dbg !1604
  br i1 %65, label %75, label %66, !dbg !1614

66:                                               ; preds = %59
  call void @llvm.dbg.value(metadata i8* %61, metadata !1478, metadata !DIExpression()), !dbg !1615
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1616
  call void @llvm.dbg.value(metadata i64 %63, metadata !145, metadata !DIExpression()), !dbg !1618
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !1620
  call void @llvm.dbg.value(metadata i64 %63, metadata !232, metadata !DIExpression()), !dbg !1622
  call void @llvm.dbg.value(metadata i8* %61, metadata !606, metadata !DIExpression()), !dbg !1624
  call void @llvm.dbg.value(metadata i64 %64, metadata !611, metadata !DIExpression()), !dbg !1624
  call void @llvm.dbg.value(metadata i1 false, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1624
  call void @llvm.dbg.value(metadata i1 undef, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1624
  call void @llvm.dbg.value(metadata i1 false, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1624
  call void @llvm.dbg.value(metadata i1 undef, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1624
  call void @llvm.dbg.value(metadata i64 %64, metadata !621, metadata !DIExpression()), !dbg !1626
  call void @llvm.dbg.value(metadata i1 false, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1626
  call void @llvm.dbg.value(metadata i1 undef, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1626
  call void @llvm.dbg.value(metadata i1 false, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1626
  call void @llvm.dbg.value(metadata i1 undef, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1626
  call void @llvm.dbg.value(metadata i64 %63, metadata !630, metadata !DIExpression(DW_OP_constu, 18446744073709551601, DW_OP_and, DW_OP_stack_value)), !dbg !1626
  %67 = and i64 %63, -13, !dbg !1628
  call void @llvm.dbg.value(metadata i64 %67, metadata !630, metadata !DIExpression()), !dbg !1626
  store i64 %67, i64* %62, align 8, !dbg !1629, !tbaa !135
  %68 = and i64 %63, 3, !dbg !1630
  %69 = icmp eq i64 %68, 0, !dbg !1630
  br i1 %69, label %70, label %86, !dbg !1630

70:                                               ; preds = %66
  call void @llvm.dbg.value(metadata i8* %61, metadata !250, metadata !DIExpression()), !dbg !1631
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1633
  call void @llvm.dbg.value(metadata i64 %67, metadata !145, metadata !DIExpression()), !dbg !1635
  call void @llvm.dbg.value(metadata i64 %64, metadata !253, metadata !DIExpression()), !dbg !1631
  %71 = getelementptr inbounds i8, i8* %61, i64 8, !dbg !1637
  %72 = getelementptr inbounds i8, i8* %71, i64 %64, !dbg !1638
  %73 = getelementptr inbounds i8, i8* %72, i64 -16, !dbg !1639
  %74 = bitcast i8* %73 to i64*, !dbg !1640
  call void @llvm.dbg.value(metadata i64* %74, metadata !616, metadata !DIExpression()), !dbg !1641
  call void @llvm.dbg.value(metadata i64 %64, metadata !621, metadata !DIExpression()), !dbg !1642
  call void @llvm.dbg.value(metadata i1 false, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1642
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1642
  call void @llvm.dbg.value(metadata i1 false, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1642
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1642
  call void @llvm.dbg.value(metadata i64 %64, metadata !630, metadata !DIExpression()), !dbg !1642
  store i64 %64, i64* %74, align 8, !dbg !1644, !tbaa !267
  br label %86, !dbg !1645

75:                                               ; preds = %59
  call void @llvm.dbg.value(metadata i8* %61, metadata !1481, metadata !DIExpression()), !dbg !1646
  call void @llvm.dbg.value(metadata i8* %61, metadata !759, metadata !DIExpression()), !dbg !1647
  call void @llvm.dbg.value(metadata i1 false, metadata !764, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1647
  call void @llvm.dbg.value(metadata i8 0, metadata !765, metadata !DIExpression()), !dbg !1647
  %76 = load %struct.block*, %struct.block** @heap_end, align 8, !dbg !1649, !tbaa !112
  %77 = icmp eq %struct.block* %76, null, !dbg !1650
  br i1 %77, label %84, label %78, !dbg !1651

78:                                               ; preds = %75
  %79 = getelementptr %struct.block, %struct.block* %76, i64 0, i32 0, !dbg !1652
  %80 = load i64, i64* %79, align 8, !dbg !1652, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !1653
  call void @llvm.dbg.value(metadata i64 %80, metadata !232, metadata !DIExpression()), !dbg !1655
  %81 = and i64 %80, 1, !dbg !1657
  %82 = icmp eq i64 %81, 0, !dbg !1658
  call void @llvm.dbg.value(metadata i8 undef, metadata !765, metadata !DIExpression()), !dbg !1647
  call void @llvm.dbg.value(metadata i64 0, metadata !621, metadata !DIExpression()), !dbg !1659
  call void @llvm.dbg.value(metadata i1 %82, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1659
  call void @llvm.dbg.value(metadata i1 true, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1659
  call void @llvm.dbg.value(metadata i1 false, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1659
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1659
  call void @llvm.dbg.value(metadata i64 1, metadata !630, metadata !DIExpression()), !dbg !1659
  %83 = select i1 %82, i64 1, i64 5, !dbg !1661
  br label %84, !dbg !1661

84:                                               ; preds = %75, %78
  %85 = phi i64 [ 1, %75 ], [ %83, %78 ]
  call void @llvm.dbg.value(metadata i64 %85, metadata !630, metadata !DIExpression()), !dbg !1659
  store i64 %85, i64* %62, align 8, !dbg !1662, !tbaa !135
  br label %86, !dbg !1663

86:                                               ; preds = %70, %66, %84
  %87 = load i64, i64* %53, align 8, !dbg !1664, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1665
  call void @llvm.dbg.value(metadata i64 %87, metadata !145, metadata !DIExpression()), !dbg !1667
  %88 = and i64 %87, -16, !dbg !1669
  call void @llvm.dbg.value(metadata i64 %88, metadata !1484, metadata !DIExpression()), !dbg !1487
  %89 = load i64, i64* %47, align 8, !dbg !1670, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1671
  call void @llvm.dbg.value(metadata i64 %89, metadata !145, metadata !DIExpression()), !dbg !1673
  %90 = and i64 %89, -16, !dbg !1675
  call void @llvm.dbg.value(metadata i64 %90, metadata !1485, metadata !DIExpression()), !dbg !1487
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !1486, metadata !DIExpression()), !dbg !1487
  br i1 %44, label %91, label %489, !dbg !1676

91:                                               ; preds = %86
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !938, metadata !DIExpression()), !dbg !1678
  call void @llvm.dbg.value(metadata i32 undef, metadata !941, metadata !DIExpression()), !dbg !1678
  %92 = getelementptr %struct.block, %struct.block* %46, i64 0, i32 0, !dbg !1681
  %93 = load i64, i64* %92, align 8, !dbg !1681, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1682
  call void @llvm.dbg.value(metadata i64 %93, metadata !145, metadata !DIExpression()), !dbg !1684
  %94 = and i64 %93, -16, !dbg !1686
  %95 = icmp ugt i64 %94, 16, !dbg !1687
  br i1 %95, label %96, label %125, !dbg !1688

96:                                               ; preds = %91, %96
  %97 = phi i64 [ %103, %96 ], [ 0, %91 ]
  %98 = phi i64 [ %102, %96 ], [ 16, %91 ]
  call void @llvm.dbg.value(metadata i64 %97, metadata !448, metadata !DIExpression()), !dbg !1689
  call void @llvm.dbg.value(metadata i64 %98, metadata !447, metadata !DIExpression()), !dbg !1691
  %99 = icmp ult i64 %97, 4, !dbg !1692
  %100 = add i64 %98, 16, !dbg !1693
  %101 = shl i64 %98, 1, !dbg !1693
  %102 = select i1 %99, i64 %100, i64 %101, !dbg !1693
  call void @llvm.dbg.value(metadata i64 %102, metadata !447, metadata !DIExpression()), !dbg !1691
  %103 = add nuw nsw i64 %97, 1, !dbg !1694
  call void @llvm.dbg.value(metadata i64 %103, metadata !448, metadata !DIExpression()), !dbg !1689
  %104 = icmp ult i64 %97, 12, !dbg !1695
  %105 = icmp ult i64 %102, %94
  %106 = select i1 %104, i1 %105, i1 false, !dbg !1696
  br i1 %106, label %96, label %107, !dbg !1696, !llvm.loop !1697

107:                                              ; preds = %96
  call void @llvm.dbg.value(metadata i64 undef, metadata !942, metadata !DIExpression()), !dbg !1699
  %108 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 1, !dbg !1700
  %109 = load %struct.block*, %struct.block** %108, align 8, !dbg !1700, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %109, metadata !945, metadata !DIExpression()), !dbg !1699
  %110 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 0, !dbg !1701
  %111 = load %struct.block*, %struct.block** %110, align 8, !dbg !1701, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %111, metadata !946, metadata !DIExpression()), !dbg !1699
  %112 = icmp eq %struct.block* %109, null, !dbg !1702
  br i1 %112, label %113, label %119, !dbg !1703

113:                                              ; preds = %107
  %114 = select i1 %104, i64 %103, i64 13
  call void @llvm.dbg.value(metadata i64 %114, metadata !942, metadata !DIExpression()), !dbg !1699
  %115 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %114, !dbg !1704
  store %struct.block* %111, %struct.block** %115, align 8, !dbg !1705, !tbaa !112
  %116 = icmp eq %struct.block* %111, null, !dbg !1706
  br i1 %116, label %140, label %117, !dbg !1707

117:                                              ; preds = %113
  %118 = getelementptr inbounds %struct.block, %struct.block* %111, i64 0, i32 1, i32 0, i32 1, !dbg !1708
  store %struct.block* null, %struct.block** %118, align 8, !dbg !1709, !tbaa !421
  br label %140, !dbg !1710

119:                                              ; preds = %107
  %120 = icmp eq %struct.block* %111, null, !dbg !1711
  %121 = getelementptr inbounds %struct.block, %struct.block* %109, i64 0, i32 1, i32 0, i32 0, !dbg !1712
  br i1 %120, label %122, label %123, !dbg !1713

122:                                              ; preds = %119
  store %struct.block* null, %struct.block** %121, align 8, !dbg !1714, !tbaa !421
  br label %140, !dbg !1715

123:                                              ; preds = %119
  store %struct.block* %111, %struct.block** %121, align 8, !dbg !1716, !tbaa !421
  %124 = getelementptr inbounds %struct.block, %struct.block* %111, i64 0, i32 1, i32 0, i32 1, !dbg !1717
  store %struct.block* %109, %struct.block** %124, align 8, !dbg !1718, !tbaa !421
  br label %140

125:                                              ; preds = %91
  %126 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1719, !tbaa !112
  %127 = icmp eq %struct.block* %126, %46, !dbg !1720
  br i1 %127, label %128, label %131, !dbg !1721

128:                                              ; preds = %125
  %129 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 0, !dbg !1722
  %130 = load %struct.block*, %struct.block** %129, align 8, !dbg !1722, !tbaa !421
  store %struct.block* %130, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1723, !tbaa !112
  br label %140, !dbg !1724

131:                                              ; preds = %125, %131
  %132 = phi %struct.block* [ %134, %131 ], [ %126, %125 ], !dbg !1725
  call void @llvm.dbg.value(metadata %struct.block* %132, metadata !947, metadata !DIExpression()), !dbg !1725
  %133 = getelementptr inbounds %struct.block, %struct.block* %132, i64 0, i32 1, i32 0, i32 0, !dbg !1726
  %134 = load %struct.block*, %struct.block** %133, align 8, !dbg !1726, !tbaa !421
  %135 = icmp eq %struct.block* %134, %46, !dbg !1727
  br i1 %135, label %136, label %131, !dbg !1728, !llvm.loop !1729

136:                                              ; preds = %131
  %137 = getelementptr inbounds %struct.block, %struct.block* %132, i64 0, i32 1, i32 0, i32 0, !dbg !1726
  %138 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 0, !dbg !1731
  %139 = load %struct.block*, %struct.block** %138, align 8, !dbg !1731, !tbaa !421
  store %struct.block* %139, %struct.block** %137, align 8, !dbg !1732, !tbaa !421
  br label %140

140:                                              ; preds = %113, %117, %122, %123, %128, %136
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !938, metadata !DIExpression()), !dbg !1733
  call void @llvm.dbg.value(metadata i32 undef, metadata !941, metadata !DIExpression()), !dbg !1733
  %141 = load i64, i64* %47, align 8, !dbg !1735, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1736
  call void @llvm.dbg.value(metadata i64 %141, metadata !145, metadata !DIExpression()), !dbg !1738
  %142 = and i64 %141, -16, !dbg !1740
  %143 = icmp ugt i64 %142, 16, !dbg !1741
  br i1 %143, label %144, label %173, !dbg !1742

144:                                              ; preds = %140, %144
  %145 = phi i64 [ %151, %144 ], [ 0, %140 ]
  %146 = phi i64 [ %150, %144 ], [ 16, %140 ]
  call void @llvm.dbg.value(metadata i64 %145, metadata !448, metadata !DIExpression()), !dbg !1743
  call void @llvm.dbg.value(metadata i64 %146, metadata !447, metadata !DIExpression()), !dbg !1745
  %147 = icmp ult i64 %145, 4, !dbg !1746
  %148 = add i64 %146, 16, !dbg !1747
  %149 = shl i64 %146, 1, !dbg !1747
  %150 = select i1 %147, i64 %148, i64 %149, !dbg !1747
  call void @llvm.dbg.value(metadata i64 %150, metadata !447, metadata !DIExpression()), !dbg !1745
  %151 = add nuw nsw i64 %145, 1, !dbg !1748
  call void @llvm.dbg.value(metadata i64 %151, metadata !448, metadata !DIExpression()), !dbg !1743
  %152 = icmp ult i64 %145, 12, !dbg !1749
  %153 = icmp ult i64 %150, %142
  %154 = select i1 %152, i1 %153, i1 false, !dbg !1750
  br i1 %154, label %144, label %155, !dbg !1750, !llvm.loop !1751

155:                                              ; preds = %144
  call void @llvm.dbg.value(metadata i64 undef, metadata !942, metadata !DIExpression()), !dbg !1753
  %156 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 1, !dbg !1754
  %157 = load %struct.block*, %struct.block** %156, align 8, !dbg !1754, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %157, metadata !945, metadata !DIExpression()), !dbg !1753
  %158 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !1755
  %159 = load %struct.block*, %struct.block** %158, align 8, !dbg !1755, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %159, metadata !946, metadata !DIExpression()), !dbg !1753
  %160 = icmp eq %struct.block* %157, null, !dbg !1756
  br i1 %160, label %161, label %167, !dbg !1757

161:                                              ; preds = %155
  %162 = select i1 %152, i64 %151, i64 13
  call void @llvm.dbg.value(metadata i64 %162, metadata !942, metadata !DIExpression()), !dbg !1753
  %163 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %162, !dbg !1758
  store %struct.block* %159, %struct.block** %163, align 8, !dbg !1759, !tbaa !112
  %164 = icmp eq %struct.block* %159, null, !dbg !1760
  br i1 %164, label %188, label %165, !dbg !1761

165:                                              ; preds = %161
  %166 = getelementptr inbounds %struct.block, %struct.block* %159, i64 0, i32 1, i32 0, i32 1, !dbg !1762
  store %struct.block* null, %struct.block** %166, align 8, !dbg !1763, !tbaa !421
  br label %188, !dbg !1764

167:                                              ; preds = %155
  %168 = icmp eq %struct.block* %159, null, !dbg !1765
  %169 = getelementptr inbounds %struct.block, %struct.block* %157, i64 0, i32 1, i32 0, i32 0, !dbg !1766
  br i1 %168, label %170, label %171, !dbg !1767

170:                                              ; preds = %167
  store %struct.block* null, %struct.block** %169, align 8, !dbg !1768, !tbaa !421
  br label %188, !dbg !1769

171:                                              ; preds = %167
  store %struct.block* %159, %struct.block** %169, align 8, !dbg !1770, !tbaa !421
  %172 = getelementptr inbounds %struct.block, %struct.block* %159, i64 0, i32 1, i32 0, i32 1, !dbg !1771
  store %struct.block* %157, %struct.block** %172, align 8, !dbg !1772, !tbaa !421
  br label %188

173:                                              ; preds = %140
  %174 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1773, !tbaa !112
  %175 = icmp eq %struct.block* %174, %0, !dbg !1774
  br i1 %175, label %176, label %179, !dbg !1775

176:                                              ; preds = %173
  %177 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !1776
  %178 = load %struct.block*, %struct.block** %177, align 8, !dbg !1776, !tbaa !421
  store %struct.block* %178, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1777, !tbaa !112
  br label %188, !dbg !1778

179:                                              ; preds = %173, %179
  %180 = phi %struct.block* [ %182, %179 ], [ %174, %173 ], !dbg !1779
  call void @llvm.dbg.value(metadata %struct.block* %180, metadata !947, metadata !DIExpression()), !dbg !1779
  %181 = getelementptr inbounds %struct.block, %struct.block* %180, i64 0, i32 1, i32 0, i32 0, !dbg !1780
  %182 = load %struct.block*, %struct.block** %181, align 8, !dbg !1780, !tbaa !421
  %183 = icmp eq %struct.block* %182, %0, !dbg !1781
  br i1 %183, label %184, label %179, !dbg !1782, !llvm.loop !1783

184:                                              ; preds = %179
  %185 = getelementptr inbounds %struct.block, %struct.block* %180, i64 0, i32 1, i32 0, i32 0, !dbg !1780
  %186 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !1785
  %187 = load %struct.block*, %struct.block** %186, align 8, !dbg !1785, !tbaa !421
  store %struct.block* %187, %struct.block** %185, align 8, !dbg !1786, !tbaa !421
  br label %188

188:                                              ; preds = %161, %165, %170, %171, %176, %184
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !938, metadata !DIExpression()), !dbg !1787
  call void @llvm.dbg.value(metadata i32 undef, metadata !941, metadata !DIExpression()), !dbg !1787
  %189 = load i64, i64* %53, align 8, !dbg !1789, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1790
  call void @llvm.dbg.value(metadata i64 %189, metadata !145, metadata !DIExpression()), !dbg !1792
  %190 = and i64 %189, -16, !dbg !1794
  %191 = icmp ugt i64 %190, 16, !dbg !1795
  br i1 %191, label %192, label %223, !dbg !1796

192:                                              ; preds = %188, %192
  %193 = phi i64 [ %199, %192 ], [ 0, %188 ]
  %194 = phi i64 [ %198, %192 ], [ 16, %188 ]
  call void @llvm.dbg.value(metadata i64 %193, metadata !448, metadata !DIExpression()), !dbg !1797
  call void @llvm.dbg.value(metadata i64 %194, metadata !447, metadata !DIExpression()), !dbg !1799
  %195 = icmp ult i64 %193, 4, !dbg !1800
  %196 = add i64 %194, 16, !dbg !1801
  %197 = shl i64 %194, 1, !dbg !1801
  %198 = select i1 %195, i64 %196, i64 %197, !dbg !1801
  call void @llvm.dbg.value(metadata i64 %198, metadata !447, metadata !DIExpression()), !dbg !1799
  %199 = add nuw nsw i64 %193, 1, !dbg !1802
  call void @llvm.dbg.value(metadata i64 %199, metadata !448, metadata !DIExpression()), !dbg !1797
  %200 = icmp ult i64 %193, 12, !dbg !1803
  %201 = icmp ult i64 %198, %190
  %202 = select i1 %200, i1 %201, i1 false, !dbg !1804
  br i1 %202, label %192, label %203, !dbg !1804, !llvm.loop !1805

203:                                              ; preds = %192
  call void @llvm.dbg.value(metadata i64 undef, metadata !942, metadata !DIExpression()), !dbg !1807
  %204 = getelementptr inbounds i8, i8* %51, i64 16, !dbg !1808
  %205 = bitcast i8* %204 to %struct.block**, !dbg !1808
  %206 = load %struct.block*, %struct.block** %205, align 8, !dbg !1808, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %206, metadata !945, metadata !DIExpression()), !dbg !1807
  %207 = getelementptr inbounds i8, i8* %51, i64 8, !dbg !1809
  %208 = bitcast i8* %207 to %struct.block**, !dbg !1809
  %209 = load %struct.block*, %struct.block** %208, align 8, !dbg !1809, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %209, metadata !946, metadata !DIExpression()), !dbg !1807
  %210 = icmp eq %struct.block* %206, null, !dbg !1810
  br i1 %210, label %211, label %217, !dbg !1811

211:                                              ; preds = %203
  %212 = select i1 %200, i64 %199, i64 13
  call void @llvm.dbg.value(metadata i64 %212, metadata !942, metadata !DIExpression()), !dbg !1807
  %213 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %212, !dbg !1812
  store %struct.block* %209, %struct.block** %213, align 8, !dbg !1813, !tbaa !112
  %214 = icmp eq %struct.block* %209, null, !dbg !1814
  br i1 %214, label %240, label %215, !dbg !1815

215:                                              ; preds = %211
  %216 = getelementptr inbounds %struct.block, %struct.block* %209, i64 0, i32 1, i32 0, i32 1, !dbg !1816
  store %struct.block* null, %struct.block** %216, align 8, !dbg !1817, !tbaa !421
  br label %240, !dbg !1818

217:                                              ; preds = %203
  %218 = icmp eq %struct.block* %209, null, !dbg !1819
  %219 = getelementptr inbounds %struct.block, %struct.block* %206, i64 0, i32 1, i32 0, i32 0, !dbg !1820
  br i1 %218, label %220, label %221, !dbg !1821

220:                                              ; preds = %217
  store %struct.block* null, %struct.block** %219, align 8, !dbg !1822, !tbaa !421
  br label %240, !dbg !1823

221:                                              ; preds = %217
  store %struct.block* %209, %struct.block** %219, align 8, !dbg !1824, !tbaa !421
  %222 = getelementptr inbounds %struct.block, %struct.block* %209, i64 0, i32 1, i32 0, i32 1, !dbg !1825
  store %struct.block* %206, %struct.block** %222, align 8, !dbg !1826, !tbaa !421
  br label %240

223:                                              ; preds = %188
  %224 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1827, !tbaa !112
  %225 = icmp eq %struct.block* %224, %52, !dbg !1828
  br i1 %225, label %226, label %230, !dbg !1829

226:                                              ; preds = %223
  %227 = getelementptr inbounds i8, i8* %51, i64 8, !dbg !1830
  %228 = bitcast i8* %227 to %struct.block**, !dbg !1830
  %229 = load %struct.block*, %struct.block** %228, align 8, !dbg !1830, !tbaa !421
  store %struct.block* %229, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1831, !tbaa !112
  br label %240, !dbg !1832

230:                                              ; preds = %223, %230
  %231 = phi %struct.block* [ %233, %230 ], [ %224, %223 ], !dbg !1833
  call void @llvm.dbg.value(metadata %struct.block* %231, metadata !947, metadata !DIExpression()), !dbg !1833
  %232 = getelementptr inbounds %struct.block, %struct.block* %231, i64 0, i32 1, i32 0, i32 0, !dbg !1834
  %233 = load %struct.block*, %struct.block** %232, align 8, !dbg !1834, !tbaa !421
  %234 = icmp eq %struct.block* %233, %52, !dbg !1835
  br i1 %234, label %235, label %230, !dbg !1836, !llvm.loop !1837

235:                                              ; preds = %230
  %236 = getelementptr inbounds %struct.block, %struct.block* %231, i64 0, i32 1, i32 0, i32 0, !dbg !1834
  %237 = getelementptr inbounds i8, i8* %51, i64 8, !dbg !1839
  %238 = bitcast i8* %237 to %struct.block**, !dbg !1839
  %239 = load %struct.block*, %struct.block** %238, align 8, !dbg !1839, !tbaa !421
  store %struct.block* %239, %struct.block** %236, align 8, !dbg !1840, !tbaa !421
  br label %240

240:                                              ; preds = %211, %215, %220, %221, %226, %235
  %241 = add i64 %90, %88, !dbg !1841
  %242 = add i64 %241, %45, !dbg !1842
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !327, metadata !DIExpression()), !dbg !1843
  %243 = icmp eq %struct.block* %43, %46, !dbg !1845
  br i1 %243, label %250, label %244, !dbg !1846

244:                                              ; preds = %240
  %245 = load i64, i64* %92, align 8, !dbg !1847, !tbaa !135
  %246 = and i64 %245, 4, !dbg !1848
  %247 = icmp eq i64 %246, 0, !dbg !1849
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !351, metadata !DIExpression()), !dbg !1850
  %248 = and i64 %245, 8, !dbg !1852
  %249 = icmp ne i64 %248, 0, !dbg !1853
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !606, metadata !DIExpression()), !dbg !1854
  call void @llvm.dbg.value(metadata i64 %242, metadata !611, metadata !DIExpression()), !dbg !1854
  call void @llvm.dbg.value(metadata i1 %247, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1854
  call void @llvm.dbg.value(metadata i1 false, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1854
  call void @llvm.dbg.value(metadata i1 %249, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1854
  call void @llvm.dbg.value(metadata i1 false, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1854
  call void @llvm.dbg.value(metadata i64 %242, metadata !621, metadata !DIExpression()), !dbg !1856
  call void @llvm.dbg.value(metadata i1 %247, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1856
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1856
  call void @llvm.dbg.value(metadata i1 %249, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1856
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1856
  call void @llvm.dbg.value(metadata i64 %242, metadata !630, metadata !DIExpression()), !dbg !1856
  br i1 %247, label %253, label %250, !dbg !1858

250:                                              ; preds = %240, %244
  %251 = phi i1 [ %249, %244 ], [ false, %240 ]
  %252 = or i64 %242, 4, !dbg !1858
  br label %253, !dbg !1858

253:                                              ; preds = %244, %250
  %254 = phi i1 [ %251, %250 ], [ %249, %244 ]
  %255 = phi i64 [ %252, %250 ], [ %242, %244 ]
  call void @llvm.dbg.value(metadata i64 %255, metadata !630, metadata !DIExpression()), !dbg !1856
  %256 = or i64 %255, 8, !dbg !1859
  %257 = select i1 %254, i64 %256, i64 %255, !dbg !1859
  call void @llvm.dbg.value(metadata i64 %257, metadata !630, metadata !DIExpression()), !dbg !1856
  store i64 %257, i64* %92, align 8, !dbg !1860, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !250, metadata !DIExpression()), !dbg !1861
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1863
  call void @llvm.dbg.value(metadata i64 %257, metadata !145, metadata !DIExpression()), !dbg !1865
  %258 = and i64 %257, -16, !dbg !1867
  call void @llvm.dbg.value(metadata i64 %258, metadata !253, metadata !DIExpression()), !dbg !1861
  %259 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, !dbg !1868
  %260 = bitcast %union.anon* %259 to i8*, !dbg !1869
  %261 = getelementptr inbounds i8, i8* %260, i64 %258, !dbg !1870
  %262 = getelementptr inbounds i8, i8* %261, i64 -16, !dbg !1871
  %263 = bitcast i8* %262 to i64*, !dbg !1872
  call void @llvm.dbg.value(metadata i64* %263, metadata !616, metadata !DIExpression()), !dbg !1873
  call void @llvm.dbg.value(metadata i64 %242, metadata !621, metadata !DIExpression()), !dbg !1874
  call void @llvm.dbg.value(metadata i1 %247, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1874
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1874
  call void @llvm.dbg.value(metadata i1 %249, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1874
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1874
  call void @llvm.dbg.value(metadata i64 %257, metadata !630, metadata !DIExpression()), !dbg !1874
  store i64 %257, i64* %263, align 8, !dbg !1876, !tbaa !267
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !674, metadata !DIExpression()) #6, !dbg !1877
  call void @llvm.dbg.value(metadata i32 undef, metadata !675, metadata !DIExpression()) #6, !dbg !1877
  %264 = load i64, i64* %92, align 8, !dbg !1879, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1880
  call void @llvm.dbg.value(metadata i64 %264, metadata !145, metadata !DIExpression()) #6, !dbg !1882
  %265 = and i64 %264, -16, !dbg !1884
  switch i64 %265, label %271 [
    i64 0, label %299
    i64 16, label %266
  ], !dbg !1885

266:                                              ; preds = %253
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !686, metadata !DIExpression()) #6, !dbg !1886
  call void @llvm.dbg.value(metadata i32 undef, metadata !689, metadata !DIExpression()) #6, !dbg !1886
  %267 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1888, !tbaa !112
  %268 = icmp eq %struct.block* %267, %46, !dbg !1889
  %269 = select i1 %268, %struct.block* null, %struct.block* %267, !dbg !1890
  %270 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 0, !dbg !1891
  store %struct.block* %269, %struct.block** %270, align 8, !dbg !1892
  store %struct.block* %46, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1893, !tbaa !112
  br label %303, !dbg !1894

271:                                              ; preds = %253
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1895
  call void @llvm.dbg.value(metadata i64 %264, metadata !145, metadata !DIExpression()) #6, !dbg !1897
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1899
  call void @llvm.dbg.value(metadata i64 %264, metadata !145, metadata !DIExpression()) #6, !dbg !1901
  call void @llvm.dbg.value(metadata i64 %265, metadata !442, metadata !DIExpression()) #6, !dbg !1903
  call void @llvm.dbg.value(metadata i64 16, metadata !447, metadata !DIExpression()) #6, !dbg !1903
  call void @llvm.dbg.value(metadata i64 0, metadata !448, metadata !DIExpression()) #6, !dbg !1905
  %272 = icmp ugt i64 %265, 16
  br i1 %272, label %273, label %286, !dbg !1906

273:                                              ; preds = %271, %273
  %274 = phi i64 [ %280, %273 ], [ 0, %271 ]
  %275 = phi i64 [ %279, %273 ], [ 16, %271 ]
  call void @llvm.dbg.value(metadata i64 %274, metadata !448, metadata !DIExpression()) #6, !dbg !1905
  call void @llvm.dbg.value(metadata i64 %275, metadata !447, metadata !DIExpression()) #6, !dbg !1903
  %276 = icmp ult i64 %274, 4, !dbg !1907
  %277 = add i64 %275, 16, !dbg !1908
  %278 = shl i64 %275, 1, !dbg !1908
  %279 = select i1 %276, i64 %277, i64 %278, !dbg !1908
  call void @llvm.dbg.value(metadata i64 %279, metadata !447, metadata !DIExpression()) #6, !dbg !1903
  %280 = add nuw nsw i64 %274, 1, !dbg !1909
  call void @llvm.dbg.value(metadata i64 %280, metadata !448, metadata !DIExpression()) #6, !dbg !1905
  %281 = icmp ult i64 %274, 12, !dbg !1910
  %282 = icmp ult i64 %279, %265
  %283 = select i1 %281, i1 %282, i1 false, !dbg !1906
  br i1 %283, label %273, label %284, !dbg !1906, !llvm.loop !1911

284:                                              ; preds = %273
  %285 = select i1 %281, i64 %280, i64 13
  br label %286

286:                                              ; preds = %284, %271
  %287 = phi i64 [ 0, %271 ], [ %285, %284 ]
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !722, metadata !DIExpression()) #6, !dbg !1913
  call void @llvm.dbg.value(metadata i64 %287, metadata !727, metadata !DIExpression()) #6, !dbg !1913
  call void @llvm.dbg.value(metadata i32 undef, metadata !728, metadata !DIExpression()) #6, !dbg !1913
  %288 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %287, !dbg !1915
  %289 = load %struct.block*, %struct.block** %288, align 8, !dbg !1915, !tbaa !112
  %290 = icmp eq %struct.block* %289, %46, !dbg !1916
  %291 = select i1 %290, %struct.block* null, %struct.block* %289, !dbg !1917
  %292 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 0, !dbg !1918
  store %struct.block* %291, %struct.block** %292, align 8, !dbg !1919
  %293 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 1, !dbg !1920
  store %struct.block* null, %struct.block** %293, align 8, !dbg !1921, !tbaa !421
  %294 = load %struct.block*, %struct.block** %288, align 8, !dbg !1922, !tbaa !112
  %295 = icmp eq %struct.block* %294, null, !dbg !1923
  br i1 %295, label %298, label %296, !dbg !1924

296:                                              ; preds = %286
  %297 = getelementptr inbounds %struct.block, %struct.block* %294, i64 0, i32 1, i32 0, i32 1, !dbg !1925
  store %struct.block* %46, %struct.block** %297, align 8, !dbg !1926, !tbaa !421
  br label %298, !dbg !1927

298:                                              ; preds = %296, %286
  store %struct.block* %46, %struct.block** %288, align 8, !dbg !1928, !tbaa !112
  br label %303, !dbg !1929

299:                                              ; preds = %253
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !1895
  call void @llvm.dbg.value(metadata i64 %264, metadata !145, metadata !DIExpression()) #6, !dbg !1897
  %300 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1930, !tbaa !112
  %301 = tail call i8* @mem_heap_lo() #6, !dbg !1931
  %302 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %300, i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @.str.19, i64 0, i64 0), %struct.block* noundef nonnull %46, i8* noundef %301) #8, !dbg !1933
  br label %303

303:                                              ; preds = %266, %298, %299
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !1486, metadata !DIExpression()), !dbg !1487
  %304 = load %struct.block*, %struct.block** @heap_end, align 8, !dbg !1934, !tbaa !112
  %305 = icmp eq %struct.block* %304, %52, !dbg !1936
  %306 = icmp eq %struct.block* %304, %0
  %307 = or i1 %305, %306, !dbg !1937
  br i1 %307, label %308, label %653, !dbg !1937

308:                                              ; preds = %303
  store %struct.block* %46, %struct.block** @heap_end, align 8, !dbg !1938, !tbaa !112
  br label %653, !dbg !1940

309:                                              ; preds = %42
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1665
  call void @llvm.dbg.value(metadata i64 %87, metadata !145, metadata !DIExpression()), !dbg !1667
  call void @llvm.dbg.value(metadata i64 %88, metadata !1484, metadata !DIExpression()), !dbg !1487
  %310 = load i64, i64* %47, align 8, !dbg !1670, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1671
  call void @llvm.dbg.value(metadata i64 %89, metadata !145, metadata !DIExpression()), !dbg !1673
  %311 = and i64 %310, -16, !dbg !1675
  call void @llvm.dbg.value(metadata i64 %90, metadata !1485, metadata !DIExpression()), !dbg !1487
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !1486, metadata !DIExpression()), !dbg !1487
  br i1 %44, label %312, label %653, !dbg !1941

312:                                              ; preds = %309
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !938, metadata !DIExpression()), !dbg !1943
  call void @llvm.dbg.value(metadata i32 undef, metadata !941, metadata !DIExpression()), !dbg !1943
  %313 = getelementptr %struct.block, %struct.block* %46, i64 0, i32 0, !dbg !1946
  %314 = load i64, i64* %313, align 8, !dbg !1946, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !1947
  call void @llvm.dbg.value(metadata i64 %314, metadata !145, metadata !DIExpression()), !dbg !1949
  %315 = and i64 %314, -16, !dbg !1951
  %316 = icmp ugt i64 %315, 16, !dbg !1952
  br i1 %316, label %317, label %346, !dbg !1953

317:                                              ; preds = %312, %317
  %318 = phi i64 [ %324, %317 ], [ 0, %312 ]
  %319 = phi i64 [ %323, %317 ], [ 16, %312 ]
  call void @llvm.dbg.value(metadata i64 %318, metadata !448, metadata !DIExpression()), !dbg !1954
  call void @llvm.dbg.value(metadata i64 %319, metadata !447, metadata !DIExpression()), !dbg !1956
  %320 = icmp ult i64 %318, 4, !dbg !1957
  %321 = add i64 %319, 16, !dbg !1958
  %322 = shl i64 %319, 1, !dbg !1958
  %323 = select i1 %320, i64 %321, i64 %322, !dbg !1958
  call void @llvm.dbg.value(metadata i64 %323, metadata !447, metadata !DIExpression()), !dbg !1956
  %324 = add nuw nsw i64 %318, 1, !dbg !1959
  call void @llvm.dbg.value(metadata i64 %324, metadata !448, metadata !DIExpression()), !dbg !1954
  %325 = icmp ult i64 %318, 12, !dbg !1960
  %326 = icmp ult i64 %323, %315
  %327 = select i1 %325, i1 %326, i1 false, !dbg !1961
  br i1 %327, label %317, label %328, !dbg !1961, !llvm.loop !1962

328:                                              ; preds = %317
  call void @llvm.dbg.value(metadata i64 undef, metadata !942, metadata !DIExpression()), !dbg !1964
  %329 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 1, !dbg !1965
  %330 = load %struct.block*, %struct.block** %329, align 8, !dbg !1965, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %330, metadata !945, metadata !DIExpression()), !dbg !1964
  %331 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 0, !dbg !1966
  %332 = load %struct.block*, %struct.block** %331, align 8, !dbg !1966, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %332, metadata !946, metadata !DIExpression()), !dbg !1964
  %333 = icmp eq %struct.block* %330, null, !dbg !1967
  br i1 %333, label %334, label %340, !dbg !1968

334:                                              ; preds = %328
  %335 = select i1 %325, i64 %324, i64 13
  call void @llvm.dbg.value(metadata i64 %335, metadata !942, metadata !DIExpression()), !dbg !1964
  %336 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %335, !dbg !1969
  store %struct.block* %332, %struct.block** %336, align 8, !dbg !1970, !tbaa !112
  %337 = icmp eq %struct.block* %332, null, !dbg !1971
  br i1 %337, label %361, label %338, !dbg !1972

338:                                              ; preds = %334
  %339 = getelementptr inbounds %struct.block, %struct.block* %332, i64 0, i32 1, i32 0, i32 1, !dbg !1973
  store %struct.block* null, %struct.block** %339, align 8, !dbg !1974, !tbaa !421
  br label %361, !dbg !1975

340:                                              ; preds = %328
  %341 = icmp eq %struct.block* %332, null, !dbg !1976
  %342 = getelementptr inbounds %struct.block, %struct.block* %330, i64 0, i32 1, i32 0, i32 0, !dbg !1977
  br i1 %341, label %343, label %344, !dbg !1978

343:                                              ; preds = %340
  store %struct.block* null, %struct.block** %342, align 8, !dbg !1979, !tbaa !421
  br label %361, !dbg !1980

344:                                              ; preds = %340
  store %struct.block* %332, %struct.block** %342, align 8, !dbg !1981, !tbaa !421
  %345 = getelementptr inbounds %struct.block, %struct.block* %332, i64 0, i32 1, i32 0, i32 1, !dbg !1982
  store %struct.block* %330, %struct.block** %345, align 8, !dbg !1983, !tbaa !421
  br label %361

346:                                              ; preds = %312
  %347 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1984, !tbaa !112
  %348 = icmp eq %struct.block* %347, %46, !dbg !1985
  br i1 %348, label %349, label %352, !dbg !1986

349:                                              ; preds = %346
  %350 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 0, !dbg !1987
  %351 = load %struct.block*, %struct.block** %350, align 8, !dbg !1987, !tbaa !421
  store %struct.block* %351, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !1988, !tbaa !112
  br label %361, !dbg !1989

352:                                              ; preds = %346, %352
  %353 = phi %struct.block* [ %355, %352 ], [ %347, %346 ], !dbg !1990
  call void @llvm.dbg.value(metadata %struct.block* %353, metadata !947, metadata !DIExpression()), !dbg !1990
  %354 = getelementptr inbounds %struct.block, %struct.block* %353, i64 0, i32 1, i32 0, i32 0, !dbg !1991
  %355 = load %struct.block*, %struct.block** %354, align 8, !dbg !1991, !tbaa !421
  %356 = icmp eq %struct.block* %355, %46, !dbg !1992
  br i1 %356, label %357, label %352, !dbg !1993, !llvm.loop !1994

357:                                              ; preds = %352
  %358 = getelementptr inbounds %struct.block, %struct.block* %353, i64 0, i32 1, i32 0, i32 0, !dbg !1991
  %359 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 0, !dbg !1996
  %360 = load %struct.block*, %struct.block** %359, align 8, !dbg !1996, !tbaa !421
  store %struct.block* %360, %struct.block** %358, align 8, !dbg !1997, !tbaa !421
  br label %361

361:                                              ; preds = %334, %338, %343, %344, %349, %357
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !938, metadata !DIExpression()), !dbg !1998
  call void @llvm.dbg.value(metadata i32 undef, metadata !941, metadata !DIExpression()), !dbg !1998
  %362 = load i64, i64* %47, align 8, !dbg !2000, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !2001
  call void @llvm.dbg.value(metadata i64 %362, metadata !145, metadata !DIExpression()), !dbg !2003
  %363 = and i64 %362, -16, !dbg !2005
  %364 = icmp ugt i64 %363, 16, !dbg !2006
  br i1 %364, label %365, label %394, !dbg !2007

365:                                              ; preds = %361, %365
  %366 = phi i64 [ %372, %365 ], [ 0, %361 ]
  %367 = phi i64 [ %371, %365 ], [ 16, %361 ]
  call void @llvm.dbg.value(metadata i64 %366, metadata !448, metadata !DIExpression()), !dbg !2008
  call void @llvm.dbg.value(metadata i64 %367, metadata !447, metadata !DIExpression()), !dbg !2010
  %368 = icmp ult i64 %366, 4, !dbg !2011
  %369 = add i64 %367, 16, !dbg !2012
  %370 = shl i64 %367, 1, !dbg !2012
  %371 = select i1 %368, i64 %369, i64 %370, !dbg !2012
  call void @llvm.dbg.value(metadata i64 %371, metadata !447, metadata !DIExpression()), !dbg !2010
  %372 = add nuw nsw i64 %366, 1, !dbg !2013
  call void @llvm.dbg.value(metadata i64 %372, metadata !448, metadata !DIExpression()), !dbg !2008
  %373 = icmp ult i64 %366, 12, !dbg !2014
  %374 = icmp ult i64 %371, %363
  %375 = select i1 %373, i1 %374, i1 false, !dbg !2015
  br i1 %375, label %365, label %376, !dbg !2015, !llvm.loop !2016

376:                                              ; preds = %365
  call void @llvm.dbg.value(metadata i64 undef, metadata !942, metadata !DIExpression()), !dbg !2018
  %377 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 1, !dbg !2019
  %378 = load %struct.block*, %struct.block** %377, align 8, !dbg !2019, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %378, metadata !945, metadata !DIExpression()), !dbg !2018
  %379 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !2020
  %380 = load %struct.block*, %struct.block** %379, align 8, !dbg !2020, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %380, metadata !946, metadata !DIExpression()), !dbg !2018
  %381 = icmp eq %struct.block* %378, null, !dbg !2021
  br i1 %381, label %382, label %388, !dbg !2022

382:                                              ; preds = %376
  %383 = select i1 %373, i64 %372, i64 13
  call void @llvm.dbg.value(metadata i64 %383, metadata !942, metadata !DIExpression()), !dbg !2018
  %384 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %383, !dbg !2023
  store %struct.block* %380, %struct.block** %384, align 8, !dbg !2024, !tbaa !112
  %385 = icmp eq %struct.block* %380, null, !dbg !2025
  br i1 %385, label %409, label %386, !dbg !2026

386:                                              ; preds = %382
  %387 = getelementptr inbounds %struct.block, %struct.block* %380, i64 0, i32 1, i32 0, i32 1, !dbg !2027
  store %struct.block* null, %struct.block** %387, align 8, !dbg !2028, !tbaa !421
  br label %409, !dbg !2029

388:                                              ; preds = %376
  %389 = icmp eq %struct.block* %380, null, !dbg !2030
  %390 = getelementptr inbounds %struct.block, %struct.block* %378, i64 0, i32 1, i32 0, i32 0, !dbg !2031
  br i1 %389, label %391, label %392, !dbg !2032

391:                                              ; preds = %388
  store %struct.block* null, %struct.block** %390, align 8, !dbg !2033, !tbaa !421
  br label %409, !dbg !2034

392:                                              ; preds = %388
  store %struct.block* %380, %struct.block** %390, align 8, !dbg !2035, !tbaa !421
  %393 = getelementptr inbounds %struct.block, %struct.block* %380, i64 0, i32 1, i32 0, i32 1, !dbg !2036
  store %struct.block* %378, %struct.block** %393, align 8, !dbg !2037, !tbaa !421
  br label %409

394:                                              ; preds = %361
  %395 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !2038, !tbaa !112
  %396 = icmp eq %struct.block* %395, %0, !dbg !2039
  br i1 %396, label %397, label %400, !dbg !2040

397:                                              ; preds = %394
  %398 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !2041
  %399 = load %struct.block*, %struct.block** %398, align 8, !dbg !2041, !tbaa !421
  store %struct.block* %399, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !2042, !tbaa !112
  br label %409, !dbg !2043

400:                                              ; preds = %394, %400
  %401 = phi %struct.block* [ %403, %400 ], [ %395, %394 ], !dbg !2044
  call void @llvm.dbg.value(metadata %struct.block* %401, metadata !947, metadata !DIExpression()), !dbg !2044
  %402 = getelementptr inbounds %struct.block, %struct.block* %401, i64 0, i32 1, i32 0, i32 0, !dbg !2045
  %403 = load %struct.block*, %struct.block** %402, align 8, !dbg !2045, !tbaa !421
  %404 = icmp eq %struct.block* %403, %0, !dbg !2046
  br i1 %404, label %405, label %400, !dbg !2047, !llvm.loop !2048

405:                                              ; preds = %400
  %406 = getelementptr inbounds %struct.block, %struct.block* %401, i64 0, i32 1, i32 0, i32 0, !dbg !2045
  %407 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !2050
  %408 = load %struct.block*, %struct.block** %407, align 8, !dbg !2050, !tbaa !421
  store %struct.block* %408, %struct.block** %406, align 8, !dbg !2051, !tbaa !421
  br label %409

409:                                              ; preds = %382, %386, %391, %392, %397, %405
  %410 = add i64 %311, %45, !dbg !2052
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !327, metadata !DIExpression()), !dbg !2053
  %411 = icmp eq %struct.block* %43, %46, !dbg !2055
  br i1 %411, label %418, label %412, !dbg !2056

412:                                              ; preds = %409
  %413 = load i64, i64* %313, align 8, !dbg !2057, !tbaa !135
  %414 = and i64 %413, 4, !dbg !2058
  %415 = icmp eq i64 %414, 0, !dbg !2059
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !351, metadata !DIExpression()), !dbg !2060
  %416 = and i64 %413, 8, !dbg !2062
  %417 = icmp ne i64 %416, 0, !dbg !2063
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !606, metadata !DIExpression()), !dbg !2064
  call void @llvm.dbg.value(metadata i64 %410, metadata !611, metadata !DIExpression()), !dbg !2064
  call void @llvm.dbg.value(metadata i1 %415, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2064
  call void @llvm.dbg.value(metadata i1 false, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2064
  call void @llvm.dbg.value(metadata i1 %417, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2064
  call void @llvm.dbg.value(metadata i1 false, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2064
  call void @llvm.dbg.value(metadata i64 %410, metadata !621, metadata !DIExpression()), !dbg !2066
  call void @llvm.dbg.value(metadata i1 %415, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2066
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2066
  call void @llvm.dbg.value(metadata i1 %417, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2066
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2066
  call void @llvm.dbg.value(metadata i64 %410, metadata !630, metadata !DIExpression()), !dbg !2066
  br i1 %415, label %421, label %418, !dbg !2068

418:                                              ; preds = %409, %412
  %419 = phi i1 [ %417, %412 ], [ false, %409 ]
  %420 = or i64 %410, 4, !dbg !2068
  br label %421, !dbg !2068

421:                                              ; preds = %412, %418
  %422 = phi i1 [ %419, %418 ], [ %417, %412 ]
  %423 = phi i64 [ %420, %418 ], [ %410, %412 ]
  call void @llvm.dbg.value(metadata i64 %423, metadata !630, metadata !DIExpression()), !dbg !2066
  %424 = or i64 %423, 8, !dbg !2069
  %425 = select i1 %422, i64 %424, i64 %423, !dbg !2069
  call void @llvm.dbg.value(metadata i64 %425, metadata !630, metadata !DIExpression()), !dbg !2066
  store i64 %425, i64* %313, align 8, !dbg !2070, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !250, metadata !DIExpression()), !dbg !2071
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !2073
  call void @llvm.dbg.value(metadata i64 %425, metadata !145, metadata !DIExpression()), !dbg !2075
  %426 = and i64 %425, -16, !dbg !2077
  call void @llvm.dbg.value(metadata i64 %426, metadata !253, metadata !DIExpression()), !dbg !2071
  %427 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, !dbg !2078
  %428 = bitcast %union.anon* %427 to i8*, !dbg !2079
  %429 = getelementptr inbounds i8, i8* %428, i64 %426, !dbg !2080
  %430 = getelementptr inbounds i8, i8* %429, i64 -16, !dbg !2081
  %431 = bitcast i8* %430 to i64*, !dbg !2082
  call void @llvm.dbg.value(metadata i64* %431, metadata !616, metadata !DIExpression()), !dbg !2083
  call void @llvm.dbg.value(metadata i64 %410, metadata !621, metadata !DIExpression()), !dbg !2084
  call void @llvm.dbg.value(metadata i1 %415, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2084
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2084
  call void @llvm.dbg.value(metadata i1 %417, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2084
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2084
  call void @llvm.dbg.value(metadata i64 %425, metadata !630, metadata !DIExpression()), !dbg !2084
  store i64 %425, i64* %431, align 8, !dbg !2086, !tbaa !267
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !674, metadata !DIExpression()) #6, !dbg !2087
  call void @llvm.dbg.value(metadata i32 undef, metadata !675, metadata !DIExpression()) #6, !dbg !2087
  %432 = load i64, i64* %313, align 8, !dbg !2089, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !2090
  call void @llvm.dbg.value(metadata i64 %432, metadata !145, metadata !DIExpression()) #6, !dbg !2092
  %433 = and i64 %432, -16, !dbg !2094
  switch i64 %433, label %439 [
    i64 0, label %467
    i64 16, label %434
  ], !dbg !2095

434:                                              ; preds = %421
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !686, metadata !DIExpression()) #6, !dbg !2096
  call void @llvm.dbg.value(metadata i32 undef, metadata !689, metadata !DIExpression()) #6, !dbg !2096
  %435 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !2098, !tbaa !112
  %436 = icmp eq %struct.block* %435, %46, !dbg !2099
  %437 = select i1 %436, %struct.block* null, %struct.block* %435, !dbg !2100
  %438 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 0, !dbg !2101
  store %struct.block* %437, %struct.block** %438, align 8, !dbg !2102
  store %struct.block* %46, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !2103, !tbaa !112
  br label %471, !dbg !2104

439:                                              ; preds = %421
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !2105
  call void @llvm.dbg.value(metadata i64 %432, metadata !145, metadata !DIExpression()) #6, !dbg !2107
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !2109
  call void @llvm.dbg.value(metadata i64 %432, metadata !145, metadata !DIExpression()) #6, !dbg !2111
  call void @llvm.dbg.value(metadata i64 %433, metadata !442, metadata !DIExpression()) #6, !dbg !2113
  call void @llvm.dbg.value(metadata i64 16, metadata !447, metadata !DIExpression()) #6, !dbg !2113
  call void @llvm.dbg.value(metadata i64 0, metadata !448, metadata !DIExpression()) #6, !dbg !2115
  %440 = icmp ugt i64 %433, 16
  br i1 %440, label %441, label %454, !dbg !2116

441:                                              ; preds = %439, %441
  %442 = phi i64 [ %448, %441 ], [ 0, %439 ]
  %443 = phi i64 [ %447, %441 ], [ 16, %439 ]
  call void @llvm.dbg.value(metadata i64 %442, metadata !448, metadata !DIExpression()) #6, !dbg !2115
  call void @llvm.dbg.value(metadata i64 %443, metadata !447, metadata !DIExpression()) #6, !dbg !2113
  %444 = icmp ult i64 %442, 4, !dbg !2117
  %445 = add i64 %443, 16, !dbg !2118
  %446 = shl i64 %443, 1, !dbg !2118
  %447 = select i1 %444, i64 %445, i64 %446, !dbg !2118
  call void @llvm.dbg.value(metadata i64 %447, metadata !447, metadata !DIExpression()) #6, !dbg !2113
  %448 = add nuw nsw i64 %442, 1, !dbg !2119
  call void @llvm.dbg.value(metadata i64 %448, metadata !448, metadata !DIExpression()) #6, !dbg !2115
  %449 = icmp ult i64 %442, 12, !dbg !2120
  %450 = icmp ult i64 %447, %433
  %451 = select i1 %449, i1 %450, i1 false, !dbg !2116
  br i1 %451, label %441, label %452, !dbg !2116, !llvm.loop !2121

452:                                              ; preds = %441
  %453 = select i1 %449, i64 %448, i64 13
  br label %454

454:                                              ; preds = %452, %439
  %455 = phi i64 [ 0, %439 ], [ %453, %452 ]
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !722, metadata !DIExpression()) #6, !dbg !2123
  call void @llvm.dbg.value(metadata i64 %455, metadata !727, metadata !DIExpression()) #6, !dbg !2123
  call void @llvm.dbg.value(metadata i32 undef, metadata !728, metadata !DIExpression()) #6, !dbg !2123
  %456 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %455, !dbg !2125
  %457 = load %struct.block*, %struct.block** %456, align 8, !dbg !2125, !tbaa !112
  %458 = icmp eq %struct.block* %457, %46, !dbg !2126
  %459 = select i1 %458, %struct.block* null, %struct.block* %457, !dbg !2127
  %460 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 0, !dbg !2128
  store %struct.block* %459, %struct.block** %460, align 8, !dbg !2129
  %461 = getelementptr inbounds %struct.block, %struct.block* %46, i64 0, i32 1, i32 0, i32 1, !dbg !2130
  store %struct.block* null, %struct.block** %461, align 8, !dbg !2131, !tbaa !421
  %462 = load %struct.block*, %struct.block** %456, align 8, !dbg !2132, !tbaa !112
  %463 = icmp eq %struct.block* %462, null, !dbg !2133
  br i1 %463, label %466, label %464, !dbg !2134

464:                                              ; preds = %454
  %465 = getelementptr inbounds %struct.block, %struct.block* %462, i64 0, i32 1, i32 0, i32 1, !dbg !2135
  store %struct.block* %46, %struct.block** %465, align 8, !dbg !2136, !tbaa !421
  br label %466, !dbg !2137

466:                                              ; preds = %464, %454
  store %struct.block* %46, %struct.block** %456, align 8, !dbg !2138, !tbaa !112
  br label %471, !dbg !2139

467:                                              ; preds = %421
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !2105
  call void @llvm.dbg.value(metadata i64 %432, metadata !145, metadata !DIExpression()) #6, !dbg !2107
  %468 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2140, !tbaa !112
  %469 = tail call i8* @mem_heap_lo() #6, !dbg !2141
  %470 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %468, i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @.str.19, i64 0, i64 0), %struct.block* noundef nonnull %46, i8* noundef %469) #8, !dbg !2143
  br label %471

471:                                              ; preds = %434, %466, %467
  call void @llvm.dbg.value(metadata %struct.block* %46, metadata !1486, metadata !DIExpression()), !dbg !1487
  %472 = load %struct.block*, %struct.block** @heap_end, align 8, !dbg !2144, !tbaa !112
  %473 = icmp eq %struct.block* %472, %0, !dbg !2146
  br i1 %473, label %474, label %475, !dbg !2147

474:                                              ; preds = %471
  store %struct.block* %46, %struct.block** @heap_end, align 8, !dbg !2148, !tbaa !112
  br label %475, !dbg !2150

475:                                              ; preds = %474, %471
  %476 = phi %struct.block* [ %46, %474 ], [ %472, %471 ]
  %477 = icmp eq %struct.block* %46, %476
  br i1 %477, label %653, label %478, !dbg !2151

478:                                              ; preds = %475
  %479 = load i64, i64* %53, align 8, !dbg !2153, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !2155
  call void @llvm.dbg.value(metadata i64 %479, metadata !145, metadata !DIExpression()), !dbg !2157
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !225, metadata !DIExpression()), !dbg !2159
  call void @llvm.dbg.value(metadata i64 %479, metadata !232, metadata !DIExpression()), !dbg !2161
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !606, metadata !DIExpression()), !dbg !2163
  call void @llvm.dbg.value(metadata i64 %479, metadata !611, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !2163
  call void @llvm.dbg.value(metadata i1 false, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2163
  call void @llvm.dbg.value(metadata i1 undef, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2163
  call void @llvm.dbg.value(metadata i1 false, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2163
  call void @llvm.dbg.value(metadata i1 undef, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2163
  call void @llvm.dbg.value(metadata i64 %479, metadata !621, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !2165
  call void @llvm.dbg.value(metadata i1 false, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2165
  call void @llvm.dbg.value(metadata i1 undef, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2165
  call void @llvm.dbg.value(metadata i1 false, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2165
  call void @llvm.dbg.value(metadata i1 undef, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2165
  call void @llvm.dbg.value(metadata i64 %479, metadata !630, metadata !DIExpression(DW_OP_constu, 18446744073709551601, DW_OP_and, DW_OP_stack_value)), !dbg !2165
  %480 = and i64 %479, -13, !dbg !2167
  call void @llvm.dbg.value(metadata i64 %480, metadata !630, metadata !DIExpression()), !dbg !2165
  store i64 %480, i64* %53, align 8, !dbg !2168, !tbaa !135
  %481 = and i64 %479, 3, !dbg !2169
  %482 = icmp eq i64 %481, 0, !dbg !2169
  br i1 %482, label %483, label %653, !dbg !2169

483:                                              ; preds = %478
  %484 = and i64 %479, -16, !dbg !2170
  call void @llvm.dbg.value(metadata i64 %484, metadata !611, metadata !DIExpression()), !dbg !2163
  call void @llvm.dbg.value(metadata i64 %484, metadata !621, metadata !DIExpression()), !dbg !2165
  call void @llvm.dbg.value(metadata i64 %484, metadata !630, metadata !DIExpression()), !dbg !2165
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !250, metadata !DIExpression()), !dbg !2171
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !2173
  call void @llvm.dbg.value(metadata i64 %480, metadata !145, metadata !DIExpression()), !dbg !2175
  call void @llvm.dbg.value(metadata i64 %484, metadata !253, metadata !DIExpression()), !dbg !2171
  %485 = getelementptr inbounds i8, i8* %51, i64 8, !dbg !2177
  %486 = getelementptr inbounds i8, i8* %485, i64 %484, !dbg !2178
  %487 = getelementptr inbounds i8, i8* %486, i64 -16, !dbg !2179
  %488 = bitcast i8* %487 to i64*, !dbg !2180
  call void @llvm.dbg.value(metadata i64* %488, metadata !616, metadata !DIExpression()), !dbg !2181
  call void @llvm.dbg.value(metadata i64 %479, metadata !621, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !2182
  call void @llvm.dbg.value(metadata i1 false, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2182
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2182
  call void @llvm.dbg.value(metadata i1 false, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2182
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2182
  call void @llvm.dbg.value(metadata i64 %479, metadata !630, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !2182
  store i64 %484, i64* %488, align 8, !dbg !2184, !tbaa !267
  br label %653, !dbg !2185

489:                                              ; preds = %86
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !2186
  call void @llvm.dbg.value(metadata i64 %87, metadata !145, metadata !DIExpression()), !dbg !2190
  call void @llvm.dbg.value(metadata i64 %88, metadata !1484, metadata !DIExpression()), !dbg !1487
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !938, metadata !DIExpression()), !dbg !2192
  call void @llvm.dbg.value(metadata i32 undef, metadata !941, metadata !DIExpression()), !dbg !2192
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !2194
  call void @llvm.dbg.value(metadata i64 %89, metadata !145, metadata !DIExpression()), !dbg !2196
  %490 = icmp ugt i64 %90, 16, !dbg !2198
  br i1 %490, label %491, label %520, !dbg !2199

491:                                              ; preds = %489, %491
  %492 = phi i64 [ %498, %491 ], [ 0, %489 ]
  %493 = phi i64 [ %497, %491 ], [ 16, %489 ]
  call void @llvm.dbg.value(metadata i64 %492, metadata !448, metadata !DIExpression()), !dbg !2200
  call void @llvm.dbg.value(metadata i64 %493, metadata !447, metadata !DIExpression()), !dbg !2202
  %494 = icmp ult i64 %492, 4, !dbg !2203
  %495 = add i64 %493, 16, !dbg !2204
  %496 = shl i64 %493, 1, !dbg !2204
  %497 = select i1 %494, i64 %495, i64 %496, !dbg !2204
  call void @llvm.dbg.value(metadata i64 %497, metadata !447, metadata !DIExpression()), !dbg !2202
  %498 = add nuw nsw i64 %492, 1, !dbg !2205
  call void @llvm.dbg.value(metadata i64 %498, metadata !448, metadata !DIExpression()), !dbg !2200
  %499 = icmp ult i64 %492, 12, !dbg !2206
  %500 = icmp ult i64 %497, %90
  %501 = select i1 %499, i1 %500, i1 false, !dbg !2207
  br i1 %501, label %491, label %502, !dbg !2207, !llvm.loop !2208

502:                                              ; preds = %491
  call void @llvm.dbg.value(metadata i64 undef, metadata !942, metadata !DIExpression()), !dbg !2210
  %503 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 1, !dbg !2211
  %504 = load %struct.block*, %struct.block** %503, align 8, !dbg !2211, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %504, metadata !945, metadata !DIExpression()), !dbg !2210
  %505 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !2212
  %506 = load %struct.block*, %struct.block** %505, align 8, !dbg !2212, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %506, metadata !946, metadata !DIExpression()), !dbg !2210
  %507 = icmp eq %struct.block* %504, null, !dbg !2213
  br i1 %507, label %508, label %514, !dbg !2214

508:                                              ; preds = %502
  %509 = select i1 %499, i64 %498, i64 13
  call void @llvm.dbg.value(metadata i64 %509, metadata !942, metadata !DIExpression()), !dbg !2210
  %510 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %509, !dbg !2215
  store %struct.block* %506, %struct.block** %510, align 8, !dbg !2216, !tbaa !112
  %511 = icmp eq %struct.block* %506, null, !dbg !2217
  br i1 %511, label %535, label %512, !dbg !2218

512:                                              ; preds = %508
  %513 = getelementptr inbounds %struct.block, %struct.block* %506, i64 0, i32 1, i32 0, i32 1, !dbg !2219
  store %struct.block* null, %struct.block** %513, align 8, !dbg !2220, !tbaa !421
  br label %535, !dbg !2221

514:                                              ; preds = %502
  %515 = icmp eq %struct.block* %506, null, !dbg !2222
  %516 = getelementptr inbounds %struct.block, %struct.block* %504, i64 0, i32 1, i32 0, i32 0, !dbg !2223
  br i1 %515, label %517, label %518, !dbg !2224

517:                                              ; preds = %514
  store %struct.block* null, %struct.block** %516, align 8, !dbg !2225, !tbaa !421
  br label %535, !dbg !2226

518:                                              ; preds = %514
  store %struct.block* %506, %struct.block** %516, align 8, !dbg !2227, !tbaa !421
  %519 = getelementptr inbounds %struct.block, %struct.block* %506, i64 0, i32 1, i32 0, i32 1, !dbg !2228
  store %struct.block* %504, %struct.block** %519, align 8, !dbg !2229, !tbaa !421
  br label %535

520:                                              ; preds = %489
  %521 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !2230, !tbaa !112
  %522 = icmp eq %struct.block* %521, %0, !dbg !2231
  br i1 %522, label %523, label %526, !dbg !2232

523:                                              ; preds = %520
  %524 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !2233
  %525 = load %struct.block*, %struct.block** %524, align 8, !dbg !2233, !tbaa !421
  store %struct.block* %525, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !2234, !tbaa !112
  br label %535, !dbg !2235

526:                                              ; preds = %520, %526
  %527 = phi %struct.block* [ %529, %526 ], [ %521, %520 ], !dbg !2236
  call void @llvm.dbg.value(metadata %struct.block* %527, metadata !947, metadata !DIExpression()), !dbg !2236
  %528 = getelementptr inbounds %struct.block, %struct.block* %527, i64 0, i32 1, i32 0, i32 0, !dbg !2237
  %529 = load %struct.block*, %struct.block** %528, align 8, !dbg !2237, !tbaa !421
  %530 = icmp eq %struct.block* %529, %0, !dbg !2238
  br i1 %530, label %531, label %526, !dbg !2239, !llvm.loop !2240

531:                                              ; preds = %526
  %532 = getelementptr inbounds %struct.block, %struct.block* %527, i64 0, i32 1, i32 0, i32 0, !dbg !2237
  %533 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !2242
  %534 = load %struct.block*, %struct.block** %533, align 8, !dbg !2242, !tbaa !421
  store %struct.block* %534, %struct.block** %532, align 8, !dbg !2243, !tbaa !421
  br label %535

535:                                              ; preds = %508, %512, %517, %518, %523, %531
  call void @llvm.dbg.value(metadata %struct.block* %52, metadata !938, metadata !DIExpression()), !dbg !2244
  call void @llvm.dbg.value(metadata i32 undef, metadata !941, metadata !DIExpression()), !dbg !2244
  %536 = load i64, i64* %53, align 8, !dbg !2246, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !2247
  call void @llvm.dbg.value(metadata i64 %536, metadata !145, metadata !DIExpression()), !dbg !2249
  %537 = and i64 %536, -16, !dbg !2251
  %538 = icmp ugt i64 %537, 16, !dbg !2252
  br i1 %538, label %539, label %570, !dbg !2253

539:                                              ; preds = %535, %539
  %540 = phi i64 [ %546, %539 ], [ 0, %535 ]
  %541 = phi i64 [ %545, %539 ], [ 16, %535 ]
  call void @llvm.dbg.value(metadata i64 %540, metadata !448, metadata !DIExpression()), !dbg !2254
  call void @llvm.dbg.value(metadata i64 %541, metadata !447, metadata !DIExpression()), !dbg !2256
  %542 = icmp ult i64 %540, 4, !dbg !2257
  %543 = add i64 %541, 16, !dbg !2258
  %544 = shl i64 %541, 1, !dbg !2258
  %545 = select i1 %542, i64 %543, i64 %544, !dbg !2258
  call void @llvm.dbg.value(metadata i64 %545, metadata !447, metadata !DIExpression()), !dbg !2256
  %546 = add nuw nsw i64 %540, 1, !dbg !2259
  call void @llvm.dbg.value(metadata i64 %546, metadata !448, metadata !DIExpression()), !dbg !2254
  %547 = icmp ult i64 %540, 12, !dbg !2260
  %548 = icmp ult i64 %545, %537
  %549 = select i1 %547, i1 %548, i1 false, !dbg !2261
  br i1 %549, label %539, label %550, !dbg !2261, !llvm.loop !2262

550:                                              ; preds = %539
  call void @llvm.dbg.value(metadata i64 undef, metadata !942, metadata !DIExpression()), !dbg !2264
  %551 = getelementptr inbounds i8, i8* %51, i64 16, !dbg !2265
  %552 = bitcast i8* %551 to %struct.block**, !dbg !2265
  %553 = load %struct.block*, %struct.block** %552, align 8, !dbg !2265, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %553, metadata !945, metadata !DIExpression()), !dbg !2264
  %554 = getelementptr inbounds i8, i8* %51, i64 8, !dbg !2266
  %555 = bitcast i8* %554 to %struct.block**, !dbg !2266
  %556 = load %struct.block*, %struct.block** %555, align 8, !dbg !2266, !tbaa !421
  call void @llvm.dbg.value(metadata %struct.block* %556, metadata !946, metadata !DIExpression()), !dbg !2264
  %557 = icmp eq %struct.block* %553, null, !dbg !2267
  br i1 %557, label %558, label %564, !dbg !2268

558:                                              ; preds = %550
  %559 = select i1 %547, i64 %546, i64 13
  call void @llvm.dbg.value(metadata i64 %559, metadata !942, metadata !DIExpression()), !dbg !2264
  %560 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %559, !dbg !2269
  store %struct.block* %556, %struct.block** %560, align 8, !dbg !2270, !tbaa !112
  %561 = icmp eq %struct.block* %556, null, !dbg !2271
  br i1 %561, label %587, label %562, !dbg !2272

562:                                              ; preds = %558
  %563 = getelementptr inbounds %struct.block, %struct.block* %556, i64 0, i32 1, i32 0, i32 1, !dbg !2273
  store %struct.block* null, %struct.block** %563, align 8, !dbg !2274, !tbaa !421
  br label %587, !dbg !2275

564:                                              ; preds = %550
  %565 = icmp eq %struct.block* %556, null, !dbg !2276
  %566 = getelementptr inbounds %struct.block, %struct.block* %553, i64 0, i32 1, i32 0, i32 0, !dbg !2277
  br i1 %565, label %567, label %568, !dbg !2278

567:                                              ; preds = %564
  store %struct.block* null, %struct.block** %566, align 8, !dbg !2279, !tbaa !421
  br label %587, !dbg !2280

568:                                              ; preds = %564
  store %struct.block* %556, %struct.block** %566, align 8, !dbg !2281, !tbaa !421
  %569 = getelementptr inbounds %struct.block, %struct.block* %556, i64 0, i32 1, i32 0, i32 1, !dbg !2282
  store %struct.block* %553, %struct.block** %569, align 8, !dbg !2283, !tbaa !421
  br label %587

570:                                              ; preds = %535
  %571 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !2284, !tbaa !112
  %572 = icmp eq %struct.block* %571, %52, !dbg !2285
  br i1 %572, label %573, label %577, !dbg !2286

573:                                              ; preds = %570
  %574 = getelementptr inbounds i8, i8* %51, i64 8, !dbg !2287
  %575 = bitcast i8* %574 to %struct.block**, !dbg !2287
  %576 = load %struct.block*, %struct.block** %575, align 8, !dbg !2287, !tbaa !421
  store %struct.block* %576, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !2288, !tbaa !112
  br label %587, !dbg !2289

577:                                              ; preds = %570, %577
  %578 = phi %struct.block* [ %580, %577 ], [ %571, %570 ], !dbg !2290
  call void @llvm.dbg.value(metadata %struct.block* %578, metadata !947, metadata !DIExpression()), !dbg !2290
  %579 = getelementptr inbounds %struct.block, %struct.block* %578, i64 0, i32 1, i32 0, i32 0, !dbg !2291
  %580 = load %struct.block*, %struct.block** %579, align 8, !dbg !2291, !tbaa !421
  %581 = icmp eq %struct.block* %580, %52, !dbg !2292
  br i1 %581, label %582, label %577, !dbg !2293, !llvm.loop !2294

582:                                              ; preds = %577
  %583 = getelementptr inbounds %struct.block, %struct.block* %578, i64 0, i32 1, i32 0, i32 0, !dbg !2291
  %584 = getelementptr inbounds i8, i8* %51, i64 8, !dbg !2296
  %585 = bitcast i8* %584 to %struct.block**, !dbg !2296
  %586 = load %struct.block*, %struct.block** %585, align 8, !dbg !2296, !tbaa !421
  store %struct.block* %586, %struct.block** %583, align 8, !dbg !2297, !tbaa !421
  br label %587

587:                                              ; preds = %558, %562, %567, %568, %573, %582
  %588 = add i64 %90, %88, !dbg !2298
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !327, metadata !DIExpression()), !dbg !2299
  %589 = icmp eq %struct.block* %43, %0, !dbg !2301
  br i1 %589, label %596, label %590, !dbg !2302

590:                                              ; preds = %587
  %591 = load i64, i64* %47, align 8, !dbg !2303, !tbaa !135
  %592 = and i64 %591, 4, !dbg !2304
  %593 = icmp eq i64 %592, 0, !dbg !2305
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !351, metadata !DIExpression()), !dbg !2306
  %594 = and i64 %591, 8, !dbg !2308
  %595 = icmp ne i64 %594, 0, !dbg !2309
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !606, metadata !DIExpression()), !dbg !2310
  call void @llvm.dbg.value(metadata i64 %588, metadata !611, metadata !DIExpression()), !dbg !2310
  call void @llvm.dbg.value(metadata i1 %593, metadata !612, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2310
  call void @llvm.dbg.value(metadata i1 false, metadata !613, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2310
  call void @llvm.dbg.value(metadata i1 %595, metadata !614, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2310
  call void @llvm.dbg.value(metadata i1 false, metadata !615, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2310
  call void @llvm.dbg.value(metadata i64 %588, metadata !621, metadata !DIExpression()), !dbg !2312
  call void @llvm.dbg.value(metadata i1 %593, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2312
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2312
  call void @llvm.dbg.value(metadata i1 %595, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2312
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2312
  call void @llvm.dbg.value(metadata i64 %588, metadata !630, metadata !DIExpression()), !dbg !2312
  br i1 %593, label %599, label %596, !dbg !2314

596:                                              ; preds = %587, %590
  %597 = phi i1 [ %595, %590 ], [ false, %587 ]
  %598 = or i64 %588, 4, !dbg !2314
  br label %599, !dbg !2314

599:                                              ; preds = %590, %596
  %600 = phi i1 [ %597, %596 ], [ %595, %590 ]
  %601 = phi i64 [ %598, %596 ], [ %588, %590 ]
  call void @llvm.dbg.value(metadata i64 %601, metadata !630, metadata !DIExpression()), !dbg !2312
  %602 = or i64 %601, 8, !dbg !2315
  %603 = select i1 %600, i64 %602, i64 %601, !dbg !2315
  call void @llvm.dbg.value(metadata i64 %603, metadata !630, metadata !DIExpression()), !dbg !2312
  store i64 %603, i64* %47, align 8, !dbg !2316, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !250, metadata !DIExpression()), !dbg !2317
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !2319
  call void @llvm.dbg.value(metadata i64 %603, metadata !145, metadata !DIExpression()), !dbg !2321
  %604 = and i64 %603, -16, !dbg !2323
  call void @llvm.dbg.value(metadata i64 %604, metadata !253, metadata !DIExpression()), !dbg !2317
  %605 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, !dbg !2324
  %606 = bitcast %union.anon* %605 to i8*, !dbg !2325
  %607 = getelementptr inbounds i8, i8* %606, i64 %604, !dbg !2326
  %608 = getelementptr inbounds i8, i8* %607, i64 -16, !dbg !2327
  %609 = bitcast i8* %608 to i64*, !dbg !2328
  call void @llvm.dbg.value(metadata i64* %609, metadata !616, metadata !DIExpression()), !dbg !2329
  call void @llvm.dbg.value(metadata i64 %588, metadata !621, metadata !DIExpression()), !dbg !2330
  call void @llvm.dbg.value(metadata i1 %593, metadata !626, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2330
  call void @llvm.dbg.value(metadata i1 false, metadata !627, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2330
  call void @llvm.dbg.value(metadata i1 %595, metadata !628, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2330
  call void @llvm.dbg.value(metadata i1 false, metadata !629, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !2330
  call void @llvm.dbg.value(metadata i64 %603, metadata !630, metadata !DIExpression()), !dbg !2330
  store i64 %603, i64* %609, align 8, !dbg !2332, !tbaa !267
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !674, metadata !DIExpression()) #6, !dbg !2333
  call void @llvm.dbg.value(metadata i32 undef, metadata !675, metadata !DIExpression()) #6, !dbg !2333
  %610 = load i64, i64* %47, align 8, !dbg !2335, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !2336
  call void @llvm.dbg.value(metadata i64 %610, metadata !145, metadata !DIExpression()) #6, !dbg !2338
  %611 = and i64 %610, -16, !dbg !2340
  switch i64 %611, label %617 [
    i64 0, label %645
    i64 16, label %612
  ], !dbg !2341

612:                                              ; preds = %599
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !686, metadata !DIExpression()) #6, !dbg !2342
  call void @llvm.dbg.value(metadata i32 undef, metadata !689, metadata !DIExpression()) #6, !dbg !2342
  %613 = load %struct.block*, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !2344, !tbaa !112
  %614 = icmp eq %struct.block* %613, %0, !dbg !2345
  %615 = select i1 %614, %struct.block* null, %struct.block* %613, !dbg !2346
  %616 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !2347
  store %struct.block* %615, %struct.block** %616, align 8, !dbg !2348
  store %struct.block* %0, %struct.block** getelementptr inbounds ([14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 0), align 16, !dbg !2349, !tbaa !112
  br label %649, !dbg !2350

617:                                              ; preds = %599
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !2351
  call void @llvm.dbg.value(metadata i64 %610, metadata !145, metadata !DIExpression()) #6, !dbg !2353
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !2355
  call void @llvm.dbg.value(metadata i64 %610, metadata !145, metadata !DIExpression()) #6, !dbg !2357
  call void @llvm.dbg.value(metadata i64 %611, metadata !442, metadata !DIExpression()) #6, !dbg !2359
  call void @llvm.dbg.value(metadata i64 16, metadata !447, metadata !DIExpression()) #6, !dbg !2359
  call void @llvm.dbg.value(metadata i64 0, metadata !448, metadata !DIExpression()) #6, !dbg !2361
  %618 = icmp ugt i64 %611, 16
  br i1 %618, label %619, label %632, !dbg !2362

619:                                              ; preds = %617, %619
  %620 = phi i64 [ %626, %619 ], [ 0, %617 ]
  %621 = phi i64 [ %625, %619 ], [ 16, %617 ]
  call void @llvm.dbg.value(metadata i64 %620, metadata !448, metadata !DIExpression()) #6, !dbg !2361
  call void @llvm.dbg.value(metadata i64 %621, metadata !447, metadata !DIExpression()) #6, !dbg !2359
  %622 = icmp ult i64 %620, 4, !dbg !2363
  %623 = add i64 %621, 16, !dbg !2364
  %624 = shl i64 %621, 1, !dbg !2364
  %625 = select i1 %622, i64 %623, i64 %624, !dbg !2364
  call void @llvm.dbg.value(metadata i64 %625, metadata !447, metadata !DIExpression()) #6, !dbg !2359
  %626 = add nuw nsw i64 %620, 1, !dbg !2365
  call void @llvm.dbg.value(metadata i64 %626, metadata !448, metadata !DIExpression()) #6, !dbg !2361
  %627 = icmp ult i64 %620, 12, !dbg !2366
  %628 = icmp ult i64 %625, %611
  %629 = select i1 %627, i1 %628, i1 false, !dbg !2362
  br i1 %629, label %619, label %630, !dbg !2362, !llvm.loop !2367

630:                                              ; preds = %619
  %631 = select i1 %627, i64 %626, i64 13
  br label %632

632:                                              ; preds = %630, %617
  %633 = phi i64 [ 0, %617 ], [ %631, %630 ]
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !722, metadata !DIExpression()) #6, !dbg !2369
  call void @llvm.dbg.value(metadata i64 %633, metadata !727, metadata !DIExpression()) #6, !dbg !2369
  call void @llvm.dbg.value(metadata i32 undef, metadata !728, metadata !DIExpression()) #6, !dbg !2369
  %634 = getelementptr inbounds [14 x %struct.block*], [14 x %struct.block*]* @seg_list, i64 0, i64 %633, !dbg !2371
  %635 = load %struct.block*, %struct.block** %634, align 8, !dbg !2371, !tbaa !112
  %636 = icmp eq %struct.block* %635, %0, !dbg !2372
  %637 = select i1 %636, %struct.block* null, %struct.block* %635, !dbg !2373
  %638 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !2374
  store %struct.block* %637, %struct.block** %638, align 8, !dbg !2375
  %639 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 1, !dbg !2376
  store %struct.block* null, %struct.block** %639, align 8, !dbg !2377, !tbaa !421
  %640 = load %struct.block*, %struct.block** %634, align 8, !dbg !2378, !tbaa !112
  %641 = icmp eq %struct.block* %640, null, !dbg !2379
  br i1 %641, label %644, label %642, !dbg !2380

642:                                              ; preds = %632
  %643 = getelementptr inbounds %struct.block, %struct.block* %640, i64 0, i32 1, i32 0, i32 1, !dbg !2381
  store %struct.block* %0, %struct.block** %643, align 8, !dbg !2382, !tbaa !421
  br label %644, !dbg !2383

644:                                              ; preds = %642, %632
  store %struct.block* %0, %struct.block** %634, align 8, !dbg !2384, !tbaa !112
  br label %649, !dbg !2385

645:                                              ; preds = %599
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()) #6, !dbg !2351
  call void @llvm.dbg.value(metadata i64 %610, metadata !145, metadata !DIExpression()) #6, !dbg !2353
  %646 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2386, !tbaa !112
  %647 = tail call i8* @mem_heap_lo() #6, !dbg !2387
  %648 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %646, i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @.str.19, i64 0, i64 0), %struct.block* noundef nonnull %0, i8* noundef %647) #8, !dbg !2389
  br label %649

649:                                              ; preds = %612, %644, %645
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !1486, metadata !DIExpression()), !dbg !1487
  %650 = load %struct.block*, %struct.block** @heap_end, align 8, !dbg !2390, !tbaa !112
  %651 = icmp eq %struct.block* %650, %52, !dbg !2392
  br i1 %651, label %652, label %653, !dbg !2393

652:                                              ; preds = %649
  store %struct.block* %0, %struct.block** @heap_end, align 8, !dbg !2394, !tbaa !112
  br label %653, !dbg !2396

653:                                              ; preds = %309, %483, %478, %303, %475, %649, %652, %308
  %654 = phi %struct.block* [ %46, %308 ], [ %0, %652 ], [ %0, %649 ], [ %46, %475 ], [ %46, %303 ], [ %46, %478 ], [ %46, %483 ], [ %0, %309 ], !dbg !2397
  call void @llvm.dbg.value(metadata %struct.block* %654, metadata !1486, metadata !DIExpression()), !dbg !1487
  ret %struct.block* %654, !dbg !2398
}

; Function Attrs: nounwind uwtable
define dso_local i8* @mm_realloc(i8* noundef %0, i64 noundef %1) local_unnamed_addr #0 !dbg !2399 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !2403, metadata !DIExpression()), !dbg !2408
  call void @llvm.dbg.value(metadata i64 %1, metadata !2404, metadata !DIExpression()), !dbg !2408
  call void @llvm.dbg.value(metadata i8* %0, metadata !596, metadata !DIExpression()), !dbg !2409
  %3 = getelementptr inbounds i8, i8* %0, i64 -8, !dbg !2411
  call void @llvm.dbg.value(metadata i8* %3, metadata !2405, metadata !DIExpression()), !dbg !2408
  %4 = icmp eq i64 %1, 0, !dbg !2412
  br i1 %4, label %5, label %6, !dbg !2414

5:                                                ; preds = %2
  tail call void @mm_free(i8* noundef %0), !dbg !2415
  br label %19, !dbg !2417

6:                                                ; preds = %2
  %7 = icmp eq i8* %0, null, !dbg !2418
  %8 = tail call i8* @mm_malloc(i64 noundef %1), !dbg !2408
  br i1 %7, label %19, label %9, !dbg !2420

9:                                                ; preds = %6
  call void @llvm.dbg.value(metadata i8* %8, metadata !2407, metadata !DIExpression()), !dbg !2408
  %10 = icmp eq i8* %8, null, !dbg !2421
  br i1 %10, label %19, label %11, !dbg !2423

11:                                               ; preds = %9
  %12 = bitcast i8* %3 to i64*, !dbg !2424
  %13 = load i64, i64* %12, align 8, !dbg !2424, !tbaa !135
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !2425, metadata !DIExpression()), !dbg !2429
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !138, metadata !DIExpression()), !dbg !2431
  call void @llvm.dbg.value(metadata i64 %13, metadata !145, metadata !DIExpression()), !dbg !2433
  %14 = and i64 %13, -16, !dbg !2435
  call void @llvm.dbg.value(metadata i64 %14, metadata !2428, metadata !DIExpression()), !dbg !2429
  %15 = add i64 %14, -8, !dbg !2436
  call void @llvm.dbg.value(metadata i64 %15, metadata !2406, metadata !DIExpression()), !dbg !2408
  %16 = icmp ugt i64 %15, %1, !dbg !2437
  %17 = select i1 %16, i64 %1, i64 %15, !dbg !2439
  call void @llvm.dbg.value(metadata i64 %17, metadata !2406, metadata !DIExpression()), !dbg !2408
  %18 = tail call i8* @mem_memcpy(i8* noundef nonnull %8, i8* noundef nonnull %0, i64 noundef %17) #6, !dbg !2440
  tail call void @mm_free(i8* noundef nonnull %0), !dbg !2441
  br label %19, !dbg !2442

19:                                               ; preds = %6, %9, %11, %5
  %20 = phi i8* [ null, %5 ], [ %8, %11 ], [ null, %9 ], [ %8, %6 ], !dbg !2408
  ret i8* %20, !dbg !2443
}

declare !dbg !2444 i8* @mem_memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local i8* @mm_calloc(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 !dbg !2449 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2453, metadata !DIExpression()), !dbg !2457
  call void @llvm.dbg.value(metadata i64 %1, metadata !2454, metadata !DIExpression()), !dbg !2457
  %3 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %0, i64 %1), !dbg !2458
  %4 = extractvalue { i64, i1 } %3, 0, !dbg !2458
  call void @llvm.dbg.value(metadata i64 %4, metadata !2456, metadata !DIExpression()), !dbg !2457
  %5 = icmp eq i64 %0, 0, !dbg !2459
  br i1 %5, label %13, label %6, !dbg !2461

6:                                                ; preds = %2
  %7 = extractvalue { i64, i1 } %3, 1, !dbg !2458
  br i1 %7, label %13, label %8, !dbg !2462

8:                                                ; preds = %6
  %9 = tail call i8* @mm_malloc(i64 noundef %4), !dbg !2463
  call void @llvm.dbg.value(metadata i8* %9, metadata !2455, metadata !DIExpression()), !dbg !2457
  %10 = icmp eq i8* %9, null, !dbg !2464
  br i1 %10, label %13, label %11, !dbg !2466

11:                                               ; preds = %8
  %12 = tail call i8* @mem_memset(i8* noundef nonnull %9, i32 noundef 0, i64 noundef %4) #6, !dbg !2467
  br label %13, !dbg !2468

13:                                               ; preds = %8, %6, %2, %11
  %14 = phi i8* [ %9, %11 ], [ null, %2 ], [ null, %6 ], [ null, %8 ], !dbg !2457
  ret i8* %14, !dbg !2469
}

declare !dbg !2470 i8* @mem_memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #3

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { cold nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!75, !76, !77, !78, !79, !80}
!llvm.ident = !{!81}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "heap_start", scope: !2, file: !3, line: 151, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !39, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "mm.c", directory: "/afs/andrew.cmu.edu/usr16/ishikhar/private/18213/malloc-lab-Zedonkay", checksumkind: CSK_MD5, checksum: "903f25bf07d5a33469b151aa0cbd24eb")
!4 = !{!5, !6, !31, !32, !33, !35, !36}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "block_t", file: !3, line: 147, baseType: !8)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "block", file: !3, line: 133, size: 192, elements: !9)
!9 = !{!10, !17}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "header", scope: !8, file: !3, line: 135, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "word_t", file: !3, line: 96, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !13, line: 27, baseType: !14)
!13 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !15, line: 45, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!16 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!17 = !DIDerivedType(tag: DW_TAG_member, scope: !8, file: !3, line: 137, baseType: !18, size: 128, offset: 64)
!18 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !8, file: !3, line: 137, size: 128, elements: !19)
!19 = !{!20, !26}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "pointers", scope: !18, file: !3, line: 141, baseType: !21, size: 128)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !18, file: !3, line: 138, size: 128, elements: !22)
!22 = !{!23, !25}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !21, file: !3, line: 139, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !21, file: !3, line: 140, baseType: !24, size: 64, offset: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !18, file: !3, line: 142, baseType: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 0)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !16)
!34 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!35 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !37, line: 87, baseType: !38)
!37 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "a48e64edacc5b19f56c99745232c963c")
!38 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!39 = !{!40, !43, !45, !47, !49, !51, !0, !56, !59, !61, !63, !65, !67, !69, !71, !73}
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!41 = distinct !DIGlobalVariable(name: "dsize", scope: !2, file: !3, line: 102, type: !42, isLocal: true, isDefinition: true)
!42 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!44 = distinct !DIGlobalVariable(name: "min_block_size", scope: !2, file: !3, line: 105, type: !42, isLocal: true, isDefinition: true)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression(DW_OP_constu, 8, DW_OP_stack_value))
!46 = distinct !DIGlobalVariable(name: "wsize", scope: !2, file: !3, line: 99, type: !42, isLocal: true, isDefinition: true)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression(DW_OP_constu, 1024, DW_OP_stack_value))
!48 = distinct !DIGlobalVariable(name: "chunksize", scope: !2, file: !3, line: 111, type: !42, isLocal: true, isDefinition: true)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!50 = distinct !DIGlobalVariable(name: "mini_size", scope: !2, file: !3, line: 107, type: !42, isLocal: true, isDefinition: true)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(name: "seg_list", scope: !2, file: !3, line: 154, type: !53, isLocal: true, isDefinition: true)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 896, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 14)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_stack_value))
!57 = distinct !DIGlobalVariable(name: "size_mask", scope: !2, file: !3, line: 128, type: !58, isLocal: true, isDefinition: true)
!58 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!60 = distinct !DIGlobalVariable(name: "alloc_mask", scope: !2, file: !3, line: 116, type: !58, isLocal: true, isDefinition: true)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!62 = distinct !DIGlobalVariable(name: "mini_mask", scope: !2, file: !3, line: 118, type: !58, isLocal: true, isDefinition: true)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression(DW_OP_constu, 4, DW_OP_stack_value))
!64 = distinct !DIGlobalVariable(name: "prev_alloc_mask", scope: !2, file: !3, line: 120, type: !58, isLocal: true, isDefinition: true)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression(DW_OP_constu, 8, DW_OP_stack_value))
!66 = distinct !DIGlobalVariable(name: "prev_mini_mask", scope: !2, file: !3, line: 122, type: !58, isLocal: true, isDefinition: true)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "seg_list_size", scope: !2, file: !3, line: 153, type: !33, isLocal: true, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(name: "seg_list_small_incr", scope: !2, file: !3, line: 155, type: !33, isLocal: true, isDefinition: true)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "heap_end", scope: !2, file: !3, line: 152, type: !6, isLocal: true, isDefinition: true)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "better_fit_param", scope: !2, file: !3, line: 156, type: !33, isLocal: true, isDefinition: true)
!75 = !{i32 7, !"Dwarf Version", i32 5}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 4}
!78 = !{i32 7, !"PIC Level", i32 2}
!79 = !{i32 7, !"PIE Level", i32 2}
!80 = !{i32 7, !"uwtable", i32 1}
!81 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!82 = distinct !DISubprogram(name: "mm_checkheap", scope: !3, file: !3, line: 982, type: !83, scopeLine: 982, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !86)
!83 = !DISubroutineType(types: !84)
!84 = !{!35, !85}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !{!87, !88, !89, !90, !91, !92, !94, !97, !98, !100, !104, !109}
!87 = !DILocalVariable(name: "line", arg: 1, scope: !82, file: !3, line: 982, type: !85)
!88 = !DILocalVariable(name: "prologue", scope: !82, file: !3, line: 984, type: !5)
!89 = !DILocalVariable(name: "end", scope: !82, file: !3, line: 990, type: !6)
!90 = !DILocalVariable(name: "start", scope: !82, file: !3, line: 1010, type: !6)
!91 = !DILocalVariable(name: "free_count_traverse", scope: !82, file: !3, line: 1011, type: !33)
!92 = !DILocalVariable(name: "block_size", scope: !93, file: !3, line: 1013, type: !33)
!93 = distinct !DILexicalBlock(scope: !82, file: !3, line: 1012, column: 25)
!94 = !DILocalVariable(name: "footer", scope: !95, file: !3, line: 1042, type: !31)
!95 = distinct !DILexicalBlock(scope: !96, file: !3, line: 1041, column: 51)
!96 = distinct !DILexicalBlock(scope: !93, file: !3, line: 1041, column: 13)
!97 = !DILocalVariable(name: "free_count_list", scope: !82, file: !3, line: 1101, type: !33)
!98 = !DILocalVariable(name: "i", scope: !99, file: !3, line: 1102, type: !33)
!99 = distinct !DILexicalBlock(scope: !82, file: !3, line: 1102, column: 5)
!100 = !DILocalVariable(name: "curr", scope: !101, file: !3, line: 1103, type: !6)
!101 = distinct !DILexicalBlock(scope: !102, file: !3, line: 1103, column: 9)
!102 = distinct !DILexicalBlock(scope: !103, file: !3, line: 1102, column: 48)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 1102, column: 5)
!104 = !DILocalVariable(name: "prev", scope: !105, file: !3, line: 1130, type: !6)
!105 = distinct !DILexicalBlock(scope: !106, file: !3, line: 1129, column: 21)
!106 = distinct !DILexicalBlock(scope: !107, file: !3, line: 1129, column: 16)
!107 = distinct !DILexicalBlock(scope: !108, file: !3, line: 1104, column: 42)
!108 = distinct !DILexicalBlock(scope: !101, file: !3, line: 1103, column: 9)
!109 = !DILocalVariable(name: "next", scope: !105, file: !3, line: 1139, type: !6)
!110 = !DILocation(line: 0, scope: !82)
!111 = !DILocation(line: 984, column: 39, scope: !82)
!112 = !{!113, !113, i64 0}
!113 = !{!"any pointer", !114, i64 0}
!114 = !{!"omnipotent char", !115, i64 0}
!115 = !{!"Simple C/C++ TBAA"}
!116 = !DILocalVariable(name: "block", arg: 1, scope: !117, file: !3, line: 440, type: !6)
!117 = distinct !DISubprogram(name: "find_prev_footer", scope: !3, file: !3, line: 440, type: !118, scopeLine: 440, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !120)
!118 = !DISubroutineType(types: !119)
!119 = !{!31, !6}
!120 = !{!116}
!121 = !DILocation(line: 0, scope: !117, inlinedAt: !122)
!122 = distinct !DILocation(line: 984, column: 22, scope: !82)
!123 = !DILocation(line: 442, column: 21, scope: !117, inlinedAt: !122)
!124 = !DILocation(line: 442, column: 29, scope: !117, inlinedAt: !122)
!125 = !DILocation(line: 495, column: 32, scope: !126, inlinedAt: !130)
!126 = distinct !DISubprogram(name: "find_epilogue", scope: !3, file: !3, line: 494, type: !127, scopeLine: 494, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !129)
!127 = !DISubroutineType(types: !128)
!128 = !{!6}
!129 = !{}
!130 = distinct !DILocation(line: 990, column: 20, scope: !82)
!131 = !DILocation(line: 495, column: 46, scope: !126, inlinedAt: !130)
!132 = !DILocation(line: 495, column: 12, scope: !126, inlinedAt: !130)
!133 = !DILocation(line: 995, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !82, file: !3, line: 995, column: 9)
!135 = !{!136, !137, i64 0}
!136 = !{!"block", !137, i64 0, !114, i64 8}
!137 = !{!"long", !114, i64 0}
!138 = !DILocalVariable(name: "block", arg: 1, scope: !139, file: !3, line: 331, type: !6)
!139 = distinct !DISubprogram(name: "get_size", scope: !3, file: !3, line: 331, type: !140, scopeLine: 331, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !142)
!140 = !DISubroutineType(types: !141)
!141 = !{!33, !6}
!142 = !{!138}
!143 = !DILocation(line: 0, scope: !139, inlinedAt: !144)
!144 = distinct !DILocation(line: 995, column: 9, scope: !134)
!145 = !DILocalVariable(name: "word", arg: 1, scope: !146, file: !3, line: 322, type: !11)
!146 = distinct !DISubprogram(name: "extract_size", scope: !3, file: !3, line: 322, type: !147, scopeLine: 322, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !149)
!147 = !DISubroutineType(types: !148)
!148 = !{!33, !11}
!149 = !{!145}
!150 = !DILocation(line: 0, scope: !146, inlinedAt: !151)
!151 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !144)
!152 = !DILocation(line: 995, column: 28, scope: !134)
!153 = !DILocation(line: 995, column: 9, scope: !82)
!154 = !DILocation(line: 996, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !134, file: !3, line: 995, column: 34)
!156 = !DILocation(line: 996, column: 9, scope: !155)
!157 = !DILocation(line: 997, column: 9, scope: !155)
!158 = !DILocation(line: 999, column: 9, scope: !159)
!159 = distinct !DILexicalBlock(scope: !82, file: !3, line: 999, column: 9)
!160 = !DILocation(line: 0, scope: !139, inlinedAt: !161)
!161 = distinct !DILocation(line: 999, column: 9, scope: !159)
!162 = !DILocation(line: 0, scope: !146, inlinedAt: !163)
!163 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !161)
!164 = !DILocation(line: 999, column: 23, scope: !159)
!165 = !DILocation(line: 999, column: 9, scope: !82)
!166 = !DILocation(line: 1000, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !159, file: !3, line: 999, column: 29)
!168 = !DILocation(line: 1000, column: 9, scope: !167)
!169 = !DILocation(line: 1001, column: 9, scope: !167)
!170 = !DILocation(line: 1005, column: 26, scope: !171)
!171 = distinct !DILexicalBlock(scope: !82, file: !3, line: 1005, column: 9)
!172 = !DILocation(line: 1005, column: 13, scope: !171)
!173 = !DILocation(line: 1005, column: 9, scope: !82)
!174 = !DILocation(line: 1006, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !3, line: 1005, column: 41)
!176 = !DILocation(line: 1006, column: 9, scope: !175)
!177 = !DILocation(line: 1007, column: 9, scope: !175)
!178 = !DILocation(line: 1010, column: 22, scope: !82)
!179 = !DILocation(line: 1012, column: 18, scope: !82)
!180 = !DILocation(line: 1012, column: 5, scope: !82)
!181 = !DILocation(line: 1011, column: 12, scope: !82)
!182 = !DILocation(line: 0, scope: !99)
!183 = !DILocation(line: 1102, column: 5, scope: !99)
!184 = !DILocation(line: 1013, column: 29, scope: !93)
!185 = !DILocation(line: 0, scope: !139, inlinedAt: !186)
!186 = distinct !DILocation(line: 1013, column: 29, scope: !93)
!187 = !DILocation(line: 0, scope: !146, inlinedAt: !188)
!188 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !186)
!189 = !DILocation(line: 0, scope: !93)
!190 = !DILocation(line: 1015, column: 32, scope: !191)
!191 = distinct !DILexicalBlock(scope: !93, file: !3, line: 1015, column: 13)
!192 = !DILocation(line: 1015, column: 21, scope: !191)
!193 = !DILocation(line: 1015, column: 19, scope: !191)
!194 = !DILocation(line: 1015, column: 13, scope: !93)
!195 = !DILocation(line: 1016, column: 21, scope: !196)
!196 = distinct !DILexicalBlock(scope: !191, file: !3, line: 1015, column: 47)
!197 = !DILocation(line: 1016, column: 13, scope: !196)
!198 = !DILocation(line: 1020, column: 13, scope: !196)
!199 = !DILocation(line: 1023, column: 31, scope: !200)
!200 = distinct !DILexicalBlock(scope: !93, file: !3, line: 1023, column: 13)
!201 = !DILocalVariable(name: "offsetted", arg: 1, scope: !202, file: !3, line: 259, type: !6)
!202 = distinct !DISubprogram(name: "get_offset", scope: !3, file: !3, line: 259, type: !203, scopeLine: 259, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !205)
!203 = !DISubroutineType(types: !204)
!204 = !{!33, !6, !6}
!205 = !{!201, !206}
!206 = !DILocalVariable(name: "start", arg: 2, scope: !202, file: !3, line: 259, type: !6)
!207 = !DILocation(line: 0, scope: !202, inlinedAt: !208)
!208 = distinct !DILocation(line: 1023, column: 13, scope: !200)
!209 = !DILocation(line: 260, column: 39, scope: !202, inlinedAt: !208)
!210 = !DILocation(line: 1023, column: 43, scope: !200)
!211 = !DILocation(line: 1023, column: 51, scope: !200)
!212 = !DILocation(line: 1023, column: 13, scope: !93)
!213 = !DILocation(line: 1024, column: 21, scope: !214)
!214 = distinct !DILexicalBlock(scope: !200, file: !3, line: 1023, column: 57)
!215 = !DILocation(line: 1024, column: 13, scope: !214)
!216 = !DILocation(line: 1028, column: 13, scope: !214)
!217 = !DILocation(line: 1034, column: 24, scope: !218)
!218 = distinct !DILexicalBlock(scope: !93, file: !3, line: 1034, column: 13)
!219 = !DILocation(line: 1034, column: 13, scope: !93)
!220 = !DILocation(line: 1035, column: 21, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !3, line: 1034, column: 42)
!222 = !DILocation(line: 1035, column: 13, scope: !221)
!223 = !DILocation(line: 1039, column: 13, scope: !221)
!224 = !DILocation(line: 1041, column: 14, scope: !96)
!225 = !DILocalVariable(name: "block", arg: 1, scope: !226, file: !3, line: 279, type: !6)
!226 = distinct !DISubprogram(name: "get_alloc", scope: !3, file: !3, line: 279, type: !227, scopeLine: 279, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !229)
!227 = !DISubroutineType(types: !228)
!228 = !{!35, !6}
!229 = !{!225}
!230 = !DILocation(line: 0, scope: !226, inlinedAt: !231)
!231 = distinct !DILocation(line: 1041, column: 14, scope: !96)
!232 = !DILocalVariable(name: "word", arg: 1, scope: !233, file: !3, line: 270, type: !11)
!233 = distinct !DISubprogram(name: "extract_alloc", scope: !3, file: !3, line: 270, type: !234, scopeLine: 270, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !236)
!234 = !DISubroutineType(types: !235)
!235 = !{!35, !11}
!236 = !{!232}
!237 = !DILocation(line: 0, scope: !233, inlinedAt: !238)
!238 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !231)
!239 = !DILocation(line: 271, column: 24, scope: !233, inlinedAt: !238)
!240 = !DILocation(line: 271, column: 12, scope: !233, inlinedAt: !238)
!241 = !DILocation(line: 1041, column: 30, scope: !96)
!242 = !DILocalVariable(name: "block", arg: 1, scope: !243, file: !3, line: 309, type: !6)
!243 = distinct !DISubprogram(name: "get_mini", scope: !3, file: !3, line: 309, type: !227, scopeLine: 309, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !244)
!244 = !{!242}
!245 = !DILocation(line: 0, scope: !243, inlinedAt: !246)
!246 = distinct !DILocation(line: 1041, column: 34, scope: !96)
!247 = !DILocation(line: 310, column: 33, scope: !243, inlinedAt: !246)
!248 = !DILocation(line: 310, column: 12, scope: !243, inlinedAt: !246)
!249 = !DILocation(line: 1041, column: 13, scope: !93)
!250 = !DILocalVariable(name: "block", arg: 1, scope: !251, file: !3, line: 365, type: !6)
!251 = distinct !DISubprogram(name: "header_to_footer", scope: !3, file: !3, line: 365, type: !118, scopeLine: 365, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !252)
!252 = !{!250, !253}
!253 = !DILocalVariable(name: "block_size", scope: !251, file: !3, line: 368, type: !33)
!254 = !DILocation(line: 0, scope: !251, inlinedAt: !255)
!255 = distinct !DILocation(line: 1042, column: 30, scope: !95)
!256 = !DILocation(line: 0, scope: !139, inlinedAt: !257)
!257 = distinct !DILocation(line: 368, column: 25, scope: !251, inlinedAt: !255)
!258 = !DILocation(line: 0, scope: !146, inlinedAt: !259)
!259 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !257)
!260 = !DILocation(line: 369, column: 30, scope: !251, inlinedAt: !255)
!261 = !DILocation(line: 369, column: 38, scope: !251, inlinedAt: !255)
!262 = !DILocation(line: 369, column: 51, scope: !251, inlinedAt: !255)
!263 = !DILocation(line: 369, column: 12, scope: !251, inlinedAt: !255)
!264 = !DILocation(line: 0, scope: !95)
!265 = !DILocation(line: 1050, column: 40, scope: !266)
!266 = distinct !DILexicalBlock(scope: !95, file: !3, line: 1050, column: 17)
!267 = !{!137, !137, i64 0}
!268 = !DILocation(line: 1050, column: 35, scope: !266)
!269 = !DILocation(line: 1050, column: 17, scope: !95)
!270 = !DILocation(line: 1051, column: 25, scope: !271)
!271 = distinct !DILexicalBlock(scope: !266, file: !3, line: 1050, column: 51)
!272 = !DILocation(line: 1051, column: 17, scope: !271)
!273 = !DILocalVariable(name: "block", arg: 1, scope: !274, file: !3, line: 428, type: !6)
!274 = distinct !DISubprogram(name: "find_next", scope: !3, file: !3, line: 428, type: !275, scopeLine: 428, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !277)
!275 = !DISubroutineType(types: !276)
!276 = !{!6, !6}
!277 = !{!273, !278}
!278 = !DILocalVariable(name: "block_size", scope: !274, file: !3, line: 432, type: !33)
!279 = !DILocation(line: 0, scope: !274, inlinedAt: !280)
!280 = distinct !DILocation(line: 1063, column: 13, scope: !281)
!281 = distinct !DILexicalBlock(scope: !93, file: !3, line: 1063, column: 13)
!282 = !DILocation(line: 0, scope: !139, inlinedAt: !283)
!283 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !280)
!284 = !DILocation(line: 0, scope: !146, inlinedAt: !285)
!285 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !283)
!286 = !DILocation(line: 433, column: 24, scope: !274, inlinedAt: !280)
!287 = !DILocation(line: 433, column: 38, scope: !274, inlinedAt: !280)
!288 = !DILocation(line: 433, column: 12, scope: !274, inlinedAt: !280)
!289 = !DILocation(line: 1063, column: 30, scope: !281)
!290 = !DILocation(line: 1063, column: 13, scope: !93)
!291 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !285)
!292 = !DILocation(line: 0, scope: !226, inlinedAt: !293)
!293 = distinct !DILocation(line: 1064, column: 18, scope: !294)
!294 = distinct !DILexicalBlock(scope: !295, file: !3, line: 1064, column: 17)
!295 = distinct !DILexicalBlock(scope: !281, file: !3, line: 1063, column: 38)
!296 = !DILocation(line: 0, scope: !233, inlinedAt: !297)
!297 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !293)
!298 = !DILocation(line: 0, scope: !274, inlinedAt: !299)
!299 = distinct !DILocation(line: 1064, column: 49, scope: !294)
!300 = !DILocation(line: 0, scope: !139, inlinedAt: !301)
!301 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !299)
!302 = !DILocation(line: 0, scope: !146, inlinedAt: !303)
!303 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !301)
!304 = !DILocation(line: 1064, column: 39, scope: !294)
!305 = !DILocation(line: 0, scope: !226, inlinedAt: !306)
!306 = distinct !DILocation(line: 1064, column: 39, scope: !294)
!307 = !DILocation(line: 0, scope: !233, inlinedAt: !308)
!308 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !306)
!309 = !DILocation(line: 271, column: 24, scope: !233, inlinedAt: !308)
!310 = !DILocation(line: 271, column: 12, scope: !233, inlinedAt: !308)
!311 = !DILocation(line: 1064, column: 17, scope: !295)
!312 = !DILocation(line: 1065, column: 25, scope: !313)
!313 = distinct !DILexicalBlock(scope: !294, file: !3, line: 1064, column: 68)
!314 = !DILocation(line: 1065, column: 17, scope: !313)
!315 = !DILocation(line: 1071, column: 17, scope: !313)
!316 = !DILocation(line: 0, scope: !226, inlinedAt: !317)
!317 = distinct !DILocation(line: 1074, column: 17, scope: !318)
!318 = distinct !DILexicalBlock(scope: !295, file: !3, line: 1074, column: 17)
!319 = !DILocation(line: 0, scope: !233, inlinedAt: !320)
!320 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !317)
!321 = !DILocation(line: 0, scope: !274, inlinedAt: !322)
!322 = distinct !DILocation(line: 1074, column: 52, scope: !318)
!323 = !DILocation(line: 0, scope: !139, inlinedAt: !324)
!324 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !322)
!325 = !DILocation(line: 0, scope: !146, inlinedAt: !326)
!326 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !324)
!327 = !DILocalVariable(name: "block", arg: 1, scope: !328, file: !3, line: 287, type: !6)
!328 = distinct !DISubprogram(name: "get_prev_alloc", scope: !3, file: !3, line: 287, type: !227, scopeLine: 287, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !329)
!329 = !{!327}
!330 = !DILocation(line: 0, scope: !328, inlinedAt: !331)
!331 = distinct !DILocation(line: 1074, column: 37, scope: !318)
!332 = !DILocation(line: 288, column: 15, scope: !333, inlinedAt: !331)
!333 = distinct !DILexicalBlock(scope: !328, file: !3, line: 288, column: 9)
!334 = !DILocation(line: 288, column: 9, scope: !328, inlinedAt: !331)
!335 = !DILocation(line: 291, column: 26, scope: !328, inlinedAt: !331)
!336 = !DILocation(line: 291, column: 33, scope: !328, inlinedAt: !331)
!337 = !DILocation(line: 291, column: 12, scope: !328, inlinedAt: !331)
!338 = !DILocation(line: 1074, column: 34, scope: !318)
!339 = !DILocation(line: 1074, column: 17, scope: !295)
!340 = !DILocation(line: 0, scope: !243, inlinedAt: !341)
!341 = distinct !DILocation(line: 1083, column: 17, scope: !342)
!342 = distinct !DILexicalBlock(scope: !295, file: !3, line: 1083, column: 17)
!343 = !DILocation(line: 310, column: 33, scope: !243, inlinedAt: !341)
!344 = !DILocation(line: 310, column: 12, scope: !243, inlinedAt: !341)
!345 = !DILocation(line: 0, scope: !274, inlinedAt: !346)
!346 = distinct !DILocation(line: 1083, column: 50, scope: !342)
!347 = !DILocation(line: 0, scope: !139, inlinedAt: !348)
!348 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !346)
!349 = !DILocation(line: 0, scope: !146, inlinedAt: !350)
!350 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !348)
!351 = !DILocalVariable(name: "block", arg: 1, scope: !352, file: !3, line: 298, type: !6)
!352 = distinct !DISubprogram(name: "get_prev_mini", scope: !3, file: !3, line: 298, type: !227, scopeLine: 298, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !353)
!353 = !{!351}
!354 = !DILocation(line: 0, scope: !352, inlinedAt: !355)
!355 = distinct !DILocation(line: 1083, column: 36, scope: !342)
!356 = !DILocation(line: 1083, column: 17, scope: !295)
!357 = !DILocation(line: 0, scope: !274, inlinedAt: !358)
!358 = distinct !DILocation(line: 1078, column: 33, scope: !359)
!359 = distinct !DILexicalBlock(scope: !318, file: !3, line: 1074, column: 71)
!360 = !DILocation(line: 0, scope: !139, inlinedAt: !361)
!361 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !358)
!362 = !DILocation(line: 0, scope: !146, inlinedAt: !363)
!363 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !361)
!364 = !DILocation(line: 0, scope: !274, inlinedAt: !365)
!365 = distinct !DILocation(line: 1078, column: 66, scope: !359)
!366 = !DILocation(line: 0, scope: !139, inlinedAt: !367)
!367 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !365)
!368 = !DILocation(line: 0, scope: !146, inlinedAt: !369)
!369 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !367)
!370 = !DILocation(line: 0, scope: !328, inlinedAt: !371)
!371 = distinct !DILocation(line: 1078, column: 51, scope: !359)
!372 = !DILocation(line: 291, column: 5, scope: !328, inlinedAt: !371)
!373 = !DILocation(line: 1075, column: 25, scope: !359)
!374 = !DILocation(line: 0, scope: !226, inlinedAt: !375)
!375 = distinct !DILocation(line: 1079, column: 40, scope: !359)
!376 = !DILocation(line: 0, scope: !233, inlinedAt: !377)
!377 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !375)
!378 = !DILocation(line: 1075, column: 17, scope: !359)
!379 = !DILocation(line: 1081, column: 17, scope: !359)
!380 = !DILocation(line: 302, column: 33, scope: !352, inlinedAt: !355)
!381 = !DILocation(line: 302, column: 12, scope: !352, inlinedAt: !355)
!382 = !DILocation(line: 1083, column: 33, scope: !342)
!383 = !DILocation(line: 0, scope: !274, inlinedAt: !384)
!384 = distinct !DILocation(line: 1087, column: 33, scope: !385)
!385 = distinct !DILexicalBlock(scope: !342, file: !3, line: 1083, column: 69)
!386 = !DILocation(line: 0, scope: !139, inlinedAt: !387)
!387 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !384)
!388 = !DILocation(line: 0, scope: !146, inlinedAt: !389)
!389 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !387)
!390 = !DILocation(line: 0, scope: !274, inlinedAt: !391)
!391 = distinct !DILocation(line: 1087, column: 65, scope: !385)
!392 = !DILocation(line: 0, scope: !139, inlinedAt: !393)
!393 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !391)
!394 = !DILocation(line: 0, scope: !146, inlinedAt: !395)
!395 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !393)
!396 = !DILocation(line: 0, scope: !352, inlinedAt: !397)
!397 = distinct !DILocation(line: 1087, column: 51, scope: !385)
!398 = !DILocation(line: 302, column: 5, scope: !352, inlinedAt: !397)
!399 = !DILocation(line: 1084, column: 25, scope: !385)
!400 = !DILocation(line: 0, scope: !243, inlinedAt: !401)
!401 = distinct !DILocation(line: 1088, column: 40, scope: !385)
!402 = !DILocation(line: 1084, column: 17, scope: !385)
!403 = !DILocation(line: 1090, column: 17, scope: !385)
!404 = !DILocation(line: 0, scope: !226, inlinedAt: !405)
!405 = distinct !DILocation(line: 1095, column: 14, scope: !406)
!406 = distinct !DILexicalBlock(scope: !93, file: !3, line: 1095, column: 13)
!407 = !DILocation(line: 0, scope: !233, inlinedAt: !408)
!408 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !405)
!409 = !DILocation(line: 1095, column: 13, scope: !93)
!410 = !DILocation(line: 0, scope: !274, inlinedAt: !411)
!411 = distinct !DILocation(line: 1098, column: 17, scope: !93)
!412 = !DILocation(line: 0, scope: !139, inlinedAt: !413)
!413 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !411)
!414 = !DILocation(line: 0, scope: !146, inlinedAt: !415)
!415 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !413)
!416 = distinct !{!416, !180, !417, !418}
!417 = !DILocation(line: 1099, column: 5, scope: !82)
!418 = !{!"llvm.loop.mustprogress"}
!419 = !DILocation(line: 1103, column: 30, scope: !101)
!420 = !DILocation(line: 0, scope: !101)
!421 = !{!114, !114, i64 0}
!422 = !DILocation(line: 1103, column: 48, scope: !108)
!423 = !DILocation(line: 1103, column: 9, scope: !101)
!424 = !DILocation(line: 1129, column: 16, scope: !107)
!425 = !DILocation(line: 1107, column: 35, scope: !426)
!426 = distinct !DILexicalBlock(scope: !107, file: !3, line: 1107, column: 17)
!427 = !DILocation(line: 1107, column: 24, scope: !426)
!428 = !DILocation(line: 1107, column: 22, scope: !426)
!429 = !DILocation(line: 1107, column: 17, scope: !107)
!430 = !DILocation(line: 1112, column: 35, scope: !431)
!431 = distinct !DILexicalBlock(scope: !107, file: !3, line: 1112, column: 17)
!432 = !DILocation(line: 1112, column: 24, scope: !431)
!433 = !DILocation(line: 1112, column: 22, scope: !431)
!434 = !DILocation(line: 1112, column: 17, scope: !107)
!435 = !DILocation(line: 1119, column: 30, scope: !436)
!436 = distinct !DILexicalBlock(scope: !107, file: !3, line: 1119, column: 17)
!437 = !DILocation(line: 0, scope: !139, inlinedAt: !438)
!438 = distinct !DILocation(line: 1119, column: 30, scope: !436)
!439 = !DILocation(line: 0, scope: !146, inlinedAt: !440)
!440 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !438)
!441 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !440)
!442 = !DILocalVariable(name: "block_size", arg: 1, scope: !443, file: !3, line: 185, type: !33)
!443 = distinct !DISubprogram(name: "get_list_ind", scope: !3, file: !3, line: 185, type: !444, scopeLine: 185, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !446)
!444 = !DISubroutineType(types: !445)
!445 = !{!33, !33}
!446 = !{!442, !447, !448}
!447 = !DILocalVariable(name: "size", scope: !443, file: !3, line: 186, type: !33)
!448 = !DILocalVariable(name: "index", scope: !449, file: !3, line: 187, type: !33)
!449 = distinct !DILexicalBlock(scope: !443, file: !3, line: 187, column: 5)
!450 = !DILocation(line: 0, scope: !443, inlinedAt: !451)
!451 = distinct !DILocation(line: 1119, column: 17, scope: !436)
!452 = !DILocation(line: 0, scope: !449, inlinedAt: !451)
!453 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !451)
!454 = !DILocation(line: 1153, column: 28, scope: !107)
!455 = !DILocation(line: 1104, column: 36, scope: !108)
!456 = distinct !{!456, !423, !457, !418}
!457 = !DILocation(line: 1154, column: 9, scope: !101)
!458 = !DILocation(line: 1108, column: 25, scope: !459)
!459 = distinct !DILexicalBlock(scope: !426, file: !3, line: 1107, column: 50)
!460 = !DILocation(line: 1108, column: 17, scope: !459)
!461 = !DILocation(line: 1110, column: 17, scope: !459)
!462 = !DILocation(line: 1113, column: 25, scope: !463)
!463 = distinct !DILexicalBlock(scope: !431, file: !3, line: 1112, column: 50)
!464 = !DILocation(line: 1113, column: 17, scope: !463)
!465 = !DILocation(line: 1115, column: 17, scope: !463)
!466 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !451)
!467 = distinct !DILexicalBlock(scope: !468, file: !3, line: 191, column: 13)
!468 = distinct !DILexicalBlock(scope: !469, file: !3, line: 187, column: 66)
!469 = distinct !DILexicalBlock(scope: !449, file: !3, line: 187, column: 5)
!470 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !451)
!471 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !451)
!472 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !451)
!473 = distinct !{!473, !453, !474, !418}
!474 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !451)
!475 = !DILocation(line: 1119, column: 46, scope: !436)
!476 = !DILocation(line: 1119, column: 17, scope: !107)
!477 = !DILocation(line: 1120, column: 25, scope: !478)
!478 = distinct !DILexicalBlock(scope: !436, file: !3, line: 1119, column: 52)
!479 = !DILocation(line: 0, scope: !139, inlinedAt: !480)
!480 = distinct !DILocation(line: 1123, column: 55, scope: !478)
!481 = !DILocation(line: 0, scope: !146, inlinedAt: !482)
!482 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !480)
!483 = !DILocation(line: 0, scope: !443, inlinedAt: !484)
!484 = distinct !DILocation(line: 1123, column: 42, scope: !478)
!485 = !DILocation(line: 0, scope: !449, inlinedAt: !484)
!486 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !484)
!487 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !484)
!488 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !484)
!489 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !484)
!490 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !484)
!491 = distinct !{!491, !486, !492, !418}
!492 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !484)
!493 = !DILocation(line: 1120, column: 17, scope: !478)
!494 = !DILocation(line: 1124, column: 17, scope: !478)
!495 = !DILocation(line: 1130, column: 48, scope: !105)
!496 = !DILocation(line: 0, scope: !105)
!497 = !DILocation(line: 1131, column: 26, scope: !498)
!498 = distinct !DILexicalBlock(scope: !105, file: !3, line: 1131, column: 21)
!499 = !DILocation(line: 1131, column: 34, scope: !498)
!500 = !DILocation(line: 1131, column: 52, scope: !498)
!501 = !DILocation(line: 1131, column: 57, scope: !498)
!502 = !DILocation(line: 1131, column: 21, scope: !105)
!503 = !DILocation(line: 1132, column: 29, scope: !504)
!504 = distinct !DILexicalBlock(scope: !498, file: !3, line: 1131, column: 66)
!505 = !DILocation(line: 1132, column: 21, scope: !504)
!506 = !DILocation(line: 1137, column: 21, scope: !504)
!507 = !DILocation(line: 1139, column: 48, scope: !105)
!508 = !DILocation(line: 1140, column: 26, scope: !509)
!509 = distinct !DILexicalBlock(scope: !105, file: !3, line: 1140, column: 21)
!510 = !DILocation(line: 1140, column: 34, scope: !509)
!511 = !DILocation(line: 1140, column: 52, scope: !509)
!512 = !DILocation(line: 1140, column: 57, scope: !509)
!513 = !DILocation(line: 1140, column: 21, scope: !105)
!514 = !DILocation(line: 1141, column: 29, scope: !515)
!515 = distinct !DILexicalBlock(scope: !509, file: !3, line: 1140, column: 66)
!516 = !DILocation(line: 1141, column: 21, scope: !515)
!517 = !DILocation(line: 1146, column: 21, scope: !515)
!518 = !DILocation(line: 1102, column: 44, scope: !103)
!519 = !DILocation(line: 1102, column: 26, scope: !103)
!520 = distinct !{!520, !183, !521, !418}
!521 = !DILocation(line: 1155, column: 5, scope: !99)
!522 = !DILocation(line: 1158, column: 25, scope: !523)
!523 = distinct !DILexicalBlock(scope: !82, file: !3, line: 1158, column: 9)
!524 = !DILocation(line: 1158, column: 9, scope: !82)
!525 = !DILocation(line: 1159, column: 17, scope: !526)
!526 = distinct !DILexicalBlock(scope: !523, file: !3, line: 1158, column: 49)
!527 = !DILocation(line: 1159, column: 9, scope: !526)
!528 = !DILocation(line: 1163, column: 9, scope: !526)
!529 = !DILocation(line: 1166, column: 1, scope: !82)
!530 = !DISubprogram(name: "mem_heap_hi", scope: !531, file: !531, line: 58, type: !532, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !129)
!531 = !DIFile(filename: "./memlib.h", directory: "/afs/andrew.cmu.edu/usr16/ishikhar/private/18213/malloc-lab-Zedonkay", checksumkind: CSK_MD5, checksum: "37b081d8653fabdc7bb50cf8ca5e2d25")
!532 = !DISubroutineType(types: !533)
!533 = !{!5}
!534 = !DISubprogram(name: "mem_heap_lo", scope: !531, file: !531, line: 48, type: !532, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !129)
!535 = distinct !DISubprogram(name: "mm_init", scope: !3, file: !3, line: 1182, type: !536, scopeLine: 1182, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !538)
!536 = !DISubroutineType(types: !537)
!537 = !{!35}
!538 = !{!539, !540, !542}
!539 = !DILocalVariable(name: "start", scope: !535, file: !3, line: 1185, type: !31)
!540 = !DILocalVariable(name: "index", scope: !541, file: !3, line: 1199, type: !33)
!541 = distinct !DILexicalBlock(scope: !535, file: !3, line: 1199, column: 5)
!542 = !DILocalVariable(name: "block", scope: !535, file: !3, line: 1202, type: !6)
!543 = !DILocation(line: 1185, column: 32, scope: !535)
!544 = !DILocation(line: 0, scope: !535)
!545 = !DILocation(line: 1187, column: 15, scope: !546)
!546 = distinct !DILexicalBlock(scope: !535, file: !3, line: 1187, column: 9)
!547 = !DILocation(line: 1187, column: 9, scope: !535)
!548 = !DILocation(line: 1192, column: 5, scope: !535)
!549 = !DILocation(line: 1190, column: 14, scope: !535)
!550 = !DILocation(line: 1196, column: 16, scope: !535)
!551 = !DILocation(line: 1197, column: 14, scope: !535)
!552 = !DILocation(line: 0, scope: !541)
!553 = !DILocation(line: 1200, column: 25, scope: !554)
!554 = distinct !DILexicalBlock(scope: !555, file: !3, line: 1199, column: 60)
!555 = distinct !DILexicalBlock(scope: !541, file: !3, line: 1199, column: 5)
!556 = !DILocation(line: 1202, column: 22, scope: !535)
!557 = !DILocation(line: 1205, column: 15, scope: !558)
!558 = distinct !DILexicalBlock(scope: !535, file: !3, line: 1205, column: 9)
!559 = !DILocation(line: 1205, column: 9, scope: !535)
!560 = !DILocation(line: 1208, column: 18, scope: !561)
!561 = distinct !DILexicalBlock(scope: !558, file: !3, line: 1207, column: 12)
!562 = !DILocation(line: 1213, column: 5, scope: !535)
!563 = !DILocation(line: 1214, column: 1, scope: !535)
!564 = !DISubprogram(name: "mem_sbrk", scope: !531, file: !531, line: 37, type: !565, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !129)
!565 = !DISubroutineType(types: !566)
!566 = !{!5, !36}
!567 = distinct !DISubprogram(name: "extend_heap", scope: !3, file: !3, line: 833, type: !568, scopeLine: 833, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !570)
!568 = !DISubroutineType(types: !569)
!569 = !{!6, !33}
!570 = !{!571, !572, !573, !574, !575, !576}
!571 = !DILocalVariable(name: "size", arg: 1, scope: !567, file: !3, line: 833, type: !33)
!572 = !DILocalVariable(name: "bp", scope: !567, file: !3, line: 837, type: !5)
!573 = !DILocalVariable(name: "prev_alloc", scope: !567, file: !3, line: 843, type: !35)
!574 = !DILocalVariable(name: "prev_mini", scope: !567, file: !3, line: 844, type: !35)
!575 = !DILocalVariable(name: "block", scope: !567, file: !3, line: 852, type: !6)
!576 = !DILocalVariable(name: "block_next", scope: !567, file: !3, line: 859, type: !6)
!577 = !DILocation(line: 0, scope: !567)
!578 = !DILocalVariable(name: "size", arg: 1, scope: !579, file: !3, line: 216, type: !33)
!579 = distinct !DISubprogram(name: "round_up", scope: !3, file: !3, line: 216, type: !580, scopeLine: 216, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !582)
!580 = !DISubroutineType(types: !581)
!581 = !{!33, !33, !33}
!582 = !{!578, !583}
!583 = !DILocalVariable(name: "n", arg: 2, scope: !579, file: !3, line: 216, type: !33)
!584 = !DILocation(line: 0, scope: !579, inlinedAt: !585)
!585 = distinct !DILocation(line: 839, column: 12, scope: !567)
!586 = !DILocation(line: 217, column: 23, scope: !579, inlinedAt: !585)
!587 = !DILocation(line: 217, column: 14, scope: !579, inlinedAt: !585)
!588 = !DILocation(line: 840, column: 15, scope: !589)
!589 = distinct !DILexicalBlock(scope: !567, file: !3, line: 840, column: 9)
!590 = !DILocation(line: 840, column: 41, scope: !589)
!591 = !DILocation(line: 840, column: 9, scope: !567)
!592 = !DILocation(line: 845, column: 9, scope: !593)
!593 = distinct !DILexicalBlock(scope: !567, file: !3, line: 845, column: 9)
!594 = !DILocation(line: 845, column: 18, scope: !593)
!595 = !DILocation(line: 845, column: 9, scope: !567)
!596 = !DILocalVariable(name: "bp", arg: 1, scope: !597, file: !3, line: 342, type: !5)
!597 = distinct !DISubprogram(name: "payload_to_header", scope: !3, file: !3, line: 342, type: !598, scopeLine: 342, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !600)
!598 = !DISubroutineType(types: !599)
!599 = !{!6, !5}
!600 = !{!596}
!601 = !DILocation(line: 0, scope: !597, inlinedAt: !602)
!602 = distinct !DILocation(line: 852, column: 22, scope: !567)
!603 = !DILocation(line: 343, column: 35, scope: !597, inlinedAt: !602)
!604 = !DILocation(line: 343, column: 12, scope: !597, inlinedAt: !602)
!605 = !DILocation(line: 853, column: 66, scope: !567)
!606 = !DILocalVariable(name: "block", arg: 1, scope: !607, file: !3, line: 515, type: !6)
!607 = distinct !DISubprogram(name: "write_block", scope: !3, file: !3, line: 515, type: !608, scopeLine: 516, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !610)
!608 = !DISubroutineType(types: !609)
!609 = !{null, !6, !33, !35, !35, !35, !35}
!610 = !{!606, !611, !612, !613, !614, !615, !616}
!611 = !DILocalVariable(name: "size", arg: 2, scope: !607, file: !3, line: 515, type: !33)
!612 = !DILocalVariable(name: "prev_alloc", arg: 3, scope: !607, file: !3, line: 515, type: !35)
!613 = !DILocalVariable(name: "alloc", arg: 4, scope: !607, file: !3, line: 516, type: !35)
!614 = !DILocalVariable(name: "prev_mini", arg: 5, scope: !607, file: !3, line: 516, type: !35)
!615 = !DILocalVariable(name: "mini", arg: 6, scope: !607, file: !3, line: 516, type: !35)
!616 = !DILocalVariable(name: "footerp", scope: !617, file: !3, line: 522, type: !31)
!617 = distinct !DILexicalBlock(scope: !618, file: !3, line: 521, column: 26)
!618 = distinct !DILexicalBlock(scope: !607, file: !3, line: 521, column: 9)
!619 = !DILocation(line: 0, scope: !607, inlinedAt: !620)
!620 = distinct !DILocation(line: 853, column: 5, scope: !567)
!621 = !DILocalVariable(name: "size", arg: 1, scope: !622, file: !3, line: 232, type: !33)
!622 = distinct !DISubprogram(name: "pack", scope: !3, file: !3, line: 232, type: !623, scopeLine: 233, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !625)
!623 = !DISubroutineType(types: !624)
!624 = !{!11, !33, !35, !35, !35, !35}
!625 = !{!621, !626, !627, !628, !629, !630}
!626 = !DILocalVariable(name: "prev_alloc", arg: 2, scope: !622, file: !3, line: 232, type: !35)
!627 = !DILocalVariable(name: "alloc", arg: 3, scope: !622, file: !3, line: 232, type: !35)
!628 = !DILocalVariable(name: "prev_mini", arg: 4, scope: !622, file: !3, line: 232, type: !35)
!629 = !DILocalVariable(name: "mini", arg: 5, scope: !622, file: !3, line: 233, type: !35)
!630 = !DILocalVariable(name: "word", scope: !622, file: !3, line: 234, type: !11)
!631 = !DILocation(line: 0, scope: !622, inlinedAt: !632)
!632 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !620)
!633 = !DILocation(line: 238, column: 9, scope: !622, inlinedAt: !632)
!634 = !DILocation(line: 241, column: 9, scope: !622, inlinedAt: !632)
!635 = !DILocation(line: 520, column: 12, scope: !607, inlinedAt: !620)
!636 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !620)
!637 = !DILocation(line: 521, column: 16, scope: !618, inlinedAt: !620)
!638 = !DILocation(line: 846, column: 22, scope: !639)
!639 = distinct !DILexicalBlock(scope: !593, file: !3, line: 845, column: 27)
!640 = !DILocation(line: 0, scope: !226, inlinedAt: !641)
!641 = distinct !DILocation(line: 846, column: 22, scope: !639)
!642 = !DILocation(line: 0, scope: !233, inlinedAt: !643)
!643 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !641)
!644 = !DILocation(line: 271, column: 24, scope: !233, inlinedAt: !643)
!645 = !DILocation(line: 271, column: 12, scope: !233, inlinedAt: !643)
!646 = !DILocation(line: 0, scope: !243, inlinedAt: !647)
!647 = distinct !DILocation(line: 847, column: 21, scope: !639)
!648 = !DILocation(line: 310, column: 33, scope: !243, inlinedAt: !647)
!649 = !DILocation(line: 310, column: 12, scope: !243, inlinedAt: !647)
!650 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !632)
!651 = !DILocation(line: 0, scope: !251, inlinedAt: !652)
!652 = distinct !DILocation(line: 522, column: 27, scope: !617, inlinedAt: !620)
!653 = !DILocation(line: 0, scope: !139, inlinedAt: !654)
!654 = distinct !DILocation(line: 368, column: 25, scope: !251, inlinedAt: !652)
!655 = !DILocation(line: 0, scope: !146, inlinedAt: !656)
!656 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !654)
!657 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !656)
!658 = !DILocation(line: 369, column: 38, scope: !251, inlinedAt: !652)
!659 = !DILocation(line: 369, column: 51, scope: !251, inlinedAt: !652)
!660 = !DILocation(line: 369, column: 12, scope: !251, inlinedAt: !652)
!661 = !DILocation(line: 0, scope: !617, inlinedAt: !620)
!662 = !DILocation(line: 0, scope: !622, inlinedAt: !663)
!663 = distinct !DILocation(line: 523, column: 20, scope: !617, inlinedAt: !620)
!664 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !663)
!665 = !DILocation(line: 369, column: 30, scope: !251, inlinedAt: !652)
!666 = !DILocation(line: 369, column: 23, scope: !251, inlinedAt: !652)
!667 = !DILocation(line: 523, column: 18, scope: !617, inlinedAt: !620)
!668 = !DILocation(line: 619, column: 9, scope: !669, inlinedAt: !676)
!669 = distinct !DILexicalBlock(scope: !670, file: !3, line: 619, column: 9)
!670 = distinct !DISubprogram(name: "add_to_list", scope: !3, file: !3, line: 617, type: !671, scopeLine: 617, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !673)
!671 = !DISubroutineType(types: !672)
!672 = !{null, !6, !85}
!673 = !{!674, !675}
!674 = !DILocalVariable(name: "block", arg: 1, scope: !670, file: !3, line: 617, type: !6)
!675 = !DILocalVariable(name: "line", arg: 2, scope: !670, file: !3, line: 617, type: !85)
!676 = distinct !DILocation(line: 856, column: 5, scope: !567)
!677 = !DILocation(line: 524, column: 5, scope: !617, inlinedAt: !620)
!678 = !DILocation(line: 854, column: 14, scope: !567)
!679 = !DILocation(line: 0, scope: !670, inlinedAt: !676)
!680 = !DILocation(line: 0, scope: !139, inlinedAt: !681)
!681 = distinct !DILocation(line: 619, column: 9, scope: !669, inlinedAt: !676)
!682 = !DILocation(line: 0, scope: !146, inlinedAt: !683)
!683 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !681)
!684 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !683)
!685 = !DILocation(line: 619, column: 29, scope: !669, inlinedAt: !676)
!686 = !DILocalVariable(name: "block", arg: 1, scope: !687, file: !3, line: 576, type: !6)
!687 = distinct !DISubprogram(name: "add_mini_to_seg_list", scope: !3, file: !3, line: 576, type: !671, scopeLine: 576, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !688)
!688 = !{!686, !689}
!689 = !DILocalVariable(name: "line", arg: 2, scope: !687, file: !3, line: 576, type: !85)
!690 = !DILocation(line: 0, scope: !687, inlinedAt: !691)
!691 = distinct !DILocation(line: 620, column: 9, scope: !692, inlinedAt: !676)
!692 = distinct !DILexicalBlock(scope: !669, file: !3, line: 619, column: 53)
!693 = !DILocation(line: 578, column: 8, scope: !694, inlinedAt: !691)
!694 = distinct !DILexicalBlock(scope: !687, file: !3, line: 578, column: 8)
!695 = !DILocation(line: 578, column: 19, scope: !694, inlinedAt: !691)
!696 = !DILocation(line: 578, column: 8, scope: !687, inlinedAt: !691)
!697 = !DILocation(line: 579, column: 25, scope: !698, inlinedAt: !691)
!698 = distinct !DILexicalBlock(scope: !694, file: !3, line: 578, column: 27)
!699 = !DILocation(line: 579, column: 30, scope: !698, inlinedAt: !691)
!700 = !DILocation(line: 583, column: 16, scope: !687, inlinedAt: !691)
!701 = !DILocation(line: 621, column: 5, scope: !692, inlinedAt: !676)
!702 = !DILocation(line: 0, scope: !139, inlinedAt: !703)
!703 = distinct !DILocation(line: 621, column: 16, scope: !704, inlinedAt: !676)
!704 = distinct !DILexicalBlock(scope: !669, file: !3, line: 621, column: 16)
!705 = !DILocation(line: 0, scope: !146, inlinedAt: !706)
!706 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !703)
!707 = !DILocation(line: 0, scope: !139, inlinedAt: !708)
!708 = distinct !DILocation(line: 622, column: 45, scope: !709, inlinedAt: !676)
!709 = distinct !DILexicalBlock(scope: !704, file: !3, line: 621, column: 34)
!710 = !DILocation(line: 0, scope: !146, inlinedAt: !711)
!711 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !708)
!712 = !DILocation(line: 0, scope: !443, inlinedAt: !713)
!713 = distinct !DILocation(line: 622, column: 32, scope: !709, inlinedAt: !676)
!714 = !DILocation(line: 0, scope: !449, inlinedAt: !713)
!715 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !713)
!716 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !713)
!717 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !713)
!718 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !713)
!719 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !713)
!720 = distinct !{!720, !715, !721, !418}
!721 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !713)
!722 = !DILocalVariable(name: "block", arg: 1, scope: !723, file: !3, line: 593, type: !6)
!723 = distinct !DISubprogram(name: "add_to_seg_list", scope: !3, file: !3, line: 593, type: !724, scopeLine: 593, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !726)
!724 = !DISubroutineType(types: !725)
!725 = !{null, !6, !33, !85}
!726 = !{!722, !727, !728}
!727 = !DILocalVariable(name: "list", arg: 2, scope: !723, file: !3, line: 593, type: !33)
!728 = !DILocalVariable(name: "line", arg: 3, scope: !723, file: !3, line: 593, type: !85)
!729 = !DILocation(line: 0, scope: !723, inlinedAt: !730)
!730 = distinct !DILocation(line: 622, column: 9, scope: !709, inlinedAt: !676)
!731 = !DILocation(line: 597, column: 9, scope: !732, inlinedAt: !730)
!732 = distinct !DILexicalBlock(scope: !723, file: !3, line: 597, column: 9)
!733 = !DILocation(line: 597, column: 24, scope: !732, inlinedAt: !730)
!734 = !DILocation(line: 597, column: 9, scope: !723, inlinedAt: !730)
!735 = !DILocation(line: 598, column: 25, scope: !736, inlinedAt: !730)
!736 = distinct !DILexicalBlock(scope: !732, file: !3, line: 597, column: 34)
!737 = !DILocation(line: 598, column: 30, scope: !736, inlinedAt: !730)
!738 = !DILocation(line: 602, column: 21, scope: !723, inlinedAt: !730)
!739 = !DILocation(line: 602, column: 26, scope: !723, inlinedAt: !730)
!740 = !DILocation(line: 603, column: 9, scope: !741, inlinedAt: !730)
!741 = distinct !DILexicalBlock(scope: !723, file: !3, line: 603, column: 9)
!742 = !DILocation(line: 603, column: 24, scope: !741, inlinedAt: !730)
!743 = !DILocation(line: 603, column: 9, scope: !723, inlinedAt: !730)
!744 = !DILocation(line: 604, column: 34, scope: !745, inlinedAt: !730)
!745 = distinct !DILexicalBlock(scope: !741, file: !3, line: 603, column: 33)
!746 = !DILocation(line: 604, column: 39, scope: !745, inlinedAt: !730)
!747 = !DILocation(line: 605, column: 5, scope: !745, inlinedAt: !730)
!748 = !DILocation(line: 606, column: 20, scope: !723, inlinedAt: !730)
!749 = !DILocation(line: 623, column: 5, scope: !709, inlinedAt: !676)
!750 = !DILocation(line: 0, scope: !274, inlinedAt: !751)
!751 = distinct !DILocation(line: 859, column: 27, scope: !567)
!752 = !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !751)
!753 = !DILocation(line: 0, scope: !139, inlinedAt: !754)
!754 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !751)
!755 = !DILocation(line: 0, scope: !146, inlinedAt: !756)
!756 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !754)
!757 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !756)
!758 = !DILocation(line: 433, column: 38, scope: !274, inlinedAt: !751)
!759 = !DILocalVariable(name: "block", arg: 1, scope: !760, file: !3, line: 408, type: !6)
!760 = distinct !DISubprogram(name: "write_epilogue", scope: !3, file: !3, line: 408, type: !761, scopeLine: 408, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !763)
!761 = !DISubroutineType(types: !762)
!762 = !{null, !6, !35}
!763 = !{!759, !764, !765}
!764 = !DILocalVariable(name: "prev_mini", arg: 2, scope: !760, file: !3, line: 408, type: !35)
!765 = !DILocalVariable(name: "prev_alloc", scope: !760, file: !3, line: 411, type: !35)
!766 = !DILocation(line: 0, scope: !760, inlinedAt: !767)
!767 = distinct !DILocation(line: 860, column: 5, scope: !567)
!768 = !DILocation(line: 412, column: 9, scope: !760, inlinedAt: !767)
!769 = !DILocation(line: 625, column: 17, scope: !770, inlinedAt: !676)
!770 = distinct !DILexicalBlock(scope: !704, file: !3, line: 624, column: 10)
!771 = !DILocation(line: 498, column: 24, scope: !772, inlinedAt: !773)
!772 = distinct !DISubprogram(name: "find_prologue", scope: !3, file: !3, line: 497, type: !127, scopeLine: 497, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !129)
!773 = distinct !DILocation(line: 626, column: 40, scope: !770, inlinedAt: !676)
!774 = !DILocation(line: 625, column: 9, scope: !770, inlinedAt: !676)
!775 = !DILocation(line: 412, column: 9, scope: !776, inlinedAt: !767)
!776 = distinct !DILexicalBlock(scope: !760, file: !3, line: 412, column: 9)
!777 = !DILocation(line: 412, column: 18, scope: !776, inlinedAt: !767)
!778 = !DILocation(line: 413, column: 22, scope: !779, inlinedAt: !767)
!779 = distinct !DILexicalBlock(scope: !776, file: !3, line: 412, column: 27)
!780 = !DILocation(line: 0, scope: !226, inlinedAt: !781)
!781 = distinct !DILocation(line: 413, column: 22, scope: !779, inlinedAt: !767)
!782 = !DILocation(line: 0, scope: !233, inlinedAt: !783)
!783 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !781)
!784 = !DILocation(line: 271, column: 24, scope: !233, inlinedAt: !783)
!785 = !DILocation(line: 271, column: 12, scope: !233, inlinedAt: !783)
!786 = !DILocation(line: 0, scope: !622, inlinedAt: !787)
!787 = distinct !DILocation(line: 415, column: 21, scope: !760, inlinedAt: !767)
!788 = !DILocation(line: 238, column: 9, scope: !622, inlinedAt: !787)
!789 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !787)
!790 = !DILocation(line: 415, column: 12, scope: !760, inlinedAt: !767)
!791 = !DILocation(line: 415, column: 19, scope: !760, inlinedAt: !767)
!792 = !DILocation(line: 864, column: 13, scope: !567)
!793 = !DILocation(line: 869, column: 1, scope: !567)
!794 = distinct !DISubprogram(name: "mm_malloc", scope: !3, file: !3, line: 1231, type: !795, scopeLine: 1231, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !797)
!795 = !DISubroutineType(types: !796)
!796 = !{!5, !33}
!797 = !{!798, !799, !800, !801, !802, !803, !804}
!798 = !DILocalVariable(name: "size", arg: 1, scope: !794, file: !3, line: 1231, type: !33)
!799 = !DILocalVariable(name: "asize", scope: !794, file: !3, line: 1235, type: !33)
!800 = !DILocalVariable(name: "extendsize", scope: !794, file: !3, line: 1236, type: !33)
!801 = !DILocalVariable(name: "block", scope: !794, file: !3, line: 1237, type: !6)
!802 = !DILocalVariable(name: "bp", scope: !794, file: !3, line: 1238, type: !5)
!803 = !DILocalVariable(name: "block_size", scope: !794, file: !3, line: 1279, type: !33)
!804 = !DILocalVariable(name: "next", scope: !805, file: !3, line: 1284, type: !6)
!805 = distinct !DILexicalBlock(scope: !806, file: !3, line: 1283, column: 24)
!806 = distinct !DILexicalBlock(scope: !794, file: !3, line: 1283, column: 8)
!807 = !DILocation(line: 0, scope: !794)
!808 = !DILocation(line: 1241, column: 9, scope: !809)
!809 = distinct !DILexicalBlock(scope: !794, file: !3, line: 1241, column: 9)
!810 = !DILocation(line: 1241, column: 20, scope: !809)
!811 = !DILocation(line: 1241, column: 9, scope: !794)
!812 = !DILocation(line: 1185, column: 32, scope: !535, inlinedAt: !813)
!813 = distinct !DILocation(line: 1242, column: 15, scope: !814)
!814 = distinct !DILexicalBlock(scope: !815, file: !3, line: 1242, column: 13)
!815 = distinct !DILexicalBlock(scope: !809, file: !3, line: 1241, column: 29)
!816 = !DILocation(line: 0, scope: !535, inlinedAt: !813)
!817 = !DILocation(line: 1187, column: 15, scope: !546, inlinedAt: !813)
!818 = !DILocation(line: 1187, column: 9, scope: !535, inlinedAt: !813)
!819 = !DILocation(line: 1192, column: 5, scope: !535, inlinedAt: !813)
!820 = !DILocation(line: 1190, column: 14, scope: !535, inlinedAt: !813)
!821 = !DILocation(line: 1196, column: 16, scope: !535, inlinedAt: !813)
!822 = !DILocation(line: 1197, column: 14, scope: !535, inlinedAt: !813)
!823 = !DILocation(line: 0, scope: !541, inlinedAt: !813)
!824 = !DILocation(line: 1200, column: 25, scope: !554, inlinedAt: !813)
!825 = !DILocation(line: 1202, column: 22, scope: !535, inlinedAt: !813)
!826 = !DILocation(line: 1205, column: 15, scope: !558, inlinedAt: !813)
!827 = !DILocation(line: 1205, column: 9, scope: !535, inlinedAt: !813)
!828 = !DILocation(line: 1208, column: 18, scope: !561, inlinedAt: !813)
!829 = !DILocation(line: 1242, column: 13, scope: !815)
!830 = !DILocation(line: 1249, column: 14, scope: !831)
!831 = distinct !DILexicalBlock(scope: !794, file: !3, line: 1249, column: 9)
!832 = !DILocation(line: 1249, column: 9, scope: !794)
!833 = !DILocation(line: 0, scope: !579, inlinedAt: !834)
!834 = distinct !DILocation(line: 1256, column: 13, scope: !794)
!835 = !DILocation(line: 217, column: 23, scope: !579, inlinedAt: !834)
!836 = !DILocation(line: 217, column: 14, scope: !579, inlinedAt: !834)
!837 = !DILocalVariable(name: "x", arg: 1, scope: !838, file: !3, line: 206, type: !33)
!838 = distinct !DISubprogram(name: "max", scope: !3, file: !3, line: 206, type: !580, scopeLine: 206, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !839)
!839 = !{!837, !840}
!840 = !DILocalVariable(name: "y", arg: 2, scope: !838, file: !3, line: 206, type: !33)
!841 = !DILocation(line: 0, scope: !838, inlinedAt: !842)
!842 = distinct !DILocation(line: 1257, column: 13, scope: !794)
!843 = !DILocation(line: 207, column: 15, scope: !838, inlinedAt: !842)
!844 = !DILocation(line: 207, column: 12, scope: !838, inlinedAt: !842)
!845 = !DILocalVariable(name: "asize", arg: 1, scope: !846, file: !3, line: 935, type: !33)
!846 = distinct !DISubprogram(name: "find_fit", scope: !3, file: !3, line: 935, type: !568, scopeLine: 935, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !847)
!847 = !{!845, !848, !849, !851, !855, !860}
!848 = !DILocalVariable(name: "index", scope: !846, file: !3, line: 939, type: !33)
!849 = !DILocalVariable(name: "i", scope: !850, file: !3, line: 941, type: !33)
!850 = distinct !DILexicalBlock(scope: !846, file: !3, line: 941, column: 5)
!851 = !DILocalVariable(name: "block", scope: !852, file: !3, line: 943, type: !6)
!852 = distinct !DILexicalBlock(scope: !853, file: !3, line: 943, column: 9)
!853 = distinct !DILexicalBlock(scope: !854, file: !3, line: 941, column: 52)
!854 = distinct !DILexicalBlock(scope: !850, file: !3, line: 941, column: 5)
!855 = !DILocalVariable(name: "better", scope: !856, file: !3, line: 946, type: !6)
!856 = distinct !DILexicalBlock(scope: !857, file: !3, line: 945, column: 43)
!857 = distinct !DILexicalBlock(scope: !858, file: !3, line: 945, column: 17)
!858 = distinct !DILexicalBlock(scope: !859, file: !3, line: 944, column: 44)
!859 = distinct !DILexicalBlock(scope: !852, file: !3, line: 943, column: 9)
!860 = !DILocalVariable(name: "i", scope: !861, file: !3, line: 947, type: !33)
!861 = distinct !DILexicalBlock(scope: !856, file: !3, line: 947, column: 17)
!862 = !DILocation(line: 0, scope: !846, inlinedAt: !863)
!863 = distinct !DILocation(line: 1260, column: 13, scope: !794)
!864 = !DILocation(line: 0, scope: !443, inlinedAt: !865)
!865 = distinct !DILocation(line: 939, column: 20, scope: !846, inlinedAt: !863)
!866 = !DILocation(line: 0, scope: !449, inlinedAt: !865)
!867 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !865)
!868 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !865)
!869 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !865)
!870 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !865)
!871 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !865)
!872 = distinct !{!872, !867, !873, !418}
!873 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !865)
!874 = !DILocation(line: 941, column: 5, scope: !850, inlinedAt: !863)
!875 = !DILocation(line: 0, scope: !850, inlinedAt: !863)
!876 = !DILocation(line: 943, column: 31, scope: !852, inlinedAt: !863)
!877 = !DILocation(line: 0, scope: !852, inlinedAt: !863)
!878 = !DILocation(line: 943, column: 50, scope: !859, inlinedAt: !863)
!879 = !DILocation(line: 943, column: 9, scope: !852, inlinedAt: !863)
!880 = !DILocation(line: 945, column: 26, scope: !857, inlinedAt: !863)
!881 = !DILocation(line: 0, scope: !139, inlinedAt: !882)
!882 = distinct !DILocation(line: 945, column: 26, scope: !857, inlinedAt: !863)
!883 = !DILocation(line: 0, scope: !146, inlinedAt: !884)
!884 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !882)
!885 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !884)
!886 = !DILocation(line: 945, column: 23, scope: !857, inlinedAt: !863)
!887 = !DILocation(line: 945, column: 17, scope: !858, inlinedAt: !863)
!888 = !DILocation(line: 0, scope: !856, inlinedAt: !863)
!889 = !DILocation(line: 0, scope: !861, inlinedAt: !863)
!890 = !DILocation(line: 956, column: 47, scope: !891, inlinedAt: !863)
!891 = distinct !DILexicalBlock(scope: !892, file: !3, line: 947, column: 63)
!892 = distinct !DILexicalBlock(scope: !861, file: !3, line: 947, column: 17)
!893 = !DILocation(line: 947, column: 17, scope: !861, inlinedAt: !863)
!894 = distinct !{!894, !893, !895, !418}
!895 = !DILocation(line: 957, column: 17, scope: !861, inlinedAt: !863)
!896 = !DILocation(line: 951, column: 25, scope: !897, inlinedAt: !863)
!897 = distinct !DILexicalBlock(scope: !891, file: !3, line: 951, column: 25)
!898 = !DILocation(line: 0, scope: !139, inlinedAt: !899)
!899 = distinct !DILocation(line: 951, column: 25, scope: !897, inlinedAt: !863)
!900 = !DILocation(line: 0, scope: !146, inlinedAt: !901)
!901 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !899)
!902 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !901)
!903 = !DILocation(line: 0, scope: !139, inlinedAt: !904)
!904 = distinct !DILocation(line: 951, column: 44, scope: !897, inlinedAt: !863)
!905 = !DILocation(line: 0, scope: !146, inlinedAt: !906)
!906 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !904)
!907 = !DILocation(line: 951, column: 42, scope: !897, inlinedAt: !863)
!908 = !DILocation(line: 951, column: 60, scope: !897, inlinedAt: !863)
!909 = !DILocation(line: 0, scope: !139, inlinedAt: !910)
!910 = distinct !DILocation(line: 952, column: 25, scope: !897, inlinedAt: !863)
!911 = !DILocation(line: 0, scope: !146, inlinedAt: !912)
!912 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !910)
!913 = !DILocation(line: 944, column: 38, scope: !859, inlinedAt: !863)
!914 = distinct !{!914, !879, !915, !418}
!915 = !DILocation(line: 961, column: 9, scope: !852, inlinedAt: !863)
!916 = !DILocation(line: 941, column: 48, scope: !854, inlinedAt: !863)
!917 = !DILocation(line: 941, column: 30, scope: !854, inlinedAt: !863)
!918 = distinct !{!918, !874, !919, !418}
!919 = !DILocation(line: 962, column: 5, scope: !850, inlinedAt: !863)
!920 = !DILocation(line: 1263, column: 15, scope: !921)
!921 = distinct !DILexicalBlock(scope: !794, file: !3, line: 1263, column: 9)
!922 = !DILocation(line: 1263, column: 9, scope: !794)
!923 = !DILocation(line: 0, scope: !838, inlinedAt: !924)
!924 = distinct !DILocation(line: 1265, column: 22, scope: !925)
!925 = distinct !DILexicalBlock(scope: !921, file: !3, line: 1263, column: 24)
!926 = !DILocation(line: 207, column: 15, scope: !838, inlinedAt: !924)
!927 = !DILocation(line: 207, column: 12, scope: !838, inlinedAt: !924)
!928 = !DILocation(line: 1266, column: 17, scope: !925)
!929 = !DILocation(line: 1268, column: 19, scope: !930)
!930 = distinct !DILexicalBlock(scope: !925, file: !3, line: 1268, column: 13)
!931 = !DILocation(line: 1268, column: 13, scope: !925)
!932 = !DILocation(line: 1279, column: 25, scope: !794)
!933 = !DILocation(line: 0, scope: !139, inlinedAt: !934)
!934 = distinct !DILocation(line: 1279, column: 25, scope: !794)
!935 = !DILocation(line: 0, scope: !146, inlinedAt: !936)
!936 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !934)
!937 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !936)
!938 = !DILocalVariable(name: "block", arg: 1, scope: !939, file: !3, line: 533, type: !6)
!939 = distinct !DISubprogram(name: "remove_from_list", scope: !3, file: !3, line: 533, type: !671, scopeLine: 533, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !940)
!940 = !{!938, !941, !942, !945, !946, !947}
!941 = !DILocalVariable(name: "line", arg: 2, scope: !939, file: !3, line: 533, type: !85)
!942 = !DILocalVariable(name: "index", scope: !943, file: !3, line: 537, type: !33)
!943 = distinct !DILexicalBlock(scope: !944, file: !3, line: 536, column: 27)
!944 = distinct !DILexicalBlock(scope: !939, file: !3, line: 536, column: 8)
!945 = !DILocalVariable(name: "prev", scope: !943, file: !3, line: 538, type: !6)
!946 = !DILocalVariable(name: "next", scope: !943, file: !3, line: 539, type: !6)
!947 = !DILocalVariable(name: "curr", scope: !948, file: !3, line: 560, type: !6)
!948 = distinct !DILexicalBlock(scope: !949, file: !3, line: 559, column: 14)
!949 = distinct !DILexicalBlock(scope: !950, file: !3, line: 557, column: 12)
!950 = distinct !DILexicalBlock(scope: !944, file: !3, line: 556, column: 10)
!951 = !DILocation(line: 0, scope: !939, inlinedAt: !952)
!952 = distinct !DILocation(line: 1280, column: 5, scope: !794)
!953 = !DILocation(line: 0, scope: !139, inlinedAt: !954)
!954 = distinct !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !952)
!955 = !DILocation(line: 0, scope: !146, inlinedAt: !956)
!956 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !954)
!957 = !DILocation(line: 536, column: 23, scope: !944, inlinedAt: !952)
!958 = !DILocation(line: 536, column: 8, scope: !939, inlinedAt: !952)
!959 = !DILocation(line: 0, scope: !449, inlinedAt: !960)
!960 = distinct !DILocation(line: 537, column: 24, scope: !943, inlinedAt: !952)
!961 = !DILocation(line: 0, scope: !443, inlinedAt: !960)
!962 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !960)
!963 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !960)
!964 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !960)
!965 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !960)
!966 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !960)
!967 = distinct !{!967, !966, !968, !418}
!968 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !960)
!969 = !DILocation(line: 0, scope: !943, inlinedAt: !952)
!970 = !DILocation(line: 538, column: 41, scope: !943, inlinedAt: !952)
!971 = !DILocation(line: 539, column: 41, scope: !943, inlinedAt: !952)
!972 = !DILocation(line: 540, column: 18, scope: !973, inlinedAt: !952)
!973 = distinct !DILexicalBlock(scope: !943, file: !3, line: 540, column: 13)
!974 = !DILocation(line: 540, column: 13, scope: !943, inlinedAt: !952)
!975 = !DILocation(line: 541, column: 13, scope: !976, inlinedAt: !952)
!976 = distinct !DILexicalBlock(scope: !973, file: !3, line: 540, column: 27)
!977 = !DILocation(line: 541, column: 29, scope: !976, inlinedAt: !952)
!978 = !DILocation(line: 542, column: 22, scope: !979, inlinedAt: !952)
!979 = distinct !DILexicalBlock(scope: !976, file: !3, line: 542, column: 17)
!980 = !DILocation(line: 542, column: 17, scope: !976, inlinedAt: !952)
!981 = !DILocation(line: 543, column: 45, scope: !982, inlinedAt: !952)
!982 = distinct !DILexicalBlock(scope: !979, file: !3, line: 542, column: 31)
!983 = !DILocation(line: 543, column: 50, scope: !982, inlinedAt: !952)
!984 = !DILocation(line: 544, column: 13, scope: !982, inlinedAt: !952)
!985 = !DILocation(line: 546, column: 22, scope: !986, inlinedAt: !952)
!986 = distinct !DILexicalBlock(scope: !987, file: !3, line: 546, column: 17)
!987 = distinct !DILexicalBlock(scope: !973, file: !3, line: 545, column: 16)
!988 = !DILocation(line: 0, scope: !986, inlinedAt: !952)
!989 = !DILocation(line: 546, column: 17, scope: !987, inlinedAt: !952)
!990 = !DILocation(line: 547, column: 37, scope: !991, inlinedAt: !952)
!991 = distinct !DILexicalBlock(scope: !986, file: !3, line: 546, column: 31)
!992 = !DILocation(line: 550, column: 13, scope: !991, inlinedAt: !952)
!993 = !DILocation(line: 551, column: 37, scope: !994, inlinedAt: !952)
!994 = distinct !DILexicalBlock(scope: !986, file: !3, line: 550, column: 20)
!995 = !DILocation(line: 553, column: 32, scope: !994, inlinedAt: !952)
!996 = !DILocation(line: 553, column: 37, scope: !994, inlinedAt: !952)
!997 = !DILocation(line: 557, column: 12, scope: !949, inlinedAt: !952)
!998 = !DILocation(line: 557, column: 23, scope: !949, inlinedAt: !952)
!999 = !DILocation(line: 557, column: 12, scope: !950, inlinedAt: !952)
!1000 = !DILocation(line: 558, column: 41, scope: !1001, inlinedAt: !952)
!1001 = distinct !DILexicalBlock(scope: !949, file: !3, line: 557, column: 31)
!1002 = !DILocation(line: 558, column: 24, scope: !1001, inlinedAt: !952)
!1003 = !DILocation(line: 559, column: 9, scope: !1001, inlinedAt: !952)
!1004 = !DILocation(line: 0, scope: !948, inlinedAt: !952)
!1005 = !DILocation(line: 561, column: 34, scope: !948, inlinedAt: !952)
!1006 = !DILocation(line: 561, column: 38, scope: !948, inlinedAt: !952)
!1007 = !DILocation(line: 561, column: 13, scope: !948, inlinedAt: !952)
!1008 = distinct !{!1008, !1007, !1009, !418}
!1009 = !DILocation(line: 563, column: 13, scope: !948, inlinedAt: !952)
!1010 = !DILocation(line: 564, column: 51, scope: !948, inlinedAt: !952)
!1011 = !DILocation(line: 564, column: 33, scope: !948, inlinedAt: !952)
!1012 = !DILocation(line: 0, scope: !328, inlinedAt: !1013)
!1013 = distinct !DILocation(line: 1281, column: 36, scope: !794)
!1014 = !DILocation(line: 288, column: 18, scope: !333, inlinedAt: !1013)
!1015 = !DILocation(line: 288, column: 15, scope: !333, inlinedAt: !1013)
!1016 = !DILocation(line: 288, column: 9, scope: !328, inlinedAt: !1013)
!1017 = !DILocation(line: 0, scope: !352, inlinedAt: !1018)
!1018 = distinct !DILocation(line: 1282, column: 17, scope: !794)
!1019 = !DILocation(line: 1282, column: 51, scope: !794)
!1020 = !DILocation(line: 0, scope: !607, inlinedAt: !1021)
!1021 = distinct !DILocation(line: 1281, column: 5, scope: !794)
!1022 = !DILocation(line: 0, scope: !622, inlinedAt: !1023)
!1023 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !1021)
!1024 = !DILocation(line: 238, column: 9, scope: !622, inlinedAt: !1023)
!1025 = !DILocation(line: 291, column: 26, scope: !328, inlinedAt: !1013)
!1026 = !DILocation(line: 291, column: 33, scope: !328, inlinedAt: !1013)
!1027 = !DILocation(line: 291, column: 12, scope: !328, inlinedAt: !1013)
!1028 = !DILocation(line: 302, column: 33, scope: !352, inlinedAt: !1018)
!1029 = !DILocation(line: 302, column: 12, scope: !352, inlinedAt: !1018)
!1030 = !DILocation(line: 235, column: 9, scope: !622, inlinedAt: !1023)
!1031 = !DILocation(line: 241, column: 9, scope: !622, inlinedAt: !1023)
!1032 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1023)
!1033 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !1021)
!1034 = !DILocation(line: 1283, column: 15, scope: !806)
!1035 = !DILocation(line: 1283, column: 13, scope: !806)
!1036 = !DILocation(line: 1283, column: 8, scope: !794)
!1037 = !DILocation(line: 0, scope: !274, inlinedAt: !1038)
!1038 = distinct !DILocation(line: 1284, column: 25, scope: !805)
!1039 = !DILocation(line: 0, scope: !139, inlinedAt: !1040)
!1040 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !1038)
!1041 = !DILocation(line: 0, scope: !146, inlinedAt: !1042)
!1042 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1040)
!1043 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1042)
!1044 = !DILocation(line: 433, column: 24, scope: !274, inlinedAt: !1038)
!1045 = !DILocation(line: 433, column: 38, scope: !274, inlinedAt: !1038)
!1046 = !DILocation(line: 0, scope: !805)
!1047 = !DILocation(line: 1285, column: 26, scope: !805)
!1048 = !DILocation(line: 0, scope: !139, inlinedAt: !1049)
!1049 = distinct !DILocation(line: 1285, column: 26, scope: !805)
!1050 = !DILocation(line: 0, scope: !146, inlinedAt: !1051)
!1051 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1049)
!1052 = !DILocation(line: 0, scope: !243, inlinedAt: !1053)
!1053 = distinct !DILocation(line: 1285, column: 62, scope: !805)
!1054 = !DILocation(line: 310, column: 33, scope: !243, inlinedAt: !1053)
!1055 = !DILocation(line: 0, scope: !243, inlinedAt: !1056)
!1056 = distinct !DILocation(line: 1285, column: 78, scope: !805)
!1057 = !DILocation(line: 310, column: 33, scope: !243, inlinedAt: !1056)
!1058 = !DILocation(line: 0, scope: !607, inlinedAt: !1059)
!1059 = distinct !DILocation(line: 1285, column: 9, scope: !805)
!1060 = !DILocation(line: 0, scope: !622, inlinedAt: !1061)
!1061 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !1059)
!1062 = !DILocation(line: 235, column: 9, scope: !622, inlinedAt: !1061)
!1063 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1061)
!1064 = !DILocation(line: 241, column: 9, scope: !622, inlinedAt: !1061)
!1065 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !1059)
!1066 = !DILocation(line: 521, column: 16, scope: !618, inlinedAt: !1059)
!1067 = !DILocation(line: 310, column: 12, scope: !243, inlinedAt: !1053)
!1068 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1051)
!1069 = !DILocation(line: 0, scope: !251, inlinedAt: !1070)
!1070 = distinct !DILocation(line: 522, column: 27, scope: !617, inlinedAt: !1059)
!1071 = !DILocation(line: 0, scope: !139, inlinedAt: !1072)
!1072 = distinct !DILocation(line: 368, column: 25, scope: !251, inlinedAt: !1070)
!1073 = !DILocation(line: 0, scope: !146, inlinedAt: !1074)
!1074 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1072)
!1075 = !DILocation(line: 369, column: 30, scope: !251, inlinedAt: !1070)
!1076 = !DILocation(line: 369, column: 38, scope: !251, inlinedAt: !1070)
!1077 = !DILocation(line: 369, column: 51, scope: !251, inlinedAt: !1070)
!1078 = !DILocation(line: 369, column: 12, scope: !251, inlinedAt: !1070)
!1079 = !DILocation(line: 0, scope: !617, inlinedAt: !1059)
!1080 = !DILocation(line: 0, scope: !622, inlinedAt: !1081)
!1081 = distinct !DILocation(line: 523, column: 20, scope: !617, inlinedAt: !1059)
!1082 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1081)
!1083 = !DILocation(line: 523, column: 18, scope: !617, inlinedAt: !1059)
!1084 = !DILocation(line: 524, column: 5, scope: !617, inlinedAt: !1059)
!1085 = !DILocalVariable(name: "block", arg: 1, scope: !1086, file: !3, line: 887, type: !6)
!1086 = distinct !DISubprogram(name: "split_block", scope: !3, file: !3, line: 887, type: !1087, scopeLine: 887, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1089)
!1087 = !DISubroutineType(types: !1088)
!1088 = !{null, !6, !33}
!1089 = !{!1085, !1090, !1091, !1092, !1095}
!1090 = !DILocalVariable(name: "asize", arg: 2, scope: !1086, file: !3, line: 887, type: !33)
!1091 = !DILocalVariable(name: "block_size", scope: !1086, file: !3, line: 894, type: !33)
!1092 = !DILocalVariable(name: "block_next", scope: !1093, file: !3, line: 897, type: !6)
!1093 = distinct !DILexicalBlock(scope: !1094, file: !3, line: 896, column: 49)
!1094 = distinct !DILexicalBlock(scope: !1086, file: !3, line: 896, column: 9)
!1095 = !DILocalVariable(name: "next", scope: !1096, file: !3, line: 911, type: !6)
!1096 = distinct !DILexicalBlock(scope: !1097, file: !3, line: 910, column: 13)
!1097 = distinct !DILexicalBlock(scope: !1093, file: !3, line: 907, column: 13)
!1098 = !DILocation(line: 0, scope: !1086, inlinedAt: !1099)
!1099 = distinct !DILocation(line: 1289, column: 5, scope: !794)
!1100 = !DILocation(line: 894, column: 25, scope: !1086, inlinedAt: !1099)
!1101 = !DILocation(line: 0, scope: !139, inlinedAt: !1102)
!1102 = distinct !DILocation(line: 894, column: 25, scope: !1086, inlinedAt: !1099)
!1103 = !DILocation(line: 0, scope: !146, inlinedAt: !1104)
!1104 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1102)
!1105 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1104)
!1106 = !DILocation(line: 896, column: 21, scope: !1094, inlinedAt: !1099)
!1107 = !DILocation(line: 896, column: 30, scope: !1094, inlinedAt: !1099)
!1108 = !DILocation(line: 896, column: 9, scope: !1086, inlinedAt: !1099)
!1109 = !DILocation(line: 0, scope: !328, inlinedAt: !1110)
!1110 = distinct !DILocation(line: 898, column: 35, scope: !1093, inlinedAt: !1099)
!1111 = !DILocation(line: 288, column: 9, scope: !328, inlinedAt: !1110)
!1112 = !DILocation(line: 0, scope: !352, inlinedAt: !1113)
!1113 = distinct !DILocation(line: 899, column: 21, scope: !1093, inlinedAt: !1099)
!1114 = !DILocation(line: 899, column: 50, scope: !1093, inlinedAt: !1099)
!1115 = !DILocation(line: 0, scope: !607, inlinedAt: !1116)
!1116 = distinct !DILocation(line: 898, column: 9, scope: !1093, inlinedAt: !1099)
!1117 = !DILocation(line: 0, scope: !622, inlinedAt: !1118)
!1118 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !1116)
!1119 = !DILocation(line: 238, column: 9, scope: !622, inlinedAt: !1118)
!1120 = !DILocation(line: 291, column: 33, scope: !328, inlinedAt: !1110)
!1121 = !DILocation(line: 291, column: 12, scope: !328, inlinedAt: !1110)
!1122 = !DILocation(line: 302, column: 33, scope: !352, inlinedAt: !1113)
!1123 = !DILocation(line: 302, column: 12, scope: !352, inlinedAt: !1113)
!1124 = !DILocation(line: 235, column: 9, scope: !622, inlinedAt: !1118)
!1125 = !DILocation(line: 241, column: 9, scope: !622, inlinedAt: !1118)
!1126 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1118)
!1127 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !1116)
!1128 = !DILocation(line: 0, scope: !274, inlinedAt: !1129)
!1129 = distinct !DILocation(line: 901, column: 22, scope: !1093, inlinedAt: !1099)
!1130 = !DILocation(line: 0, scope: !139, inlinedAt: !1131)
!1131 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !1129)
!1132 = !DILocation(line: 0, scope: !146, inlinedAt: !1133)
!1133 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1131)
!1134 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1133)
!1135 = !DILocation(line: 433, column: 24, scope: !274, inlinedAt: !1129)
!1136 = !DILocation(line: 433, column: 38, scope: !274, inlinedAt: !1129)
!1137 = !DILocation(line: 433, column: 12, scope: !274, inlinedAt: !1129)
!1138 = !DILocation(line: 0, scope: !1093, inlinedAt: !1099)
!1139 = !DILocation(line: 905, column: 42, scope: !1093, inlinedAt: !1099)
!1140 = !DILocation(line: 0, scope: !607, inlinedAt: !1141)
!1141 = distinct !DILocation(line: 904, column: 9, scope: !1093, inlinedAt: !1099)
!1142 = !DILocation(line: 0, scope: !622, inlinedAt: !1143)
!1143 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !1141)
!1144 = !DILocation(line: 238, column: 9, scope: !622, inlinedAt: !1143)
!1145 = !DILocation(line: 241, column: 9, scope: !622, inlinedAt: !1143)
!1146 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1143)
!1147 = !DILocation(line: 520, column: 12, scope: !607, inlinedAt: !1141)
!1148 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !1141)
!1149 = !DILocation(line: 521, column: 16, scope: !618, inlinedAt: !1141)
!1150 = !DILocation(line: 0, scope: !251, inlinedAt: !1151)
!1151 = distinct !DILocation(line: 522, column: 27, scope: !617, inlinedAt: !1141)
!1152 = !DILocation(line: 0, scope: !139, inlinedAt: !1153)
!1153 = distinct !DILocation(line: 368, column: 25, scope: !251, inlinedAt: !1151)
!1154 = !DILocation(line: 0, scope: !146, inlinedAt: !1155)
!1155 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1153)
!1156 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1155)
!1157 = !DILocation(line: 369, column: 30, scope: !251, inlinedAt: !1151)
!1158 = !DILocation(line: 369, column: 38, scope: !251, inlinedAt: !1151)
!1159 = !DILocation(line: 369, column: 51, scope: !251, inlinedAt: !1151)
!1160 = !DILocation(line: 369, column: 12, scope: !251, inlinedAt: !1151)
!1161 = !DILocation(line: 0, scope: !617, inlinedAt: !1141)
!1162 = !DILocation(line: 0, scope: !622, inlinedAt: !1163)
!1163 = distinct !DILocation(line: 523, column: 20, scope: !617, inlinedAt: !1141)
!1164 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1163)
!1165 = !DILocation(line: 523, column: 18, scope: !617, inlinedAt: !1141)
!1166 = !DILocation(line: 619, column: 9, scope: !669, inlinedAt: !1167)
!1167 = distinct !DILocation(line: 906, column: 9, scope: !1093, inlinedAt: !1099)
!1168 = !DILocation(line: 524, column: 5, scope: !617, inlinedAt: !1141)
!1169 = !DILocation(line: 0, scope: !670, inlinedAt: !1167)
!1170 = !DILocation(line: 0, scope: !139, inlinedAt: !1171)
!1171 = distinct !DILocation(line: 619, column: 9, scope: !669, inlinedAt: !1167)
!1172 = !DILocation(line: 0, scope: !146, inlinedAt: !1173)
!1173 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1171)
!1174 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1173)
!1175 = !DILocation(line: 619, column: 29, scope: !669, inlinedAt: !1167)
!1176 = !DILocation(line: 0, scope: !687, inlinedAt: !1177)
!1177 = distinct !DILocation(line: 620, column: 9, scope: !692, inlinedAt: !1167)
!1178 = !DILocation(line: 578, column: 8, scope: !694, inlinedAt: !1177)
!1179 = !DILocation(line: 578, column: 19, scope: !694, inlinedAt: !1177)
!1180 = !DILocation(line: 578, column: 8, scope: !687, inlinedAt: !1177)
!1181 = !DILocation(line: 579, column: 25, scope: !698, inlinedAt: !1177)
!1182 = !DILocation(line: 579, column: 30, scope: !698, inlinedAt: !1177)
!1183 = !DILocation(line: 583, column: 16, scope: !687, inlinedAt: !1177)
!1184 = !DILocation(line: 621, column: 5, scope: !692, inlinedAt: !1167)
!1185 = !DILocation(line: 0, scope: !139, inlinedAt: !1186)
!1186 = distinct !DILocation(line: 621, column: 16, scope: !704, inlinedAt: !1167)
!1187 = !DILocation(line: 0, scope: !146, inlinedAt: !1188)
!1188 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1186)
!1189 = !DILocation(line: 0, scope: !139, inlinedAt: !1190)
!1190 = distinct !DILocation(line: 622, column: 45, scope: !709, inlinedAt: !1167)
!1191 = !DILocation(line: 0, scope: !146, inlinedAt: !1192)
!1192 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1190)
!1193 = !DILocation(line: 0, scope: !443, inlinedAt: !1194)
!1194 = distinct !DILocation(line: 622, column: 32, scope: !709, inlinedAt: !1167)
!1195 = !DILocation(line: 0, scope: !449, inlinedAt: !1194)
!1196 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !1194)
!1197 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !1194)
!1198 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !1194)
!1199 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !1194)
!1200 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !1194)
!1201 = distinct !{!1201, !1196, !1202, !418}
!1202 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !1194)
!1203 = !DILocation(line: 0, scope: !723, inlinedAt: !1204)
!1204 = distinct !DILocation(line: 622, column: 9, scope: !709, inlinedAt: !1167)
!1205 = !DILocation(line: 597, column: 9, scope: !732, inlinedAt: !1204)
!1206 = !DILocation(line: 597, column: 24, scope: !732, inlinedAt: !1204)
!1207 = !DILocation(line: 597, column: 9, scope: !723, inlinedAt: !1204)
!1208 = !DILocation(line: 598, column: 25, scope: !736, inlinedAt: !1204)
!1209 = !DILocation(line: 598, column: 30, scope: !736, inlinedAt: !1204)
!1210 = !DILocation(line: 602, column: 21, scope: !723, inlinedAt: !1204)
!1211 = !DILocation(line: 602, column: 26, scope: !723, inlinedAt: !1204)
!1212 = !DILocation(line: 603, column: 9, scope: !741, inlinedAt: !1204)
!1213 = !DILocation(line: 603, column: 24, scope: !741, inlinedAt: !1204)
!1214 = !DILocation(line: 603, column: 9, scope: !723, inlinedAt: !1204)
!1215 = !DILocation(line: 604, column: 34, scope: !745, inlinedAt: !1204)
!1216 = !DILocation(line: 604, column: 39, scope: !745, inlinedAt: !1204)
!1217 = !DILocation(line: 605, column: 5, scope: !745, inlinedAt: !1204)
!1218 = !DILocation(line: 606, column: 20, scope: !723, inlinedAt: !1204)
!1219 = !DILocation(line: 623, column: 5, scope: !709, inlinedAt: !1167)
!1220 = !DILocation(line: 625, column: 17, scope: !770, inlinedAt: !1167)
!1221 = !DILocation(line: 498, column: 24, scope: !772, inlinedAt: !1222)
!1222 = distinct !DILocation(line: 626, column: 40, scope: !770, inlinedAt: !1167)
!1223 = !DILocation(line: 625, column: 9, scope: !770, inlinedAt: !1167)
!1224 = !DILocation(line: 907, column: 22, scope: !1097, inlinedAt: !1099)
!1225 = !DILocation(line: 907, column: 19, scope: !1097, inlinedAt: !1099)
!1226 = !DILocation(line: 907, column: 13, scope: !1093, inlinedAt: !1099)
!1227 = !DILocation(line: 908, column: 22, scope: !1228, inlinedAt: !1099)
!1228 = distinct !DILexicalBlock(scope: !1097, file: !3, line: 907, column: 32)
!1229 = !DILocation(line: 909, column: 9, scope: !1228, inlinedAt: !1099)
!1230 = !DILocation(line: 0, scope: !274, inlinedAt: !1231)
!1231 = distinct !DILocation(line: 911, column: 29, scope: !1096, inlinedAt: !1099)
!1232 = !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !1231)
!1233 = !DILocation(line: 0, scope: !139, inlinedAt: !1234)
!1234 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !1231)
!1235 = !DILocation(line: 0, scope: !146, inlinedAt: !1236)
!1236 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1234)
!1237 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1236)
!1238 = !DILocation(line: 433, column: 38, scope: !274, inlinedAt: !1231)
!1239 = !DILocation(line: 0, scope: !1096, inlinedAt: !1099)
!1240 = !DILocation(line: 912, column: 30, scope: !1096, inlinedAt: !1099)
!1241 = !DILocation(line: 0, scope: !139, inlinedAt: !1242)
!1242 = distinct !DILocation(line: 912, column: 30, scope: !1096, inlinedAt: !1099)
!1243 = !DILocation(line: 0, scope: !146, inlinedAt: !1244)
!1244 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1242)
!1245 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1244)
!1246 = !DILocation(line: 0, scope: !607, inlinedAt: !1247)
!1247 = distinct !DILocation(line: 912, column: 13, scope: !1096, inlinedAt: !1099)
!1248 = !DILocation(line: 0, scope: !622, inlinedAt: !1249)
!1249 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !1247)
!1250 = !DILocation(line: 241, column: 9, scope: !622, inlinedAt: !1249)
!1251 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1249)
!1252 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !1247)
!1253 = !DILocation(line: 521, column: 16, scope: !618, inlinedAt: !1247)
!1254 = !DILocation(line: 0, scope: !251, inlinedAt: !1255)
!1255 = distinct !DILocation(line: 522, column: 27, scope: !617, inlinedAt: !1247)
!1256 = !DILocation(line: 0, scope: !139, inlinedAt: !1257)
!1257 = distinct !DILocation(line: 368, column: 25, scope: !251, inlinedAt: !1255)
!1258 = !DILocation(line: 0, scope: !146, inlinedAt: !1259)
!1259 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1257)
!1260 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1259)
!1261 = !DILocation(line: 369, column: 30, scope: !251, inlinedAt: !1255)
!1262 = !DILocation(line: 369, column: 38, scope: !251, inlinedAt: !1255)
!1263 = !DILocation(line: 369, column: 51, scope: !251, inlinedAt: !1255)
!1264 = !DILocation(line: 369, column: 12, scope: !251, inlinedAt: !1255)
!1265 = !DILocation(line: 0, scope: !617, inlinedAt: !1247)
!1266 = !DILocation(line: 0, scope: !622, inlinedAt: !1267)
!1267 = distinct !DILocation(line: 523, column: 20, scope: !617, inlinedAt: !1247)
!1268 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1267)
!1269 = !DILocation(line: 523, column: 18, scope: !617, inlinedAt: !1247)
!1270 = !DILocation(line: 524, column: 5, scope: !617, inlinedAt: !1247)
!1271 = !DILocalVariable(name: "block", arg: 1, scope: !1272, file: !3, line: 353, type: !6)
!1272 = distinct !DISubprogram(name: "header_to_payload", scope: !3, file: !3, line: 353, type: !1273, scopeLine: 353, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1275)
!1273 = !DISubroutineType(types: !1274)
!1274 = !{!5, !6}
!1275 = !{!1271}
!1276 = !DILocation(line: 0, scope: !1272, inlinedAt: !1277)
!1277 = distinct !DILocation(line: 1291, column: 10, scope: !794)
!1278 = !DILocation(line: 355, column: 28, scope: !1272, inlinedAt: !1277)
!1279 = !DILocation(line: 355, column: 20, scope: !1272, inlinedAt: !1277)
!1280 = !DILocation(line: 1296, column: 1, scope: !794)
!1281 = distinct !DISubprogram(name: "mm_free", scope: !3, file: !3, line: 1312, type: !1282, scopeLine: 1312, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1284)
!1282 = !DISubroutineType(types: !1283)
!1283 = !{null, !5}
!1284 = !{!1285, !1286, !1287, !1288, !1291}
!1285 = !DILocalVariable(name: "bp", arg: 1, scope: !1281, file: !3, line: 1312, type: !5)
!1286 = !DILocalVariable(name: "block", scope: !1281, file: !3, line: 1320, type: !6)
!1287 = !DILocalVariable(name: "size", scope: !1281, file: !3, line: 1322, type: !33)
!1288 = !DILocalVariable(name: "next", scope: !1289, file: !3, line: 1331, type: !6)
!1289 = distinct !DILexicalBlock(scope: !1290, file: !3, line: 1330, column: 28)
!1290 = distinct !DILexicalBlock(scope: !1281, file: !3, line: 1330, column: 9)
!1291 = !DILocalVariable(name: "epilogue", scope: !1292, file: !3, line: 1336, type: !6)
!1292 = distinct !DILexicalBlock(scope: !1290, file: !3, line: 1335, column: 9)
!1293 = !DILocation(line: 0, scope: !1281)
!1294 = !DILocation(line: 1316, column: 12, scope: !1295)
!1295 = distinct !DILexicalBlock(scope: !1281, file: !3, line: 1316, column: 9)
!1296 = !DILocation(line: 1316, column: 9, scope: !1281)
!1297 = !DILocation(line: 0, scope: !597, inlinedAt: !1298)
!1298 = distinct !DILocation(line: 1320, column: 22, scope: !1281)
!1299 = !DILocation(line: 343, column: 35, scope: !597, inlinedAt: !1298)
!1300 = !DILocation(line: 343, column: 12, scope: !597, inlinedAt: !1298)
!1301 = !DILocation(line: 1322, column: 19, scope: !1281)
!1302 = !DILocation(line: 0, scope: !139, inlinedAt: !1303)
!1303 = distinct !DILocation(line: 1322, column: 19, scope: !1281)
!1304 = !DILocation(line: 0, scope: !146, inlinedAt: !1305)
!1305 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1303)
!1306 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1305)
!1307 = !DILocation(line: 0, scope: !328, inlinedAt: !1308)
!1308 = distinct !DILocation(line: 1328, column: 30, scope: !1281)
!1309 = !DILocation(line: 288, column: 18, scope: !333, inlinedAt: !1308)
!1310 = !DILocation(line: 288, column: 15, scope: !333, inlinedAt: !1308)
!1311 = !DILocation(line: 288, column: 9, scope: !328, inlinedAt: !1308)
!1312 = !DILocation(line: 0, scope: !352, inlinedAt: !1313)
!1313 = distinct !DILocation(line: 1328, column: 60, scope: !1281)
!1314 = !DILocation(line: 1329, column: 22, scope: !1281)
!1315 = !DILocation(line: 0, scope: !607, inlinedAt: !1316)
!1316 = distinct !DILocation(line: 1328, column: 5, scope: !1281)
!1317 = !DILocation(line: 0, scope: !622, inlinedAt: !1318)
!1318 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !1316)
!1319 = !DILocation(line: 238, column: 9, scope: !622, inlinedAt: !1318)
!1320 = !DILocation(line: 241, column: 9, scope: !622, inlinedAt: !1318)
!1321 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !1316)
!1322 = !DILocation(line: 521, column: 16, scope: !618, inlinedAt: !1316)
!1323 = !DILocation(line: 291, column: 33, scope: !328, inlinedAt: !1308)
!1324 = !DILocation(line: 291, column: 12, scope: !328, inlinedAt: !1308)
!1325 = !DILocation(line: 302, column: 33, scope: !352, inlinedAt: !1313)
!1326 = !DILocation(line: 302, column: 12, scope: !352, inlinedAt: !1313)
!1327 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1318)
!1328 = !DILocation(line: 0, scope: !251, inlinedAt: !1329)
!1329 = distinct !DILocation(line: 522, column: 27, scope: !617, inlinedAt: !1316)
!1330 = !DILocation(line: 0, scope: !139, inlinedAt: !1331)
!1331 = distinct !DILocation(line: 368, column: 25, scope: !251, inlinedAt: !1329)
!1332 = !DILocation(line: 0, scope: !146, inlinedAt: !1333)
!1333 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1331)
!1334 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1333)
!1335 = !DILocation(line: 369, column: 38, scope: !251, inlinedAt: !1329)
!1336 = !DILocation(line: 369, column: 51, scope: !251, inlinedAt: !1329)
!1337 = !DILocation(line: 369, column: 12, scope: !251, inlinedAt: !1329)
!1338 = !DILocation(line: 0, scope: !617, inlinedAt: !1316)
!1339 = !DILocation(line: 0, scope: !622, inlinedAt: !1340)
!1340 = distinct !DILocation(line: 523, column: 20, scope: !617, inlinedAt: !1316)
!1341 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1340)
!1342 = !DILocation(line: 523, column: 18, scope: !617, inlinedAt: !1316)
!1343 = !DILocation(line: 524, column: 5, scope: !617, inlinedAt: !1316)
!1344 = !DILocation(line: 1330, column: 18, scope: !1290)
!1345 = !DILocation(line: 1330, column: 15, scope: !1290)
!1346 = !DILocation(line: 0, scope: !274, inlinedAt: !1347)
!1347 = distinct !DILocation(line: 1336, column: 29, scope: !1292)
!1348 = !DILocation(line: 0, scope: !274, inlinedAt: !1349)
!1349 = distinct !DILocation(line: 1331, column: 25, scope: !1289)
!1350 = !DILocation(line: 0, scope: !1290)
!1351 = !DILocation(line: 0, scope: !139, inlinedAt: !1352)
!1352 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !1347)
!1353 = !DILocation(line: 0, scope: !139, inlinedAt: !1354)
!1354 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !1349)
!1355 = !DILocation(line: 0, scope: !146, inlinedAt: !1356)
!1356 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1352)
!1357 = !DILocation(line: 0, scope: !146, inlinedAt: !1358)
!1358 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1354)
!1359 = !DILocation(line: 1330, column: 9, scope: !1281)
!1360 = !DILocation(line: 0, scope: !1289)
!1361 = !DILocation(line: 1332, column: 27, scope: !1289)
!1362 = !DILocation(line: 0, scope: !139, inlinedAt: !1363)
!1363 = distinct !DILocation(line: 1332, column: 27, scope: !1289)
!1364 = !DILocation(line: 0, scope: !146, inlinedAt: !1365)
!1365 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1363)
!1366 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1365)
!1367 = !DILocation(line: 0, scope: !226, inlinedAt: !1368)
!1368 = distinct !DILocation(line: 1332, column: 50, scope: !1289)
!1369 = !DILocation(line: 0, scope: !233, inlinedAt: !1370)
!1370 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !1368)
!1371 = !DILocation(line: 0, scope: !607, inlinedAt: !1372)
!1372 = distinct !DILocation(line: 1332, column: 9, scope: !1289)
!1373 = !DILocation(line: 0, scope: !622, inlinedAt: !1374)
!1374 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !1372)
!1375 = !DILocation(line: 241, column: 9, scope: !622, inlinedAt: !1374)
!1376 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1374)
!1377 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !1372)
!1378 = !DILocation(line: 521, column: 16, scope: !618, inlinedAt: !1372)
!1379 = !DILocation(line: 0, scope: !251, inlinedAt: !1380)
!1380 = distinct !DILocation(line: 522, column: 27, scope: !617, inlinedAt: !1372)
!1381 = !DILocation(line: 0, scope: !139, inlinedAt: !1382)
!1382 = distinct !DILocation(line: 368, column: 25, scope: !251, inlinedAt: !1380)
!1383 = !DILocation(line: 0, scope: !146, inlinedAt: !1384)
!1384 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1382)
!1385 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1384)
!1386 = !DILocation(line: 369, column: 30, scope: !251, inlinedAt: !1380)
!1387 = !DILocation(line: 369, column: 38, scope: !251, inlinedAt: !1380)
!1388 = !DILocation(line: 369, column: 51, scope: !251, inlinedAt: !1380)
!1389 = !DILocation(line: 369, column: 12, scope: !251, inlinedAt: !1380)
!1390 = !DILocation(line: 0, scope: !617, inlinedAt: !1372)
!1391 = !DILocation(line: 0, scope: !622, inlinedAt: !1392)
!1392 = distinct !DILocation(line: 523, column: 20, scope: !617, inlinedAt: !1372)
!1393 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1392)
!1394 = !DILocation(line: 523, column: 18, scope: !617, inlinedAt: !1372)
!1395 = !DILocation(line: 524, column: 5, scope: !617, inlinedAt: !1372)
!1396 = !DILocation(line: 0, scope: !1292)
!1397 = !DILocation(line: 0, scope: !760, inlinedAt: !1398)
!1398 = distinct !DILocation(line: 1337, column: 9, scope: !1292)
!1399 = !DILocation(line: 0, scope: !226, inlinedAt: !1400)
!1400 = distinct !DILocation(line: 413, column: 22, scope: !779, inlinedAt: !1398)
!1401 = !DILocation(line: 0, scope: !233, inlinedAt: !1402)
!1402 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !1400)
!1403 = !DILocation(line: 271, column: 24, scope: !233, inlinedAt: !1402)
!1404 = !DILocation(line: 271, column: 12, scope: !233, inlinedAt: !1402)
!1405 = !DILocation(line: 0, scope: !622, inlinedAt: !1406)
!1406 = distinct !DILocation(line: 415, column: 21, scope: !760, inlinedAt: !1398)
!1407 = !DILocation(line: 238, column: 9, scope: !622, inlinedAt: !1406)
!1408 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1406)
!1409 = !DILocation(line: 415, column: 12, scope: !760, inlinedAt: !1398)
!1410 = !DILocation(line: 415, column: 19, scope: !760, inlinedAt: !1398)
!1411 = !DILocation(line: 0, scope: !670, inlinedAt: !1412)
!1412 = distinct !DILocation(line: 1339, column: 5, scope: !1281)
!1413 = !DILocation(line: 619, column: 9, scope: !669, inlinedAt: !1412)
!1414 = !DILocation(line: 0, scope: !139, inlinedAt: !1415)
!1415 = distinct !DILocation(line: 619, column: 9, scope: !669, inlinedAt: !1412)
!1416 = !DILocation(line: 0, scope: !146, inlinedAt: !1417)
!1417 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1415)
!1418 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1417)
!1419 = !DILocation(line: 619, column: 29, scope: !669, inlinedAt: !1412)
!1420 = !DILocation(line: 0, scope: !687, inlinedAt: !1421)
!1421 = distinct !DILocation(line: 620, column: 9, scope: !692, inlinedAt: !1412)
!1422 = !DILocation(line: 578, column: 8, scope: !694, inlinedAt: !1421)
!1423 = !DILocation(line: 578, column: 19, scope: !694, inlinedAt: !1421)
!1424 = !DILocation(line: 578, column: 8, scope: !687, inlinedAt: !1421)
!1425 = !DILocation(line: 579, column: 25, scope: !698, inlinedAt: !1421)
!1426 = !DILocation(line: 579, column: 30, scope: !698, inlinedAt: !1421)
!1427 = !DILocation(line: 583, column: 16, scope: !687, inlinedAt: !1421)
!1428 = !DILocation(line: 621, column: 5, scope: !692, inlinedAt: !1412)
!1429 = !DILocation(line: 0, scope: !139, inlinedAt: !1430)
!1430 = distinct !DILocation(line: 621, column: 16, scope: !704, inlinedAt: !1412)
!1431 = !DILocation(line: 0, scope: !146, inlinedAt: !1432)
!1432 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1430)
!1433 = !DILocation(line: 0, scope: !139, inlinedAt: !1434)
!1434 = distinct !DILocation(line: 622, column: 45, scope: !709, inlinedAt: !1412)
!1435 = !DILocation(line: 0, scope: !146, inlinedAt: !1436)
!1436 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1434)
!1437 = !DILocation(line: 0, scope: !443, inlinedAt: !1438)
!1438 = distinct !DILocation(line: 622, column: 32, scope: !709, inlinedAt: !1412)
!1439 = !DILocation(line: 0, scope: !449, inlinedAt: !1438)
!1440 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !1438)
!1441 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !1438)
!1442 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !1438)
!1443 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !1438)
!1444 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !1438)
!1445 = distinct !{!1445, !1440, !1446, !418}
!1446 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !1438)
!1447 = !DILocation(line: 0, scope: !723, inlinedAt: !1448)
!1448 = distinct !DILocation(line: 622, column: 9, scope: !709, inlinedAt: !1412)
!1449 = !DILocation(line: 597, column: 9, scope: !732, inlinedAt: !1448)
!1450 = !DILocation(line: 597, column: 24, scope: !732, inlinedAt: !1448)
!1451 = !DILocation(line: 597, column: 9, scope: !723, inlinedAt: !1448)
!1452 = !DILocation(line: 598, column: 25, scope: !736, inlinedAt: !1448)
!1453 = !DILocation(line: 598, column: 30, scope: !736, inlinedAt: !1448)
!1454 = !DILocation(line: 602, column: 21, scope: !723, inlinedAt: !1448)
!1455 = !DILocation(line: 602, column: 26, scope: !723, inlinedAt: !1448)
!1456 = !DILocation(line: 603, column: 9, scope: !741, inlinedAt: !1448)
!1457 = !DILocation(line: 603, column: 24, scope: !741, inlinedAt: !1448)
!1458 = !DILocation(line: 603, column: 9, scope: !723, inlinedAt: !1448)
!1459 = !DILocation(line: 604, column: 34, scope: !745, inlinedAt: !1448)
!1460 = !DILocation(line: 604, column: 39, scope: !745, inlinedAt: !1448)
!1461 = !DILocation(line: 605, column: 5, scope: !745, inlinedAt: !1448)
!1462 = !DILocation(line: 606, column: 20, scope: !723, inlinedAt: !1448)
!1463 = !DILocation(line: 623, column: 5, scope: !709, inlinedAt: !1412)
!1464 = !DILocation(line: 625, column: 17, scope: !770, inlinedAt: !1412)
!1465 = !DILocation(line: 498, column: 24, scope: !772, inlinedAt: !1466)
!1466 = distinct !DILocation(line: 626, column: 40, scope: !770, inlinedAt: !1412)
!1467 = !DILocation(line: 625, column: 9, scope: !770, inlinedAt: !1412)
!1468 = !DILocation(line: 1342, column: 5, scope: !1281)
!1469 = !DILocation(line: 1345, column: 1, scope: !1281)
!1470 = distinct !DISubprogram(name: "coalesce_block", scope: !3, file: !3, line: 713, type: !275, scopeLine: 713, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1471)
!1471 = !{!1472, !1473, !1474, !1475, !1476, !1477, !1478, !1481, !1484, !1485, !1486}
!1472 = !DILocalVariable(name: "block", arg: 1, scope: !1470, file: !3, line: 713, type: !6)
!1473 = !DILocalVariable(name: "prev", scope: !1470, file: !3, line: 718, type: !6)
!1474 = !DILocalVariable(name: "prev_coalescable", scope: !1470, file: !3, line: 720, type: !35)
!1475 = !DILocalVariable(name: "prev_size", scope: !1470, file: !3, line: 722, type: !33)
!1476 = !DILocalVariable(name: "next", scope: !1470, file: !3, line: 733, type: !6)
!1477 = !DILocalVariable(name: "next_coalescable", scope: !1470, file: !3, line: 735, type: !35)
!1478 = !DILocalVariable(name: "next_next", scope: !1479, file: !3, line: 739, type: !6)
!1479 = distinct !DILexicalBlock(scope: !1480, file: !3, line: 738, column: 61)
!1480 = distinct !DILexicalBlock(scope: !1470, file: !3, line: 738, column: 9)
!1481 = !DILocalVariable(name: "epilogue", scope: !1482, file: !3, line: 744, type: !6)
!1482 = distinct !DILexicalBlock(scope: !1483, file: !3, line: 743, column: 34)
!1483 = distinct !DILexicalBlock(scope: !1480, file: !3, line: 743, column: 16)
!1484 = !DILocalVariable(name: "next_size", scope: !1470, file: !3, line: 748, type: !33)
!1485 = !DILocalVariable(name: "block_size", scope: !1470, file: !3, line: 749, type: !33)
!1486 = !DILocalVariable(name: "ret", scope: !1470, file: !3, line: 750, type: !6)
!1487 = !DILocation(line: 0, scope: !1470)
!1488 = !DILocation(line: 714, column: 15, scope: !1489)
!1489 = distinct !DILexicalBlock(scope: !1470, file: !3, line: 714, column: 9)
!1490 = !DILocation(line: 714, column: 9, scope: !1470)
!1491 = !DILocation(line: 0, scope: !328, inlinedAt: !1492)
!1492 = distinct !DILocation(line: 720, column: 30, scope: !1470)
!1493 = !DILocation(line: 288, column: 18, scope: !333, inlinedAt: !1492)
!1494 = !DILocation(line: 288, column: 15, scope: !333, inlinedAt: !1492)
!1495 = !DILocation(line: 288, column: 9, scope: !328, inlinedAt: !1492)
!1496 = !DILocation(line: 291, column: 26, scope: !328, inlinedAt: !1492)
!1497 = !DILocation(line: 291, column: 33, scope: !328, inlinedAt: !1492)
!1498 = !DILocation(line: 291, column: 12, scope: !328, inlinedAt: !1492)
!1499 = !DILocation(line: 720, column: 52, scope: !1470)
!1500 = !DILocation(line: 715, column: 17, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1489, file: !3, line: 714, column: 24)
!1502 = !DILocation(line: 715, column: 9, scope: !1501)
!1503 = !DILocation(line: 0, scope: !328, inlinedAt: !1504)
!1504 = distinct !DILocation(line: 720, column: 30, scope: !1470)
!1505 = !DILocation(line: 288, column: 18, scope: !333, inlinedAt: !1504)
!1506 = !DILocation(line: 288, column: 15, scope: !333, inlinedAt: !1504)
!1507 = !DILocation(line: 288, column: 9, scope: !328, inlinedAt: !1504)
!1508 = !DILocation(line: 0, scope: !352, inlinedAt: !1509)
!1509 = distinct !DILocation(line: 721, column: 30, scope: !1470)
!1510 = !DILocation(line: 302, column: 33, scope: !352, inlinedAt: !1509)
!1511 = !DILocation(line: 302, column: 12, scope: !352, inlinedAt: !1509)
!1512 = !DILocation(line: 721, column: 51, scope: !1470)
!1513 = !DILocalVariable(name: "block", arg: 1, scope: !1514, file: !3, line: 460, type: !6)
!1514 = distinct !DISubprogram(name: "find_prev", scope: !3, file: !3, line: 460, type: !275, scopeLine: 460, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1515)
!1515 = !{!1513, !1516}
!1516 = !DILocalVariable(name: "footerp", scope: !1514, file: !3, line: 462, type: !31)
!1517 = !DILocation(line: 0, scope: !1514, inlinedAt: !1518)
!1518 = distinct !DILocation(line: 721, column: 54, scope: !1470)
!1519 = !DILocation(line: 0, scope: !117, inlinedAt: !1520)
!1520 = distinct !DILocation(line: 462, column: 23, scope: !1514, inlinedAt: !1518)
!1521 = !DILocation(line: 442, column: 29, scope: !117, inlinedAt: !1520)
!1522 = !DILocation(line: 465, column: 22, scope: !1523, inlinedAt: !1518)
!1523 = distinct !DILexicalBlock(scope: !1514, file: !3, line: 465, column: 9)
!1524 = !DILocation(line: 0, scope: !146, inlinedAt: !1525)
!1525 = distinct !DILocation(line: 465, column: 9, scope: !1523, inlinedAt: !1518)
!1526 = !DILocation(line: 465, column: 32, scope: !1523, inlinedAt: !1518)
!1527 = !DILocation(line: 723, column: 26, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1470, file: !3, line: 723, column: 9)
!1529 = !DILocation(line: 0, scope: !352, inlinedAt: !1530)
!1530 = distinct !DILocation(line: 723, column: 30, scope: !1528)
!1531 = !DILocation(line: 302, column: 33, scope: !352, inlinedAt: !1530)
!1532 = !DILocation(line: 302, column: 12, scope: !352, inlinedAt: !1530)
!1533 = !DILocation(line: 723, column: 9, scope: !1470)
!1534 = !DILocation(line: 0, scope: !1514, inlinedAt: !1535)
!1535 = distinct !DILocation(line: 724, column: 16, scope: !1536)
!1536 = distinct !DILexicalBlock(scope: !1528, file: !3, line: 723, column: 52)
!1537 = !DILocation(line: 0, scope: !117, inlinedAt: !1538)
!1538 = distinct !DILocation(line: 462, column: 23, scope: !1514, inlinedAt: !1535)
!1539 = !DILocation(line: 442, column: 29, scope: !117, inlinedAt: !1538)
!1540 = !DILocation(line: 465, column: 22, scope: !1523, inlinedAt: !1535)
!1541 = !DILocation(line: 0, scope: !146, inlinedAt: !1542)
!1542 = distinct !DILocation(line: 465, column: 9, scope: !1523, inlinedAt: !1535)
!1543 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1542)
!1544 = !DILocation(line: 465, column: 32, scope: !1523, inlinedAt: !1535)
!1545 = !DILocation(line: 465, column: 9, scope: !1514, inlinedAt: !1535)
!1546 = !DILocation(line: 725, column: 21, scope: !1536)
!1547 = !DILocation(line: 0, scope: !139, inlinedAt: !1548)
!1548 = distinct !DILocation(line: 725, column: 21, scope: !1536)
!1549 = !DILocation(line: 0, scope: !146, inlinedAt: !1550)
!1550 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1548)
!1551 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1550)
!1552 = !DILocation(line: 726, column: 5, scope: !1536)
!1553 = !DILocation(line: 0, scope: !352, inlinedAt: !1554)
!1554 = distinct !DILocation(line: 726, column: 36, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1528, file: !3, line: 726, column: 16)
!1556 = !DILocalVariable(name: "block", arg: 1, scope: !1557, file: !3, line: 483, type: !6)
!1557 = distinct !DISubprogram(name: "find_prev_mini", scope: !3, file: !3, line: 483, type: !275, scopeLine: 483, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1558)
!1558 = !{!1556}
!1559 = !DILocation(line: 0, scope: !1557, inlinedAt: !1560)
!1560 = distinct !DILocation(line: 728, column: 16, scope: !1561)
!1561 = distinct !DILexicalBlock(scope: !1555, file: !3, line: 726, column: 58)
!1562 = !DILocation(line: 485, column: 45, scope: !1557, inlinedAt: !1560)
!1563 = !DILocation(line: 485, column: 14, scope: !1557, inlinedAt: !1560)
!1564 = !DILocation(line: 731, column: 5, scope: !1561)
!1565 = !DILocation(line: 0, scope: !274, inlinedAt: !1566)
!1566 = distinct !DILocation(line: 733, column: 21, scope: !1470)
!1567 = !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !1566)
!1568 = !DILocation(line: 0, scope: !139, inlinedAt: !1569)
!1569 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !1566)
!1570 = !DILocation(line: 0, scope: !146, inlinedAt: !1571)
!1571 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1569)
!1572 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1571)
!1573 = !DILocation(line: 433, column: 24, scope: !274, inlinedAt: !1566)
!1574 = !DILocation(line: 433, column: 38, scope: !274, inlinedAt: !1566)
!1575 = !DILocation(line: 433, column: 12, scope: !274, inlinedAt: !1566)
!1576 = !DILocation(line: 736, column: 25, scope: !1470)
!1577 = !DILocation(line: 0, scope: !139, inlinedAt: !1578)
!1578 = distinct !DILocation(line: 736, column: 25, scope: !1470)
!1579 = !DILocation(line: 0, scope: !146, inlinedAt: !1580)
!1580 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1578)
!1581 = !DILocation(line: 736, column: 40, scope: !1470)
!1582 = !DILocation(line: 736, column: 45, scope: !1470)
!1583 = !DILocation(line: 0, scope: !226, inlinedAt: !1584)
!1584 = distinct !DILocation(line: 736, column: 49, scope: !1470)
!1585 = !DILocation(line: 0, scope: !233, inlinedAt: !1586)
!1586 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !1584)
!1587 = !DILocation(line: 0, scope: !274, inlinedAt: !1588)
!1588 = distinct !DILocation(line: 738, column: 38, scope: !1480)
!1589 = !DILocation(line: 0, scope: !139, inlinedAt: !1590)
!1590 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !1588)
!1591 = !DILocation(line: 0, scope: !146, inlinedAt: !1592)
!1592 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1590)
!1593 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1592)
!1594 = !DILocation(line: 433, column: 38, scope: !274, inlinedAt: !1588)
!1595 = !DILocation(line: 738, column: 29, scope: !1480)
!1596 = !DILocation(line: 0, scope: !139, inlinedAt: !1597)
!1597 = distinct !DILocation(line: 738, column: 29, scope: !1480)
!1598 = !DILocation(line: 0, scope: !146, inlinedAt: !1599)
!1599 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1597)
!1600 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1599)
!1601 = !DILocation(line: 738, column: 55, scope: !1480)
!1602 = !DILocation(line: 0, scope: !274, inlinedAt: !1603)
!1603 = distinct !DILocation(line: 744, column: 29, scope: !1482)
!1604 = !DILocation(line: 0, scope: !274, inlinedAt: !1605)
!1605 = distinct !DILocation(line: 739, column: 30, scope: !1479)
!1606 = !DILocation(line: 0, scope: !139, inlinedAt: !1607)
!1607 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !1603)
!1608 = !DILocation(line: 0, scope: !139, inlinedAt: !1609)
!1609 = distinct !DILocation(line: 432, column: 25, scope: !274, inlinedAt: !1605)
!1610 = !DILocation(line: 0, scope: !146, inlinedAt: !1611)
!1611 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1607)
!1612 = !DILocation(line: 0, scope: !146, inlinedAt: !1613)
!1613 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1609)
!1614 = !DILocation(line: 738, column: 9, scope: !1470)
!1615 = !DILocation(line: 0, scope: !1479)
!1616 = !DILocation(line: 0, scope: !139, inlinedAt: !1617)
!1617 = distinct !DILocation(line: 740, column: 32, scope: !1479)
!1618 = !DILocation(line: 0, scope: !146, inlinedAt: !1619)
!1619 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1617)
!1620 = !DILocation(line: 0, scope: !226, inlinedAt: !1621)
!1621 = distinct !DILocation(line: 740, column: 60, scope: !1479)
!1622 = !DILocation(line: 0, scope: !233, inlinedAt: !1623)
!1623 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !1621)
!1624 = !DILocation(line: 0, scope: !607, inlinedAt: !1625)
!1625 = distinct !DILocation(line: 740, column: 9, scope: !1479)
!1626 = !DILocation(line: 0, scope: !622, inlinedAt: !1627)
!1627 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !1625)
!1628 = !DILocation(line: 241, column: 9, scope: !622, inlinedAt: !1627)
!1629 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !1625)
!1630 = !DILocation(line: 521, column: 16, scope: !618, inlinedAt: !1625)
!1631 = !DILocation(line: 0, scope: !251, inlinedAt: !1632)
!1632 = distinct !DILocation(line: 522, column: 27, scope: !617, inlinedAt: !1625)
!1633 = !DILocation(line: 0, scope: !139, inlinedAt: !1634)
!1634 = distinct !DILocation(line: 368, column: 25, scope: !251, inlinedAt: !1632)
!1635 = !DILocation(line: 0, scope: !146, inlinedAt: !1636)
!1636 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1634)
!1637 = !DILocation(line: 369, column: 30, scope: !251, inlinedAt: !1632)
!1638 = !DILocation(line: 369, column: 38, scope: !251, inlinedAt: !1632)
!1639 = !DILocation(line: 369, column: 51, scope: !251, inlinedAt: !1632)
!1640 = !DILocation(line: 369, column: 12, scope: !251, inlinedAt: !1632)
!1641 = !DILocation(line: 0, scope: !617, inlinedAt: !1625)
!1642 = !DILocation(line: 0, scope: !622, inlinedAt: !1643)
!1643 = distinct !DILocation(line: 523, column: 20, scope: !617, inlinedAt: !1625)
!1644 = !DILocation(line: 523, column: 18, scope: !617, inlinedAt: !1625)
!1645 = !DILocation(line: 524, column: 5, scope: !617, inlinedAt: !1625)
!1646 = !DILocation(line: 0, scope: !1482)
!1647 = !DILocation(line: 0, scope: !760, inlinedAt: !1648)
!1648 = distinct !DILocation(line: 746, column: 9, scope: !1482)
!1649 = !DILocation(line: 412, column: 9, scope: !776, inlinedAt: !1648)
!1650 = !DILocation(line: 412, column: 18, scope: !776, inlinedAt: !1648)
!1651 = !DILocation(line: 412, column: 9, scope: !760, inlinedAt: !1648)
!1652 = !DILocation(line: 413, column: 22, scope: !779, inlinedAt: !1648)
!1653 = !DILocation(line: 0, scope: !226, inlinedAt: !1654)
!1654 = distinct !DILocation(line: 413, column: 22, scope: !779, inlinedAt: !1648)
!1655 = !DILocation(line: 0, scope: !233, inlinedAt: !1656)
!1656 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !1654)
!1657 = !DILocation(line: 271, column: 24, scope: !233, inlinedAt: !1656)
!1658 = !DILocation(line: 271, column: 12, scope: !233, inlinedAt: !1656)
!1659 = !DILocation(line: 0, scope: !622, inlinedAt: !1660)
!1660 = distinct !DILocation(line: 415, column: 21, scope: !760, inlinedAt: !1648)
!1661 = !DILocation(line: 238, column: 9, scope: !622, inlinedAt: !1660)
!1662 = !DILocation(line: 415, column: 19, scope: !760, inlinedAt: !1648)
!1663 = !DILocation(line: 747, column: 5, scope: !1482)
!1664 = !DILocation(line: 748, column: 24, scope: !1470)
!1665 = !DILocation(line: 0, scope: !139, inlinedAt: !1666)
!1666 = distinct !DILocation(line: 748, column: 24, scope: !1470)
!1667 = !DILocation(line: 0, scope: !146, inlinedAt: !1668)
!1668 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1666)
!1669 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1668)
!1670 = !DILocation(line: 749, column: 25, scope: !1470)
!1671 = !DILocation(line: 0, scope: !139, inlinedAt: !1672)
!1672 = distinct !DILocation(line: 749, column: 25, scope: !1470)
!1673 = !DILocation(line: 0, scope: !146, inlinedAt: !1674)
!1674 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1672)
!1675 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1674)
!1676 = !DILocation(line: 752, column: 26, scope: !1677)
!1677 = distinct !DILexicalBlock(scope: !1470, file: !3, line: 752, column: 9)
!1678 = !DILocation(line: 0, scope: !939, inlinedAt: !1679)
!1679 = distinct !DILocation(line: 757, column: 9, scope: !1680)
!1680 = distinct !DILexicalBlock(scope: !1677, file: !3, line: 752, column: 47)
!1681 = !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !1679)
!1682 = !DILocation(line: 0, scope: !139, inlinedAt: !1683)
!1683 = distinct !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !1679)
!1684 = !DILocation(line: 0, scope: !146, inlinedAt: !1685)
!1685 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1683)
!1686 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1685)
!1687 = !DILocation(line: 536, column: 23, scope: !944, inlinedAt: !1679)
!1688 = !DILocation(line: 536, column: 8, scope: !939, inlinedAt: !1679)
!1689 = !DILocation(line: 0, scope: !449, inlinedAt: !1690)
!1690 = distinct !DILocation(line: 537, column: 24, scope: !943, inlinedAt: !1679)
!1691 = !DILocation(line: 0, scope: !443, inlinedAt: !1690)
!1692 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !1690)
!1693 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !1690)
!1694 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !1690)
!1695 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !1690)
!1696 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !1690)
!1697 = distinct !{!1697, !1696, !1698, !418}
!1698 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !1690)
!1699 = !DILocation(line: 0, scope: !943, inlinedAt: !1679)
!1700 = !DILocation(line: 538, column: 41, scope: !943, inlinedAt: !1679)
!1701 = !DILocation(line: 539, column: 41, scope: !943, inlinedAt: !1679)
!1702 = !DILocation(line: 540, column: 18, scope: !973, inlinedAt: !1679)
!1703 = !DILocation(line: 540, column: 13, scope: !943, inlinedAt: !1679)
!1704 = !DILocation(line: 541, column: 13, scope: !976, inlinedAt: !1679)
!1705 = !DILocation(line: 541, column: 29, scope: !976, inlinedAt: !1679)
!1706 = !DILocation(line: 542, column: 22, scope: !979, inlinedAt: !1679)
!1707 = !DILocation(line: 542, column: 17, scope: !976, inlinedAt: !1679)
!1708 = !DILocation(line: 543, column: 45, scope: !982, inlinedAt: !1679)
!1709 = !DILocation(line: 543, column: 50, scope: !982, inlinedAt: !1679)
!1710 = !DILocation(line: 544, column: 13, scope: !982, inlinedAt: !1679)
!1711 = !DILocation(line: 546, column: 22, scope: !986, inlinedAt: !1679)
!1712 = !DILocation(line: 0, scope: !986, inlinedAt: !1679)
!1713 = !DILocation(line: 546, column: 17, scope: !987, inlinedAt: !1679)
!1714 = !DILocation(line: 547, column: 37, scope: !991, inlinedAt: !1679)
!1715 = !DILocation(line: 550, column: 13, scope: !991, inlinedAt: !1679)
!1716 = !DILocation(line: 551, column: 37, scope: !994, inlinedAt: !1679)
!1717 = !DILocation(line: 553, column: 32, scope: !994, inlinedAt: !1679)
!1718 = !DILocation(line: 553, column: 37, scope: !994, inlinedAt: !1679)
!1719 = !DILocation(line: 557, column: 12, scope: !949, inlinedAt: !1679)
!1720 = !DILocation(line: 557, column: 23, scope: !949, inlinedAt: !1679)
!1721 = !DILocation(line: 557, column: 12, scope: !950, inlinedAt: !1679)
!1722 = !DILocation(line: 558, column: 41, scope: !1001, inlinedAt: !1679)
!1723 = !DILocation(line: 558, column: 24, scope: !1001, inlinedAt: !1679)
!1724 = !DILocation(line: 559, column: 9, scope: !1001, inlinedAt: !1679)
!1725 = !DILocation(line: 0, scope: !948, inlinedAt: !1679)
!1726 = !DILocation(line: 561, column: 34, scope: !948, inlinedAt: !1679)
!1727 = !DILocation(line: 561, column: 38, scope: !948, inlinedAt: !1679)
!1728 = !DILocation(line: 561, column: 13, scope: !948, inlinedAt: !1679)
!1729 = distinct !{!1729, !1728, !1730, !418}
!1730 = !DILocation(line: 563, column: 13, scope: !948, inlinedAt: !1679)
!1731 = !DILocation(line: 564, column: 51, scope: !948, inlinedAt: !1679)
!1732 = !DILocation(line: 564, column: 33, scope: !948, inlinedAt: !1679)
!1733 = !DILocation(line: 0, scope: !939, inlinedAt: !1734)
!1734 = distinct !DILocation(line: 758, column: 9, scope: !1680)
!1735 = !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !1734)
!1736 = !DILocation(line: 0, scope: !139, inlinedAt: !1737)
!1737 = distinct !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !1734)
!1738 = !DILocation(line: 0, scope: !146, inlinedAt: !1739)
!1739 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1737)
!1740 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1739)
!1741 = !DILocation(line: 536, column: 23, scope: !944, inlinedAt: !1734)
!1742 = !DILocation(line: 536, column: 8, scope: !939, inlinedAt: !1734)
!1743 = !DILocation(line: 0, scope: !449, inlinedAt: !1744)
!1744 = distinct !DILocation(line: 537, column: 24, scope: !943, inlinedAt: !1734)
!1745 = !DILocation(line: 0, scope: !443, inlinedAt: !1744)
!1746 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !1744)
!1747 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !1744)
!1748 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !1744)
!1749 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !1744)
!1750 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !1744)
!1751 = distinct !{!1751, !1750, !1752, !418}
!1752 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !1744)
!1753 = !DILocation(line: 0, scope: !943, inlinedAt: !1734)
!1754 = !DILocation(line: 538, column: 41, scope: !943, inlinedAt: !1734)
!1755 = !DILocation(line: 539, column: 41, scope: !943, inlinedAt: !1734)
!1756 = !DILocation(line: 540, column: 18, scope: !973, inlinedAt: !1734)
!1757 = !DILocation(line: 540, column: 13, scope: !943, inlinedAt: !1734)
!1758 = !DILocation(line: 541, column: 13, scope: !976, inlinedAt: !1734)
!1759 = !DILocation(line: 541, column: 29, scope: !976, inlinedAt: !1734)
!1760 = !DILocation(line: 542, column: 22, scope: !979, inlinedAt: !1734)
!1761 = !DILocation(line: 542, column: 17, scope: !976, inlinedAt: !1734)
!1762 = !DILocation(line: 543, column: 45, scope: !982, inlinedAt: !1734)
!1763 = !DILocation(line: 543, column: 50, scope: !982, inlinedAt: !1734)
!1764 = !DILocation(line: 544, column: 13, scope: !982, inlinedAt: !1734)
!1765 = !DILocation(line: 546, column: 22, scope: !986, inlinedAt: !1734)
!1766 = !DILocation(line: 0, scope: !986, inlinedAt: !1734)
!1767 = !DILocation(line: 546, column: 17, scope: !987, inlinedAt: !1734)
!1768 = !DILocation(line: 547, column: 37, scope: !991, inlinedAt: !1734)
!1769 = !DILocation(line: 550, column: 13, scope: !991, inlinedAt: !1734)
!1770 = !DILocation(line: 551, column: 37, scope: !994, inlinedAt: !1734)
!1771 = !DILocation(line: 553, column: 32, scope: !994, inlinedAt: !1734)
!1772 = !DILocation(line: 553, column: 37, scope: !994, inlinedAt: !1734)
!1773 = !DILocation(line: 557, column: 12, scope: !949, inlinedAt: !1734)
!1774 = !DILocation(line: 557, column: 23, scope: !949, inlinedAt: !1734)
!1775 = !DILocation(line: 557, column: 12, scope: !950, inlinedAt: !1734)
!1776 = !DILocation(line: 558, column: 41, scope: !1001, inlinedAt: !1734)
!1777 = !DILocation(line: 558, column: 24, scope: !1001, inlinedAt: !1734)
!1778 = !DILocation(line: 559, column: 9, scope: !1001, inlinedAt: !1734)
!1779 = !DILocation(line: 0, scope: !948, inlinedAt: !1734)
!1780 = !DILocation(line: 561, column: 34, scope: !948, inlinedAt: !1734)
!1781 = !DILocation(line: 561, column: 38, scope: !948, inlinedAt: !1734)
!1782 = !DILocation(line: 561, column: 13, scope: !948, inlinedAt: !1734)
!1783 = distinct !{!1783, !1782, !1784, !418}
!1784 = !DILocation(line: 563, column: 13, scope: !948, inlinedAt: !1734)
!1785 = !DILocation(line: 564, column: 51, scope: !948, inlinedAt: !1734)
!1786 = !DILocation(line: 564, column: 33, scope: !948, inlinedAt: !1734)
!1787 = !DILocation(line: 0, scope: !939, inlinedAt: !1788)
!1788 = distinct !DILocation(line: 759, column: 9, scope: !1680)
!1789 = !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !1788)
!1790 = !DILocation(line: 0, scope: !139, inlinedAt: !1791)
!1791 = distinct !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !1788)
!1792 = !DILocation(line: 0, scope: !146, inlinedAt: !1793)
!1793 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1791)
!1794 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1793)
!1795 = !DILocation(line: 536, column: 23, scope: !944, inlinedAt: !1788)
!1796 = !DILocation(line: 536, column: 8, scope: !939, inlinedAt: !1788)
!1797 = !DILocation(line: 0, scope: !449, inlinedAt: !1798)
!1798 = distinct !DILocation(line: 537, column: 24, scope: !943, inlinedAt: !1788)
!1799 = !DILocation(line: 0, scope: !443, inlinedAt: !1798)
!1800 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !1798)
!1801 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !1798)
!1802 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !1798)
!1803 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !1798)
!1804 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !1798)
!1805 = distinct !{!1805, !1804, !1806, !418}
!1806 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !1798)
!1807 = !DILocation(line: 0, scope: !943, inlinedAt: !1788)
!1808 = !DILocation(line: 538, column: 41, scope: !943, inlinedAt: !1788)
!1809 = !DILocation(line: 539, column: 41, scope: !943, inlinedAt: !1788)
!1810 = !DILocation(line: 540, column: 18, scope: !973, inlinedAt: !1788)
!1811 = !DILocation(line: 540, column: 13, scope: !943, inlinedAt: !1788)
!1812 = !DILocation(line: 541, column: 13, scope: !976, inlinedAt: !1788)
!1813 = !DILocation(line: 541, column: 29, scope: !976, inlinedAt: !1788)
!1814 = !DILocation(line: 542, column: 22, scope: !979, inlinedAt: !1788)
!1815 = !DILocation(line: 542, column: 17, scope: !976, inlinedAt: !1788)
!1816 = !DILocation(line: 543, column: 45, scope: !982, inlinedAt: !1788)
!1817 = !DILocation(line: 543, column: 50, scope: !982, inlinedAt: !1788)
!1818 = !DILocation(line: 544, column: 13, scope: !982, inlinedAt: !1788)
!1819 = !DILocation(line: 546, column: 22, scope: !986, inlinedAt: !1788)
!1820 = !DILocation(line: 0, scope: !986, inlinedAt: !1788)
!1821 = !DILocation(line: 546, column: 17, scope: !987, inlinedAt: !1788)
!1822 = !DILocation(line: 547, column: 37, scope: !991, inlinedAt: !1788)
!1823 = !DILocation(line: 550, column: 13, scope: !991, inlinedAt: !1788)
!1824 = !DILocation(line: 551, column: 37, scope: !994, inlinedAt: !1788)
!1825 = !DILocation(line: 553, column: 32, scope: !994, inlinedAt: !1788)
!1826 = !DILocation(line: 553, column: 37, scope: !994, inlinedAt: !1788)
!1827 = !DILocation(line: 557, column: 12, scope: !949, inlinedAt: !1788)
!1828 = !DILocation(line: 557, column: 23, scope: !949, inlinedAt: !1788)
!1829 = !DILocation(line: 557, column: 12, scope: !950, inlinedAt: !1788)
!1830 = !DILocation(line: 558, column: 41, scope: !1001, inlinedAt: !1788)
!1831 = !DILocation(line: 558, column: 24, scope: !1001, inlinedAt: !1788)
!1832 = !DILocation(line: 559, column: 9, scope: !1001, inlinedAt: !1788)
!1833 = !DILocation(line: 0, scope: !948, inlinedAt: !1788)
!1834 = !DILocation(line: 561, column: 34, scope: !948, inlinedAt: !1788)
!1835 = !DILocation(line: 561, column: 38, scope: !948, inlinedAt: !1788)
!1836 = !DILocation(line: 561, column: 13, scope: !948, inlinedAt: !1788)
!1837 = distinct !{!1837, !1836, !1838, !418}
!1838 = !DILocation(line: 563, column: 13, scope: !948, inlinedAt: !1788)
!1839 = !DILocation(line: 564, column: 51, scope: !948, inlinedAt: !1788)
!1840 = !DILocation(line: 564, column: 33, scope: !948, inlinedAt: !1788)
!1841 = !DILocation(line: 761, column: 37, scope: !1680)
!1842 = !DILocation(line: 761, column: 50, scope: !1680)
!1843 = !DILocation(line: 0, scope: !328, inlinedAt: !1844)
!1844 = distinct !DILocation(line: 762, column: 21, scope: !1680)
!1845 = !DILocation(line: 288, column: 15, scope: !333, inlinedAt: !1844)
!1846 = !DILocation(line: 288, column: 9, scope: !328, inlinedAt: !1844)
!1847 = !DILocation(line: 291, column: 26, scope: !328, inlinedAt: !1844)
!1848 = !DILocation(line: 291, column: 33, scope: !328, inlinedAt: !1844)
!1849 = !DILocation(line: 291, column: 12, scope: !328, inlinedAt: !1844)
!1850 = !DILocation(line: 0, scope: !352, inlinedAt: !1851)
!1851 = distinct !DILocation(line: 762, column: 50, scope: !1680)
!1852 = !DILocation(line: 302, column: 33, scope: !352, inlinedAt: !1851)
!1853 = !DILocation(line: 302, column: 12, scope: !352, inlinedAt: !1851)
!1854 = !DILocation(line: 0, scope: !607, inlinedAt: !1855)
!1855 = distinct !DILocation(line: 761, column: 9, scope: !1680)
!1856 = !DILocation(line: 0, scope: !622, inlinedAt: !1857)
!1857 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !1855)
!1858 = !DILocation(line: 238, column: 9, scope: !622, inlinedAt: !1857)
!1859 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !1857)
!1860 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !1855)
!1861 = !DILocation(line: 0, scope: !251, inlinedAt: !1862)
!1862 = distinct !DILocation(line: 522, column: 27, scope: !617, inlinedAt: !1855)
!1863 = !DILocation(line: 0, scope: !139, inlinedAt: !1864)
!1864 = distinct !DILocation(line: 368, column: 25, scope: !251, inlinedAt: !1862)
!1865 = !DILocation(line: 0, scope: !146, inlinedAt: !1866)
!1866 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1864)
!1867 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1866)
!1868 = !DILocation(line: 369, column: 30, scope: !251, inlinedAt: !1862)
!1869 = !DILocation(line: 369, column: 23, scope: !251, inlinedAt: !1862)
!1870 = !DILocation(line: 369, column: 38, scope: !251, inlinedAt: !1862)
!1871 = !DILocation(line: 369, column: 51, scope: !251, inlinedAt: !1862)
!1872 = !DILocation(line: 369, column: 12, scope: !251, inlinedAt: !1862)
!1873 = !DILocation(line: 0, scope: !617, inlinedAt: !1855)
!1874 = !DILocation(line: 0, scope: !622, inlinedAt: !1875)
!1875 = distinct !DILocation(line: 523, column: 20, scope: !617, inlinedAt: !1855)
!1876 = !DILocation(line: 523, column: 18, scope: !617, inlinedAt: !1855)
!1877 = !DILocation(line: 0, scope: !670, inlinedAt: !1878)
!1878 = distinct !DILocation(line: 764, column: 9, scope: !1680)
!1879 = !DILocation(line: 619, column: 9, scope: !669, inlinedAt: !1878)
!1880 = !DILocation(line: 0, scope: !139, inlinedAt: !1881)
!1881 = distinct !DILocation(line: 619, column: 9, scope: !669, inlinedAt: !1878)
!1882 = !DILocation(line: 0, scope: !146, inlinedAt: !1883)
!1883 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1881)
!1884 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1883)
!1885 = !DILocation(line: 619, column: 29, scope: !669, inlinedAt: !1878)
!1886 = !DILocation(line: 0, scope: !687, inlinedAt: !1887)
!1887 = distinct !DILocation(line: 620, column: 9, scope: !692, inlinedAt: !1878)
!1888 = !DILocation(line: 578, column: 8, scope: !694, inlinedAt: !1887)
!1889 = !DILocation(line: 578, column: 19, scope: !694, inlinedAt: !1887)
!1890 = !DILocation(line: 578, column: 8, scope: !687, inlinedAt: !1887)
!1891 = !DILocation(line: 579, column: 25, scope: !698, inlinedAt: !1887)
!1892 = !DILocation(line: 579, column: 30, scope: !698, inlinedAt: !1887)
!1893 = !DILocation(line: 583, column: 16, scope: !687, inlinedAt: !1887)
!1894 = !DILocation(line: 621, column: 5, scope: !692, inlinedAt: !1878)
!1895 = !DILocation(line: 0, scope: !139, inlinedAt: !1896)
!1896 = distinct !DILocation(line: 621, column: 16, scope: !704, inlinedAt: !1878)
!1897 = !DILocation(line: 0, scope: !146, inlinedAt: !1898)
!1898 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1896)
!1899 = !DILocation(line: 0, scope: !139, inlinedAt: !1900)
!1900 = distinct !DILocation(line: 622, column: 45, scope: !709, inlinedAt: !1878)
!1901 = !DILocation(line: 0, scope: !146, inlinedAt: !1902)
!1902 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1900)
!1903 = !DILocation(line: 0, scope: !443, inlinedAt: !1904)
!1904 = distinct !DILocation(line: 622, column: 32, scope: !709, inlinedAt: !1878)
!1905 = !DILocation(line: 0, scope: !449, inlinedAt: !1904)
!1906 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !1904)
!1907 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !1904)
!1908 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !1904)
!1909 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !1904)
!1910 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !1904)
!1911 = distinct !{!1911, !1906, !1912, !418}
!1912 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !1904)
!1913 = !DILocation(line: 0, scope: !723, inlinedAt: !1914)
!1914 = distinct !DILocation(line: 622, column: 9, scope: !709, inlinedAt: !1878)
!1915 = !DILocation(line: 597, column: 9, scope: !732, inlinedAt: !1914)
!1916 = !DILocation(line: 597, column: 24, scope: !732, inlinedAt: !1914)
!1917 = !DILocation(line: 597, column: 9, scope: !723, inlinedAt: !1914)
!1918 = !DILocation(line: 598, column: 25, scope: !736, inlinedAt: !1914)
!1919 = !DILocation(line: 598, column: 30, scope: !736, inlinedAt: !1914)
!1920 = !DILocation(line: 602, column: 21, scope: !723, inlinedAt: !1914)
!1921 = !DILocation(line: 602, column: 26, scope: !723, inlinedAt: !1914)
!1922 = !DILocation(line: 603, column: 9, scope: !741, inlinedAt: !1914)
!1923 = !DILocation(line: 603, column: 24, scope: !741, inlinedAt: !1914)
!1924 = !DILocation(line: 603, column: 9, scope: !723, inlinedAt: !1914)
!1925 = !DILocation(line: 604, column: 34, scope: !745, inlinedAt: !1914)
!1926 = !DILocation(line: 604, column: 39, scope: !745, inlinedAt: !1914)
!1927 = !DILocation(line: 605, column: 5, scope: !745, inlinedAt: !1914)
!1928 = !DILocation(line: 606, column: 20, scope: !723, inlinedAt: !1914)
!1929 = !DILocation(line: 623, column: 5, scope: !709, inlinedAt: !1878)
!1930 = !DILocation(line: 625, column: 17, scope: !770, inlinedAt: !1878)
!1931 = !DILocation(line: 498, column: 24, scope: !772, inlinedAt: !1932)
!1932 = distinct !DILocation(line: 626, column: 40, scope: !770, inlinedAt: !1878)
!1933 = !DILocation(line: 625, column: 9, scope: !770, inlinedAt: !1878)
!1934 = !DILocation(line: 767, column: 13, scope: !1935)
!1935 = distinct !DILexicalBlock(scope: !1680, file: !3, line: 767, column: 13)
!1936 = !DILocation(line: 767, column: 22, scope: !1935)
!1937 = !DILocation(line: 767, column: 30, scope: !1935)
!1938 = !DILocation(line: 768, column: 22, scope: !1939)
!1939 = distinct !DILexicalBlock(scope: !1935, file: !3, line: 767, column: 52)
!1940 = !DILocation(line: 769, column: 9, scope: !1939)
!1941 = !DILocation(line: 770, column: 33, scope: !1942)
!1942 = distinct !DILexicalBlock(scope: !1677, file: !3, line: 770, column: 16)
!1943 = !DILocation(line: 0, scope: !939, inlinedAt: !1944)
!1944 = distinct !DILocation(line: 774, column: 9, scope: !1945)
!1945 = distinct !DILexicalBlock(scope: !1942, file: !3, line: 770, column: 55)
!1946 = !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !1944)
!1947 = !DILocation(line: 0, scope: !139, inlinedAt: !1948)
!1948 = distinct !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !1944)
!1949 = !DILocation(line: 0, scope: !146, inlinedAt: !1950)
!1950 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !1948)
!1951 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !1950)
!1952 = !DILocation(line: 536, column: 23, scope: !944, inlinedAt: !1944)
!1953 = !DILocation(line: 536, column: 8, scope: !939, inlinedAt: !1944)
!1954 = !DILocation(line: 0, scope: !449, inlinedAt: !1955)
!1955 = distinct !DILocation(line: 537, column: 24, scope: !943, inlinedAt: !1944)
!1956 = !DILocation(line: 0, scope: !443, inlinedAt: !1955)
!1957 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !1955)
!1958 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !1955)
!1959 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !1955)
!1960 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !1955)
!1961 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !1955)
!1962 = distinct !{!1962, !1961, !1963, !418}
!1963 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !1955)
!1964 = !DILocation(line: 0, scope: !943, inlinedAt: !1944)
!1965 = !DILocation(line: 538, column: 41, scope: !943, inlinedAt: !1944)
!1966 = !DILocation(line: 539, column: 41, scope: !943, inlinedAt: !1944)
!1967 = !DILocation(line: 540, column: 18, scope: !973, inlinedAt: !1944)
!1968 = !DILocation(line: 540, column: 13, scope: !943, inlinedAt: !1944)
!1969 = !DILocation(line: 541, column: 13, scope: !976, inlinedAt: !1944)
!1970 = !DILocation(line: 541, column: 29, scope: !976, inlinedAt: !1944)
!1971 = !DILocation(line: 542, column: 22, scope: !979, inlinedAt: !1944)
!1972 = !DILocation(line: 542, column: 17, scope: !976, inlinedAt: !1944)
!1973 = !DILocation(line: 543, column: 45, scope: !982, inlinedAt: !1944)
!1974 = !DILocation(line: 543, column: 50, scope: !982, inlinedAt: !1944)
!1975 = !DILocation(line: 544, column: 13, scope: !982, inlinedAt: !1944)
!1976 = !DILocation(line: 546, column: 22, scope: !986, inlinedAt: !1944)
!1977 = !DILocation(line: 0, scope: !986, inlinedAt: !1944)
!1978 = !DILocation(line: 546, column: 17, scope: !987, inlinedAt: !1944)
!1979 = !DILocation(line: 547, column: 37, scope: !991, inlinedAt: !1944)
!1980 = !DILocation(line: 550, column: 13, scope: !991, inlinedAt: !1944)
!1981 = !DILocation(line: 551, column: 37, scope: !994, inlinedAt: !1944)
!1982 = !DILocation(line: 553, column: 32, scope: !994, inlinedAt: !1944)
!1983 = !DILocation(line: 553, column: 37, scope: !994, inlinedAt: !1944)
!1984 = !DILocation(line: 557, column: 12, scope: !949, inlinedAt: !1944)
!1985 = !DILocation(line: 557, column: 23, scope: !949, inlinedAt: !1944)
!1986 = !DILocation(line: 557, column: 12, scope: !950, inlinedAt: !1944)
!1987 = !DILocation(line: 558, column: 41, scope: !1001, inlinedAt: !1944)
!1988 = !DILocation(line: 558, column: 24, scope: !1001, inlinedAt: !1944)
!1989 = !DILocation(line: 559, column: 9, scope: !1001, inlinedAt: !1944)
!1990 = !DILocation(line: 0, scope: !948, inlinedAt: !1944)
!1991 = !DILocation(line: 561, column: 34, scope: !948, inlinedAt: !1944)
!1992 = !DILocation(line: 561, column: 38, scope: !948, inlinedAt: !1944)
!1993 = !DILocation(line: 561, column: 13, scope: !948, inlinedAt: !1944)
!1994 = distinct !{!1994, !1993, !1995, !418}
!1995 = !DILocation(line: 563, column: 13, scope: !948, inlinedAt: !1944)
!1996 = !DILocation(line: 564, column: 51, scope: !948, inlinedAt: !1944)
!1997 = !DILocation(line: 564, column: 33, scope: !948, inlinedAt: !1944)
!1998 = !DILocation(line: 0, scope: !939, inlinedAt: !1999)
!1999 = distinct !DILocation(line: 775, column: 9, scope: !1945)
!2000 = !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !1999)
!2001 = !DILocation(line: 0, scope: !139, inlinedAt: !2002)
!2002 = distinct !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !1999)
!2003 = !DILocation(line: 0, scope: !146, inlinedAt: !2004)
!2004 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2002)
!2005 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !2004)
!2006 = !DILocation(line: 536, column: 23, scope: !944, inlinedAt: !1999)
!2007 = !DILocation(line: 536, column: 8, scope: !939, inlinedAt: !1999)
!2008 = !DILocation(line: 0, scope: !449, inlinedAt: !2009)
!2009 = distinct !DILocation(line: 537, column: 24, scope: !943, inlinedAt: !1999)
!2010 = !DILocation(line: 0, scope: !443, inlinedAt: !2009)
!2011 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !2009)
!2012 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !2009)
!2013 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !2009)
!2014 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !2009)
!2015 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !2009)
!2016 = distinct !{!2016, !2015, !2017, !418}
!2017 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !2009)
!2018 = !DILocation(line: 0, scope: !943, inlinedAt: !1999)
!2019 = !DILocation(line: 538, column: 41, scope: !943, inlinedAt: !1999)
!2020 = !DILocation(line: 539, column: 41, scope: !943, inlinedAt: !1999)
!2021 = !DILocation(line: 540, column: 18, scope: !973, inlinedAt: !1999)
!2022 = !DILocation(line: 540, column: 13, scope: !943, inlinedAt: !1999)
!2023 = !DILocation(line: 541, column: 13, scope: !976, inlinedAt: !1999)
!2024 = !DILocation(line: 541, column: 29, scope: !976, inlinedAt: !1999)
!2025 = !DILocation(line: 542, column: 22, scope: !979, inlinedAt: !1999)
!2026 = !DILocation(line: 542, column: 17, scope: !976, inlinedAt: !1999)
!2027 = !DILocation(line: 543, column: 45, scope: !982, inlinedAt: !1999)
!2028 = !DILocation(line: 543, column: 50, scope: !982, inlinedAt: !1999)
!2029 = !DILocation(line: 544, column: 13, scope: !982, inlinedAt: !1999)
!2030 = !DILocation(line: 546, column: 22, scope: !986, inlinedAt: !1999)
!2031 = !DILocation(line: 0, scope: !986, inlinedAt: !1999)
!2032 = !DILocation(line: 546, column: 17, scope: !987, inlinedAt: !1999)
!2033 = !DILocation(line: 547, column: 37, scope: !991, inlinedAt: !1999)
!2034 = !DILocation(line: 550, column: 13, scope: !991, inlinedAt: !1999)
!2035 = !DILocation(line: 551, column: 37, scope: !994, inlinedAt: !1999)
!2036 = !DILocation(line: 553, column: 32, scope: !994, inlinedAt: !1999)
!2037 = !DILocation(line: 553, column: 37, scope: !994, inlinedAt: !1999)
!2038 = !DILocation(line: 557, column: 12, scope: !949, inlinedAt: !1999)
!2039 = !DILocation(line: 557, column: 23, scope: !949, inlinedAt: !1999)
!2040 = !DILocation(line: 557, column: 12, scope: !950, inlinedAt: !1999)
!2041 = !DILocation(line: 558, column: 41, scope: !1001, inlinedAt: !1999)
!2042 = !DILocation(line: 558, column: 24, scope: !1001, inlinedAt: !1999)
!2043 = !DILocation(line: 559, column: 9, scope: !1001, inlinedAt: !1999)
!2044 = !DILocation(line: 0, scope: !948, inlinedAt: !1999)
!2045 = !DILocation(line: 561, column: 34, scope: !948, inlinedAt: !1999)
!2046 = !DILocation(line: 561, column: 38, scope: !948, inlinedAt: !1999)
!2047 = !DILocation(line: 561, column: 13, scope: !948, inlinedAt: !1999)
!2048 = distinct !{!2048, !2047, !2049, !418}
!2049 = !DILocation(line: 563, column: 13, scope: !948, inlinedAt: !1999)
!2050 = !DILocation(line: 564, column: 51, scope: !948, inlinedAt: !1999)
!2051 = !DILocation(line: 564, column: 33, scope: !948, inlinedAt: !1999)
!2052 = !DILocation(line: 777, column: 37, scope: !1945)
!2053 = !DILocation(line: 0, scope: !328, inlinedAt: !2054)
!2054 = distinct !DILocation(line: 777, column: 51, scope: !1945)
!2055 = !DILocation(line: 288, column: 15, scope: !333, inlinedAt: !2054)
!2056 = !DILocation(line: 288, column: 9, scope: !328, inlinedAt: !2054)
!2057 = !DILocation(line: 291, column: 26, scope: !328, inlinedAt: !2054)
!2058 = !DILocation(line: 291, column: 33, scope: !328, inlinedAt: !2054)
!2059 = !DILocation(line: 291, column: 12, scope: !328, inlinedAt: !2054)
!2060 = !DILocation(line: 0, scope: !352, inlinedAt: !2061)
!2061 = distinct !DILocation(line: 778, column: 21, scope: !1945)
!2062 = !DILocation(line: 302, column: 33, scope: !352, inlinedAt: !2061)
!2063 = !DILocation(line: 302, column: 12, scope: !352, inlinedAt: !2061)
!2064 = !DILocation(line: 0, scope: !607, inlinedAt: !2065)
!2065 = distinct !DILocation(line: 777, column: 9, scope: !1945)
!2066 = !DILocation(line: 0, scope: !622, inlinedAt: !2067)
!2067 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !2065)
!2068 = !DILocation(line: 238, column: 9, scope: !622, inlinedAt: !2067)
!2069 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !2067)
!2070 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !2065)
!2071 = !DILocation(line: 0, scope: !251, inlinedAt: !2072)
!2072 = distinct !DILocation(line: 522, column: 27, scope: !617, inlinedAt: !2065)
!2073 = !DILocation(line: 0, scope: !139, inlinedAt: !2074)
!2074 = distinct !DILocation(line: 368, column: 25, scope: !251, inlinedAt: !2072)
!2075 = !DILocation(line: 0, scope: !146, inlinedAt: !2076)
!2076 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2074)
!2077 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !2076)
!2078 = !DILocation(line: 369, column: 30, scope: !251, inlinedAt: !2072)
!2079 = !DILocation(line: 369, column: 23, scope: !251, inlinedAt: !2072)
!2080 = !DILocation(line: 369, column: 38, scope: !251, inlinedAt: !2072)
!2081 = !DILocation(line: 369, column: 51, scope: !251, inlinedAt: !2072)
!2082 = !DILocation(line: 369, column: 12, scope: !251, inlinedAt: !2072)
!2083 = !DILocation(line: 0, scope: !617, inlinedAt: !2065)
!2084 = !DILocation(line: 0, scope: !622, inlinedAt: !2085)
!2085 = distinct !DILocation(line: 523, column: 20, scope: !617, inlinedAt: !2065)
!2086 = !DILocation(line: 523, column: 18, scope: !617, inlinedAt: !2065)
!2087 = !DILocation(line: 0, scope: !670, inlinedAt: !2088)
!2088 = distinct !DILocation(line: 780, column: 9, scope: !1945)
!2089 = !DILocation(line: 619, column: 9, scope: !669, inlinedAt: !2088)
!2090 = !DILocation(line: 0, scope: !139, inlinedAt: !2091)
!2091 = distinct !DILocation(line: 619, column: 9, scope: !669, inlinedAt: !2088)
!2092 = !DILocation(line: 0, scope: !146, inlinedAt: !2093)
!2093 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2091)
!2094 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !2093)
!2095 = !DILocation(line: 619, column: 29, scope: !669, inlinedAt: !2088)
!2096 = !DILocation(line: 0, scope: !687, inlinedAt: !2097)
!2097 = distinct !DILocation(line: 620, column: 9, scope: !692, inlinedAt: !2088)
!2098 = !DILocation(line: 578, column: 8, scope: !694, inlinedAt: !2097)
!2099 = !DILocation(line: 578, column: 19, scope: !694, inlinedAt: !2097)
!2100 = !DILocation(line: 578, column: 8, scope: !687, inlinedAt: !2097)
!2101 = !DILocation(line: 579, column: 25, scope: !698, inlinedAt: !2097)
!2102 = !DILocation(line: 579, column: 30, scope: !698, inlinedAt: !2097)
!2103 = !DILocation(line: 583, column: 16, scope: !687, inlinedAt: !2097)
!2104 = !DILocation(line: 621, column: 5, scope: !692, inlinedAt: !2088)
!2105 = !DILocation(line: 0, scope: !139, inlinedAt: !2106)
!2106 = distinct !DILocation(line: 621, column: 16, scope: !704, inlinedAt: !2088)
!2107 = !DILocation(line: 0, scope: !146, inlinedAt: !2108)
!2108 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2106)
!2109 = !DILocation(line: 0, scope: !139, inlinedAt: !2110)
!2110 = distinct !DILocation(line: 622, column: 45, scope: !709, inlinedAt: !2088)
!2111 = !DILocation(line: 0, scope: !146, inlinedAt: !2112)
!2112 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2110)
!2113 = !DILocation(line: 0, scope: !443, inlinedAt: !2114)
!2114 = distinct !DILocation(line: 622, column: 32, scope: !709, inlinedAt: !2088)
!2115 = !DILocation(line: 0, scope: !449, inlinedAt: !2114)
!2116 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !2114)
!2117 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !2114)
!2118 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !2114)
!2119 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !2114)
!2120 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !2114)
!2121 = distinct !{!2121, !2116, !2122, !418}
!2122 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !2114)
!2123 = !DILocation(line: 0, scope: !723, inlinedAt: !2124)
!2124 = distinct !DILocation(line: 622, column: 9, scope: !709, inlinedAt: !2088)
!2125 = !DILocation(line: 597, column: 9, scope: !732, inlinedAt: !2124)
!2126 = !DILocation(line: 597, column: 24, scope: !732, inlinedAt: !2124)
!2127 = !DILocation(line: 597, column: 9, scope: !723, inlinedAt: !2124)
!2128 = !DILocation(line: 598, column: 25, scope: !736, inlinedAt: !2124)
!2129 = !DILocation(line: 598, column: 30, scope: !736, inlinedAt: !2124)
!2130 = !DILocation(line: 602, column: 21, scope: !723, inlinedAt: !2124)
!2131 = !DILocation(line: 602, column: 26, scope: !723, inlinedAt: !2124)
!2132 = !DILocation(line: 603, column: 9, scope: !741, inlinedAt: !2124)
!2133 = !DILocation(line: 603, column: 24, scope: !741, inlinedAt: !2124)
!2134 = !DILocation(line: 603, column: 9, scope: !723, inlinedAt: !2124)
!2135 = !DILocation(line: 604, column: 34, scope: !745, inlinedAt: !2124)
!2136 = !DILocation(line: 604, column: 39, scope: !745, inlinedAt: !2124)
!2137 = !DILocation(line: 605, column: 5, scope: !745, inlinedAt: !2124)
!2138 = !DILocation(line: 606, column: 20, scope: !723, inlinedAt: !2124)
!2139 = !DILocation(line: 623, column: 5, scope: !709, inlinedAt: !2088)
!2140 = !DILocation(line: 625, column: 17, scope: !770, inlinedAt: !2088)
!2141 = !DILocation(line: 498, column: 24, scope: !772, inlinedAt: !2142)
!2142 = distinct !DILocation(line: 626, column: 40, scope: !770, inlinedAt: !2088)
!2143 = !DILocation(line: 625, column: 9, scope: !770, inlinedAt: !2088)
!2144 = !DILocation(line: 783, column: 13, scope: !2145)
!2145 = distinct !DILexicalBlock(scope: !1945, file: !3, line: 783, column: 13)
!2146 = !DILocation(line: 783, column: 22, scope: !2145)
!2147 = !DILocation(line: 783, column: 13, scope: !1945)
!2148 = !DILocation(line: 784, column: 22, scope: !2149)
!2149 = distinct !DILexicalBlock(scope: !2145, file: !3, line: 783, column: 32)
!2150 = !DILocation(line: 785, column: 9, scope: !2149)
!2151 = !DILocation(line: 786, column: 26, scope: !2152)
!2152 = distinct !DILexicalBlock(scope: !1945, file: !3, line: 786, column: 13)
!2153 = !DILocation(line: 787, column: 31, scope: !2154)
!2154 = distinct !DILexicalBlock(scope: !2152, file: !3, line: 786, column: 47)
!2155 = !DILocation(line: 0, scope: !139, inlinedAt: !2156)
!2156 = distinct !DILocation(line: 787, column: 31, scope: !2154)
!2157 = !DILocation(line: 0, scope: !146, inlinedAt: !2158)
!2158 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2156)
!2159 = !DILocation(line: 0, scope: !226, inlinedAt: !2160)
!2160 = distinct !DILocation(line: 787, column: 54, scope: !2154)
!2161 = !DILocation(line: 0, scope: !233, inlinedAt: !2162)
!2162 = distinct !DILocation(line: 280, column: 12, scope: !226, inlinedAt: !2160)
!2163 = !DILocation(line: 0, scope: !607, inlinedAt: !2164)
!2164 = distinct !DILocation(line: 787, column: 13, scope: !2154)
!2165 = !DILocation(line: 0, scope: !622, inlinedAt: !2166)
!2166 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !2164)
!2167 = !DILocation(line: 241, column: 9, scope: !622, inlinedAt: !2166)
!2168 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !2164)
!2169 = !DILocation(line: 521, column: 16, scope: !618, inlinedAt: !2164)
!2170 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !2158)
!2171 = !DILocation(line: 0, scope: !251, inlinedAt: !2172)
!2172 = distinct !DILocation(line: 522, column: 27, scope: !617, inlinedAt: !2164)
!2173 = !DILocation(line: 0, scope: !139, inlinedAt: !2174)
!2174 = distinct !DILocation(line: 368, column: 25, scope: !251, inlinedAt: !2172)
!2175 = !DILocation(line: 0, scope: !146, inlinedAt: !2176)
!2176 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2174)
!2177 = !DILocation(line: 369, column: 30, scope: !251, inlinedAt: !2172)
!2178 = !DILocation(line: 369, column: 38, scope: !251, inlinedAt: !2172)
!2179 = !DILocation(line: 369, column: 51, scope: !251, inlinedAt: !2172)
!2180 = !DILocation(line: 369, column: 12, scope: !251, inlinedAt: !2172)
!2181 = !DILocation(line: 0, scope: !617, inlinedAt: !2164)
!2182 = !DILocation(line: 0, scope: !622, inlinedAt: !2183)
!2183 = distinct !DILocation(line: 523, column: 20, scope: !617, inlinedAt: !2164)
!2184 = !DILocation(line: 523, column: 18, scope: !617, inlinedAt: !2164)
!2185 = !DILocation(line: 524, column: 5, scope: !617, inlinedAt: !2164)
!2186 = !DILocation(line: 0, scope: !139, inlinedAt: !2187)
!2187 = distinct !DILocation(line: 794, column: 21, scope: !2188)
!2188 = distinct !DILexicalBlock(scope: !2189, file: !3, line: 790, column: 55)
!2189 = distinct !DILexicalBlock(scope: !1942, file: !3, line: 790, column: 16)
!2190 = !DILocation(line: 0, scope: !146, inlinedAt: !2191)
!2191 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2187)
!2192 = !DILocation(line: 0, scope: !939, inlinedAt: !2193)
!2193 = distinct !DILocation(line: 796, column: 9, scope: !2188)
!2194 = !DILocation(line: 0, scope: !139, inlinedAt: !2195)
!2195 = distinct !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !2193)
!2196 = !DILocation(line: 0, scope: !146, inlinedAt: !2197)
!2197 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2195)
!2198 = !DILocation(line: 536, column: 23, scope: !944, inlinedAt: !2193)
!2199 = !DILocation(line: 536, column: 8, scope: !939, inlinedAt: !2193)
!2200 = !DILocation(line: 0, scope: !449, inlinedAt: !2201)
!2201 = distinct !DILocation(line: 537, column: 24, scope: !943, inlinedAt: !2193)
!2202 = !DILocation(line: 0, scope: !443, inlinedAt: !2201)
!2203 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !2201)
!2204 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !2201)
!2205 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !2201)
!2206 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !2201)
!2207 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !2201)
!2208 = distinct !{!2208, !2207, !2209, !418}
!2209 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !2201)
!2210 = !DILocation(line: 0, scope: !943, inlinedAt: !2193)
!2211 = !DILocation(line: 538, column: 41, scope: !943, inlinedAt: !2193)
!2212 = !DILocation(line: 539, column: 41, scope: !943, inlinedAt: !2193)
!2213 = !DILocation(line: 540, column: 18, scope: !973, inlinedAt: !2193)
!2214 = !DILocation(line: 540, column: 13, scope: !943, inlinedAt: !2193)
!2215 = !DILocation(line: 541, column: 13, scope: !976, inlinedAt: !2193)
!2216 = !DILocation(line: 541, column: 29, scope: !976, inlinedAt: !2193)
!2217 = !DILocation(line: 542, column: 22, scope: !979, inlinedAt: !2193)
!2218 = !DILocation(line: 542, column: 17, scope: !976, inlinedAt: !2193)
!2219 = !DILocation(line: 543, column: 45, scope: !982, inlinedAt: !2193)
!2220 = !DILocation(line: 543, column: 50, scope: !982, inlinedAt: !2193)
!2221 = !DILocation(line: 544, column: 13, scope: !982, inlinedAt: !2193)
!2222 = !DILocation(line: 546, column: 22, scope: !986, inlinedAt: !2193)
!2223 = !DILocation(line: 0, scope: !986, inlinedAt: !2193)
!2224 = !DILocation(line: 546, column: 17, scope: !987, inlinedAt: !2193)
!2225 = !DILocation(line: 547, column: 37, scope: !991, inlinedAt: !2193)
!2226 = !DILocation(line: 550, column: 13, scope: !991, inlinedAt: !2193)
!2227 = !DILocation(line: 551, column: 37, scope: !994, inlinedAt: !2193)
!2228 = !DILocation(line: 553, column: 32, scope: !994, inlinedAt: !2193)
!2229 = !DILocation(line: 553, column: 37, scope: !994, inlinedAt: !2193)
!2230 = !DILocation(line: 557, column: 12, scope: !949, inlinedAt: !2193)
!2231 = !DILocation(line: 557, column: 23, scope: !949, inlinedAt: !2193)
!2232 = !DILocation(line: 557, column: 12, scope: !950, inlinedAt: !2193)
!2233 = !DILocation(line: 558, column: 41, scope: !1001, inlinedAt: !2193)
!2234 = !DILocation(line: 558, column: 24, scope: !1001, inlinedAt: !2193)
!2235 = !DILocation(line: 559, column: 9, scope: !1001, inlinedAt: !2193)
!2236 = !DILocation(line: 0, scope: !948, inlinedAt: !2193)
!2237 = !DILocation(line: 561, column: 34, scope: !948, inlinedAt: !2193)
!2238 = !DILocation(line: 561, column: 38, scope: !948, inlinedAt: !2193)
!2239 = !DILocation(line: 561, column: 13, scope: !948, inlinedAt: !2193)
!2240 = distinct !{!2240, !2239, !2241, !418}
!2241 = !DILocation(line: 563, column: 13, scope: !948, inlinedAt: !2193)
!2242 = !DILocation(line: 564, column: 51, scope: !948, inlinedAt: !2193)
!2243 = !DILocation(line: 564, column: 33, scope: !948, inlinedAt: !2193)
!2244 = !DILocation(line: 0, scope: !939, inlinedAt: !2245)
!2245 = distinct !DILocation(line: 797, column: 9, scope: !2188)
!2246 = !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !2245)
!2247 = !DILocation(line: 0, scope: !139, inlinedAt: !2248)
!2248 = distinct !DILocation(line: 536, column: 8, scope: !944, inlinedAt: !2245)
!2249 = !DILocation(line: 0, scope: !146, inlinedAt: !2250)
!2250 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2248)
!2251 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !2250)
!2252 = !DILocation(line: 536, column: 23, scope: !944, inlinedAt: !2245)
!2253 = !DILocation(line: 536, column: 8, scope: !939, inlinedAt: !2245)
!2254 = !DILocation(line: 0, scope: !449, inlinedAt: !2255)
!2255 = distinct !DILocation(line: 537, column: 24, scope: !943, inlinedAt: !2245)
!2256 = !DILocation(line: 0, scope: !443, inlinedAt: !2255)
!2257 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !2255)
!2258 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !2255)
!2259 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !2255)
!2260 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !2255)
!2261 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !2255)
!2262 = distinct !{!2262, !2261, !2263, !418}
!2263 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !2255)
!2264 = !DILocation(line: 0, scope: !943, inlinedAt: !2245)
!2265 = !DILocation(line: 538, column: 41, scope: !943, inlinedAt: !2245)
!2266 = !DILocation(line: 539, column: 41, scope: !943, inlinedAt: !2245)
!2267 = !DILocation(line: 540, column: 18, scope: !973, inlinedAt: !2245)
!2268 = !DILocation(line: 540, column: 13, scope: !943, inlinedAt: !2245)
!2269 = !DILocation(line: 541, column: 13, scope: !976, inlinedAt: !2245)
!2270 = !DILocation(line: 541, column: 29, scope: !976, inlinedAt: !2245)
!2271 = !DILocation(line: 542, column: 22, scope: !979, inlinedAt: !2245)
!2272 = !DILocation(line: 542, column: 17, scope: !976, inlinedAt: !2245)
!2273 = !DILocation(line: 543, column: 45, scope: !982, inlinedAt: !2245)
!2274 = !DILocation(line: 543, column: 50, scope: !982, inlinedAt: !2245)
!2275 = !DILocation(line: 544, column: 13, scope: !982, inlinedAt: !2245)
!2276 = !DILocation(line: 546, column: 22, scope: !986, inlinedAt: !2245)
!2277 = !DILocation(line: 0, scope: !986, inlinedAt: !2245)
!2278 = !DILocation(line: 546, column: 17, scope: !987, inlinedAt: !2245)
!2279 = !DILocation(line: 547, column: 37, scope: !991, inlinedAt: !2245)
!2280 = !DILocation(line: 550, column: 13, scope: !991, inlinedAt: !2245)
!2281 = !DILocation(line: 551, column: 37, scope: !994, inlinedAt: !2245)
!2282 = !DILocation(line: 553, column: 32, scope: !994, inlinedAt: !2245)
!2283 = !DILocation(line: 553, column: 37, scope: !994, inlinedAt: !2245)
!2284 = !DILocation(line: 557, column: 12, scope: !949, inlinedAt: !2245)
!2285 = !DILocation(line: 557, column: 23, scope: !949, inlinedAt: !2245)
!2286 = !DILocation(line: 557, column: 12, scope: !950, inlinedAt: !2245)
!2287 = !DILocation(line: 558, column: 41, scope: !1001, inlinedAt: !2245)
!2288 = !DILocation(line: 558, column: 24, scope: !1001, inlinedAt: !2245)
!2289 = !DILocation(line: 559, column: 9, scope: !1001, inlinedAt: !2245)
!2290 = !DILocation(line: 0, scope: !948, inlinedAt: !2245)
!2291 = !DILocation(line: 561, column: 34, scope: !948, inlinedAt: !2245)
!2292 = !DILocation(line: 561, column: 38, scope: !948, inlinedAt: !2245)
!2293 = !DILocation(line: 561, column: 13, scope: !948, inlinedAt: !2245)
!2294 = distinct !{!2294, !2293, !2295, !418}
!2295 = !DILocation(line: 563, column: 13, scope: !948, inlinedAt: !2245)
!2296 = !DILocation(line: 564, column: 51, scope: !948, inlinedAt: !2245)
!2297 = !DILocation(line: 564, column: 33, scope: !948, inlinedAt: !2245)
!2298 = !DILocation(line: 799, column: 39, scope: !2188)
!2299 = !DILocation(line: 0, scope: !328, inlinedAt: !2300)
!2300 = distinct !DILocation(line: 799, column: 52, scope: !2188)
!2301 = !DILocation(line: 288, column: 15, scope: !333, inlinedAt: !2300)
!2302 = !DILocation(line: 288, column: 9, scope: !328, inlinedAt: !2300)
!2303 = !DILocation(line: 291, column: 26, scope: !328, inlinedAt: !2300)
!2304 = !DILocation(line: 291, column: 33, scope: !328, inlinedAt: !2300)
!2305 = !DILocation(line: 291, column: 12, scope: !328, inlinedAt: !2300)
!2306 = !DILocation(line: 0, scope: !352, inlinedAt: !2307)
!2307 = distinct !DILocation(line: 800, column: 21, scope: !2188)
!2308 = !DILocation(line: 302, column: 33, scope: !352, inlinedAt: !2307)
!2309 = !DILocation(line: 302, column: 12, scope: !352, inlinedAt: !2307)
!2310 = !DILocation(line: 0, scope: !607, inlinedAt: !2311)
!2311 = distinct !DILocation(line: 799, column: 9, scope: !2188)
!2312 = !DILocation(line: 0, scope: !622, inlinedAt: !2313)
!2313 = distinct !DILocation(line: 520, column: 21, scope: !607, inlinedAt: !2311)
!2314 = !DILocation(line: 238, column: 9, scope: !622, inlinedAt: !2313)
!2315 = !DILocation(line: 244, column: 9, scope: !622, inlinedAt: !2313)
!2316 = !DILocation(line: 520, column: 19, scope: !607, inlinedAt: !2311)
!2317 = !DILocation(line: 0, scope: !251, inlinedAt: !2318)
!2318 = distinct !DILocation(line: 522, column: 27, scope: !617, inlinedAt: !2311)
!2319 = !DILocation(line: 0, scope: !139, inlinedAt: !2320)
!2320 = distinct !DILocation(line: 368, column: 25, scope: !251, inlinedAt: !2318)
!2321 = !DILocation(line: 0, scope: !146, inlinedAt: !2322)
!2322 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2320)
!2323 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !2322)
!2324 = !DILocation(line: 369, column: 30, scope: !251, inlinedAt: !2318)
!2325 = !DILocation(line: 369, column: 23, scope: !251, inlinedAt: !2318)
!2326 = !DILocation(line: 369, column: 38, scope: !251, inlinedAt: !2318)
!2327 = !DILocation(line: 369, column: 51, scope: !251, inlinedAt: !2318)
!2328 = !DILocation(line: 369, column: 12, scope: !251, inlinedAt: !2318)
!2329 = !DILocation(line: 0, scope: !617, inlinedAt: !2311)
!2330 = !DILocation(line: 0, scope: !622, inlinedAt: !2331)
!2331 = distinct !DILocation(line: 523, column: 20, scope: !617, inlinedAt: !2311)
!2332 = !DILocation(line: 523, column: 18, scope: !617, inlinedAt: !2311)
!2333 = !DILocation(line: 0, scope: !670, inlinedAt: !2334)
!2334 = distinct !DILocation(line: 802, column: 9, scope: !2188)
!2335 = !DILocation(line: 619, column: 9, scope: !669, inlinedAt: !2334)
!2336 = !DILocation(line: 0, scope: !139, inlinedAt: !2337)
!2337 = distinct !DILocation(line: 619, column: 9, scope: !669, inlinedAt: !2334)
!2338 = !DILocation(line: 0, scope: !146, inlinedAt: !2339)
!2339 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2337)
!2340 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !2339)
!2341 = !DILocation(line: 619, column: 29, scope: !669, inlinedAt: !2334)
!2342 = !DILocation(line: 0, scope: !687, inlinedAt: !2343)
!2343 = distinct !DILocation(line: 620, column: 9, scope: !692, inlinedAt: !2334)
!2344 = !DILocation(line: 578, column: 8, scope: !694, inlinedAt: !2343)
!2345 = !DILocation(line: 578, column: 19, scope: !694, inlinedAt: !2343)
!2346 = !DILocation(line: 578, column: 8, scope: !687, inlinedAt: !2343)
!2347 = !DILocation(line: 579, column: 25, scope: !698, inlinedAt: !2343)
!2348 = !DILocation(line: 579, column: 30, scope: !698, inlinedAt: !2343)
!2349 = !DILocation(line: 583, column: 16, scope: !687, inlinedAt: !2343)
!2350 = !DILocation(line: 621, column: 5, scope: !692, inlinedAt: !2334)
!2351 = !DILocation(line: 0, scope: !139, inlinedAt: !2352)
!2352 = distinct !DILocation(line: 621, column: 16, scope: !704, inlinedAt: !2334)
!2353 = !DILocation(line: 0, scope: !146, inlinedAt: !2354)
!2354 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2352)
!2355 = !DILocation(line: 0, scope: !139, inlinedAt: !2356)
!2356 = distinct !DILocation(line: 622, column: 45, scope: !709, inlinedAt: !2334)
!2357 = !DILocation(line: 0, scope: !146, inlinedAt: !2358)
!2358 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2356)
!2359 = !DILocation(line: 0, scope: !443, inlinedAt: !2360)
!2360 = distinct !DILocation(line: 622, column: 32, scope: !709, inlinedAt: !2334)
!2361 = !DILocation(line: 0, scope: !449, inlinedAt: !2360)
!2362 = !DILocation(line: 187, column: 5, scope: !449, inlinedAt: !2360)
!2363 = !DILocation(line: 191, column: 19, scope: !467, inlinedAt: !2360)
!2364 = !DILocation(line: 191, column: 13, scope: !468, inlinedAt: !2360)
!2365 = !DILocation(line: 187, column: 62, scope: !469, inlinedAt: !2360)
!2366 = !DILocation(line: 187, column: 34, scope: !469, inlinedAt: !2360)
!2367 = distinct !{!2367, !2362, !2368, !418}
!2368 = !DILocation(line: 196, column: 5, scope: !449, inlinedAt: !2360)
!2369 = !DILocation(line: 0, scope: !723, inlinedAt: !2370)
!2370 = distinct !DILocation(line: 622, column: 9, scope: !709, inlinedAt: !2334)
!2371 = !DILocation(line: 597, column: 9, scope: !732, inlinedAt: !2370)
!2372 = !DILocation(line: 597, column: 24, scope: !732, inlinedAt: !2370)
!2373 = !DILocation(line: 597, column: 9, scope: !723, inlinedAt: !2370)
!2374 = !DILocation(line: 598, column: 25, scope: !736, inlinedAt: !2370)
!2375 = !DILocation(line: 598, column: 30, scope: !736, inlinedAt: !2370)
!2376 = !DILocation(line: 602, column: 21, scope: !723, inlinedAt: !2370)
!2377 = !DILocation(line: 602, column: 26, scope: !723, inlinedAt: !2370)
!2378 = !DILocation(line: 603, column: 9, scope: !741, inlinedAt: !2370)
!2379 = !DILocation(line: 603, column: 24, scope: !741, inlinedAt: !2370)
!2380 = !DILocation(line: 603, column: 9, scope: !723, inlinedAt: !2370)
!2381 = !DILocation(line: 604, column: 34, scope: !745, inlinedAt: !2370)
!2382 = !DILocation(line: 604, column: 39, scope: !745, inlinedAt: !2370)
!2383 = !DILocation(line: 605, column: 5, scope: !745, inlinedAt: !2370)
!2384 = !DILocation(line: 606, column: 20, scope: !723, inlinedAt: !2370)
!2385 = !DILocation(line: 623, column: 5, scope: !709, inlinedAt: !2334)
!2386 = !DILocation(line: 625, column: 17, scope: !770, inlinedAt: !2334)
!2387 = !DILocation(line: 498, column: 24, scope: !772, inlinedAt: !2388)
!2388 = distinct !DILocation(line: 626, column: 40, scope: !770, inlinedAt: !2334)
!2389 = !DILocation(line: 625, column: 9, scope: !770, inlinedAt: !2334)
!2390 = !DILocation(line: 805, column: 13, scope: !2391)
!2391 = distinct !DILexicalBlock(scope: !2188, file: !3, line: 805, column: 13)
!2392 = !DILocation(line: 805, column: 22, scope: !2391)
!2393 = !DILocation(line: 805, column: 13, scope: !2188)
!2394 = !DILocation(line: 806, column: 22, scope: !2395)
!2395 = distinct !DILexicalBlock(scope: !2391, file: !3, line: 805, column: 31)
!2396 = !DILocation(line: 807, column: 9, scope: !2395)
!2397 = !DILocation(line: 0, scope: !1677)
!2398 = !DILocation(line: 814, column: 5, scope: !1470)
!2399 = distinct !DISubprogram(name: "mm_realloc", scope: !3, file: !3, line: 1364, type: !2400, scopeLine: 1364, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2402)
!2400 = !DISubroutineType(types: !2401)
!2401 = !{!5, !5, !33}
!2402 = !{!2403, !2404, !2405, !2406, !2407}
!2403 = !DILocalVariable(name: "ptr", arg: 1, scope: !2399, file: !3, line: 1364, type: !5)
!2404 = !DILocalVariable(name: "size", arg: 2, scope: !2399, file: !3, line: 1364, type: !33)
!2405 = !DILocalVariable(name: "block", scope: !2399, file: !3, line: 1367, type: !6)
!2406 = !DILocalVariable(name: "copysize", scope: !2399, file: !3, line: 1368, type: !33)
!2407 = !DILocalVariable(name: "newptr", scope: !2399, file: !3, line: 1369, type: !5)
!2408 = !DILocation(line: 0, scope: !2399)
!2409 = !DILocation(line: 0, scope: !597, inlinedAt: !2410)
!2410 = distinct !DILocation(line: 1367, column: 22, scope: !2399)
!2411 = !DILocation(line: 343, column: 35, scope: !597, inlinedAt: !2410)
!2412 = !DILocation(line: 1372, column: 14, scope: !2413)
!2413 = distinct !DILexicalBlock(scope: !2399, file: !3, line: 1372, column: 9)
!2414 = !DILocation(line: 1372, column: 9, scope: !2399)
!2415 = !DILocation(line: 1373, column: 9, scope: !2416)
!2416 = distinct !DILexicalBlock(scope: !2413, file: !3, line: 1372, column: 20)
!2417 = !DILocation(line: 1374, column: 9, scope: !2416)
!2418 = !DILocation(line: 1378, column: 13, scope: !2419)
!2419 = distinct !DILexicalBlock(scope: !2399, file: !3, line: 1378, column: 9)
!2420 = !DILocation(line: 1378, column: 9, scope: !2399)
!2421 = !DILocation(line: 1386, column: 16, scope: !2422)
!2422 = distinct !DILexicalBlock(scope: !2399, file: !3, line: 1386, column: 9)
!2423 = !DILocation(line: 1386, column: 9, scope: !2399)
!2424 = !DILocation(line: 1391, column: 16, scope: !2399)
!2425 = !DILocalVariable(name: "block", arg: 1, scope: !2426, file: !3, line: 394, type: !6)
!2426 = distinct !DISubprogram(name: "get_payload_size", scope: !3, file: !3, line: 394, type: !140, scopeLine: 394, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2427)
!2427 = !{!2425, !2428}
!2428 = !DILocalVariable(name: "asize", scope: !2426, file: !3, line: 395, type: !33)
!2429 = !DILocation(line: 0, scope: !2426, inlinedAt: !2430)
!2430 = distinct !DILocation(line: 1391, column: 16, scope: !2399)
!2431 = !DILocation(line: 0, scope: !139, inlinedAt: !2432)
!2432 = distinct !DILocation(line: 395, column: 20, scope: !2426, inlinedAt: !2430)
!2433 = !DILocation(line: 0, scope: !146, inlinedAt: !2434)
!2434 = distinct !DILocation(line: 333, column: 12, scope: !139, inlinedAt: !2432)
!2435 = !DILocation(line: 323, column: 18, scope: !146, inlinedAt: !2434)
!2436 = !DILocation(line: 396, column: 18, scope: !2426, inlinedAt: !2430)
!2437 = !DILocation(line: 1392, column: 14, scope: !2438)
!2438 = distinct !DILexicalBlock(scope: !2399, file: !3, line: 1392, column: 9)
!2439 = !DILocation(line: 1392, column: 9, scope: !2399)
!2440 = !DILocation(line: 1395, column: 5, scope: !2399)
!2441 = !DILocation(line: 1398, column: 5, scope: !2399)
!2442 = !DILocation(line: 1401, column: 5, scope: !2399)
!2443 = !DILocation(line: 1402, column: 1, scope: !2399)
!2444 = !DISubprogram(name: "mem_memcpy", scope: !531, file: !531, line: 113, type: !2445, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !129)
!2445 = !DISubroutineType(types: !2446)
!2446 = !{!5, !5, !2447, !33}
!2447 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2448, size: 64)
!2448 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!2449 = distinct !DISubprogram(name: "mm_calloc", scope: !3, file: !3, line: 1421, type: !2450, scopeLine: 1421, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2452)
!2450 = !DISubroutineType(types: !2451)
!2451 = !{!5, !33, !33}
!2452 = !{!2453, !2454, !2455, !2456}
!2453 = !DILocalVariable(name: "elements", arg: 1, scope: !2449, file: !3, line: 1421, type: !33)
!2454 = !DILocalVariable(name: "size", arg: 2, scope: !2449, file: !3, line: 1421, type: !33)
!2455 = !DILocalVariable(name: "bp", scope: !2449, file: !3, line: 1424, type: !5)
!2456 = !DILocalVariable(name: "asize", scope: !2449, file: !3, line: 1425, type: !33)
!2457 = !DILocation(line: 0, scope: !2449)
!2458 = !DILocation(line: 1425, column: 29, scope: !2449)
!2459 = !DILocation(line: 1427, column: 18, scope: !2460)
!2460 = distinct !DILexicalBlock(scope: !2449, file: !3, line: 1427, column: 9)
!2461 = !DILocation(line: 1427, column: 9, scope: !2449)
!2462 = !DILocation(line: 1430, column: 9, scope: !2449)
!2463 = !DILocation(line: 1435, column: 10, scope: !2449)
!2464 = !DILocation(line: 1436, column: 12, scope: !2465)
!2465 = distinct !DILexicalBlock(scope: !2449, file: !3, line: 1436, column: 9)
!2466 = !DILocation(line: 1436, column: 9, scope: !2449)
!2467 = !DILocation(line: 1441, column: 5, scope: !2449)
!2468 = !DILocation(line: 1443, column: 5, scope: !2449)
!2469 = !DILocation(line: 1444, column: 1, scope: !2449)
!2470 = !DISubprogram(name: "mem_memset", scope: !531, file: !531, line: 122, type: !2471, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !129)
!2471 = !DISubroutineType(types: !2472)
!2472 = !{!5, !5, !85, !33}
