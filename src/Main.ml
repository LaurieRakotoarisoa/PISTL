open Formula

let str = "ERROR"

let _ =
  try
    let oc = open_in Sys.argv.(1) in 
    let lexbuf = Lexing.from_channel oc in
    let f = Parser.parse_formula Lexer.token lexbuf in
    Eval.eval_formula f
  with Lexer.Eof ->
   exit 0
        
     