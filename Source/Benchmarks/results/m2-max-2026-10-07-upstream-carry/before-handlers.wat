(module
 (type $0 (func (param i32)))
 (type $1 (func (result i32)))
 (type $2 (func))
 (type $3 (func (param i32 i32 i32 i32 i32 i32 i32) (result i64)))
 (type $4 (func (param i32) (result i32)))
 (type $5 (func (param i32 i32 i32) (result i32)))
 (type $6 (func (param i32 i32)))
 (global $global$0 (mut i32) (i32.const 71936))
 (memory $0 258 258)
 (data $0 (i32.const 1024) "\04\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\t\00\00\00\08\00\00\00\t\00\00\00\n\00\00\00\0b\00\00\00\0c\00\00\00\r\00\00\00\0e\00\00\00\0f\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\13\00\00\00\14\00\00\00\15\00\00\00\16\00\00\00\16\00\00\00\16\00\00\00\16\00\00\00\17\00\00\00\18\00\00\00\19\00\00\00\1a\00\00\00\1b\00\00\00\1c\00\00\00\1d\00\00\00\1e\00\00\00\1f\00\00\00 \00\00\00!\00\00\00\"\00\00\00#\00\00\00$\00\00\00%\00\00\00&\00\00\00\'\00\00\00(\00\00\00)\00\00\00*\00\00\00+\00\00\00,\00\00\00-\00\00\00.")
 (table $0 48 48 funcref)
 (elem $0 (i32.const 1) $1 $2 $46 $13 $15 $14 $16 $3 $4 $9 $10 $11 $12 $17 $19 $18 $20 $21 $23 $22 $24 $25 $30 $32 $31 $33 $34 $36 $35 $37 $38 $40 $39 $41 $42 $44 $43 $45 $5 $6 $7 $8 $26 $28 $27 $29 $0)
 (export "memory" (memory $0))
 (export "__indirect_function_table" (table $0))
 (export "check" (func $47))
 (export "get_cr" (func $48))
 (export "get_gpr" (func $49))
 (export "run" (func $50))
 (export "_initialize" (func $0))
 (export "setThrew" (func $53))
 (export "_emscripten_stack_restore" (func $51))
 (export "emscripten_stack_get_current" (func $52))
 (func $0
  (i32.store
   (i32.const 1256)
   (i32.const 0)
  )
  (i32.store8
   (i32.const 1232)
   (i32.const 0)
  )
  (i32.store
   (i32.const 1320)
   (i32.const 0)
  )
  (i32.store8
   (i32.const 1296)
   (i32.const 0)
  )
 )
 (func $1 (param $0 i32)
  (local $1 i32)
  (block $block
   (local.set $1
    (if (result i32)
     (i32.eq
      (local.tee $0
       (i32.load
        (i32.const 1256)
       )
      )
      (i32.const 1240)
     )
     (then
      (i32.const 16)
     )
     (else
      (br_if $block
       (i32.eqz
        (local.get $0)
       )
      )
      (i32.const 20)
     )
    )
   )
   (call_indirect (type $0)
    (local.get $0)
    (i32.load
     (i32.add
      (i32.load
       (local.get $0)
      )
      (local.get $1)
     )
    )
   )
  )
 )
 (func $2 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (if
   (local.tee $1
    (i32.load
     (i32.const 1264)
    )
   )
   (then
    (if
     (i32.ne
      (local.tee $3
       (local.get $1)
      )
      (local.tee $0
       (i32.load
        (i32.const 1268)
       )
      )
     )
     (then
      (loop $label
       (block $block
        (local.set $2
         (if (result i32)
          (i32.eq
           (local.tee $3
            (i32.load
             (i32.sub
              (local.get $0)
              (i32.const 8)
             )
            )
           )
           (local.tee $0
            (i32.sub
             (local.get $0)
             (i32.const 24)
            )
           )
          )
          (then
           (i32.const 16)
          )
          (else
           (br_if $block
            (i32.eqz
             (local.get $3)
            )
           )
           (i32.const 20)
          )
         )
        )
        (call_indirect (type $0)
         (local.get $3)
         (i32.load
          (i32.add
           (i32.load
            (local.get $3)
           )
           (local.get $2)
          )
         )
        )
       )
       (br_if $label
        (i32.ne
         (local.get $0)
         (local.get $1)
        )
       )
      )
      (local.set $3
       (i32.load
        (i32.const 1264)
       )
      )
     )
    )
    (i32.store
     (i32.const 1268)
     (local.get $1)
    )
    (drop
     (i32.load
      (i32.const 1272)
     )
    )
    (block $block1
     (br_if $block1
      (i32.eqz
       (local.get $3)
      )
     )
     (local.set $5
      (i32.add
       (local.tee $2
        (i32.sub
         (local.get $3)
         (i32.const 8)
        )
       )
       (local.tee $4
        (i32.and
         (local.tee $0
          (i32.load
           (i32.sub
            (local.get $3)
            (i32.const 4)
           )
          )
         )
         (i32.const -8)
        )
       )
      )
     )
     (block $block2
      (br_if $block2
       (i32.and
        (local.get $0)
        (i32.const 1)
       )
      )
      (br_if $block1
       (i32.eqz
        (i32.and
         (local.get $0)
         (i32.const 2)
        )
       )
      )
      (br_if $block1
       (i32.lt_u
        (local.tee $2
         (i32.sub
          (local.get $2)
          (local.tee $0
           (i32.load
            (local.get $2)
           )
          )
         )
        )
        (i32.load
         (i32.const 5924)
        )
       )
      )
      (local.set $4
       (i32.add
        (local.get $0)
        (local.get $4)
       )
      )
      (block $block4
       (block $block5
        (block $block3
         (if
          (i32.ne
           (i32.load
            (i32.const 5928)
           )
           (local.get $2)
          )
          (then
           (local.set $1
            (i32.load offset=12
             (local.get $2)
            )
           )
           (if
            (i32.le_u
             (local.get $0)
             (i32.const 255)
            )
            (then
             (br_if $block3
              (i32.ne
               (local.get $1)
               (local.tee $3
                (i32.load offset=8
                 (local.get $2)
                )
               )
              )
             )
             (i32.store
              (i32.const 5908)
              (i32.and
               (i32.load
                (i32.const 5908)
               )
               (i32.rotl
                (i32.const -2)
                (i32.shr_u
                 (local.get $0)
                 (i32.const 3)
                )
               )
              )
             )
             (br $block2)
            )
           )
           (local.set $6
            (i32.load offset=24
             (local.get $2)
            )
           )
           (if
            (i32.ne
             (local.get $1)
             (local.get $2)
            )
            (then
             (i32.store offset=12
              (local.tee $0
               (i32.load offset=8
                (local.get $2)
               )
              )
              (local.get $1)
             )
             (i32.store offset=8
              (local.get $1)
              (local.get $0)
             )
             (br $block4)
            )
           )
           (local.set $3
            (if (result i32)
             (local.tee $0
              (i32.load offset=20
               (local.get $2)
              )
             )
             (then
              (i32.add
               (local.get $2)
               (i32.const 20)
              )
             )
             (else
              (br_if $block5
               (i32.eqz
                (local.tee $0
                 (i32.load offset=16
                  (local.get $2)
                 )
                )
               )
              )
              (i32.add
               (local.get $2)
               (i32.const 16)
              )
             )
            )
           )
           (loop $label1
            (local.set $7
             (local.get $3)
            )
            (local.set $3
             (i32.add
              (local.tee $1
               (local.get $0)
              )
              (i32.const 20)
             )
            )
            (br_if $label1
             (local.tee $0
              (i32.load offset=20
               (local.get $1)
              )
             )
            )
            (local.set $3
             (i32.add
              (local.get $1)
              (i32.const 16)
             )
            )
            (br_if $label1
             (local.tee $0
              (i32.load offset=16
               (local.get $1)
              )
             )
            )
           )
           (i32.store
            (local.get $7)
            (i32.const 0)
           )
           (br $block4)
          )
         )
         (br_if $block2
          (i32.ne
           (i32.and
            (local.tee $0
             (i32.load offset=4
              (local.get $5)
             )
            )
            (i32.const 3)
           )
           (i32.const 3)
          )
         )
         (i32.store
          (i32.const 5916)
          (local.get $4)
         )
         (i32.store offset=4
          (local.get $5)
          (i32.and
           (local.get $0)
           (i32.const -2)
          )
         )
         (i32.store offset=4
          (local.get $2)
          (i32.or
           (local.get $4)
           (i32.const 1)
          )
         )
         (i32.store
          (local.get $5)
          (local.get $4)
         )
         (br $block1)
        )
        (i32.store offset=12
         (local.get $3)
         (local.get $1)
        )
        (i32.store offset=8
         (local.get $1)
         (local.get $3)
        )
        (br $block2)
       )
       (local.set $1
        (i32.const 0)
       )
      )
      (br_if $block2
       (i32.eqz
        (local.get $6)
       )
      )
      (block $block6
       (if
        (i32.eq
         (i32.load offset=6212
          (local.tee $3
           (i32.shl
            (local.tee $0
             (i32.load offset=28
              (local.get $2)
             )
            )
            (i32.const 2)
           )
          )
         )
         (local.get $2)
        )
        (then
         (i32.store
          (i32.add
           (local.get $3)
           (i32.const 6212)
          )
          (local.get $1)
         )
         (br_if $block6
          (local.get $1)
         )
         (i32.store
          (i32.const 5912)
          (i32.and
           (i32.load
            (i32.const 5912)
           )
           (i32.rotl
            (i32.const -2)
            (local.get $0)
           )
          )
         )
         (br $block2)
        )
       )
       (block $block7
        (if
         (i32.eq
          (local.get $2)
          (i32.load offset=16
           (local.get $6)
          )
         )
         (then
          (i32.store offset=16
           (local.get $6)
           (local.get $1)
          )
          (br $block7)
         )
        )
        (i32.store offset=20
         (local.get $6)
         (local.get $1)
        )
       )
       (br_if $block2
        (i32.eqz
         (local.get $1)
        )
       )
      )
      (i32.store offset=24
       (local.get $1)
       (local.get $6)
      )
      (if
       (local.tee $0
        (i32.load offset=16
         (local.get $2)
        )
       )
       (then
        (i32.store offset=16
         (local.get $1)
         (local.get $0)
        )
        (i32.store offset=24
         (local.get $0)
         (local.get $1)
        )
       )
      )
      (br_if $block2
       (i32.eqz
        (local.tee $0
         (i32.load offset=20
          (local.get $2)
         )
        )
       )
      )
      (i32.store offset=20
       (local.get $1)
       (local.get $0)
      )
      (i32.store offset=24
       (local.get $0)
       (local.get $1)
      )
     )
     (br_if $block1
      (i32.ge_u
       (local.get $2)
       (local.get $5)
      )
     )
     (br_if $block1
      (i32.eqz
       (i32.and
        (local.tee $0
         (i32.load offset=4
          (local.get $5)
         )
        )
        (i32.const 1)
       )
      )
     )
     (block $block11
      (block $block8
       (block $block9
        (block $block10
         (if
          (i32.eqz
           (i32.and
            (local.get $0)
            (i32.const 2)
           )
          )
          (then
           (if
            (i32.eq
             (i32.load
              (i32.const 5932)
             )
             (local.get $5)
            )
            (then
             (i32.store
              (i32.const 5932)
              (local.get $2)
             )
             (i32.store
              (i32.const 5920)
              (local.tee $0
               (i32.add
                (i32.load
                 (i32.const 5920)
                )
                (local.get $4)
               )
              )
             )
             (i32.store offset=4
              (local.get $2)
              (i32.or
               (local.get $0)
               (i32.const 1)
              )
             )
             (br_if $block1
              (i32.ne
               (local.get $2)
               (i32.load
                (i32.const 5928)
               )
              )
             )
             (i32.store
              (i32.const 5916)
              (i32.const 0)
             )
             (i32.store
              (i32.const 5928)
              (i32.const 0)
             )
             (br $block1)
            )
           )
           (if
            (i32.eq
             (local.tee $8
              (i32.load
               (i32.const 5928)
              )
             )
             (local.get $5)
            )
            (then
             (i32.store
              (i32.const 5928)
              (local.get $2)
             )
             (i32.store
              (i32.const 5916)
              (local.tee $0
               (i32.add
                (i32.load
                 (i32.const 5916)
                )
                (local.get $4)
               )
              )
             )
             (i32.store offset=4
              (local.get $2)
              (i32.or
               (local.get $0)
               (i32.const 1)
              )
             )
             (i32.store
              (i32.add
               (local.get $0)
               (local.get $2)
              )
              (local.get $0)
             )
             (br $block1)
            )
           )
           (local.set $4
            (i32.add
             (i32.and
              (local.get $0)
              (i32.const -8)
             )
             (local.get $4)
            )
           )
           (local.set $1
            (i32.load offset=12
             (local.get $5)
            )
           )
           (if
            (i32.le_u
             (local.get $0)
             (i32.const 255)
            )
            (then
             (if
              (i32.eq
               (local.tee $3
                (i32.load offset=8
                 (local.get $5)
                )
               )
               (local.get $1)
              )
              (then
               (i32.store
                (i32.const 5908)
                (i32.and
                 (i32.load
                  (i32.const 5908)
                 )
                 (i32.rotl
                  (i32.const -2)
                  (i32.shr_u
                   (local.get $0)
                   (i32.const 3)
                  )
                 )
                )
               )
               (br $block8)
              )
             )
             (i32.store offset=12
              (local.get $3)
              (local.get $1)
             )
             (i32.store offset=8
              (local.get $1)
              (local.get $3)
             )
             (br $block8)
            )
           )
           (local.set $6
            (i32.load offset=24
             (local.get $5)
            )
           )
           (if
            (i32.ne
             (local.get $1)
             (local.get $5)
            )
            (then
             (i32.store offset=12
              (local.tee $0
               (i32.load offset=8
                (local.get $5)
               )
              )
              (local.get $1)
             )
             (i32.store offset=8
              (local.get $1)
              (local.get $0)
             )
             (br $block9)
            )
           )
           (local.set $3
            (if (result i32)
             (local.tee $0
              (i32.load offset=20
               (local.get $5)
              )
             )
             (then
              (i32.add
               (local.get $5)
               (i32.const 20)
              )
             )
             (else
              (br_if $block10
               (i32.eqz
                (local.tee $0
                 (i32.load offset=16
                  (local.get $5)
                 )
                )
               )
              )
              (i32.add
               (local.get $5)
               (i32.const 16)
              )
             )
            )
           )
           (loop $label2
            (local.set $7
             (local.get $3)
            )
            (local.set $3
             (i32.add
              (local.tee $1
               (local.get $0)
              )
              (i32.const 20)
             )
            )
            (br_if $label2
             (local.tee $0
              (i32.load offset=20
               (local.get $1)
              )
             )
            )
            (local.set $3
             (i32.add
              (local.get $1)
              (i32.const 16)
             )
            )
            (br_if $label2
             (local.tee $0
              (i32.load offset=16
               (local.get $1)
              )
             )
            )
           )
           (i32.store
            (local.get $7)
            (i32.const 0)
           )
           (br $block9)
          )
         )
         (i32.store offset=4
          (local.get $5)
          (i32.and
           (local.get $0)
           (i32.const -2)
          )
         )
         (i32.store offset=4
          (local.get $2)
          (i32.or
           (local.get $4)
           (i32.const 1)
          )
         )
         (i32.store
          (i32.add
           (local.get $2)
           (local.get $4)
          )
          (local.get $4)
         )
         (br $block11)
        )
        (local.set $1
         (i32.const 0)
        )
       )
       (br_if $block8
        (i32.eqz
         (local.get $6)
        )
       )
       (block $block12
        (if
         (i32.eq
          (i32.load offset=6212
           (local.tee $3
            (i32.shl
             (local.tee $0
              (i32.load offset=28
               (local.get $5)
              )
             )
             (i32.const 2)
            )
           )
          )
          (local.get $5)
         )
         (then
          (i32.store
           (i32.add
            (local.get $3)
            (i32.const 6212)
           )
           (local.get $1)
          )
          (br_if $block12
           (local.get $1)
          )
          (i32.store
           (i32.const 5912)
           (i32.and
            (i32.load
             (i32.const 5912)
            )
            (i32.rotl
             (i32.const -2)
             (local.get $0)
            )
           )
          )
          (br $block8)
         )
        )
        (block $block13
         (if
          (i32.eq
           (local.get $5)
           (i32.load offset=16
            (local.get $6)
           )
          )
          (then
           (i32.store offset=16
            (local.get $6)
            (local.get $1)
           )
           (br $block13)
          )
         )
         (i32.store offset=20
          (local.get $6)
          (local.get $1)
         )
        )
        (br_if $block8
         (i32.eqz
          (local.get $1)
         )
        )
       )
       (i32.store offset=24
        (local.get $1)
        (local.get $6)
       )
       (if
        (local.tee $0
         (i32.load offset=16
          (local.get $5)
         )
        )
        (then
         (i32.store offset=16
          (local.get $1)
          (local.get $0)
         )
         (i32.store offset=24
          (local.get $0)
          (local.get $1)
         )
        )
       )
       (br_if $block8
        (i32.eqz
         (local.tee $0
          (i32.load offset=20
           (local.get $5)
          )
         )
        )
       )
       (i32.store offset=20
        (local.get $1)
        (local.get $0)
       )
       (i32.store offset=24
        (local.get $0)
        (local.get $1)
       )
      )
      (i32.store offset=4
       (local.get $2)
       (i32.or
        (local.get $4)
        (i32.const 1)
       )
      )
      (i32.store
       (i32.add
        (local.get $2)
        (local.get $4)
       )
       (local.get $4)
      )
      (br_if $block11
       (i32.ne
        (local.get $2)
        (local.get $8)
       )
      )
      (i32.store
       (i32.const 5916)
       (local.get $4)
      )
      (br $block1)
     )
     (if
      (i32.le_u
       (local.get $4)
       (i32.const 255)
      )
      (then
       (local.set $0
        (i32.add
         (i32.and
          (local.get $4)
          (i32.const 248)
         )
         (i32.const 5948)
        )
       )
       (local.set $3
        (block $block14 (result i32)
         (if
          (i32.eqz
           (i32.and
            (local.tee $3
             (i32.load
              (i32.const 5908)
             )
            )
            (local.tee $1
             (i32.shl
              (i32.const 1)
              (i32.shr_u
               (local.get $4)
               (i32.const 3)
              )
             )
            )
           )
          )
          (then
           (i32.store
            (i32.const 5908)
            (i32.or
             (local.get $1)
             (local.get $3)
            )
           )
           (br $block14
            (local.get $0)
           )
          )
         )
         (i32.load offset=8
          (local.get $0)
         )
        )
       )
       (i32.store offset=8
        (local.get $0)
        (local.get $2)
       )
       (i32.store offset=12
        (local.get $3)
        (local.get $2)
       )
       (i32.store offset=12
        (local.get $2)
        (local.get $0)
       )
       (i32.store offset=8
        (local.get $2)
        (local.get $3)
       )
       (br $block1)
      )
     )
     (local.set $1
      (i32.const 31)
     )
     (if
      (i32.le_u
       (local.get $4)
       (i32.const 16777215)
      )
      (then
       (local.set $1
        (i32.xor
         (i32.or
          (i32.and
           (i32.shr_u
            (local.get $4)
            (i32.sub
             (i32.const 38)
             (local.tee $0
              (i32.clz
               (i32.shr_u
                (local.get $4)
                (i32.const 8)
               )
              )
             )
            )
           )
           (i32.const 1)
          )
          (i32.shl
           (local.get $0)
           (i32.const 1)
          )
         )
         (i32.const 62)
        )
       )
      )
     )
     (i32.store offset=28
      (local.get $2)
      (local.get $1)
     )
     (i64.store offset=16 align=4
      (local.get $2)
      (i64.const 0)
     )
     (local.set $3
      (i32.add
       (i32.shl
        (local.get $1)
        (i32.const 2)
       )
       (i32.const 6212)
      )
     )
     (local.set $7
      (block $block17 (result i32)
       (block $block16
        (local.set $4
         (block $block15 (result i32)
          (if
           (i32.eqz
            (i32.and
             (local.tee $0
              (i32.load
               (i32.const 5912)
              )
             )
             (local.tee $7
              (i32.shl
               (i32.const 1)
               (local.get $1)
              )
             )
            )
           )
           (then
            (i32.store
             (i32.const 5912)
             (i32.or
              (local.get $0)
              (local.get $7)
             )
            )
            (i32.store
             (local.get $3)
             (local.get $2)
            )
            (local.set $1
             (i32.const 24)
            )
            (br $block15
             (i32.const 8)
            )
           )
          )
          (local.set $1
           (i32.shl
            (local.get $4)
            (select
             (i32.sub
              (i32.const 25)
              (i32.shr_u
               (local.get $1)
               (i32.const 1)
              )
             )
             (i32.const 0)
             (i32.ne
              (local.get $1)
              (i32.const 31)
             )
            )
           )
          )
          (local.set $3
           (i32.load
            (local.get $3)
           )
          )
          (loop $label3
           (br_if $block16
            (i32.eq
             (i32.and
              (i32.load offset=4
               (local.tee $0
                (local.get $3)
               )
              )
              (i32.const -8)
             )
             (local.get $4)
            )
           )
           (local.set $3
            (i32.shr_u
             (local.get $1)
             (i32.const 29)
            )
           )
           (local.set $1
            (i32.shl
             (local.get $1)
             (i32.const 1)
            )
           )
           (br_if $label3
            (local.tee $3
             (i32.load offset=16
              (local.tee $7
               (i32.add
                (local.get $0)
                (i32.and
                 (local.get $3)
                 (i32.const 4)
                )
               )
              )
             )
            )
           )
          )
          (i32.store offset=16
           (local.get $7)
           (local.get $2)
          )
          (local.set $1
           (i32.const 24)
          )
          (local.set $3
           (local.get $0)
          )
          (i32.const 8)
         )
        )
        (br $block17
         (local.tee $0
          (local.get $2)
         )
        )
       )
       (i32.store offset=12
        (local.tee $3
         (i32.load offset=8
          (local.get $0)
         )
        )
        (local.get $2)
       )
       (i32.store offset=8
        (local.get $0)
        (local.get $2)
       )
       (local.set $4
        (i32.const 24)
       )
       (local.set $1
        (i32.const 8)
       )
       (i32.const 0)
      )
     )
     (i32.store
      (i32.add
       (local.get $1)
       (local.get $2)
      )
      (local.get $3)
     )
     (i32.store offset=12
      (local.get $2)
      (local.get $0)
     )
     (i32.store
      (i32.add
       (local.get $2)
       (local.get $4)
      )
      (local.get $7)
     )
     (i32.store
      (i32.const 5940)
      (select
       (local.tee $0
        (i32.sub
         (i32.load
          (i32.const 5940)
         )
         (i32.const 1)
        )
       )
       (i32.const -1)
       (local.get $0)
      )
     )
    )
   )
  )
 )
 (func $3 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (i32.store
   (i32.const 1736)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1736)
     )
     (i32.const -536870913)
    )
    (select
     (i32.const 536870912)
     (i32.const 0)
     (i32.lt_u
      (local.tee $2
       (i32.add
        (local.tee $1
         (i32.load
          (i32.add
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 14)
            )
            (i32.const 124)
           )
           (i32.const 1588)
          )
         )
        )
        (i32.extend16_s
         (local.get $0)
        )
       )
      )
      (local.get $1)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $2)
  )
 )
 (func $4 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (i32.or
    (i32.and
     (local.tee $2
      (i32.load
       (i32.const 1736)
      )
     )
     (i32.const -536870913)
    )
    (select
     (i32.const 536870912)
     (i32.const 0)
     (i32.lt_u
      (local.tee $1
       (i32.add
        (local.tee $3
         (i32.load
          (i32.add
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 14)
            )
            (i32.const 124)
           )
           (i32.const 1588)
          )
         )
        )
        (i32.extend16_s
         (local.get $0)
        )
       )
      )
      (local.get $3)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1716)
     )
     (i32.const 268435455)
    )
    (i32.or
     (i32.and
      (i32.shr_u
       (local.get $2)
       (i32.const 3)
      )
      (i32.const 268435456)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $1)
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $1)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $5 (param $0 i32)
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (i32.add
    (i32.load
     (i32.add
      (i32.and
       (i32.shr_u
        (local.get $0)
        (i32.const 9)
       )
       (i32.const 124)
      )
      (i32.const 1588)
     )
    )
    (i32.load
     (i32.add
      (i32.and
       (i32.shr_u
        (local.get $0)
        (i32.const 14)
       )
       (i32.const 124)
      )
      (i32.const 1588)
     )
    )
   )
  )
 )
 (func $6 (param $0 i32)
  (local $1 i32)
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (i32.load
       (i32.const 1736)
      )
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.tee $1
         (i32.add
          (i32.load
           (i32.add
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 9)
             )
             (i32.const 124)
            )
            (i32.const 1588)
           )
          )
          (i32.load
           (i32.add
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
            )
            (i32.const 1588)
           )
          )
         )
        )
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $1)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $7 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (select
    (i32.or
     (local.tee $1
      (i32.load
       (i32.const 1736)
      )
     )
     (i32.const -1073741824)
    )
    (i32.and
     (local.get $1)
     (i32.const -1073741825)
    )
    (i32.lt_s
     (i32.and
      (i32.xor
       (local.tee $3
        (i32.add
         (local.tee $2
          (i32.load
           (i32.add
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 9)
             )
             (i32.const 124)
            )
            (i32.const 1588)
           )
          )
         )
         (local.tee $1
          (i32.load
           (i32.add
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
            )
            (i32.const 1588)
           )
          )
         )
        )
       )
       (local.get $1)
      )
      (i32.xor
       (i32.xor
        (local.get $1)
        (local.get $2)
       )
       (i32.const -1)
      )
     )
     (i32.const 0)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $3)
  )
 )
 (func $8 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (local.tee $2
    (select
     (i32.or
      (local.tee $1
       (i32.load
        (i32.const 1736)
       )
      )
      (i32.const -1073741824)
     )
     (i32.and
      (local.get $1)
      (i32.const -1073741825)
     )
     (i32.lt_s
      (i32.and
       (i32.xor
        (local.tee $1
         (i32.add
          (local.tee $3
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 9)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
          (local.tee $2
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
         )
        )
        (local.get $2)
       )
       (i32.xor
        (i32.xor
         (local.get $2)
         (local.get $3)
        )
        (i32.const -1)
       )
      )
      (i32.const 0)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (local.get $2)
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $1)
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $1)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $9 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (i32.store
   (i32.const 1736)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1736)
     )
     (i32.const -536870913)
    )
    (select
     (i32.const 536870912)
     (i32.const 0)
     (i32.lt_u
      (local.tee $2
       (i32.add
        (local.tee $1
         (i32.load
          (i32.add
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 9)
            )
            (i32.const 124)
           )
           (i32.const 1588)
          )
         )
        )
        (i32.load
         (i32.add
          (i32.and
           (i32.shr_u
            (local.get $0)
            (i32.const 14)
           )
           (i32.const 124)
          )
          (i32.const 1588)
         )
        )
       )
      )
      (local.get $1)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $2)
  )
 )
 (func $10 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (i32.or
    (i32.and
     (local.tee $2
      (i32.load
       (i32.const 1736)
      )
     )
     (i32.const -536870913)
    )
    (select
     (i32.const 536870912)
     (i32.const 0)
     (i32.lt_u
      (local.tee $1
       (i32.add
        (local.tee $3
         (i32.load
          (i32.add
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 9)
            )
            (i32.const 124)
           )
           (i32.const 1588)
          )
         )
        )
        (i32.load
         (i32.add
          (i32.and
           (i32.shr_u
            (local.get $0)
            (i32.const 14)
           )
           (i32.const 124)
          )
          (i32.const 1588)
         )
        )
       )
      )
      (local.get $3)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1716)
     )
     (i32.const 268435455)
    )
    (i32.or
     (i32.and
      (i32.shr_u
       (local.get $2)
       (i32.const 3)
      )
      (i32.const 268435456)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $1)
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $1)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $11 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1736)
   (select
    (i32.or
     (local.tee $4
      (i32.or
       (i32.and
        (i32.load
         (i32.const 1736)
        )
        (i32.const -536870913)
       )
       (select
        (i32.const 536870912)
        (i32.const 0)
        (i32.lt_u
         (local.tee $3
          (i32.add
           (local.tee $1
            (i32.load
             (i32.add
              (i32.and
               (i32.shr_u
                (local.get $0)
                (i32.const 9)
               )
               (i32.const 124)
              )
              (i32.const 1588)
             )
            )
           )
           (local.tee $2
            (i32.load
             (i32.add
              (i32.and
               (i32.shr_u
                (local.get $0)
                (i32.const 14)
               )
               (i32.const 124)
              )
              (i32.const 1588)
             )
            )
           )
          )
         )
         (local.get $1)
        )
       )
      )
     )
     (i32.const -1073741824)
    )
    (i32.and
     (local.get $4)
     (i32.const -1073741825)
    )
    (i32.lt_s
     (i32.and
      (i32.xor
       (local.get $2)
       (local.get $3)
      )
      (i32.xor
       (i32.xor
        (local.get $1)
        (local.get $2)
       )
       (i32.const -1)
      )
     )
     (i32.const 0)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $3)
  )
 )
 (func $12 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1736)
   (local.tee $1
    (select
     (i32.or
      (local.tee $4
       (i32.or
        (i32.and
         (i32.load
          (i32.const 1736)
         )
         (i32.const -536870913)
        )
        (select
         (i32.const 536870912)
         (i32.const 0)
         (i32.lt_u
          (local.tee $2
           (i32.add
            (local.tee $1
             (i32.load
              (i32.add
               (i32.and
                (i32.shr_u
                 (local.get $0)
                 (i32.const 9)
                )
                (i32.const 124)
               )
               (i32.const 1588)
              )
             )
            )
            (local.tee $3
             (i32.load
              (i32.add
               (i32.and
                (i32.shr_u
                 (local.get $0)
                 (i32.const 14)
                )
                (i32.const 124)
               )
               (i32.const 1588)
              )
             )
            )
           )
          )
          (local.get $1)
         )
        )
       )
      )
      (i32.const -1073741824)
     )
     (i32.and
      (local.get $4)
      (i32.const -1073741825)
     )
     (i32.lt_s
      (i32.and
       (i32.xor
        (local.get $2)
        (local.get $3)
       )
       (i32.xor
        (i32.xor
         (local.get $1)
         (local.get $3)
        )
        (i32.const -1)
       )
      )
      (i32.const 0)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (local.get $1)
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $2)
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $2)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $2)
  )
 )
 (func $13 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1736)
   (block $block1 (result i32)
    (block $block
     (if
      (i32.ge_u
       (local.tee $3
        (i32.add
         (i32.add
          (local.tee $1
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
          (i32.load
           (i32.add
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 9)
             )
             (i32.const 124)
            )
            (i32.const 1588)
           )
          )
         )
         (i32.shr_u
          (local.tee $4
           (i32.and
            (local.tee $2
             (i32.load
              (i32.const 1736)
             )
            )
            (i32.const 536870912)
           )
          )
          (i32.const 29)
         )
        )
       )
       (local.get $1)
      )
      (then
       (br_if $block
        (i32.eqz
         (local.get $4)
        )
       )
       (br_if $block
        (i32.ne
         (local.get $1)
         (local.get $3)
        )
       )
      )
     )
     (br $block1
      (i32.or
       (local.get $2)
       (i32.const 536870912)
      )
     )
    )
    (i32.and
     (local.get $2)
     (i32.const -536870913)
    )
   )
  )
  (i32.store offset=260
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1328)
   )
   (local.get $3)
  )
 )
 (func $14 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store
   (i32.const 1736)
   (select
    (i32.or
     (local.tee $2
      (block $block1 (result i32)
       (block $block
        (if
         (i32.ge_u
          (local.tee $3
           (i32.add
            (i32.add
             (local.tee $4
              (i32.load
               (i32.add
                (i32.and
                 (i32.shr_u
                  (local.get $0)
                  (i32.const 9)
                 )
                 (i32.const 124)
                )
                (i32.const 1588)
               )
              )
             )
             (local.tee $1
              (i32.load
               (i32.add
                (i32.and
                 (i32.shr_u
                  (local.get $0)
                  (i32.const 14)
                 )
                 (i32.const 124)
                )
                (i32.const 1588)
               )
              )
             )
            )
            (i32.shr_u
             (local.tee $5
              (i32.and
               (local.tee $2
                (i32.load
                 (i32.const 1736)
                )
               )
               (i32.const 536870912)
              )
             )
             (i32.const 29)
            )
           )
          )
          (local.get $1)
         )
         (then
          (br_if $block
           (i32.eqz
            (local.get $5)
           )
          )
          (br_if $block
           (i32.ne
            (local.get $1)
            (local.get $3)
           )
          )
         )
        )
        (br $block1
         (i32.or
          (local.get $2)
          (i32.const 536870912)
         )
        )
       )
       (i32.and
        (local.get $2)
        (i32.const -536870913)
       )
      )
     )
     (i32.const -1073741824)
    )
    (i32.and
     (local.get $2)
     (i32.const -1073741825)
    )
    (i32.lt_s
     (i32.and
      (i32.xor
       (local.get $1)
       (local.get $3)
      )
      (i32.xor
       (i32.xor
        (local.get $1)
        (local.get $4)
       )
       (i32.const -1)
      )
     )
     (i32.const 0)
    )
   )
  )
  (i32.store offset=260
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1328)
   )
   (local.get $3)
  )
 )
 (func $15 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1736)
   (local.tee $1
    (block $block1 (result i32)
     (block $block
      (if
       (i32.ge_u
        (local.tee $2
         (i32.add
          (i32.add
           (local.tee $1
            (i32.load
             (i32.add
              (i32.and
               (i32.shr_u
                (local.get $0)
                (i32.const 14)
               )
               (i32.const 124)
              )
              (i32.const 1588)
             )
            )
           )
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 9)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
          (i32.shr_u
           (local.tee $4
            (i32.and
             (local.tee $3
              (i32.load
               (i32.const 1736)
              )
             )
             (i32.const 536870912)
            )
           )
           (i32.const 29)
          )
         )
        )
        (local.get $1)
       )
       (then
        (br_if $block
         (i32.eqz
          (local.get $4)
         )
        )
        (br_if $block
         (i32.ne
          (local.get $1)
          (local.get $2)
         )
        )
       )
      )
      (br $block1
       (i32.or
        (local.get $3)
        (i32.const 536870912)
       )
      )
     )
     (i32.and
      (local.get $3)
      (i32.const -536870913)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1716)
     )
     (i32.const 268435455)
    )
    (i32.or
     (i32.and
      (i32.shr_u
       (local.get $1)
       (i32.const 3)
      )
      (i32.const 268435456)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $2)
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $2)
     )
    )
   )
  )
  (i32.store offset=260
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1328)
   )
   (local.get $2)
  )
 )
 (func $16 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store
   (i32.const 1736)
   (local.tee $1
    (select
     (i32.or
      (local.tee $3
       (block $block1 (result i32)
        (block $block
         (if
          (i32.ge_u
           (local.tee $2
            (i32.add
             (i32.add
              (local.tee $4
               (i32.load
                (i32.add
                 (i32.and
                  (i32.shr_u
                   (local.get $0)
                   (i32.const 9)
                  )
                  (i32.const 124)
                 )
                 (i32.const 1588)
                )
               )
              )
              (local.tee $1
               (i32.load
                (i32.add
                 (i32.and
                  (i32.shr_u
                   (local.get $0)
                   (i32.const 14)
                  )
                  (i32.const 124)
                 )
                 (i32.const 1588)
                )
               )
              )
             )
             (i32.shr_u
              (local.tee $5
               (i32.and
                (local.tee $3
                 (i32.load
                  (i32.const 1736)
                 )
                )
                (i32.const 536870912)
               )
              )
              (i32.const 29)
             )
            )
           )
           (local.get $1)
          )
          (then
           (br_if $block
            (i32.eqz
             (local.get $5)
            )
           )
           (br_if $block
            (i32.ne
             (local.get $1)
             (local.get $2)
            )
           )
          )
         )
         (br $block1
          (i32.or
           (local.get $3)
           (i32.const 536870912)
          )
         )
        )
        (i32.and
         (local.get $3)
         (i32.const -536870913)
        )
       )
      )
      (i32.const -1073741824)
     )
     (i32.and
      (local.get $3)
      (i32.const -1073741825)
     )
     (i32.lt_s
      (i32.and
       (i32.xor
        (local.get $1)
        (local.get $2)
       )
       (i32.xor
        (i32.xor
         (local.get $1)
         (local.get $4)
        )
        (i32.const -1)
       )
      )
      (i32.const 0)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (local.get $1)
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $2)
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $2)
     )
    )
   )
  )
  (i32.store offset=260
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1328)
   )
   (local.get $2)
  )
 )
 (func $17 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1736)
   (i32.or
    (select
     (i32.const 536870912)
     (select
      (i32.const 536870912)
      (i32.const 0)
      (i32.lt_u
       (local.tee $4
        (i32.sub
         (i32.add
          (local.tee $1
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
          (local.tee $3
           (i32.and
            (i32.shr_u
             (local.tee $2
              (i32.load
               (i32.const 1736)
              )
             )
             (i32.const 29)
            )
            (i32.const 1)
           )
          )
         )
         (i32.const 1)
        )
       )
       (local.get $1)
      )
     )
     (local.get $3)
    )
    (i32.and
     (local.get $2)
     (i32.const -536870913)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $4)
  )
 )
 (func $18 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store
   (i32.const 1736)
   (select
    (i32.or
     (local.tee $1
      (i32.or
       (select
        (i32.const 536870912)
        (select
         (i32.const 536870912)
         (i32.const 0)
         (i32.lt_u
          (local.tee $5
           (i32.sub
            (local.tee $4
             (i32.add
              (local.tee $3
               (i32.and
                (i32.shr_u
                 (local.tee $1
                  (i32.load
                   (i32.const 1736)
                  )
                 )
                 (i32.const 29)
                )
                (i32.const 1)
               )
              )
              (local.tee $2
               (i32.load
                (i32.add
                 (i32.and
                  (i32.shr_u
                   (local.get $0)
                   (i32.const 14)
                  )
                  (i32.const 124)
                 )
                 (i32.const 1588)
                )
               )
              )
             )
            )
            (i32.const 1)
           )
          )
          (local.get $2)
         )
        )
        (local.get $3)
       )
       (i32.and
        (local.get $1)
        (i32.const -536870913)
       )
      )
     )
     (i32.const -1073741824)
    )
    (i32.and
     (local.get $1)
     (i32.const -1073741825)
    )
    (i32.lt_s
     (i32.and
      (local.get $2)
      (i32.sub
       (i32.const 0)
       (local.get $4)
      )
     )
     (i32.const 0)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $5)
  )
 )
 (func $19 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1736)
   (i32.or
    (select
     (i32.const 536870912)
     (select
      (i32.const 536870912)
      (i32.const 0)
      (i32.lt_u
       (local.tee $1
        (i32.sub
         (i32.add
          (local.tee $3
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
          (local.tee $4
           (i32.and
            (i32.shr_u
             (local.tee $2
              (i32.load
               (i32.const 1736)
              )
             )
             (i32.const 29)
            )
            (i32.const 1)
           )
          )
         )
         (i32.const 1)
        )
       )
       (local.get $3)
      )
     )
     (local.get $4)
    )
    (i32.and
     (local.get $2)
     (i32.const -536870913)
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (i32.and
      (i32.shr_u
       (local.get $2)
       (i32.const 3)
      )
      (i32.const 268435456)
     )
    )
    (select
     (select
      (i32.const -2147483648)
      (i32.const 1073741824)
      (i32.lt_s
       (local.get $1)
       (i32.const 0)
      )
     )
     (i32.const 536870912)
     (local.get $1)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $20 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store
   (i32.const 1736)
   (local.tee $1
    (select
     (i32.or
      (local.tee $2
       (i32.or
        (select
         (i32.const 536870912)
         (select
          (i32.const 536870912)
          (i32.const 0)
          (i32.lt_u
           (local.tee $3
            (i32.sub
             (local.tee $5
              (i32.add
               (local.tee $4
                (i32.and
                 (i32.shr_u
                  (local.tee $2
                   (i32.load
                    (i32.const 1736)
                   )
                  )
                  (i32.const 29)
                 )
                 (i32.const 1)
                )
               )
               (local.tee $1
                (i32.load
                 (i32.add
                  (i32.and
                   (i32.shr_u
                    (local.get $0)
                    (i32.const 14)
                   )
                   (i32.const 124)
                  )
                  (i32.const 1588)
                 )
                )
               )
              )
             )
             (i32.const 1)
            )
           )
           (local.get $1)
          )
         )
         (local.get $4)
        )
        (i32.and
         (local.get $2)
         (i32.const -536870913)
        )
       )
      )
      (i32.const -1073741824)
     )
     (i32.and
      (local.get $2)
      (i32.const -1073741825)
     )
     (i32.lt_s
      (i32.and
       (local.get $1)
       (i32.sub
        (i32.const 0)
        (local.get $5)
       )
      )
      (i32.const 0)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (local.get $1)
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $3)
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $3)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $3)
  )
 )
 (func $21 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (i32.or
    (select
     (i32.const 536870912)
     (i32.const 0)
     (i32.lt_u
      (local.tee $3
       (i32.add
        (local.tee $2
         (i32.and
          (i32.shr_u
           (local.tee $1
            (i32.load
             (i32.const 1736)
            )
           )
           (i32.const 29)
          )
          (i32.const 1)
         )
        )
        (i32.load
         (i32.add
          (i32.and
           (i32.shr_u
            (local.get $0)
            (i32.const 14)
           )
           (i32.const 124)
          )
          (i32.const 1588)
         )
        )
       )
      )
      (local.get $2)
     )
    )
    (i32.and
     (local.get $1)
     (i32.const -536870913)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $3)
  )
 )
 (func $22 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1736)
   (select
    (i32.or
     (local.tee $1
      (i32.or
       (select
        (i32.const 536870912)
        (i32.const 0)
        (i32.lt_u
         (local.tee $2
          (i32.add
           (local.tee $3
            (i32.and
             (i32.shr_u
              (local.tee $1
               (i32.load
                (i32.const 1736)
               )
              )
              (i32.const 29)
             )
             (i32.const 1)
            )
           )
           (local.tee $4
            (i32.load
             (i32.add
              (i32.and
               (i32.shr_u
                (local.get $0)
                (i32.const 14)
               )
               (i32.const 124)
              )
              (i32.const 1588)
             )
            )
           )
          )
         )
         (local.get $3)
        )
       )
       (i32.and
        (local.get $1)
        (i32.const -536870913)
       )
      )
     )
     (i32.const -1073741824)
    )
    (i32.and
     (local.get $1)
     (i32.const -1073741825)
    )
    (i32.lt_s
     (i32.and
      (local.get $2)
      (i32.xor
       (local.get $4)
       (i32.const -1)
      )
     )
     (i32.const 0)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $2)
  )
 )
 (func $23 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (i32.or
    (select
     (i32.const 536870912)
     (i32.const 0)
     (i32.lt_u
      (local.tee $1
       (i32.add
        (local.tee $3
         (i32.and
          (i32.shr_u
           (local.tee $2
            (i32.load
             (i32.const 1736)
            )
           )
           (i32.const 29)
          )
          (i32.const 1)
         )
        )
        (i32.load
         (i32.add
          (i32.and
           (i32.shr_u
            (local.get $0)
            (i32.const 14)
           )
           (i32.const 124)
          )
          (i32.const 1588)
         )
        )
       )
      )
      (local.get $3)
     )
    )
    (i32.and
     (local.get $2)
     (i32.const -536870913)
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (i32.and
      (i32.shr_u
       (local.get $2)
       (i32.const 3)
      )
      (i32.const 268435456)
     )
    )
    (select
     (select
      (i32.const -2147483648)
      (i32.const 1073741824)
      (i32.lt_s
       (local.get $1)
       (i32.const 0)
      )
     )
     (i32.const 536870912)
     (local.get $1)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $24 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1736)
   (local.tee $1
    (select
     (i32.or
      (local.tee $1
       (i32.or
        (select
         (i32.const 536870912)
         (i32.const 0)
         (i32.lt_u
          (local.tee $2
           (i32.add
            (local.tee $3
             (i32.and
              (i32.shr_u
               (local.tee $1
                (i32.load
                 (i32.const 1736)
                )
               )
               (i32.const 29)
              )
              (i32.const 1)
             )
            )
            (local.tee $4
             (i32.load
              (i32.add
               (i32.and
                (i32.shr_u
                 (local.get $0)
                 (i32.const 14)
                )
                (i32.const 124)
               )
               (i32.const 1588)
              )
             )
            )
           )
          )
          (local.get $3)
         )
        )
        (i32.and
         (local.get $1)
         (i32.const -536870913)
        )
       )
      )
      (i32.const -1073741824)
     )
     (i32.and
      (local.get $1)
      (i32.const -1073741825)
     )
     (i32.lt_s
      (i32.and
       (local.get $2)
       (i32.xor
        (local.get $4)
        (i32.const -1)
       )
      )
      (i32.const 0)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (local.get $1)
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $2)
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $2)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $2)
  )
 )
 (func $25 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local.set $1
   (i32.sub
    (i32.extend16_s
     (local.get $0)
    )
    (local.tee $2
     (i32.load offset=260
      (i32.add
       (i32.and
        (i32.shr_u
         (local.get $0)
         (i32.const 14)
        )
        (i32.const 124)
       )
       (i32.const 1328)
      )
     )
    )
   )
  )
  (i32.store
   (i32.const 1736)
   (block $block (result i32)
    (if
     (i32.eq
      (i32.shl
       (local.get $0)
       (i32.const 16)
      )
      (i32.const -65536)
     )
     (then
      (br $block
       (i32.or
        (i32.load
         (i32.const 1736)
        )
        (i32.const 536870912)
       )
      )
     )
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1736)
      )
      (i32.const -536870913)
     )
     (select
      (i32.const 536870912)
      (i32.const 0)
      (i32.lt_u
       (local.get $1)
       (i32.xor
        (local.get $2)
        (i32.const -1)
       )
      )
     )
    )
   )
  )
  (i32.store offset=260
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1328)
   )
   (local.get $1)
  )
 )
 (func $26 (param $0 i32)
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (i32.sub
    (i32.load
     (i32.add
      (i32.and
       (i32.shr_u
        (local.get $0)
        (i32.const 9)
       )
       (i32.const 124)
      )
      (i32.const 1588)
     )
    )
    (i32.load
     (i32.add
      (i32.and
       (i32.shr_u
        (local.get $0)
        (i32.const 14)
       )
       (i32.const 124)
      )
      (i32.const 1588)
     )
    )
   )
  )
 )
 (func $27 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (select
    (i32.or
     (local.tee $1
      (i32.load
       (i32.const 1736)
      )
     )
     (i32.const -1073741824)
    )
    (i32.and
     (local.get $1)
     (i32.const -1073741825)
    )
    (i32.lt_s
     (i32.and
      (i32.xor
       (local.tee $3
        (i32.sub
         (local.tee $1
          (i32.load
           (i32.add
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 9)
             )
             (i32.const 124)
            )
            (i32.const 1588)
           )
          )
         )
         (local.tee $2
          (i32.load
           (i32.add
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
            )
            (i32.const 1588)
           )
          )
         )
        )
       )
       (local.get $1)
      )
      (i32.xor
       (local.get $1)
       (local.get $2)
      )
     )
     (i32.const 0)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $3)
  )
 )
 (func $28 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (i32.load
       (i32.const 1736)
      )
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (i32.const 536870912)
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.tee $3
         (i32.sub
          (local.tee $1
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 9)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
          (local.tee $2
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
         )
        )
        (i32.const 0)
       )
      )
      (i32.eq
       (local.get $1)
       (local.get $2)
      )
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $3)
  )
 )
 (func $29 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1736)
   (local.tee $4
    (select
     (i32.or
      (local.tee $1
       (i32.load
        (i32.const 1736)
       )
      )
      (i32.const -1073741824)
     )
     (i32.and
      (local.get $1)
      (i32.const -1073741825)
     )
     (i32.lt_s
      (i32.and
       (i32.xor
        (local.tee $3
         (i32.sub
          (local.tee $1
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 9)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
          (local.tee $2
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
         )
        )
        (local.get $1)
       )
       (i32.xor
        (local.get $1)
        (local.get $2)
       )
      )
      (i32.const 0)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (local.get $4)
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (i32.const 536870912)
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $3)
        (i32.const 0)
       )
      )
      (i32.eq
       (local.get $1)
       (local.get $2)
      )
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $3)
  )
 )
 (func $30 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (i32.store
   (i32.const 1736)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1736)
     )
     (i32.const -536870913)
    )
    (select
     (i32.const 536870912)
     (i32.const 0)
     (i32.ge_u
      (local.tee $1
       (i32.load
        (i32.add
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 9)
          )
          (i32.const 124)
         )
         (i32.const 1588)
        )
       )
      )
      (local.tee $2
       (i32.load
        (i32.add
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 14)
          )
          (i32.const 124)
         )
         (i32.const 1588)
        )
       )
      )
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (i32.sub
    (local.get $1)
    (local.get $2)
   )
  )
 )
 (func $31 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (select
    (i32.or
     (local.tee $2
      (i32.or
       (i32.and
        (i32.load
         (i32.const 1736)
        )
        (i32.const -536870913)
       )
       (select
        (i32.const 536870912)
        (i32.const 0)
        (i32.ge_u
         (local.tee $1
          (i32.load
           (i32.add
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 9)
             )
             (i32.const 124)
            )
            (i32.const 1588)
           )
          )
         )
         (local.tee $3
          (i32.load
           (i32.add
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
            )
            (i32.const 1588)
           )
          )
         )
        )
       )
      )
     )
     (i32.const -1073741824)
    )
    (i32.and
     (local.get $2)
     (i32.const -1073741825)
    )
    (i32.lt_s
     (i32.and
      (i32.xor
       (local.tee $2
        (i32.sub
         (local.get $1)
         (local.get $3)
        )
       )
       (local.get $1)
      )
      (i32.xor
       (local.get $1)
       (local.get $3)
      )
     )
     (i32.const 0)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $2)
  )
 )
 (func $32 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (i32.or
    (i32.and
     (local.tee $1
      (i32.load
       (i32.const 1736)
      )
     )
     (i32.const -536870913)
    )
    (select
     (i32.const 536870912)
     (i32.const 0)
     (i32.ge_u
      (local.tee $2
       (i32.load
        (i32.add
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 9)
          )
          (i32.const 124)
         )
         (i32.const 1588)
        )
       )
      )
      (local.tee $3
       (i32.load
        (i32.add
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 14)
          )
          (i32.const 124)
         )
         (i32.const 1588)
        )
       )
      )
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1716)
     )
     (i32.const 268435455)
    )
    (i32.or
     (i32.and
      (i32.shr_u
       (local.get $1)
       (i32.const 3)
      )
      (i32.const 268435456)
     )
     (select
      (i32.const 536870912)
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.tee $1
         (i32.sub
          (local.get $2)
          (local.get $3)
         )
        )
        (i32.const 0)
       )
      )
      (i32.eq
       (local.get $2)
       (local.get $3)
      )
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $33 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1736)
   (local.tee $4
    (select
     (i32.or
      (local.tee $2
       (i32.or
        (i32.and
         (i32.load
          (i32.const 1736)
         )
         (i32.const -536870913)
        )
        (select
         (i32.const 536870912)
         (i32.const 0)
         (i32.ge_u
          (local.tee $1
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 9)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
          (local.tee $3
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
         )
        )
       )
      )
      (i32.const -1073741824)
     )
     (i32.and
      (local.get $2)
      (i32.const -1073741825)
     )
     (i32.lt_s
      (i32.and
       (i32.xor
        (local.tee $2
         (i32.sub
          (local.get $1)
          (local.get $3)
         )
        )
        (local.get $1)
       )
       (i32.xor
        (local.get $1)
        (local.get $3)
       )
      )
      (i32.const 0)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (local.get $4)
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (i32.const 536870912)
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $2)
        (i32.const 0)
       )
      )
      (i32.eq
       (local.get $1)
       (local.get $3)
      )
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $2)
  )
 )
 (func $34 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $1
   (i32.add
    (i32.add
     (local.tee $2
      (i32.load
       (i32.add
        (i32.and
         (i32.shr_u
          (local.get $0)
          (i32.const 9)
         )
         (i32.const 124)
        )
        (i32.const 1588)
       )
      )
     )
     (local.tee $3
      (i32.xor
       (i32.load
        (i32.add
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 14)
          )
          (i32.const 124)
         )
         (i32.const 1588)
        )
       )
       (i32.const -1)
      )
     )
    )
    (i32.shr_u
     (local.tee $5
      (i32.and
       (local.tee $4
        (i32.load
         (i32.const 1736)
        )
       )
       (i32.const 536870912)
      )
     )
     (i32.const 29)
    )
   )
  )
  (if
   (i32.eqz
    (select
     (local.get $5)
     (i32.const 0)
     (i32.eq
      (local.get $2)
      (i32.const -1)
     )
    )
   )
   (then
    (i32.store
     (i32.const 1736)
     (i32.or
      (i32.and
       (local.get $4)
       (i32.const -536870913)
      )
      (select
       (i32.const 536870912)
       (i32.const 0)
       (i32.lt_u
        (local.get $1)
        (local.get $3)
       )
      )
     )
    )
   )
  )
  (i32.store offset=260
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1328)
   )
   (local.get $1)
  )
 )
 (func $35 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store
   (i32.const 1736)
   (select
    (i32.or
     (local.tee $2
      (select
       (select
        (local.tee $1
         (i32.load
          (i32.const 1736)
         )
        )
        (local.tee $3
         (i32.or
          (i32.and
           (local.get $1)
           (i32.const -536870913)
          )
          (select
           (i32.const 536870912)
           (i32.const 0)
           (i32.lt_u
            (local.tee $4
             (i32.add
              (local.tee $2
               (i32.shr_u
                (i32.and
                 (local.get $1)
                 (i32.const 536870912)
                )
                (i32.const 29)
               )
              )
              (i32.add
               (local.tee $1
                (i32.load
                 (i32.add
                  (i32.and
                   (i32.shr_u
                    (local.get $0)
                    (i32.const 9)
                   )
                   (i32.const 124)
                  )
                  (i32.const 1588)
                 )
                )
               )
               (local.tee $3
                (i32.xor
                 (local.tee $5
                  (i32.load
                   (i32.add
                    (i32.and
                     (i32.shr_u
                      (local.get $0)
                      (i32.const 14)
                     )
                     (i32.const 124)
                    )
                    (i32.const 1588)
                   )
                  )
                 )
                 (i32.const -1)
                )
               )
              )
             )
            )
            (local.get $3)
           )
          )
         )
        )
        (i32.eq
         (local.get $1)
         (i32.const -1)
        )
       )
       (local.get $3)
       (local.get $2)
      )
     )
     (i32.const -1073741824)
    )
    (i32.and
     (local.get $2)
     (i32.const -1073741825)
    )
    (i32.lt_s
     (i32.and
      (i32.xor
       (local.get $1)
       (local.get $4)
      )
      (i32.xor
       (local.get $1)
       (local.get $5)
      )
     )
     (i32.const 0)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $4)
  )
 )
 (func $36 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $1
   (i32.add
    (i32.add
     (local.tee $3
      (i32.load
       (i32.add
        (i32.and
         (i32.shr_u
          (local.get $0)
          (i32.const 9)
         )
         (i32.const 124)
        )
        (i32.const 1588)
       )
      )
     )
     (local.tee $4
      (i32.xor
       (i32.load
        (i32.add
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 14)
          )
          (i32.const 124)
         )
         (i32.const 1588)
        )
       )
       (i32.const -1)
      )
     )
    )
    (i32.shr_u
     (local.tee $5
      (i32.and
       (local.tee $2
        (i32.load
         (i32.const 1736)
        )
       )
       (i32.const 536870912)
      )
     )
     (i32.const 29)
    )
   )
  )
  (if
   (i32.eqz
    (select
     (local.get $5)
     (i32.const 0)
     (i32.eq
      (local.get $3)
      (i32.const -1)
     )
    )
   )
   (then
    (i32.store
     (i32.const 1736)
     (local.tee $2
      (i32.or
       (i32.and
        (local.get $2)
        (i32.const -536870913)
       )
       (select
        (i32.const 536870912)
        (i32.const 0)
        (i32.lt_u
         (local.get $1)
         (local.get $4)
        )
       )
      )
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (local.get $2)
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $1)
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $1)
     )
    )
   )
  )
  (i32.store offset=260
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1328)
   )
   (local.get $1)
  )
 )
 (func $37 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store
   (i32.const 1736)
   (local.tee $2
    (select
     (i32.or
      (local.tee $3
       (select
        (select
         (local.tee $1
          (i32.load
           (i32.const 1736)
          )
         )
         (local.tee $4
          (i32.or
           (i32.and
            (local.get $1)
            (i32.const -536870913)
           )
           (select
            (i32.const 536870912)
            (i32.const 0)
            (i32.lt_u
             (local.tee $1
              (i32.add
               (local.tee $3
                (i32.shr_u
                 (i32.and
                  (local.get $1)
                  (i32.const 536870912)
                 )
                 (i32.const 29)
                )
               )
               (i32.add
                (local.tee $2
                 (i32.load
                  (i32.add
                   (i32.and
                    (i32.shr_u
                     (local.get $0)
                     (i32.const 9)
                    )
                    (i32.const 124)
                   )
                   (i32.const 1588)
                  )
                 )
                )
                (local.tee $4
                 (i32.xor
                  (local.tee $5
                   (i32.load
                    (i32.add
                     (i32.and
                      (i32.shr_u
                       (local.get $0)
                       (i32.const 14)
                      )
                      (i32.const 124)
                     )
                     (i32.const 1588)
                    )
                   )
                  )
                  (i32.const -1)
                 )
                )
               )
              )
             )
             (local.get $4)
            )
           )
          )
         )
         (i32.eq
          (local.get $2)
          (i32.const -1)
         )
        )
        (local.get $4)
        (local.get $3)
       )
      )
      (i32.const -1073741824)
     )
     (i32.and
      (local.get $3)
      (i32.const -1073741825)
     )
     (i32.lt_s
      (i32.and
       (i32.xor
        (local.get $1)
        (local.get $2)
       )
       (i32.xor
        (local.get $2)
        (local.get $5)
       )
      )
      (i32.const 0)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (local.get $2)
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $1)
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $1)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $38 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (i32.store
   (i32.const 1736)
   (select
    (local.tee $1
     (i32.load
      (i32.const 1736)
     )
    )
    (i32.or
     (local.get $1)
     (i32.const 536870912)
    )
    (i32.eq
     (local.tee $2
      (i32.load
       (i32.add
        (i32.and
         (i32.shr_u
          (local.get $0)
          (i32.const 14)
         )
         (i32.const 124)
        )
        (i32.const 1588)
       )
      )
     )
     (i32.const -1)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (i32.sub
    (i32.sub
     (i32.and
      (i32.shr_u
       (local.get $1)
       (i32.const 29)
      )
      (i32.const 1)
     )
     (local.get $2)
    )
    (i32.const 2)
   )
  )
 )
 (func $39 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (select
    (select
     (i32.or
      (local.tee $2
       (select
        (local.tee $1
         (i32.load
          (i32.const 1736)
         )
        )
        (i32.or
         (local.get $1)
         (i32.const 536870912)
        )
        (i32.eq
         (local.tee $3
          (i32.load
           (i32.add
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
            )
            (i32.const 1588)
           )
          )
         )
         (i32.const -1)
        )
       )
      )
      (i32.const -1073741824)
     )
     (local.tee $2
      (i32.and
       (local.get $2)
       (i32.const -1073741825)
      )
     )
     (i32.gt_s
      (local.tee $1
       (i32.sub
        (i32.sub
         (i32.and
          (i32.shr_u
           (local.get $1)
           (i32.const 29)
          )
          (i32.const 1)
         )
         (local.get $3)
        )
        (i32.const 2)
       )
      )
      (i32.const 0)
     )
    )
    (local.get $2)
    (i32.eq
     (local.get $1)
     (local.get $3)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $40 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (local.tee $3
    (select
     (local.tee $1
      (i32.load
       (i32.const 1736)
      )
     )
     (i32.or
      (local.get $1)
      (i32.const 536870912)
     )
     (i32.eq
      (local.tee $2
       (i32.load
        (i32.add
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 14)
          )
          (i32.const 124)
         )
         (i32.const 1588)
        )
       )
      )
      (i32.const -1)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.or
     (i32.and
      (i32.shr_u
       (local.get $3)
       (i32.const 3)
      )
      (i32.const 268435456)
     )
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
    )
    (select
     (select
      (i32.const -2147483648)
      (i32.const 1073741824)
      (i32.lt_s
       (local.tee $1
        (i32.sub
         (i32.sub
          (i32.and
           (i32.shr_u
            (local.get $1)
            (i32.const 29)
           )
           (i32.const 1)
          )
          (local.get $2)
         )
         (i32.const 2)
        )
       )
       (i32.const 0)
      )
     )
     (i32.const 536870912)
     (local.get $1)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $41 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (local.tee $2
    (select
     (select
      (i32.or
       (local.tee $3
        (select
         (local.tee $1
          (i32.load
           (i32.const 1736)
          )
         )
         (i32.or
          (local.get $1)
          (i32.const 536870912)
         )
         (i32.eq
          (local.tee $2
           (i32.load
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
             )
             (i32.const 1588)
            )
           )
          )
          (i32.const -1)
         )
        )
       )
       (i32.const -1073741824)
      )
      (local.tee $3
       (i32.and
        (local.get $3)
        (i32.const -1073741825)
       )
      )
      (i32.gt_s
       (local.tee $1
        (i32.sub
         (i32.sub
          (i32.and
           (i32.shr_u
            (local.get $1)
            (i32.const 29)
           )
           (i32.const 1)
          )
          (local.get $2)
         )
         (i32.const 2)
        )
       )
       (i32.const 0)
      )
     )
     (local.get $3)
     (i32.eq
      (local.get $1)
      (local.get $2)
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (local.get $2)
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $1)
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $1)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $42 (param $0 i32)
  (local $1 i32)
  (i32.store
   (i32.const 1736)
   (select
    (i32.and
     (local.tee $1
      (i32.load
       (i32.const 1736)
      )
     )
     (i32.const -536870913)
    )
    (local.get $1)
    (local.tee $1
     (i32.add
      (i32.and
       (i32.shr_u
        (local.get $1)
        (i32.const 29)
       )
       (i32.const 1)
      )
      (i32.xor
       (i32.load
        (i32.add
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 14)
          )
          (i32.const 124)
         )
         (i32.const 1588)
        )
       )
       (i32.const -1)
      )
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $43 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1736)
   (select
    (select
     (i32.or
      (local.tee $2
       (select
        (i32.and
         (local.tee $1
          (i32.load
           (i32.const 1736)
          )
         )
         (i32.const -536870913)
        )
        (local.get $1)
        (local.tee $1
         (i32.add
          (i32.and
           (i32.shr_u
            (local.get $1)
            (i32.const 29)
           )
           (i32.const 1)
          )
          (i32.xor
           (local.tee $3
            (i32.load
             (i32.add
              (i32.and
               (i32.shr_u
                (local.get $0)
                (i32.const 14)
               )
               (i32.const 124)
              )
              (i32.const 1588)
             )
            )
           )
           (i32.const -1)
          )
         )
        )
       )
      )
      (i32.const -1073741824)
     )
     (local.tee $2
      (i32.and
       (local.get $2)
       (i32.const -1073741825)
      )
     )
     (i32.eq
      (local.get $1)
      (local.get $3)
     )
    )
    (local.get $2)
    (local.get $1)
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $44 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (i32.store
   (i32.const 1736)
   (local.tee $2
    (select
     (i32.and
      (local.tee $1
       (i32.load
        (i32.const 1736)
       )
      )
      (i32.const -536870913)
     )
     (local.get $1)
     (local.tee $1
      (i32.add
       (i32.and
        (i32.shr_u
         (local.get $1)
         (i32.const 29)
        )
        (i32.const 1)
       )
       (i32.xor
        (i32.load
         (i32.add
          (i32.and
           (i32.shr_u
            (local.get $0)
            (i32.const 14)
           )
           (i32.const 124)
          )
          (i32.const 1588)
         )
        )
        (i32.const -1)
       )
      )
     )
    )
   )
  )
  (i32.store
   (i32.const 1716)
   (i32.or
    (i32.and
     (i32.shr_u
      (local.get $2)
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1716)
      )
      (i32.const 268435455)
     )
     (select
      (select
       (i32.const -2147483648)
       (i32.const 1073741824)
       (i32.lt_s
        (local.get $1)
        (i32.const 0)
       )
      )
      (i32.const 536870912)
      (local.get $1)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1588)
   )
   (local.get $1)
  )
 )
 (func $45 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $1
   (i32.and
    (local.tee $3
     (i32.load
      (i32.const 1736)
     )
    )
    (i32.const -536870913)
   )
  )
  (local.set $4
   (i32.load
    (i32.const 1716)
   )
  )
  (i32.store
   (i32.const 1716)
   (block $block1 (result i32)
    (block $block
     (br_if $block
      (i32.eqz
       (local.tee $2
        (i32.add
         (i32.and
          (i32.shr_u
           (local.get $3)
           (i32.const 29)
          )
          (i32.const 1)
         )
         (i32.xor
          (local.tee $5
           (i32.load offset=260
            (i32.add
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
             )
             (i32.const 1328)
            )
           )
          )
          (i32.const -1)
         )
        )
       )
      )
     )
     (br_if $block
      (i32.ne
       (local.get $2)
       (local.get $5)
      )
     )
     (local.set $1
      (i32.or
       (local.get $1)
       (i32.const -1073741824)
      )
     )
     (br $block1
      (i32.or
       (i32.and
        (local.get $4)
        (i32.const 268435455)
       )
       (select
        (i32.const -1879048192)
        (i32.const 1342177280)
        (i32.lt_s
         (local.get $5)
         (i32.const 0)
        )
       )
      )
     )
    )
    (local.set $1
     (i32.and
      (local.tee $3
       (select
        (local.get $1)
        (local.get $3)
        (local.get $2)
       )
      )
      (i32.const -1073741825)
     )
    )
    (i32.or
     (i32.and
      (local.get $4)
      (i32.const 268435455)
     )
     (i32.or
      (i32.and
       (i32.shr_u
        (local.get $3)
        (i32.const 3)
       )
       (i32.const 268435456)
      )
      (select
       (select
        (i32.const -2147483648)
        (i32.const 1073741824)
        (i32.lt_s
         (local.get $2)
         (i32.const 0)
        )
       )
       (i32.const 536870912)
       (local.get $2)
      )
     )
    )
   )
  )
  (i32.store
   (i32.const 1736)
   (local.get $1)
  )
  (i32.store offset=260
   (i32.add
    (i32.and
     (i32.shr_u
      (local.get $0)
      (i32.const 19)
     )
     (i32.const 124)
    )
    (i32.const 1328)
   )
   (local.get $2)
  )
 )
 (func $46 (param $0 i32)
  (local $1 i32)
  (block $block
   (local.set $1
    (if (result i32)
     (i32.eq
      (local.tee $0
       (i32.load
        (i32.const 1320)
       )
      )
      (i32.const 1304)
     )
     (then
      (i32.const 16)
     )
     (else
      (br_if $block
       (i32.eqz
        (local.get $0)
       )
      )
      (i32.const 20)
     )
    )
   )
   (call_indirect (type $0)
    (local.get $0)
    (i32.load
     (i32.add
      (i32.load
       (local.get $0)
      )
      (local.get $1)
     )
    )
   )
  )
 )
 (func $47 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (result i64)
  (local $7 i32)
  (i64.store align=4
   (i32.const 1708)
   (i64.const -6917528891812741090)
  )
  (i64.store align=4
   (i32.const 1700)
   (i64.const -6917528900402675684)
  )
  (i64.store align=4
   (i32.const 1692)
   (i64.const -6917528908992610278)
  )
  (i64.store align=4
   (i32.const 1684)
   (i64.const -6917528917582544872)
  )
  (i64.store align=4
   (i32.const 1676)
   (i64.const -6917528926172479466)
  )
  (i64.store align=4
   (i32.const 1668)
   (i64.const -6917528934762414060)
  )
  (i64.store align=4
   (i32.const 1660)
   (i64.const -6917528943352348654)
  )
  (i64.store align=4
   (i32.const 1652)
   (i64.const -6917528951942283248)
  )
  (i64.store align=4
   (i32.const 1644)
   (i64.const -6917528960532217842)
  )
  (i64.store align=4
   (i32.const 1636)
   (i64.const -6917528969122152436)
  )
  (i64.store align=4
   (i32.const 1628)
   (i64.const -6917528977712087030)
  )
  (i64.store align=4
   (i32.const 1620)
   (i64.const -6917528986302021624)
  )
  (i64.store align=4
   (i32.const 1612)
   (i64.const -6917528994891956218)
  )
  (i32.store
   (i32.const 1604)
   (i32.const -1610612732)
  )
  (i64.store align=4
   (i32.const 1596)
   (i64.const -6917529012071825406)
  )
  (i64.store align=4
   (i32.const 1588)
   (i64.const -6917529020661760000)
  )
  (i32.store offset=1588
   (i32.shl
    (local.tee $7
     (select
      (i32.const 4)
      (i32.const 0)
      (i32.ne
       (local.get $6)
       (i32.const 3)
      )
     )
    )
    (i32.const 2)
   )
   (local.get $2)
  )
  (i32.store
   (i32.const 1736)
   (local.get $4)
  )
  (i32.store
   (i32.const 1608)
   (local.get $3)
  )
  (i32.store
   (i32.const 1716)
   (local.get $5)
  )
  (call_indirect (type $0)
   (i32.or
    (i32.or
     (i32.shl
      (local.tee $2
       (select
        (i32.const 4)
        (select
         (i32.const 5)
         (i32.const 3)
         (i32.eq
          (local.get $6)
          (i32.const 2)
         )
        )
        (i32.eq
         (local.get $6)
         (i32.const 1)
        )
       )
      )
      (i32.const 21)
     )
     (i32.shl
      (local.get $7)
      (i32.const 16)
     )
    )
    (select
     (i32.const 10240)
     (i32.and
      (local.get $3)
      (i32.const 65535)
     )
     (i32.ne
      (i32.and
       (local.get $0)
       (i32.const -5)
      )
      (i32.const 1)
     )
    )
   )
   (i32.load offset=1024
    (i32.add
     (i32.shl
      (local.get $0)
      (i32.const 4)
     )
     (i32.shl
      (local.get $1)
      (i32.const 2)
     )
    )
   )
  )
  (i64.or
   (i64.load32_u offset=1588
    (i32.shl
     (local.get $2)
     (i32.const 2)
    )
   )
   (i64.shl
    (i64.load32_u
     (i32.const 1736)
    )
    (i64.const 32)
   )
  )
 )
 (func $48 (result i32)
  (i32.load
   (i32.const 1716)
  )
 )
 (func $49 (param $0 i32) (result i32)
  (i32.load offset=1588
   (i32.shl
    (local.get $0)
    (i32.const 2)
   )
  )
 )
 (func $50 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (i32.store
   (i32.const 5904)
   (i32.load offset=1024
    (i32.shl
     (local.get $0)
     (i32.const 4)
    )
   )
  )
  (i32.store
   (i32.const 1736)
   (i32.const 0)
  )
  (block $block
   (br_if $block
    (i32.eqz
     (local.get $2)
    )
   )
   (local.set $4
    (i32.and
     (local.get $0)
     (i32.const -5)
    )
   )
   (if
    (i32.eqz
     (local.get $1)
    )
    (then
     (local.set $0
      (i32.const -889318860)
     )
     (if
      (i32.eq
       (local.get $4)
       (i32.const 1)
      )
      (then
       (local.set $1
        (i32.const 0)
       )
       (loop $label
        (i32.store
         (i32.const 1604)
         (local.tee $0
          (i32.xor
           (i32.shl
            (local.tee $0
             (i32.xor
              (i32.shr_u
               (local.tee $0
                (i32.xor
                 (i32.shl
                  (local.get $0)
                  (i32.const 13)
                 )
                 (local.get $0)
                )
               )
               (i32.const 17)
              )
              (local.get $0)
             )
            )
            (i32.const 5)
           )
           (local.get $0)
          )
         )
        )
        (i32.store
         (i32.const 1608)
         (local.tee $4
          (i32.rotl
           (local.get $0)
           (i32.const 16)
          )
         )
        )
        (call_indirect (type $0)
         (i32.or
          (i32.and
           (local.get $4)
           (i32.const 65535)
          )
          (i32.const 6553600)
         )
         (i32.load
          (i32.const 5904)
         )
        )
        (local.set $3
         (i32.xor
          (i32.add
           (i32.load
            (i32.const 1736)
           )
           (i32.load
            (i32.const 1600)
           )
          )
          (local.get $3)
         )
        )
        (br_if $label
         (i32.ne
          (local.tee $1
           (i32.add
            (local.get $1)
            (i32.const 1)
           )
          )
          (local.get $2)
         )
        )
       )
       (br $block)
      )
     )
     (local.set $1
      (i32.const 0)
     )
     (loop $label1
      (i32.store
       (i32.const 1604)
       (local.tee $0
        (i32.xor
         (i32.shl
          (local.tee $0
           (i32.xor
            (i32.shr_u
             (local.tee $0
              (i32.xor
               (i32.shl
                (local.get $0)
                (i32.const 13)
               )
               (local.get $0)
              )
             )
             (i32.const 17)
            )
            (local.get $0)
           )
          )
          (i32.const 5)
         )
         (local.get $0)
        )
       )
      )
      (i32.store
       (i32.const 1608)
       (i32.rotl
        (local.get $0)
        (i32.const 16)
       )
      )
      (call_indirect (type $0)
       (i32.const 6563840)
       (i32.load
        (i32.const 5904)
       )
      )
      (local.set $3
       (i32.xor
        (i32.add
         (i32.load
          (i32.const 1736)
         )
         (i32.load
          (i32.const 1600)
         )
        )
        (local.get $3)
       )
      )
      (br_if $label1
       (i32.ne
        (local.tee $1
         (i32.add
          (local.get $1)
          (i32.const 1)
         )
        )
        (local.get $2)
       )
      )
     )
     (br $block)
    )
   )
   (local.set $1
    (select
     (i32.const 6553603)
     (i32.const 6563840)
     (i32.eq
      (local.get $4)
      (i32.const 1)
     )
    )
   )
   (local.set $0
    (i32.const 0)
   )
   (if
    (i32.ne
     (local.get $2)
     (i32.const 1)
    )
    (then
     (local.set $4
      (i32.and
       (local.get $2)
       (i32.const 1)
      )
     )
     (local.set $6
      (i32.and
       (local.get $2)
       (i32.const -2)
      )
     )
     (local.set $2
      (i32.const 0)
     )
     (loop $label2
      (i32.store
       (i32.const 1608)
       (i32.const 3)
      )
      (i32.store
       (i32.const 1604)
       (local.tee $5
        (i32.and
         (local.get $0)
         (i32.const 254)
        )
       )
      )
      (call_indirect (type $0)
       (local.get $1)
       (i32.load
        (i32.const 5904)
       )
      )
      (i32.store
       (i32.const 1608)
       (i32.const 3)
      )
      (i32.store
       (i32.const 1604)
       (i32.or
        (local.get $5)
        (i32.const 1)
       )
      )
      (local.set $5
       (i32.load
        (i32.const 1736)
       )
      )
      (local.set $7
       (i32.load
        (i32.const 1600)
       )
      )
      (call_indirect (type $0)
       (local.get $1)
       (i32.load
        (i32.const 5904)
       )
      )
      (local.set $3
       (i32.xor
        (i32.add
         (i32.load
          (i32.const 1736)
         )
         (i32.load
          (i32.const 1600)
         )
        )
        (i32.xor
         (i32.add
          (local.get $5)
          (local.get $7)
         )
         (local.get $3)
        )
       )
      )
      (local.set $0
       (i32.add
        (local.get $0)
        (i32.const 2)
       )
      )
      (br_if $label2
       (i32.ne
        (local.tee $2
         (i32.add
          (local.get $2)
          (i32.const 2)
         )
        )
        (local.get $6)
       )
      )
     )
     (br_if $block
      (i32.eqz
       (local.get $4)
      )
     )
    )
   )
   (i32.store
    (i32.const 1608)
    (i32.const 3)
   )
   (i32.store
    (i32.const 1604)
    (i32.and
     (local.get $0)
     (i32.const 255)
    )
   )
   (call_indirect (type $0)
    (local.get $1)
    (i32.load
     (i32.const 5904)
    )
   )
   (local.set $3
    (i32.xor
     (i32.add
      (i32.load
       (i32.const 1736)
      )
      (i32.load
       (i32.const 1600)
      )
     )
     (local.get $3)
    )
   )
  )
  (local.get $3)
 )
 (func $51 (param $0 i32)
  (global.set $global$0
   (local.get $0)
  )
 )
 (func $52 (result i32)
  (global.get $global$0)
 )
 (func $53 (param $0 i32) (param $1 i32)
  (if
   (i32.eqz
    (i32.load
     (i32.const 6380)
    )
   )
   (then
    (i32.store
     (i32.const 6384)
     (local.get $1)
    )
    (i32.store
     (i32.const 6380)
     (local.get $0)
    )
   )
  )
 )
)
