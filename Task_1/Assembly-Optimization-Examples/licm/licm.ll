; ModuleID = 'licm-example.ll'
source_filename = "licm-example.c"
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
  %NUM.promoted = load i32, i32* %NUM, align 4
  %count.promoted11 = load i32, i32* %count, align 4
  %i.promoted13 = load i64, i64* %i, align 8
  %a.promoted15 = load i32, i32* %a, align 1
  %k.promoted = load i64, i64* %k, align 8
  br label %while.cond

while.cond:                                       ; preds = %for.end17, %entry
  %add123.lcssa8.lcssa17 = phi i64 [ %add123.lcssa8.lcssa, %for.end17 ], [ %k.promoted, %entry ]
  %add2.lcssa16 = phi i32 [ %add2.lcssa, %for.end17 ], [ %a.promoted15, %entry ]
  %inc165.lcssa14 = phi i64 [ %inc165.lcssa, %for.end17 ], [ %i.promoted13, %entry ]
  %inc1410.lcssa12 = phi i32 [ %inc1410.lcssa, %for.end17 ], [ %count.promoted11, %entry ]
  %0 = phi i32 [ %dec, %for.end17 ], [ %NUM.promoted, %entry ]
  %dec = add nsw i32 %0, -1
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %add = add nsw i32 %dec, 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.body
  %add2 = phi i32 [ %add, %for.inc ], [ %add2.lcssa16, %while.body ]
  %inc1 = phi i64 [ %inc, %for.inc ], [ 2, %while.body ]
  %cmp = icmp sle i64 %inc1, 8192
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [8193 x i8], [8193 x i8]* @main.flags, i64 0, i64 %inc1
  store i8 1, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i64 %inc1, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %add2.lcssa = phi i32 [ %add2, %for.cond ]
  %inc1.lcssa = phi i64 [ %inc1, %for.cond ]
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc15, %for.end
  %inc1410 = phi i32 [ %inc149, %for.inc15 ], [ 0, %for.end ]
  %add123.lcssa8 = phi i64 [ %add123.lcssa7, %for.inc15 ], [ %add123.lcssa8.lcssa17, %for.end ]
  %inc165 = phi i64 [ %inc16, %for.inc15 ], [ 2, %for.end ]
  %cmp2 = icmp sle i64 %inc165, 8192
  br i1 %cmp2, label %for.body3, label %for.end17

for.body3:                                        ; preds = %for.cond1
  %arrayidx4 = getelementptr inbounds [8193 x i8], [8193 x i8]* @main.flags, i64 0, i64 %inc165
  %1 = load i8, i8* %arrayidx4, align 1
  %tobool5 = icmp ne i8 %1, 0
  br i1 %tobool5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %add6 = add nsw i64 %inc165, %inc165
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc11, %if.then
  %add123 = phi i64 [ %add12, %for.inc11 ], [ %add6, %if.then ]
  %cmp8 = icmp sle i64 %add123, 8192
  br i1 %cmp8, label %for.body9, label %for.end13

for.body9:                                        ; preds = %for.cond7
  %arrayidx10 = getelementptr inbounds [8193 x i8], [8193 x i8]* @main.flags, i64 0, i64 %add123
  store i8 0, i8* %arrayidx10, align 1
  br label %for.inc11

for.inc11:                                        ; preds = %for.body9
  %add12 = add nsw i64 %add123, %inc165
  br label %for.cond7

for.end13:                                        ; preds = %for.cond7
  %add123.lcssa = phi i64 [ %add123, %for.cond7 ]
  %inc14 = add nsw i32 %inc1410, 1
  br label %if.end

if.end:                                           ; preds = %for.end13, %for.body3
  %inc149 = phi i32 [ %inc14, %for.end13 ], [ %inc1410, %for.body3 ]
  %add123.lcssa7 = phi i64 [ %add123.lcssa, %for.end13 ], [ %add123.lcssa8, %for.body3 ]
  br label %for.inc15

for.inc15:                                        ; preds = %if.end
  %inc16 = add nsw i64 %inc165, 1
  br label %for.cond1

for.end17:                                        ; preds = %for.cond1
  %inc1410.lcssa = phi i32 [ %inc1410, %for.cond1 ]
  %add123.lcssa8.lcssa = phi i64 [ %add123.lcssa8, %for.cond1 ]
  %inc165.lcssa = phi i64 [ %inc165, %for.cond1 ]
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %add123.lcssa8.lcssa17.lcssa = phi i64 [ %add123.lcssa8.lcssa17, %while.cond ]
  %add2.lcssa16.lcssa = phi i32 [ %add2.lcssa16, %while.cond ]
  %inc165.lcssa14.lcssa = phi i64 [ %inc165.lcssa14, %while.cond ]
  %inc1410.lcssa12.lcssa = phi i32 [ %inc1410.lcssa12, %while.cond ]
  %dec.lcssa = phi i32 [ %dec, %while.cond ]
  store i32 %dec.lcssa, i32* %NUM, align 4
  store i32 %inc1410.lcssa12.lcssa, i32* %count, align 4
  store i64 %inc165.lcssa14.lcssa, i64* %i, align 8
  store i32 %add2.lcssa16.lcssa, i32* %a, align 1
  store i64 %add123.lcssa8.lcssa17.lcssa, i64* %k, align 8
  %2 = load i32, i32* %count, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i32 %2)
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 "}
