type binary_op = And | Or | Imp | Xor

type unary_op = Not

type comp = Eq | Neq | Lt | St | Lte | Ste

type unary_temp_op = A | E | F | G | X | AX | AF | AG | EX | EF | EG

type binary_temp_op = R | U | M | W

type state_constant = Error | Live | Active | Available

type valueId = Variable of string | Constant of string | Command of string

type atomicForm = Af1 of state_constant | Af2 of valueId * comp * valueId

type boolForm = Bf1 of atomicForm 
                | Bf2 of unary_op * boolForm 
                | Bf3 of boolForm * binary_op * boolForm 
                | Bf4 of unary_temp_op * boolForm 
                | Bf5 of boolForm * binary_temp_op * boolForm

type tempForm = Tf1 of boolForm | Tf2 of temp_op * tempForm

type formula = Form of tempForm