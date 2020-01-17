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

and eval_unary_temp_op_b o b=
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

  and eval_unary_temp_op_t o t=
  match o with
  A -> "Every path satisfies "^(eval_tempForm t)
  | E  -> "Some path satisfies "^(eval_tempForm t)
  | F -> "Some future state satisfies "^(eval_tempForm t)
  | G -> "Every future state satisfies "^(eval_tempForm t)
  | X -> "The next state satisfies "^(eval_tempForm t)
  | AX -> "Every path and the next state satisfies "^(eval_tempForm t)
  | AF ->  "Every path and Some future state satisfies "^(eval_tempForm t)
  | AG ->  "Every path and every future state satisfies "^(eval_tempForm t)
  | EX ->  "Some path and the next state satisfies "^(eval_tempForm t)
  | EF ->  "Some path and Some future state satisfies "^(eval_tempForm t)
  | EG ->  "Some path and every future state satisfies "^(eval_tempForm t)

  and eval_atomic f =
  match f with
  Af1(x) -> (eval_state_constant x)^(!s)
  |Af2(v1,c,v2) -> (eval_valueId v1)^" "^(eval_comp c)^" "^(eval_valueId v2)

and eval_binary_temp_op b1 o b2=
  match o with
  R -> (eval_boolForm b1)^" is satisfied until and including the point where "^(eval_boolForm b2)^
  " becomes true "
  | U ->(eval_boolForm b1)^" is satisfied at every state of the longest (necessarily
  finite) prefixes of every path where "^(eval_boolForm b2)^" is not satisfied "
  | M ->(eval_boolForm b1)^" is satisfied until and including the point where "^(eval_boolForm b2)^
  " becomes true "
  | W ->(eval_boolForm b1)^" satisfied at every state of the longest (possibly
  infinite) prefixes of every path where "^(eval_boolForm b2)^" is not satisfied "


and eval_boolForm b = 
  match b with
   Bf1(a) -> eval_atomic a^(!s)
  | Bf2(o,b1) -> (eval_unary_op o b1)^(!s)
  | Bf3(b1,o,b2) -> (eval_binary_op b1 o b2)^(!s)
  | Bf4(o,b) -> (eval_unary_temp_op_b o b) ^(!s)
  | Bf5(b1,o,b2) -> (eval_binary_temp_op b1 o b2)^(!s)


  
and eval_tempForm t = 
  match t with
  Tf1(b) -> (eval_boolForm b) ^ (!s)
  | Tf2(o,form) -> (eval_unary_temp_op_t o form)^(!s) 

let eval_formula f = 
  match f with
  Form x -> eval_tempForm x