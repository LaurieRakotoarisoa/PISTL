{
  open Parser (* The type token is defined in parser.mli *)
  exception Eof
}

(* | ['0'-'9']+('.'['0'-'9'])? as lxm { NUM(int_of_string lxm) } *)

rule token = parse
  [' ' '\t' '\n'] {token lexbuf}
  | "ACTIVE"   {ACTIVE}
  | "AVAILABLE" {AVAILABLE}
  | "ERROR" {ERROR}
  | "LIVE"  {LIVE}
  | "AX" {AX}
  | "AF" {AF}
  | "AG" {AG}
  | "EX" {EX}
  | "EF" {EF}
  | "EG" {EG}
  | 'A' {FORALL}
  | 'E' {EXISTS}
  | ('F'|"<>") {FINALLY}
  | ('G'|"[]") {GLOBALLY}
  | 'M' {S_RELEASE}
  | 'R' {RELEASE}
  | 'U' {UNTIL}
  | ('X'| 'o') {NEXT}
  | 'W' {WEAK}
  | "xor" {XOR}
  | '!'  {NOT}
  | '=' {EQ}
  | "!="  {NEQ}
  | '<' {LT}
  | '>' {ST}
  | "<=" {LTE}
  | "=>"  {STE}
  | '|' {OR}
  | '&' {AND}
  | "->" {IMP}
  | (['a'-'z''A'-'Z']+)'.'(['a'-'z''A'-'Z']['A'-'Z' '0'-'9']*) as x {COMMAND(x)}
  | ['a'-'z'] (['a'-'z' 'A'-'Z' '0'-'9']*) as x {VAR(x)}
  | ['A'-'Z'](['A'-'Z' '0'-'9']*) as x {CONST(x)}
  | eof { EOF }