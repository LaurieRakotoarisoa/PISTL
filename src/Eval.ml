open Formula

let s = ref ""

let eval_state_constant state =
  match state with
  Error -> "error "
  | Live -> "live "
  | Active -> "active "
  | Available -> "available "

let eval_valueId v = 
    match v with 
    Variable v -> v
    | Constant c -> c
    | Command c -> c
  
let eval_comp comp = 
    match comp with
    Eq -> "is"
    | Neq -> "is different than "
    | Lt -> "less than"
    | St -> "more than"
    | Lte -> "less than or equal "
    | Ste -> "more than or equal "

let rec eval_unary_op o b=
  match o with
  Not -> "No "^(eval_boolForm b)

and  eval_binary_op b1 o b2 = 
  match o with 
  And -> (eval_boolForm b1)^" and "^(eval_boolForm b2)
  | Or -> (eval_boolForm b1)^" or "^(eval_boolForm b2)
  | Imp -> "if "^(eval_boolForm b1)^" then "^(eval_boolForm b2)
  | Xor -> ""

and eval_unary_temp_op o b=
  match o with
  A -> "Every path satisfies "^(eval_boolForm b)
  | E  -> "Some path satisfies "^(eval_boolForm b)
  | F -> "Some future state satisfies "^(eval_boolForm b)
  | G -> "Every future state satisfies "^(eval_boolForm b)
  | X -> "The next state satisfies "^(eval_boolForm b)
  | AX -> "Every path and the next state satisfies "^(eval_boolForm b)
  | AF ->  "Every path and Some future state satisfies "^(eval_boolForm b)
  | AG ->  "Every path and every future state satisfies "^(eval_boolForm b)
  | EX ->  "Some path and the next state satisfies "^(eval_boolForm b)
  | EF ->  "Some path and Some future state satisfies "^(eval_boolForm b)
  | EG ->  "Some path and every future state satisfies "^(eval_boolForm b)

and eval_binary_temp_op b1 o b2=
  match b with
  R -> (eval_boolForm b1)^" is satisfied until and including the point where "^(eval_boolForm b2)^
  " becomes true"
  | U ->(eval_boolForm b1)^" is satisfied at every state of the longest (necessarily
  finite) prefixes of every path where "^(eval_boolForm b2)^" is not satisfied"
  | M ->(eval_boolForm b1)^" is satisfied until and including the point where "^(eval_boolForm b2)^
  " becomes true"
  | W ->(eval_boolForm b1)^" satisfied at every state of the longest (possibly
  infinite) prefixes of every path where "^(eval_boolForm b2)^" is not satisfied"


and eval_boolForm b = 
  match b with
  Bf1(a) -> eval_atomic a 
  | Bf2(u,b) -> eval_unary_temp_op(o,u)
  | Bf3(b1,o,b2) -> eval_binary_temp_op(b1,o,b2)
  | Bf4 of unary_temp_op * boolForm 
  | Bf5 of boolForm * binary_temp_op * boolForm


and eval_atomic f =
  match f with
  Af1(x) -> (eval_state_constant x)^s
  |Af2(v1,c,v2) -> x^s
  