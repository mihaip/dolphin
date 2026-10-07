define weak_odr hidden void @_ZN16dppc_interpreter7ppc_addIL11field_carry0EL8field_rc0EL8field_ov0EEEvj(i32 noundef %0) local_unnamed_addr #4 comdat {
  %2 = lshr i32 %0, 21
  %3 = and i32 %2, 31
  %4 = lshr i32 %0, 16
  %5 = and i32 %4, 31
  %6 = lshr i32 %0, 11
  %7 = and i32 %6, 31
  %8 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %5
  %9 = load i32, ptr %8, align 4, !tbaa !16
  %10 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %7
  %11 = load i32, ptr %10, align 4, !tbaa !16
  %12 = add i32 %11, %9
  %13 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %3
  store i32 %12, ptr %13, align 4, !tbaa !16
  ret void
}

define weak_odr hidden void @_ZN16dppc_interpreter8ppc_addeIL8field_rc0EL8field_ov0EEEvj(i32 noundef %0) local_unnamed_addr #4 comdat {
  %2 = lshr i32 %0, 16
  %3 = and i32 %2, 31
  %4 = lshr i32 %0, 11
  %5 = and i32 %4, 31
  %6 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %3
  %7 = load i32, ptr %6, align 4, !tbaa !16
  %8 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %5
  %9 = load i32, ptr %8, align 4, !tbaa !16
  %10 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 408), align 8, !tbaa !16
  %11 = and i32 %10, 536870912
  %12 = lshr exact i32 %11, 29
  %13 = add i32 %9, %7
  %14 = add i32 %13, %12
  %15 = icmp ult i32 %14, %7
  br i1 %15, label %20, label %16

16:                                               ; preds = %1
  %17 = icmp ne i32 %11, 0
  %18 = icmp eq i32 %14, %7
  %19 = and i1 %17, %18
  br i1 %19, label %20, label %22

20:                                               ; preds = %16, %1
  %21 = or i32 %10, 536870912
  br label %24

22:                                               ; preds = %16
  %23 = and i32 %10, -536870913
  br label %24

24:                                               ; preds = %22, %20
  %25 = phi i32 [ %23, %22 ], [ %21, %20 ]
  store i32 %25, ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 408), align 8, !tbaa !16
  %26 = lshr i32 %0, 21
  %27 = and i32 %26, 31
  %28 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %27
  store i32 %14, ptr %28, align 4, !tbaa !16
  ret void
}

define weak_odr hidden void @_ZN16dppc_interpreter8ppc_subfIL11field_carry0EL8field_rc0EL8field_ov0EEEvj(i32 noundef %0) local_unnamed_addr #4 comdat {
  %2 = lshr i32 %0, 21
  %3 = and i32 %2, 31
  %4 = lshr i32 %0, 16
  %5 = and i32 %4, 31
  %6 = lshr i32 %0, 11
  %7 = and i32 %6, 31
  %8 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %5
  %9 = load i32, ptr %8, align 4, !tbaa !16
  %10 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %7
  %11 = load i32, ptr %10, align 4, !tbaa !16
  %12 = sub i32 %11, %9
  %13 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %3
  store i32 %12, ptr %13, align 4, !tbaa !16
  ret void
}

define weak_odr hidden void @_ZN16dppc_interpreter10ppc_subfmeIL8field_rc0EL8field_ov0EEEvj(i32 noundef %0) local_unnamed_addr #4 comdat {
  %2 = lshr i32 %0, 16
  %3 = and i32 %2, 31
  %4 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %3
  %5 = load i32, ptr %4, align 4, !tbaa !16
  %6 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 408), align 8, !tbaa !16
  %7 = icmp eq i32 %5, -1
  %8 = or i32 %6, 536870912
  %9 = select i1 %7, i32 %6, i32 %8
  store i32 %9, ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 408), align 8, !tbaa !16
  %10 = lshr i32 %6, 29
  %11 = and i32 %10, 1
  %12 = sub i32 %11, %5
  %13 = add i32 %12, -2
  %14 = lshr i32 %0, 21
  %15 = and i32 %14, 31
  %16 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %15
  store i32 %13, ptr %16, align 4, !tbaa !16
  ret void
}

define weak_odr hidden void @_ZN16dppc_interpreter10ppc_subfzeIL8field_rc0EL8field_ov0EEEvj(i32 noundef %0) local_unnamed_addr #4 comdat {
  %2 = lshr i32 %0, 16
  %3 = and i32 %2, 31
  %4 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %3
  %5 = load i32, ptr %4, align 4, !tbaa !16
  %6 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 408), align 8, !tbaa !16
  %7 = lshr i32 %6, 29
  %8 = and i32 %7, 1
  %9 = xor i32 %5, -1
  %10 = add i32 %8, %9
  %11 = icmp eq i32 %10, 0
  %12 = and i32 %6, -536870913
  %13 = select i1 %11, i32 %6, i32 %12
  store i32 %13, ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 408), align 8, !tbaa !16
  %14 = lshr i32 %0, 21
  %15 = and i32 %14, 31
  %16 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %15
  store i32 %10, ptr %16, align 4, !tbaa !16
  ret void
}
