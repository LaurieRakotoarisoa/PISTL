(* %token <int> NUM*)
%token <string> VAR
%token <string> CONST
%token <string> COMMAND
%token FORALL 
%token AX
%token AF
%token AG
%token EXISTS
%token EX
%token EF
%token EG
%token FINALLY
%token GLOBALLY
%token S_RELEASE
%token RELEASE
%token UNTIL
%token NEXT
%token WEAK
%token ERROR
%token LIVE
%token ACTIVE
%token AVAILABLE
%token XOR
%token NOT
%token NEQ
%token EQ
%token LT
%token ST
%token LTE
%token STE
%token OR
%token AND
%token IMP
%token LPAR
%token RPAR
%token LBOX
%token RBOX
%token EOF

(*
%left OR
%left AND
%left EQ NEQ
%left LT ST LTE STE
%left LPAR RPAR DOT IMP LBOX RBOX
*)
(*-------------------------------------------------*)


%type <Formula.tempForm> tempForm
%type <Formula.boolForm>  boolForm
%type <Formula.atomicForm> atomicForm
%type <Formula.valueId> valueId
%type <Formula.state_constant> state_constant
%type <Formula.binary_temp_op> binary_temp_op
%type <Formula.unary_temp_op> unary_temp_op
%type <Formula.comp> comp
%type <Formula.unary_op> unary_op
%type <Formula.binary_op> binary_op

%{
  open Formula
%}


%start <Formula.formula> parse_formula 
  
%% 

parse_formula:
  | tempForm EOF { Form($1)}

tempForm:
  | boolForm {Tf1($1)}
  | unary_temp_op LPAR tempForm RPAR {Tf2($1,$3)}

boolForm:
  | atomicForm {Bf1($1) }
  | LPAR unary_op boolForm RPAR {Bf2($2,$3)}
  | boolForm binary_op boolForm {Bf3($1,$2,$3)}
  | unary_temp_op LPAR boolForm RPAR {Bf4($1,$3)}
  | LPAR boolForm binary_temp_op boolForm RPAR {Bf5($2,$3,$4)}

atomicForm:
  | state_constant {Af1($1)}
  | valueId comp valueId {Af2($1,$2,$3)}

valueId:
  | VAR {Variable($1)}
  | CONST {Constant($1)}
  | COMMAND {Command($1)}

state_constant:
  | LIVE { Live }
  | ACTIVE { Active }
  | ERROR { Error } 
  | AVAILABLE {Available}

comp:
  | EQ {Eq}
  | NEQ {Neq}
  | LT {Lt}
  | ST {St}
  | LTE {Lte}
  | STE {Ste}

binary_op :
  | OR { Or }
  | AND { And }
  | XOR {Xor}
  | IMP {Imp}

binary_temp_op :
  | WEAK {W}
  | S_RELEASE {M}
  | RELEASE {R}
  | UNTIL {U}

unary_temp_op :
  | FORALL {A}
  | EXISTS {E}
  | FINALLY {F}
  | GLOBALLY {G}
  | NEXT {X}
  | AX {AX} 
  | AF {AF}
  | AG {AG}
  | EX {EX}
  | EF {EF}
  | EG {EG}

unary_op :
  | NOT {Not}
