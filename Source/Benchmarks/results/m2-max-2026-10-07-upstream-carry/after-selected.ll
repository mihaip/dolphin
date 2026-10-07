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

define weak_odr hidden void @_ZN16dppc_interpreter8ppc_addeIL8field_rc0EL8field_ov0EEEvj(i32 noundef %0) local_unnamed_addr #3 comdat {
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
  %12 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 408), align 8, !tbaa !16
  %13 = lshr i32 %12, 29
  %14 = and i32 %13, 1
  %15 = zext i32 %9 to i64
  %16 = zext i32 %11 to i64
  %17 = add nuw nsw i64 %16, %15
  %18 = zext nneg i32 %14 to i64
  %19 = add nuw nsw i64 %17, %18
  %20 = trunc i64 %19 to i32
  %21 = and i32 %12, -536870913
  %22 = lshr i64 %19, 3
  %23 = trunc nuw nsw i64 %22 to i32
  %24 = and i32 %23, 536870912
  %25 = or disjoint i32 %24, %21
  store i32 %25, ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 408), align 8, !tbaa !16
  %26 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %3
  store i32 %20, ptr %26, align 4, !tbaa !16
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

define weak_odr hidden void @_ZN16dppc_interpreter10ppc_subfmeIL8field_rc0EL8field_ov0EEEvj(i32 noundef %0) local_unnamed_addr #3 comdat {
  %2 = lshr i32 %0, 21
  %3 = and i32 %2, 31
  %4 = lshr i32 %0, 16
  %5 = and i32 %4, 31
  %6 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %5
  %7 = load i32, ptr %6, align 4, !tbaa !16
  %8 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 408), align 8, !tbaa !16
  %9 = lshr i32 %8, 29
  %10 = and i32 %9, 1
  %11 = xor i32 %7, -1
  %12 = zext i32 %11 to i64
  %13 = zext nneg i32 %10 to i64
  %14 = add nuw nsw i64 %12, 4294967295
  %15 = add nuw nsw i64 %14, %13
  %16 = trunc i64 %15 to i32
  %17 = and i32 %8, -536870913
  %18 = lshr i64 %15, 3
  %19 = trunc nuw nsw i64 %18 to i32
  %20 = and i32 %19, 536870912
  %21 = or disjoint i32 %20, %17
  store i32 %21, ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 408), align 8, !tbaa !16
  %22 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %3
  store i32 %16, ptr %22, align 4, !tbaa !16
  ret void
}

define weak_odr hidden void @_ZN16dppc_interpreter10ppc_subfzeIL8field_rc0EL8field_ov0EEEvj(i32 noundef %0) local_unnamed_addr #3 comdat {
  %2 = lshr i32 %0, 21
  %3 = and i32 %2, 31
  %4 = lshr i32 %0, 16
  %5 = and i32 %4, 31
  %6 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %5
  %7 = load i32, ptr %6, align 4, !tbaa !16
  %8 = load i32, ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 408), align 8, !tbaa !16
  %9 = lshr i32 %8, 29
  %10 = and i32 %9, 1
  %11 = xor i32 %7, -1
  %12 = zext i32 %11 to i64
  %13 = zext nneg i32 %10 to i64
  %14 = add nuw nsw i64 %13, %12
  %15 = trunc i64 %14 to i32
  %16 = and i32 %8, -536870913
  %17 = lshr i64 %14, 3
  %18 = trunc nuw nsw i64 %17 to i32
  %19 = and i32 %18, 536870912
  %20 = or disjoint i32 %19, %16
  store i32 %20, ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 408), align 8, !tbaa !16
  %21 = getelementptr inbounds nuw [4 x i8], ptr getelementptr inbounds nuw (i8, ptr @ppc_state, i32 260), i32 %3
  store i32 %15, ptr %21, align 4, !tbaa !16
  ret void
}
