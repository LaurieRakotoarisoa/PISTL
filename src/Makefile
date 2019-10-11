all: 
	ocamlc -c Formula.ml
	ocamllex Lexer.mll
	menhir -v Parser.mly
	ocamlc -c Parser.mli
	ocamlc -c Parser.ml
	ocamlc -c Lexer.ml
	ocamlc -c Eval.ml
	ocamlc -c Eval.cmo Main.ml
	ocamlc   Formula.cmo Parser.cmo Lexer.cmo Eval.cmo Main.cmo 
mail.ml: 

Lexer.ml: Lexer.mll
	ocamllex Lexer.mll

Parser.ml: Parser.mly Formula.ml
	menhir -v Parser.mly

Parser.mli: Parser.ml
Parser.cmo: Parser.cmi
Parser.cmx: Parser.cmi

Lexer.cmo: Parser.cmo
Lexer.cmx: Parser.cmx

%.cmi: %.mli
	$(OCC) $(OCC_FLAGS) $<

%.cmo: %.ml
	$(OCC) $(OCC_FLAGS) $<

%.cmx: %.ml
	$(OCCOPT) $(OCC_FLAGS) $<
