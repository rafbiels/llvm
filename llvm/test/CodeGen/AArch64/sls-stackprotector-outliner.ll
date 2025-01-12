; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 2
; RUN: llc < %s | FileCheck %s

; Test case to demonstrate a bug where calls to OUTLINED_FUNCTION_1 are
; inserted at a point where LR is live.

target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-arm-none-eabi"

define hidden void @_ZTv0_n24_N2C6D1Ev(ptr %this) minsize sspreq "target-features"="+harden-sls-retbr" {
; CHECK-LABEL: _ZTv0_n24_N2C6D1Ev:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sub sp, sp, #32
; CHECK-NEXT:    str x30, [sp, #16] // 8-byte Folded Spill
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    .cfi_offset w30, -16
; CHECK-NEXT:    bl OUTLINED_FUNCTION_0
; CHECK-NEXT:    b.ne .LBB0_2
; CHECK-NEXT:  // %bb.1: // %entry
; CHECK-NEXT:    ldr x30, [sp, #16] // 8-byte Folded Reload
; CHECK-NEXT:    add x0, x0, x8
; CHECK-NEXT:    add sp, sp, #32
; CHECK-NEXT:    b _ZN2C6D1Ev
; CHECK-NEXT:    dsb sy
; CHECK-NEXT:    isb
; CHECK-NEXT:  .LBB0_2: // %entry
; CHECK-NEXT:    bl __stack_chk_fail
entry:
  %0 = load ptr, ptr %this, align 8
  %1 = getelementptr inbounds i8, ptr %0, i64 -24
  %2 = load i64, ptr %1, align 8
  %3 = getelementptr inbounds i8, ptr %this, i64 %2
  tail call void @_ZN2C6D1Ev(ptr %3)
  ret void
}

;
define hidden void @_ZTv0_n24_N2C6D0Ev(ptr %this) minsize sspreq "target-features"="+harden-sls-retbr" {
; CHECK-LABEL: _ZTv0_n24_N2C6D0Ev:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sub sp, sp, #32
; CHECK-NEXT:    str x30, [sp, #16] // 8-byte Folded Spill
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    .cfi_offset w30, -16
; CHECK-NEXT:    bl OUTLINED_FUNCTION_0
; CHECK-NEXT:    b.ne .LBB1_2
; CHECK-NEXT:  // %bb.1: // %entry
; CHECK-NEXT:    ldr x30, [sp, #16] // 8-byte Folded Reload
; CHECK-NEXT:    add x0, x0, x8
; CHECK-NEXT:    add sp, sp, #32
; CHECK-NEXT:    b _ZN2C6D0Ev
; CHECK-NEXT:    dsb sy
; CHECK-NEXT:    isb
; CHECK-NEXT:  .LBB1_2: // %entry
; CHECK-NEXT:    bl __stack_chk_fail
entry:
  %0 = load ptr, ptr %this, align 8
  %1 = getelementptr inbounds i8, ptr %0, i64 -24
  %2 = load i64, ptr %1, align 8
  %3 = getelementptr inbounds i8, ptr %this, i64 %2
  tail call void @_ZN2C6D0Ev(ptr %3)
  ret void
}

define hidden void @_ZTv0_n24_N3C10D1Ev(ptr %this) minsize sspreq "target-features"="+harden-sls-retbr" {
; CHECK-LABEL: _ZTv0_n24_N3C10D1Ev:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sub sp, sp, #32
; CHECK-NEXT:    str x30, [sp, #16] // 8-byte Folded Spill
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    .cfi_offset w30, -16
; CHECK-NEXT:    bl OUTLINED_FUNCTION_0
; CHECK-NEXT:    b.ne .LBB2_2
; CHECK-NEXT:  // %bb.1: // %entry
; CHECK-NEXT:    ldr x30, [sp, #16] // 8-byte Folded Reload
; CHECK-NEXT:    add x0, x0, x8
; CHECK-NEXT:    add sp, sp, #32
; CHECK-NEXT:    b _ZN3C10D1Ev
; CHECK-NEXT:    dsb sy
; CHECK-NEXT:    isb
; CHECK-NEXT:  .LBB2_2: // %entry
; CHECK-NEXT:    bl __stack_chk_fail
entry:
  %0 = load ptr, ptr %this, align 8
  %1 = getelementptr inbounds i8, ptr %0, i64 -24
  %2 = load i64, ptr %1, align 8
  %3 = getelementptr inbounds i8, ptr %this, i64 %2
  tail call void @_ZN3C10D1Ev(ptr %3)
  ret void
}

define hidden void @_ZTv0_n24_N3C10D0Ev(ptr %this) minsize sspreq "target-features"="+harden-sls-retbr" {
; CHECK-LABEL: _ZTv0_n24_N3C10D0Ev:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sub sp, sp, #32
; CHECK-NEXT:    str x30, [sp, #16] // 8-byte Folded Spill
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    .cfi_offset w30, -16
; CHECK-NEXT:    bl OUTLINED_FUNCTION_0
; CHECK-NEXT:    b.ne .LBB3_2
; CHECK-NEXT:  // %bb.1: // %entry
; CHECK-NEXT:    ldr x30, [sp, #16] // 8-byte Folded Reload
; CHECK-NEXT:    add x0, x0, x8
; CHECK-NEXT:    add sp, sp, #32
; CHECK-NEXT:    b _ZN3C10D0Ev
; CHECK-NEXT:    dsb sy
; CHECK-NEXT:    isb
; CHECK-NEXT:  .LBB3_2: // %entry
; CHECK-NEXT:    bl __stack_chk_fail
entry:
  %0 = load ptr, ptr %this, align 8
  %1 = getelementptr inbounds i8, ptr %0, i64 -24
  %2 = load i64, ptr %1, align 8
  %3 = getelementptr inbounds i8, ptr %this, i64 %2
  tail call void @_ZN3C10D0Ev(ptr %3)
  ret void
}

declare void @_ZN2C6D1Ev(ptr %this)
declare void @_ZN3C10D1Ev(ptr %this)
declare void @_ZN2C6D0Ev(ptr %this)
declare void @_ZN3C10D0Ev(ptr %this)
