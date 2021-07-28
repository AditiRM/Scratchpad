; ModuleID = 'licm.c'
source_filename = "licm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.flags = internal global [8193 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [11 x i8] c"Count: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %NUM = alloca i32, align 4
  %i = alloca i64, align 8
  %k = alloca i64, align 8
  %count = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 17000, i32* %NUM, align 4
  store i32 0, i32* %count, align 4
  store i32 1, i32* %a, align 4
  br label %while.cond

while.cond:                                       ; preds = %for.end17, %entry
  %0 = load i32, i32* %NUM, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %NUM, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %count, align 4
  store i64 2, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.body
  %1 = load i64, i64* %i, align 8
  %cmp = icmp sle i64 %1, 8192
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %NUM, align 4
  %add = add nsw i32 %2, 1
  store i32 %add, i32* %a, align 4
  %3 = load i64, i64* %i, align 8
  %arrayidx = getelementptr inbounds [8193 x i8], [8193 x i8]* @main.flags, i64 0, i64 %3
  store i8 1, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8
  %inc = add nsw i64 %4, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i64 2, i64* %i, align 8
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc15, %for.end
  %5 = load i64, i64* %i, align 8
  %cmp2 = icmp sle i64 %5, 8192
  br i1 %cmp2, label %for.body3, label %for.end17

for.body3:                                        ; preds = %for.cond1
  %6 = load i64, i64* %i, align 8
  %arrayidx4 = getelementptr inbounds [8193 x i8], [8193 x i8]* @main.flags, i64 0, i64 %6
  %7 = load i8, i8* %arrayidx4, align 1
  %tobool5 = icmp ne i8 %7, 0
  br i1 %tobool5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %8 = load i64, i64* %i, align 8
  %9 = load i64, i64* %i, align 8
  %add6 = add nsw i64 %8, %9
  store i64 %add6, i64* %k, align 8
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc11, %if.then
  %10 = load i64, i64* %k, align 8
  %cmp8 = icmp sle i64 %10, 8192
  br i1 %cmp8, label %for.body9, label %for.end13

for.body9:                                        ; preds = %for.cond7
  %11 = load i64, i64* %k, align 8
  %arrayidx10 = getelementptr inbounds [8193 x i8], [8193 x i8]* @main.flags, i64 0, i64 %11
  store i8 0, i8* %arrayidx10, align 1
  br label %for.inc11

for.inc11:                                        ; preds = %for.body9
  %12 = load i64, i64* %i, align 8
  %13 = load i64, i64* %k, align 8
  %add12 = add nsw i64 %13, %12
  store i64 %add12, i64* %k, align 8
  br label %for.cond7

for.end13:                                        ; preds = %for.cond7
  %14 = load i32, i32* %count, align 4
  %inc14 = add nsw i32 %14, 1
  store i32 %inc14, i32* %count, align 4
  br label %if.end

if.end:                                           ; preds = %for.end13, %for.body3
  br label %for.inc15

for.inc15:                                        ; preds = %if.end
  %15 = load i64, i64* %i, align 8
  %inc16 = add nsw i64 %15, 1
  store i64 %inc16, i64* %i, align 8
  br label %for.cond1

for.end17:                                        ; preds = %for.cond1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %16 = load i32, i32* %count, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i32 %16)
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
