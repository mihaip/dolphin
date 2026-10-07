(module
 (type $0 (func (param i32)))
 (type $1 (func (result i32)))
 (type $2 (func))
 (type $3 (func (param i32 i32)))
 (type $4 (func (param i32 i32 i32 i32 i32 i32 i32) (result i64)))
 (type $5 (func (param i32) (result i32)))
 (type $6 (func (param i32 i32 i32) (result i32)))
 (global $global$0 (mut i32) (i32.const 71472))
 (memory $0 258 258)
 (data $0 (i32.const 1024) "\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\t\00\00\00\n\00\00\00\0b\00\00\00\0c\00\00\00\r\00\00\00\0e\00\00\00\0f\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\13\00\00\00\14\00\00\00\14\00\00\00\14\00\00\00\14\00\00\00\15\00\00\00\16\00\00\00\17\00\00\00\18\00\00\00\19\00\00\00\1a\00\00\00\1b\00\00\00\1c\00\00\00\1d\00\00\00\1e\00\00\00\1f\00\00\00 \00\00\00!\00\00\00\"\00\00\00#\00\00\00$\00\00\00%\00\00\00&\00\00\00\'\00\00\00(\00\00\00)\00\00\00*\00\00\00+\00\00\00,")
 (table $0 45 45 funcref)
 (elem $0 (i32.const 1) $0 $14 $16 $15 $17 $4 $5 $10 $11 $12 $13 $18 $20 $19 $21 $22 $24 $23 $25 $26 $31 $33 $32 $34 $35 $37 $36 $38 $39 $41 $40 $42 $43 $45 $44 $46 $6 $7 $8 $9 $27 $29 $28 $30)
 (export "memory" (memory $0))
 (export "check" (func $47))
 (export "get_cr" (func $48))
 (export "get_gpr" (func $49))
 (export "run" (func $50))
 (export "_initialize" (func $0))
 (export "__indirect_function_table" (table $0))
 (export "setThrew" (func $3))
 (export "_emscripten_stack_restore" (func $1))
 (export "emscripten_stack_get_current" (func $2))
 (func $0
  (i32.store
   (i32.const 5860)
   (i32.const 8192)
  )
  (i32.store
   (i32.const 5852)
   (i32.const 71472)
  )
  (i32.store
   (i32.const 5828)
   (i32.const 42)
  )
  (i32.store
   (i32.const 5856)
   (i32.const 65536)
  )
 )
 (func $1 (param $0 i32)
  (global.set $global$0
   (local.get $0)
  )
 )
 (func $2 (result i32)
  (global.get $global$0)
 )
 (func $3 (param $0 i32) (param $1 i32)
  (if
   (i32.eqz
    (i32.load
     (i32.const 1216)
    )
   )
   (then
    (i32.store
     (i32.const 1220)
     (local.get $1)
    )
    (i32.store
     (i32.const 1216)
     (local.get $0)
    )
   )
  )
 )
 (func $4 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (i32.store
   (i32.const 1632)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1632)
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
         (i32.load offset=1484
          (i32.and
           (i32.shr_u
            (local.get $0)
            (i32.const 14)
           )
           (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $2)
  )
 )
 (func $5 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
   (i32.or
    (i32.and
     (local.tee $2
      (i32.load
       (i32.const 1632)
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
         (i32.load offset=1484
          (i32.and
           (i32.shr_u
            (local.get $0)
            (i32.const 14)
           )
           (i32.const 124)
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
   (i32.const 1612)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $6 (param $0 i32)
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (i32.add
    (i32.load offset=1484
     (i32.and
      (i32.shr_u
       (local.get $0)
       (i32.const 9)
      )
      (i32.const 124)
     )
    )
    (i32.load offset=1484
     (i32.and
      (i32.shr_u
       (local.get $0)
       (i32.const 14)
      )
      (i32.const 124)
     )
    )
   )
  )
 )
 (func $7 (param $0 i32)
  (local $1 i32)
  (i32.store
   (i32.const 1612)
   (i32.or
    (i32.and
     (i32.shr_u
      (i32.load
       (i32.const 1632)
      )
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1612)
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
          (i32.load offset=1484
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 9)
            )
            (i32.const 124)
           )
          )
          (i32.load offset=1484
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 14)
            )
            (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $8 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
   (select
    (i32.or
     (local.tee $1
      (i32.load
       (i32.const 1632)
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
          (i32.load offset=1484
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 9)
            )
            (i32.const 124)
           )
          )
         )
         (local.tee $1
          (i32.load offset=1484
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 14)
            )
            (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $3)
  )
 )
 (func $9 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
   (local.tee $2
    (select
     (i32.or
      (local.tee $1
       (i32.load
        (i32.const 1632)
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
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 9)
             )
             (i32.const 124)
            )
           )
          )
          (local.tee $2
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
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
   (i32.const 1612)
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
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $10 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (i32.store
   (i32.const 1632)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1632)
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
         (i32.load offset=1484
          (i32.and
           (i32.shr_u
            (local.get $0)
            (i32.const 9)
           )
           (i32.const 124)
          )
         )
        )
        (i32.load offset=1484
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 14)
          )
          (i32.const 124)
         )
        )
       )
      )
      (local.get $1)
     )
    )
   )
  )
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $2)
  )
 )
 (func $11 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
   (i32.or
    (i32.and
     (local.tee $2
      (i32.load
       (i32.const 1632)
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
         (i32.load offset=1484
          (i32.and
           (i32.shr_u
            (local.get $0)
            (i32.const 9)
           )
           (i32.const 124)
          )
         )
        )
        (i32.load offset=1484
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 14)
          )
          (i32.const 124)
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
   (i32.const 1612)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $12 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1632)
   (select
    (i32.or
     (local.tee $4
      (i32.or
       (i32.and
        (i32.load
         (i32.const 1632)
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
            (i32.load offset=1484
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 9)
              )
              (i32.const 124)
             )
            )
           )
           (local.tee $2
            (i32.load offset=1484
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $3)
  )
 )
 (func $13 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1632)
   (local.tee $1
    (select
     (i32.or
      (local.tee $4
       (i32.or
        (i32.and
         (i32.load
          (i32.const 1632)
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
             (i32.load offset=1484
              (i32.and
               (i32.shr_u
                (local.get $0)
                (i32.const 9)
               )
               (i32.const 124)
              )
             )
            )
            (local.tee $3
             (i32.load offset=1484
              (i32.and
               (i32.shr_u
                (local.get $0)
                (i32.const 14)
               )
               (i32.const 124)
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
   (i32.const 1612)
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
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $2)
  )
 )
 (func $14 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1632)
   (block $block1 (result i32)
    (block $block
     (if
      (i32.ge_u
       (local.tee $3
        (i32.add
         (i32.add
          (local.tee $1
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
            )
           )
          )
          (i32.load offset=1484
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 9)
            )
            (i32.const 124)
           )
          )
         )
         (i32.shr_u
          (local.tee $4
           (i32.and
            (local.tee $2
             (i32.load
              (i32.const 1632)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $3)
  )
 )
 (func $15 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store
   (i32.const 1632)
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
              (i32.load offset=1484
               (i32.and
                (i32.shr_u
                 (local.get $0)
                 (i32.const 9)
                )
                (i32.const 124)
               )
              )
             )
             (local.tee $1
              (i32.load offset=1484
               (i32.and
                (i32.shr_u
                 (local.get $0)
                 (i32.const 14)
                )
                (i32.const 124)
               )
              )
             )
            )
            (i32.shr_u
             (local.tee $5
              (i32.and
               (local.tee $2
                (i32.load
                 (i32.const 1632)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $3)
  )
 )
 (func $16 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1632)
   (local.tee $1
    (block $block1 (result i32)
     (block $block
      (if
       (i32.ge_u
        (local.tee $2
         (i32.add
          (i32.add
           (local.tee $1
            (i32.load offset=1484
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
             )
            )
           )
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 9)
             )
             (i32.const 124)
            )
           )
          )
          (i32.shr_u
           (local.tee $4
            (i32.and
             (local.tee $3
              (i32.load
               (i32.const 1632)
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
   (i32.const 1612)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $2)
  )
 )
 (func $17 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store
   (i32.const 1632)
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
               (i32.load offset=1484
                (i32.and
                 (i32.shr_u
                  (local.get $0)
                  (i32.const 9)
                 )
                 (i32.const 124)
                )
               )
              )
              (local.tee $1
               (i32.load offset=1484
                (i32.and
                 (i32.shr_u
                  (local.get $0)
                  (i32.const 14)
                 )
                 (i32.const 124)
                )
               )
              )
             )
             (i32.shr_u
              (local.tee $5
               (i32.and
                (local.tee $3
                 (i32.load
                  (i32.const 1632)
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
   (i32.const 1612)
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
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $2)
  )
 )
 (func $18 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1632)
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
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
            )
           )
          )
          (local.tee $3
           (i32.and
            (i32.shr_u
             (local.tee $2
              (i32.load
               (i32.const 1632)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $4)
  )
 )
 (func $19 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store
   (i32.const 1632)
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
                   (i32.const 1632)
                  )
                 )
                 (i32.const 29)
                )
                (i32.const 1)
               )
              )
              (local.tee $2
               (i32.load offset=1484
                (i32.and
                 (i32.shr_u
                  (local.get $0)
                  (i32.const 14)
                 )
                 (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $5)
  )
 )
 (func $20 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1632)
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
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
            )
           )
          )
          (local.tee $4
           (i32.and
            (i32.shr_u
             (local.tee $2
              (i32.load
               (i32.const 1632)
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
   (i32.const 1612)
   (i32.or
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $21 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store
   (i32.const 1632)
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
                    (i32.const 1632)
                   )
                  )
                  (i32.const 29)
                 )
                 (i32.const 1)
                )
               )
               (local.tee $1
                (i32.load offset=1484
                 (i32.and
                  (i32.shr_u
                   (local.get $0)
                   (i32.const 14)
                  )
                  (i32.const 124)
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
   (i32.const 1612)
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
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $3)
  )
 )
 (func $22 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
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
             (i32.const 1632)
            )
           )
           (i32.const 29)
          )
          (i32.const 1)
         )
        )
        (i32.load offset=1484
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 14)
          )
          (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $3)
  )
 )
 (func $23 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1632)
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
                (i32.const 1632)
               )
              )
              (i32.const 29)
             )
             (i32.const 1)
            )
           )
           (local.tee $4
            (i32.load offset=1484
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $2)
  )
 )
 (func $24 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
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
             (i32.const 1632)
            )
           )
           (i32.const 29)
          )
          (i32.const 1)
         )
        )
        (i32.load offset=1484
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 14)
          )
          (i32.const 124)
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
   (i32.const 1612)
   (i32.or
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $25 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1632)
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
                 (i32.const 1632)
                )
               )
               (i32.const 29)
              )
              (i32.const 1)
             )
            )
            (local.tee $4
             (i32.load offset=1484
              (i32.and
               (i32.shr_u
                (local.get $0)
                (i32.const 14)
               )
               (i32.const 124)
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
   (i32.const 1612)
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
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $2)
  )
 )
 (func $26 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local.set $1
   (i32.sub
    (i32.extend16_s
     (local.get $0)
    )
    (local.tee $2
     (i32.load offset=1484
      (i32.and
       (i32.shr_u
        (local.get $0)
        (i32.const 14)
       )
       (i32.const 124)
      )
     )
    )
   )
  )
  (i32.store
   (i32.const 1632)
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
         (i32.const 1632)
        )
        (i32.const 536870912)
       )
      )
     )
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1632)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $27 (param $0 i32)
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (i32.sub
    (i32.load offset=1484
     (i32.and
      (i32.shr_u
       (local.get $0)
       (i32.const 9)
      )
      (i32.const 124)
     )
    )
    (i32.load offset=1484
     (i32.and
      (i32.shr_u
       (local.get $0)
       (i32.const 14)
      )
      (i32.const 124)
     )
    )
   )
  )
 )
 (func $28 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
   (select
    (i32.or
     (local.tee $1
      (i32.load
       (i32.const 1632)
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
          (i32.load offset=1484
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 9)
            )
            (i32.const 124)
           )
          )
         )
         (local.tee $2
          (i32.load offset=1484
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 14)
            )
            (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $3)
  )
 )
 (func $29 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1612)
   (i32.or
    (i32.and
     (i32.shr_u
      (i32.load
       (i32.const 1632)
      )
      (i32.const 3)
     )
     (i32.const 268435456)
    )
    (i32.or
     (i32.and
      (i32.load
       (i32.const 1612)
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
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 9)
             )
             (i32.const 124)
            )
           )
          )
          (local.tee $2
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $3)
  )
 )
 (func $30 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1632)
   (local.tee $4
    (select
     (i32.or
      (local.tee $1
       (i32.load
        (i32.const 1632)
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
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 9)
             )
             (i32.const 124)
            )
           )
          )
          (local.tee $2
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
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
   (i32.const 1612)
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
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $3)
  )
 )
 (func $31 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (i32.store
   (i32.const 1632)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1632)
     )
     (i32.const -536870913)
    )
    (select
     (i32.const 536870912)
     (i32.const 0)
     (i32.ge_u
      (local.tee $1
       (i32.load offset=1484
        (i32.and
         (i32.shr_u
          (local.get $0)
          (i32.const 9)
         )
         (i32.const 124)
        )
       )
      )
      (local.tee $2
       (i32.load offset=1484
        (i32.and
         (i32.shr_u
          (local.get $0)
          (i32.const 14)
         )
         (i32.const 124)
        )
       )
      )
     )
    )
   )
  )
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (i32.sub
    (local.get $1)
    (local.get $2)
   )
  )
 )
 (func $32 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
   (select
    (i32.or
     (local.tee $2
      (i32.or
       (i32.and
        (i32.load
         (i32.const 1632)
        )
        (i32.const -536870913)
       )
       (select
        (i32.const 536870912)
        (i32.const 0)
        (i32.ge_u
         (local.tee $1
          (i32.load offset=1484
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 9)
            )
            (i32.const 124)
           )
          )
         )
         (local.tee $3
          (i32.load offset=1484
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 14)
            )
            (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $2)
  )
 )
 (func $33 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
   (i32.or
    (i32.and
     (local.tee $1
      (i32.load
       (i32.const 1632)
      )
     )
     (i32.const -536870913)
    )
    (select
     (i32.const 536870912)
     (i32.const 0)
     (i32.ge_u
      (local.tee $2
       (i32.load offset=1484
        (i32.and
         (i32.shr_u
          (local.get $0)
          (i32.const 9)
         )
         (i32.const 124)
        )
       )
      )
      (local.tee $3
       (i32.load offset=1484
        (i32.and
         (i32.shr_u
          (local.get $0)
          (i32.const 14)
         )
         (i32.const 124)
        )
       )
      )
     )
    )
   )
  )
  (i32.store
   (i32.const 1612)
   (i32.or
    (i32.and
     (i32.load
      (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $34 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store
   (i32.const 1632)
   (local.tee $4
    (select
     (i32.or
      (local.tee $2
       (i32.or
        (i32.and
         (i32.load
          (i32.const 1632)
         )
         (i32.const -536870913)
        )
        (select
         (i32.const 536870912)
         (i32.const 0)
         (i32.ge_u
          (local.tee $1
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 9)
             )
             (i32.const 124)
            )
           )
          )
          (local.tee $3
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
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
   (i32.const 1612)
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
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $2)
  )
 )
 (func $35 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $1
   (i32.add
    (i32.add
     (local.tee $2
      (i32.load offset=1484
       (i32.and
        (i32.shr_u
         (local.get $0)
         (i32.const 9)
        )
        (i32.const 124)
       )
      )
     )
     (local.tee $3
      (i32.xor
       (i32.load offset=1484
        (i32.and
         (i32.shr_u
          (local.get $0)
          (i32.const 14)
         )
         (i32.const 124)
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
         (i32.const 1632)
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
     (i32.const 1632)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $36 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store
   (i32.const 1632)
   (select
    (i32.or
     (local.tee $2
      (select
       (select
        (local.tee $1
         (i32.load
          (i32.const 1632)
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
                (i32.load offset=1484
                 (i32.and
                  (i32.shr_u
                   (local.get $0)
                   (i32.const 9)
                  )
                  (i32.const 124)
                 )
                )
               )
               (local.tee $3
                (i32.xor
                 (local.tee $5
                  (i32.load offset=1484
                   (i32.and
                    (i32.shr_u
                     (local.get $0)
                     (i32.const 14)
                    )
                    (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $4)
  )
 )
 (func $37 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $1
   (i32.add
    (i32.add
     (local.tee $3
      (i32.load offset=1484
       (i32.and
        (i32.shr_u
         (local.get $0)
         (i32.const 9)
        )
        (i32.const 124)
       )
      )
     )
     (local.tee $4
      (i32.xor
       (i32.load offset=1484
        (i32.and
         (i32.shr_u
          (local.get $0)
          (i32.const 14)
         )
         (i32.const 124)
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
         (i32.const 1632)
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
     (i32.const 1632)
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
   (i32.const 1612)
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
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $38 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (i32.store
   (i32.const 1632)
   (local.tee $2
    (select
     (i32.or
      (local.tee $3
       (select
        (select
         (local.tee $1
          (i32.load
           (i32.const 1632)
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
                 (i32.load offset=1484
                  (i32.and
                   (i32.shr_u
                    (local.get $0)
                    (i32.const 9)
                   )
                   (i32.const 124)
                  )
                 )
                )
                (local.tee $4
                 (i32.xor
                  (local.tee $5
                   (i32.load offset=1484
                    (i32.and
                     (i32.shr_u
                      (local.get $0)
                      (i32.const 14)
                     )
                     (i32.const 124)
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
   (i32.const 1612)
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
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $39 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (i32.store
   (i32.const 1632)
   (select
    (local.tee $1
     (i32.load
      (i32.const 1632)
     )
    )
    (i32.or
     (local.get $1)
     (i32.const 536870912)
    )
    (i32.eq
     (local.tee $2
      (i32.load offset=1484
       (i32.and
        (i32.shr_u
         (local.get $0)
         (i32.const 14)
        )
        (i32.const 124)
       )
      )
     )
     (i32.const -1)
    )
   )
  )
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
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
 (func $40 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
   (select
    (select
     (i32.or
      (local.tee $2
       (select
        (local.tee $1
         (i32.load
          (i32.const 1632)
         )
        )
        (i32.or
         (local.get $1)
         (i32.const 536870912)
        )
        (i32.eq
         (local.tee $3
          (i32.load offset=1484
           (i32.and
            (i32.shr_u
             (local.get $0)
             (i32.const 14)
            )
            (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $41 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
   (local.tee $3
    (select
     (local.tee $1
      (i32.load
       (i32.const 1632)
      )
     )
     (i32.or
      (local.get $1)
      (i32.const 536870912)
     )
     (i32.eq
      (local.tee $2
       (i32.load offset=1484
        (i32.and
         (i32.shr_u
          (local.get $0)
          (i32.const 14)
         )
         (i32.const 124)
        )
       )
      )
      (i32.const -1)
     )
    )
   )
  )
  (i32.store
   (i32.const 1612)
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
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $42 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
   (local.tee $2
    (select
     (select
      (i32.or
       (local.tee $3
        (select
         (local.tee $1
          (i32.load
           (i32.const 1632)
          )
         )
         (i32.or
          (local.get $1)
          (i32.const 536870912)
         )
         (i32.eq
          (local.tee $2
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
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
   (i32.const 1612)
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
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $43 (param $0 i32)
  (local $1 i32)
  (i32.store
   (i32.const 1632)
   (select
    (i32.and
     (local.tee $1
      (i32.load
       (i32.const 1632)
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
       (i32.load offset=1484
        (i32.and
         (i32.shr_u
          (local.get $0)
          (i32.const 14)
         )
         (i32.const 124)
        )
       )
       (i32.const -1)
      )
     )
    )
   )
  )
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $44 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store
   (i32.const 1632)
   (select
    (select
     (i32.or
      (local.tee $2
       (select
        (i32.and
         (local.tee $1
          (i32.load
           (i32.const 1632)
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
            (i32.load offset=1484
             (i32.and
              (i32.shr_u
               (local.get $0)
               (i32.const 14)
              )
              (i32.const 124)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $45 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (i32.store
   (i32.const 1632)
   (local.tee $2
    (select
     (i32.and
      (local.tee $1
       (i32.load
        (i32.const 1632)
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
        (i32.load offset=1484
         (i32.and
          (i32.shr_u
           (local.get $0)
           (i32.const 14)
          )
          (i32.const 124)
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
   (i32.const 1612)
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
       (i32.const 1612)
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
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $1)
  )
 )
 (func $46 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $1
   (i32.and
    (local.tee $3
     (i32.load
      (i32.const 1632)
     )
    )
    (i32.const -536870913)
   )
  )
  (local.set $4
   (i32.load
    (i32.const 1612)
   )
  )
  (i32.store
   (i32.const 1612)
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
           (i32.load offset=1484
            (i32.and
             (i32.shr_u
              (local.get $0)
              (i32.const 14)
             )
             (i32.const 124)
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
   (i32.const 1632)
   (local.get $1)
  )
  (i32.store offset=1484
   (i32.and
    (i32.shr_u
     (local.get $0)
     (i32.const 19)
    )
    (i32.const 124)
   )
   (local.get $2)
  )
 )
 (func $47 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (result i64)
  (local $7 i32)
  (i64.store align=4
   (i32.const 1604)
   (i64.const -6917528891812741090)
  )
  (i64.store align=4
   (i32.const 1596)
   (i64.const -6917528900402675684)
  )
  (i64.store align=4
   (i32.const 1588)
   (i64.const -6917528908992610278)
  )
  (i64.store align=4
   (i32.const 1580)
   (i64.const -6917528917582544872)
  )
  (i64.store align=4
   (i32.const 1572)
   (i64.const -6917528926172479466)
  )
  (i64.store align=4
   (i32.const 1564)
   (i64.const -6917528934762414060)
  )
  (i64.store align=4
   (i32.const 1556)
   (i64.const -6917528943352348654)
  )
  (i64.store align=4
   (i32.const 1548)
   (i64.const -6917528951942283248)
  )
  (i64.store align=4
   (i32.const 1540)
   (i64.const -6917528960532217842)
  )
  (i64.store align=4
   (i32.const 1532)
   (i64.const -6917528969122152436)
  )
  (i64.store align=4
   (i32.const 1524)
   (i64.const -6917528977712087030)
  )
  (i64.store align=4
   (i32.const 1516)
   (i64.const -6917528986302021624)
  )
  (i64.store align=4
   (i32.const 1508)
   (i64.const -6917528994891956218)
  )
  (i32.store
   (i32.const 1500)
   (i32.const -1610612732)
  )
  (i64.store align=4
   (i32.const 1492)
   (i64.const -6917529012071825406)
  )
  (i64.store align=4
   (i32.const 1484)
   (i64.const -6917529020661760000)
  )
  (i32.store offset=1484
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
   (i32.const 1632)
   (local.get $4)
  )
  (i32.store
   (i32.const 1504)
   (local.get $3)
  )
  (i32.store
   (i32.const 1612)
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
   (i64.load32_u offset=1484
    (i32.shl
     (local.get $2)
     (i32.const 2)
    )
   )
   (i64.shl
    (i64.load32_u
     (i32.const 1632)
    )
    (i64.const 32)
   )
  )
 )
 (func $48 (result i32)
  (i32.load
   (i32.const 1612)
  )
 )
 (func $49 (param $0 i32) (result i32)
  (i32.load offset=1484
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
  (i32.store
   (i32.const 5800)
   (i32.load offset=1024
    (i32.shl
     (local.get $0)
     (i32.const 4)
    )
   )
  )
  (i32.store
   (i32.const 1632)
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
         (i32.const 1500)
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
         (i32.const 1504)
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
          (i32.const 5800)
         )
        )
        (local.set $3
         (i32.xor
          (i32.add
           (i32.load
            (i32.const 1632)
           )
           (i32.load
            (i32.const 1496)
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
       (i32.const 1500)
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
       (i32.const 1504)
       (i32.rotl
        (local.get $0)
        (i32.const 16)
       )
      )
      (call_indirect (type $0)
       (i32.const 6563840)
       (i32.load
        (i32.const 5800)
       )
      )
      (local.set $3
       (i32.xor
        (i32.add
         (i32.load
          (i32.const 1632)
         )
         (i32.load
          (i32.const 1496)
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
     (local.set $2
      (i32.and
       (local.get $2)
       (i32.const -2)
      )
     )
     (loop $label2
      (i32.store
       (i32.const 1504)
       (i32.const 3)
      )
      (i32.store
       (i32.const 1500)
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
        (i32.const 5800)
       )
      )
      (i32.store
       (i32.const 1504)
       (i32.const 3)
      )
      (i32.store
       (i32.const 1500)
       (i32.or
        (local.get $5)
        (i32.const 1)
       )
      )
      (local.set $5
       (i32.load
        (i32.const 1632)
       )
      )
      (local.set $6
       (i32.load
        (i32.const 1496)
       )
      )
      (call_indirect (type $0)
       (local.get $1)
       (i32.load
        (i32.const 5800)
       )
      )
      (local.set $3
       (i32.xor
        (i32.add
         (i32.load
          (i32.const 1632)
         )
         (i32.load
          (i32.const 1496)
         )
        )
        (i32.xor
         (i32.add
          (local.get $5)
          (local.get $6)
         )
         (local.get $3)
        )
       )
      )
      (br_if $label2
       (i32.ne
        (local.tee $0
         (i32.add
          (local.get $0)
          (i32.const 2)
         )
        )
        (local.get $2)
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
    (i32.const 1504)
    (i32.const 3)
   )
   (i32.store
    (i32.const 1500)
    (i32.and
     (local.get $0)
     (i32.const 255)
    )
   )
   (call_indirect (type $0)
    (local.get $1)
    (i32.load
     (i32.const 5800)
    )
   )
   (local.set $3
    (i32.xor
     (i32.add
      (i32.load
       (i32.const 1632)
      )
      (i32.load
       (i32.const 1496)
      )
     )
     (local.get $3)
    )
   )
  )
  (local.get $3)
 )
)
