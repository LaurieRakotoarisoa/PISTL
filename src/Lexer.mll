{
  open Parser (* The type token is defined in parser.mli *)
  exception Eof
}

rule token = parse
  [' ' '\t' '\n'] {token lexbuf}
  | ['0'-'9']+('.'['0'-'9'])? as lxm { NUM(int_of_string lxm) }
  | 'A' {FORALL}
  | "AX" {AX}
  | "AF" {AF}
  | "AG" {AG}
  | 'E' {EXISTS}
  | "EX" {EX}
  | "EF" {EF}
  | "EG" {EG}
  | ('F'|"<>") {FINALLY}
  | ('G'|"[]") {GLOBALLY}
  | 'M' {S_RELEASE}
  | 'R' {RELEASE}
  | 'U' {UNTIL}
  | ('X'| 'o') {NEXT}
  | 'W' {WEAK}
  | '.' {DOT}
  | "ERROR" {ERROR}
  | "LIVE"  {LIVE}
  | "ACTIVE"   {ACTIVE}
  | "AVAILABLE" {AVAILABLE}
  | "xor" {XOR}
  | '+' {ADD}
  | '-' {SUB}
  | '*' {TIMES}
  | '/' {DIV} 
  | '%' {MOD}
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
  | '(' {LPAR}
  | ')' {RPAR}
  | '['   { LBOX }
  | ']'   { RBOX }
  | ',' {COMMA}
  | (['a'-'z''A'-'Z']+).(['a'-'z''A'-'Z']['A'-'Z' '0'-'9']*) as x {COMMAND(x)}
  | ['a'-'z'] (['a'-'z' 'A'-'Z' '0'-'9']*) as x {VAR(x)}
  | ['A'-'Z'](['A'-'Z' '0'-'9']*) as x {CONST(x)}
  | eof { EOF }