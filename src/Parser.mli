
(* The type of tokens. *)

type token = 
  | XOR
  | WEAK
  | VAR of (string)
  | UNTIL
  | S_RELEASE
  | STE
  | ST
  | RPAR
  | RELEASE
  | RBOX
  | OR
  | NOT
  | NEXT
  | NEQ
  | LTE
  | LT
  | LPAR
  | LIVE
  | LBOX
  | IMP
  | GLOBALLY
  | FORALL
  | FINALLY
  | EXISTS
  | EX
  | ERROR
  | EQ
  | EOF
  | EG
  | EF
  | CONST of (string)
  | COMMAND of (string)
  | AX
  | AVAILABLE
  | AND
  | AG
  | AF
  | ACTIVE

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val parse_formula: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Formula.formula)
