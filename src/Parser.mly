%token <int> NUM
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
%token DOT
%token ERROR
%token LIVE
%token ACTIVE
%token AVAILABLE
%token XOR
%token ADD
%token SUB
%token TIMES
%token DIV
%token NOT
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
%token COMMA
%token EOF


%left OR
%left AND
%left EQ NEQ
%left LT ST LTE STE
%left PLUS MINUS
%left TIMES DIV MOD
%left LPAR RPAR DOT IMP LBOX RBOX

(*-------------------------------------------------*)


%type <Formula.tempForm> 
%type <Formula.boolForm>
%type <Formula.atomicForm>
%type <Formula.valueID>
%type <Formula.state_constant> 
%type <Formula.binary_temp_op> 
%type <Formula.unary_temp_op>
%type <Formula.comp>
%type <Formula.unary_op>
%type <Formula.binary_op>

%{
  open Lexer
  open Formula
%}


%start <Formula.formula> parse_formula 
  
%% 

parse_formula:
  | temp_form EOF { Form($1)}

temp_form:
  | bool_form {Tf1($1)}
  | temp_op temp {Tf2($1,$2)}

bool_form:
  | atomic_form {Bf1{$1} }
  | unary_op bool_form {Bf2{$1,$2}}
  | bool_form binary_op bool_form {Bf3{$1,$2,$3}}
  | unary_temp_op bool_form {Bf2{$1,$2}}
  | bool_form binary_temp_op bool_form {Bf2{$1,$2,$3}}

atomic_form:
  | state_constant {Af1($1)}
  | valueId comp valueId {Af2($1,$2,$3)}

value_Id:
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

temp_op :
  | FORALL {A}
  | EXISTS {E}
  | FINALLY {F}
  | GLOBALLY {G}
  | S_RELEASE {M}
  | RELEASE {R}
  | UNTIL {U}
  | NEXT {X}
  | WEAK {W}
  | AX {AX} 
  | AF {AF}
  | AG {AG}
  | EX {EX}
  | EF {EF}
  | EG {EG}

unary_op :
  | NOT {Not}
