open Formula

let formula_of_string s = Parser.parse_formula Lexer.token(Lexing.from_string s)

let _ = Printf.printf(Eval.eval_formula (formula_of_string "AG((load_data=Unloaded & build_window_button=enabled) -> AF(InfoWin=open)) "))