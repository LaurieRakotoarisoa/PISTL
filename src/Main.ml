open Formula


let _ =
    let oc = open_in Sys.argv.(1) in 
    let lexbuf = Lexing.from_channel oc in
    let f = Parser.parse_formula Lexer.token lexbuf in
    print_string (Eval.eval_formula f);
    print_char '\n'