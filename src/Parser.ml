
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | XOR
    | WEAK
    | VAR of (
# 2 "Parser.mly"
       (string)
# 13 "Parser.ml"
  )
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
    | CONST of (
# 3 "Parser.mly"
       (string)
# 45 "Parser.ml"
  )
    | COMMAND of (
# 4 "Parser.mly"
       (string)
# 50 "Parser.ml"
  )
    | AX
    | AVAILABLE
    | AND
    | AG
    | AF
    | ACTIVE
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState54
  | MenhirState50
  | MenhirState42
  | MenhirState39
  | MenhirState31
  | MenhirState28
  | MenhirState3
  | MenhirState0

# 62 "Parser.mly"
  
  open Formula

# 87 "Parser.ml"

let rec _menhir_goto_binary_op : _menhir_env -> 'ttv_tail -> (
# 60 "Parser.mly"
      (Formula.binary_op)
# 92 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv207 * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 100 "Parser.ml"
    )) * (
# 60 "Parser.mly"
      (Formula.binary_op)
# 104 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACTIVE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | AF ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | AG ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | AVAILABLE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | AX ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | COMMAND _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | CONST _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | EF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | EG ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | ERROR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | EX ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | EXISTS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | FINALLY ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | FORALL ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | GLOBALLY ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | LIVE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | LPAR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | NEXT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39) : 'freshtv208)

and _menhir_goto_tempForm : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 51 "Parser.mly"
      (Formula.tempForm)
# 155 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv191 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 165 "Parser.ml"
        ))) * _menhir_state * (
# 51 "Parser.mly"
      (Formula.tempForm)
# 169 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv187 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 179 "Parser.ml"
            ))) * _menhir_state * (
# 51 "Parser.mly"
      (Formula.tempForm)
# 183 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv185 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 190 "Parser.ml"
            ))) * _menhir_state * (
# 51 "Parser.mly"
      (Formula.tempForm)
# 194 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 199 "Parser.ml"
            ))), _, (_3 : (
# 51 "Parser.mly"
      (Formula.tempForm)
# 203 "Parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (
# 51 "Parser.mly"
      (Formula.tempForm)
# 210 "Parser.ml"
            ) = 
# 76 "Parser.mly"
                                     (Tf2(_1,_3))
# 214 "Parser.ml"
             in
            _menhir_goto_tempForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv186)) : 'freshtv188)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv189 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 224 "Parser.ml"
            ))) * _menhir_state * (
# 51 "Parser.mly"
      (Formula.tempForm)
# 228 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)) : 'freshtv192)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state * (
# 51 "Parser.mly"
      (Formula.tempForm)
# 237 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv201 * _menhir_state * (
# 51 "Parser.mly"
      (Formula.tempForm)
# 247 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv199 * _menhir_state * (
# 51 "Parser.mly"
      (Formula.tempForm)
# 253 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 51 "Parser.mly"
      (Formula.tempForm)
# 258 "Parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 67 "Parser.mly"
       (Formula.formula)
# 264 "Parser.ml"
            ) = 
# 72 "Parser.mly"
                 ( Form(_1))
# 268 "Parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv197) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 67 "Parser.mly"
       (Formula.formula)
# 276 "Parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv195) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 67 "Parser.mly"
       (Formula.formula)
# 284 "Parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv193) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 67 "Parser.mly"
       (Formula.formula)
# 292 "Parser.ml"
            )) : (
# 67 "Parser.mly"
       (Formula.formula)
# 296 "Parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv194)) : 'freshtv196)) : 'freshtv198)) : 'freshtv200)) : 'freshtv202)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv203 * _menhir_state * (
# 51 "Parser.mly"
      (Formula.tempForm)
# 306 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)) : 'freshtv206)
    | _ ->
        _menhir_fail ()

and _menhir_goto_binary_temp_op : _menhir_env -> 'ttv_tail -> (
# 56 "Parser.mly"
      (Formula.binary_temp_op)
# 316 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv183 * _menhir_state) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 324 "Parser.ml"
    )) * (
# 56 "Parser.mly"
      (Formula.binary_temp_op)
# 328 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACTIVE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | AF ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | AG ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | AVAILABLE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | AX ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | COMMAND _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | CONST _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | EF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | EG ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | ERROR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | EX ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | EXISTS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | FINALLY ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | FORALL ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | GLOBALLY ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | LIVE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | LPAR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | NEXT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50) : 'freshtv184)

and _menhir_run34 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv181) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : (
# 60 "Parser.mly"
      (Formula.binary_op)
# 385 "Parser.ml"
    ) = 
# 111 "Parser.mly"
        (Xor)
# 389 "Parser.ml"
     in
    _menhir_goto_binary_op _menhir_env _menhir_stack _v) : 'freshtv182)

and _menhir_run35 : _menhir_env -> (('ttv_tail * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 396 "Parser.ml"
))) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 400 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv179 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 408 "Parser.ml"
    ))) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 412 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    ((let ((_menhir_stack, _menhir_s, (_1 : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 417 "Parser.ml"
    ))), _, (_3 : (
# 52 "Parser.mly"
      (Formula.boolForm)
# 421 "Parser.ml"
    ))) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _v : (
# 52 "Parser.mly"
      (Formula.boolForm)
# 428 "Parser.ml"
    ) = 
# 82 "Parser.mly"
                                     (Bf4(_1,_3))
# 432 "Parser.ml"
     in
    _menhir_goto_boolForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv180)

and _menhir_run36 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv177) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : (
# 60 "Parser.mly"
      (Formula.binary_op)
# 445 "Parser.ml"
    ) = 
# 109 "Parser.mly"
       ( Or )
# 449 "Parser.ml"
     in
    _menhir_goto_binary_op _menhir_env _menhir_stack _v) : 'freshtv178)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv175) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : (
# 60 "Parser.mly"
      (Formula.binary_op)
# 462 "Parser.ml"
    ) = 
# 112 "Parser.mly"
        (Imp)
# 466 "Parser.ml"
     in
    _menhir_goto_binary_op _menhir_env _menhir_stack _v) : 'freshtv176)

and _menhir_run38 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv173) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : (
# 60 "Parser.mly"
      (Formula.binary_op)
# 479 "Parser.ml"
    ) = 
# 110 "Parser.mly"
        ( And )
# 483 "Parser.ml"
     in
    _menhir_goto_binary_op _menhir_env _menhir_stack _v) : 'freshtv174)

and _menhir_goto_boolForm : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 52 "Parser.mly"
      (Formula.boolForm)
# 490 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv119 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 500 "Parser.ml"
        ))) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 504 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv117 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 526 "Parser.ml"
            ))) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 530 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)) : 'freshtv120)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv125 * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 539 "Parser.ml"
        )) * (
# 60 "Parser.mly"
      (Formula.binary_op)
# 543 "Parser.ml"
        )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 547 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | EOF | RELEASE | RPAR | S_RELEASE | UNTIL | WEAK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv121 * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 565 "Parser.ml"
            )) * (
# 60 "Parser.mly"
      (Formula.binary_op)
# 569 "Parser.ml"
            )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 573 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 52 "Parser.mly"
      (Formula.boolForm)
# 578 "Parser.ml"
            ))), (_2 : (
# 60 "Parser.mly"
      (Formula.binary_op)
# 582 "Parser.ml"
            ))), _, (_3 : (
# 52 "Parser.mly"
      (Formula.boolForm)
# 586 "Parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 52 "Parser.mly"
      (Formula.boolForm)
# 591 "Parser.ml"
            ) = 
# 81 "Parser.mly"
                                (Bf3(_1,_2,_3))
# 595 "Parser.ml"
             in
            _menhir_goto_boolForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv122)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv123 * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 605 "Parser.ml"
            )) * (
# 60 "Parser.mly"
      (Formula.binary_op)
# 609 "Parser.ml"
            )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 613 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)) : 'freshtv126)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv133 * _menhir_state) * _menhir_state * (
# 59 "Parser.mly"
      (Formula.unary_op)
# 622 "Parser.ml"
        )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 626 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv129 * _menhir_state) * _menhir_state * (
# 59 "Parser.mly"
      (Formula.unary_op)
# 642 "Parser.ml"
            )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 646 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv127 * _menhir_state) * _menhir_state * (
# 59 "Parser.mly"
      (Formula.unary_op)
# 653 "Parser.ml"
            )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 657 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 59 "Parser.mly"
      (Formula.unary_op)
# 662 "Parser.ml"
            ))), _, (_3 : (
# 52 "Parser.mly"
      (Formula.boolForm)
# 666 "Parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : (
# 52 "Parser.mly"
      (Formula.boolForm)
# 673 "Parser.ml"
            ) = 
# 80 "Parser.mly"
                                (Bf2(_2,_3))
# 677 "Parser.ml"
             in
            _menhir_goto_boolForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv128)) : 'freshtv130)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv131 * _menhir_state) * _menhir_state * (
# 59 "Parser.mly"
      (Formula.unary_op)
# 689 "Parser.ml"
            )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 693 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)) : 'freshtv134)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv153 * _menhir_state) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 702 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | RELEASE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv137) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv135) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 56 "Parser.mly"
      (Formula.binary_temp_op)
# 723 "Parser.ml"
            ) = 
# 117 "Parser.mly"
            (R)
# 727 "Parser.ml"
             in
            _menhir_goto_binary_temp_op _menhir_env _menhir_stack _v) : 'freshtv136)) : 'freshtv138)
        | S_RELEASE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv141) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv139) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 56 "Parser.mly"
      (Formula.binary_temp_op)
# 740 "Parser.ml"
            ) = 
# 116 "Parser.mly"
              (M)
# 744 "Parser.ml"
             in
            _menhir_goto_binary_temp_op _menhir_env _menhir_stack _v) : 'freshtv140)) : 'freshtv142)
        | UNTIL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv145) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv143) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 56 "Parser.mly"
      (Formula.binary_temp_op)
# 757 "Parser.ml"
            ) = 
# 118 "Parser.mly"
          (U)
# 761 "Parser.ml"
             in
            _menhir_goto_binary_temp_op _menhir_env _menhir_stack _v) : 'freshtv144)) : 'freshtv146)
        | WEAK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv149) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv147) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 56 "Parser.mly"
      (Formula.binary_temp_op)
# 774 "Parser.ml"
            ) = 
# 115 "Parser.mly"
         (W)
# 778 "Parser.ml"
             in
            _menhir_goto_binary_temp_op _menhir_env _menhir_stack _v) : 'freshtv148)) : 'freshtv150)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv151 * _menhir_state) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 790 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)) : 'freshtv154)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv161 * _menhir_state) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 799 "Parser.ml"
        )) * (
# 56 "Parser.mly"
      (Formula.binary_temp_op)
# 803 "Parser.ml"
        )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 807 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv157 * _menhir_state) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 823 "Parser.ml"
            )) * (
# 56 "Parser.mly"
      (Formula.binary_temp_op)
# 827 "Parser.ml"
            )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 831 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv155 * _menhir_state) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 838 "Parser.ml"
            )) * (
# 56 "Parser.mly"
      (Formula.binary_temp_op)
# 842 "Parser.ml"
            )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 846 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 52 "Parser.mly"
      (Formula.boolForm)
# 851 "Parser.ml"
            ))), (_3 : (
# 56 "Parser.mly"
      (Formula.binary_temp_op)
# 855 "Parser.ml"
            ))), _, (_4 : (
# 52 "Parser.mly"
      (Formula.boolForm)
# 859 "Parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _1 = () in
            let _v : (
# 52 "Parser.mly"
      (Formula.boolForm)
# 866 "Parser.ml"
            ) = 
# 83 "Parser.mly"
                                               (Bf5(_2,_3,_4))
# 870 "Parser.ml"
             in
            _menhir_goto_boolForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv156)) : 'freshtv158)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv159 * _menhir_state) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 882 "Parser.ml"
            )) * (
# 56 "Parser.mly"
      (Formula.binary_temp_op)
# 886 "Parser.ml"
            )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 890 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)) : 'freshtv162)
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 899 "Parser.ml"
        ))) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 903 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | RPAR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv163 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 925 "Parser.ml"
            ))) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 929 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)) : 'freshtv166)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv171 * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 938 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv167 * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 956 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 52 "Parser.mly"
      (Formula.boolForm)
# 961 "Parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 51 "Parser.mly"
      (Formula.tempForm)
# 966 "Parser.ml"
            ) = 
# 75 "Parser.mly"
             (Tf1(_1))
# 970 "Parser.ml"
             in
            _menhir_goto_tempForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv168)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv169 * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 980 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)) : 'freshtv172)
    | _ ->
        _menhir_fail ()

and _menhir_goto_comp : _menhir_env -> 'ttv_tail -> (
# 58 "Parser.mly"
      (Formula.comp)
# 990 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv115 * _menhir_state * (
# 54 "Parser.mly"
      (Formula.valueId)
# 998 "Parser.ml"
    )) * (
# 58 "Parser.mly"
      (Formula.comp)
# 1002 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMAND _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | CONST _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28) : 'freshtv116)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_atomicForm : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 53 "Parser.mly"
      (Formula.atomicForm)
# 1026 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv113) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 53 "Parser.mly"
      (Formula.atomicForm)
# 1035 "Parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv111) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 53 "Parser.mly"
      (Formula.atomicForm)
# 1043 "Parser.ml"
    )) : (
# 53 "Parser.mly"
      (Formula.atomicForm)
# 1047 "Parser.ml"
    )) = _v in
    ((let _v : (
# 52 "Parser.mly"
      (Formula.boolForm)
# 1052 "Parser.ml"
    ) = 
# 79 "Parser.mly"
               (Bf1(_1) )
# 1056 "Parser.ml"
     in
    _menhir_goto_boolForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)) : 'freshtv114)

and _menhir_goto_valueId : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 54 "Parser.mly"
      (Formula.valueId)
# 1063 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState54 | MenhirState0 | MenhirState50 | MenhirState42 | MenhirState39 | MenhirState31 | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * _menhir_state * (
# 54 "Parser.mly"
      (Formula.valueId)
# 1073 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv81) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv79) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 58 "Parser.mly"
      (Formula.comp)
# 1088 "Parser.ml"
            ) = 
# 101 "Parser.mly"
       (Eq)
# 1092 "Parser.ml"
             in
            _menhir_goto_comp _menhir_env _menhir_stack _v) : 'freshtv80)) : 'freshtv82)
        | LT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv85) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv83) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 58 "Parser.mly"
      (Formula.comp)
# 1105 "Parser.ml"
            ) = 
# 103 "Parser.mly"
       (Lt)
# 1109 "Parser.ml"
             in
            _menhir_goto_comp _menhir_env _menhir_stack _v) : 'freshtv84)) : 'freshtv86)
        | LTE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv89) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv87) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 58 "Parser.mly"
      (Formula.comp)
# 1122 "Parser.ml"
            ) = 
# 105 "Parser.mly"
        (Lte)
# 1126 "Parser.ml"
             in
            _menhir_goto_comp _menhir_env _menhir_stack _v) : 'freshtv88)) : 'freshtv90)
        | NEQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv93) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv91) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 58 "Parser.mly"
      (Formula.comp)
# 1139 "Parser.ml"
            ) = 
# 102 "Parser.mly"
        (Neq)
# 1143 "Parser.ml"
             in
            _menhir_goto_comp _menhir_env _menhir_stack _v) : 'freshtv92)) : 'freshtv94)
        | ST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv97) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv95) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 58 "Parser.mly"
      (Formula.comp)
# 1156 "Parser.ml"
            ) = 
# 104 "Parser.mly"
       (St)
# 1160 "Parser.ml"
             in
            _menhir_goto_comp _menhir_env _menhir_stack _v) : 'freshtv96)) : 'freshtv98)
        | STE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv101) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv99) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 58 "Parser.mly"
      (Formula.comp)
# 1173 "Parser.ml"
            ) = 
# 106 "Parser.mly"
        (Ste)
# 1177 "Parser.ml"
             in
            _menhir_goto_comp _menhir_env _menhir_stack _v) : 'freshtv100)) : 'freshtv102)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv103 * _menhir_state * (
# 54 "Parser.mly"
      (Formula.valueId)
# 1187 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)) : 'freshtv106)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv109 * _menhir_state * (
# 54 "Parser.mly"
      (Formula.valueId)
# 1196 "Parser.ml"
        )) * (
# 58 "Parser.mly"
      (Formula.comp)
# 1200 "Parser.ml"
        )) * _menhir_state * (
# 54 "Parser.mly"
      (Formula.valueId)
# 1204 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv107 * _menhir_state * (
# 54 "Parser.mly"
      (Formula.valueId)
# 1210 "Parser.ml"
        )) * (
# 58 "Parser.mly"
      (Formula.comp)
# 1214 "Parser.ml"
        )) * _menhir_state * (
# 54 "Parser.mly"
      (Formula.valueId)
# 1218 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 54 "Parser.mly"
      (Formula.valueId)
# 1223 "Parser.ml"
        ))), (_2 : (
# 58 "Parser.mly"
      (Formula.comp)
# 1227 "Parser.ml"
        ))), _, (_3 : (
# 54 "Parser.mly"
      (Formula.valueId)
# 1231 "Parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 53 "Parser.mly"
      (Formula.atomicForm)
# 1236 "Parser.ml"
        ) = 
# 87 "Parser.mly"
                         (Af2(_1,_2,_3))
# 1240 "Parser.ml"
         in
        _menhir_goto_atomicForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv108)) : 'freshtv110)

and _menhir_goto_unary_temp_op : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1247 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState50 | MenhirState42 | MenhirState39 | MenhirState31 | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1257 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv67 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1267 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACTIVE ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | AF ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | AG ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | AVAILABLE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | AX ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | COMMAND _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
            | CONST _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
            | EF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | EG ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | ERROR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | EX ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | EXISTS ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | FINALLY ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | FORALL ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | GLOBALLY ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | LIVE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | LPAR ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | NEXT ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | VAR _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31) : 'freshtv68)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv69 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1321 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)) : 'freshtv72)
    | MenhirState54 | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1330 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LPAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv73 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1340 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACTIVE ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | AF ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | AG ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | AVAILABLE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | AX ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | COMMAND _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
            | CONST _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
            | EF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | EG ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | ERROR ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | EX ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | EXISTS ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | FINALLY ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | FORALL ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | GLOBALLY ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | LIVE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | LPAR ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | NEXT ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | VAR _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54) : 'freshtv74)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv75 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1394 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)) : 'freshtv78)
    | _ ->
        _menhir_fail ()

and _menhir_goto_state_constant : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 55 "Parser.mly"
      (Formula.state_constant)
# 1404 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv65) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 55 "Parser.mly"
      (Formula.state_constant)
# 1413 "Parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv63) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 55 "Parser.mly"
      (Formula.state_constant)
# 1421 "Parser.ml"
    )) : (
# 55 "Parser.mly"
      (Formula.state_constant)
# 1425 "Parser.ml"
    )) = _v in
    ((let _v : (
# 53 "Parser.mly"
      (Formula.atomicForm)
# 1430 "Parser.ml"
    ) = 
# 86 "Parser.mly"
                   (Af1(_1))
# 1434 "Parser.ml"
     in
    _menhir_goto_atomicForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv64)) : 'freshtv66)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv47 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1446 "Parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv49 * _menhir_state) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 1455 "Parser.ml"
        )) * (
# 56 "Parser.mly"
      (Formula.binary_temp_op)
# 1459 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state) * _menhir_state * (
# 59 "Parser.mly"
      (Formula.unary_op)
# 1468 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * (
# 52 "Parser.mly"
      (Formula.boolForm)
# 1477 "Parser.ml"
        )) * (
# 60 "Parser.mly"
      (Formula.binary_op)
# 1481 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1490 "Parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * _menhir_state * (
# 54 "Parser.mly"
      (Formula.valueId)
# 1499 "Parser.ml"
        )) * (
# 58 "Parser.mly"
      (Formula.comp)
# 1503 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv62)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 2 "Parser.mly"
       (string)
# 1520 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv45) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 2 "Parser.mly"
       (string)
# 1530 "Parser.ml"
    )) : (
# 2 "Parser.mly"
       (string)
# 1534 "Parser.ml"
    )) = _v in
    ((let _v : (
# 54 "Parser.mly"
      (Formula.valueId)
# 1539 "Parser.ml"
    ) = 
# 90 "Parser.mly"
        (Variable(_1))
# 1543 "Parser.ml"
     in
    _menhir_goto_valueId _menhir_env _menhir_stack _menhir_s _v) : 'freshtv46)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv43) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1557 "Parser.ml"
    ) = 
# 125 "Parser.mly"
         (X)
# 1561 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv44)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACTIVE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | AF ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | AG ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | AVAILABLE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | AX ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | COMMAND _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | CONST _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | EF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EG ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | ERROR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EX ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EXISTS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | FINALLY ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | FORALL ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | GLOBALLY ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | LIVE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | LPAR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | NEXT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | NOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState3 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        ((let _1 = () in
        let _v : (
# 59 "Parser.mly"
      (Formula.unary_op)
# 1619 "Parser.ml"
        ) = 
# 134 "Parser.mly"
        (Not)
# 1623 "Parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 59 "Parser.mly"
      (Formula.unary_op)
# 1631 "Parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv35 * _menhir_state) * _menhir_state * (
# 59 "Parser.mly"
      (Formula.unary_op)
# 1638 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACTIVE ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | AF ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | AG ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | AVAILABLE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | AX ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | COMMAND _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | CONST _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | EF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | EG ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | ERROR ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | EX ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | EXISTS ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | FINALLY ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | FORALL ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | GLOBALLY ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | LIVE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | LPAR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | NEXT ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42) : 'freshtv36)) : 'freshtv38)) : 'freshtv40)) : 'freshtv42)
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv33) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 55 "Parser.mly"
      (Formula.state_constant)
# 1702 "Parser.ml"
    ) = 
# 95 "Parser.mly"
         ( Live )
# 1706 "Parser.ml"
     in
    _menhir_goto_state_constant _menhir_env _menhir_stack _menhir_s _v) : 'freshtv34)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv31) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1720 "Parser.ml"
    ) = 
# 124 "Parser.mly"
             (G)
# 1724 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv32)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv29) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1738 "Parser.ml"
    ) = 
# 121 "Parser.mly"
           (A)
# 1742 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv30)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1756 "Parser.ml"
    ) = 
# 123 "Parser.mly"
            (F)
# 1760 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1774 "Parser.ml"
    ) = 
# 122 "Parser.mly"
           (E)
# 1778 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv26)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1792 "Parser.ml"
    ) = 
# 129 "Parser.mly"
       (EX)
# 1796 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 55 "Parser.mly"
      (Formula.state_constant)
# 1810 "Parser.ml"
    ) = 
# 97 "Parser.mly"
          ( Error )
# 1814 "Parser.ml"
     in
    _menhir_goto_state_constant _menhir_env _menhir_stack _menhir_s _v) : 'freshtv22)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1828 "Parser.ml"
    ) = 
# 131 "Parser.mly"
       (EG)
# 1832 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv20)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv17) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1846 "Parser.ml"
    ) = 
# 130 "Parser.mly"
       (EF)
# 1850 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv18)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 3 "Parser.mly"
       (string)
# 1857 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv15) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 3 "Parser.mly"
       (string)
# 1867 "Parser.ml"
    )) : (
# 3 "Parser.mly"
       (string)
# 1871 "Parser.ml"
    )) = _v in
    ((let _v : (
# 54 "Parser.mly"
      (Formula.valueId)
# 1876 "Parser.ml"
    ) = 
# 91 "Parser.mly"
          (Constant(_1))
# 1880 "Parser.ml"
     in
    _menhir_goto_valueId _menhir_env _menhir_stack _menhir_s _v) : 'freshtv16)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "Parser.mly"
       (string)
# 1887 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 4 "Parser.mly"
       (string)
# 1897 "Parser.ml"
    )) : (
# 4 "Parser.mly"
       (string)
# 1901 "Parser.ml"
    )) = _v in
    ((let _v : (
# 54 "Parser.mly"
      (Formula.valueId)
# 1906 "Parser.ml"
    ) = 
# 92 "Parser.mly"
            (Command(_1))
# 1910 "Parser.ml"
     in
    _menhir_goto_valueId _menhir_env _menhir_stack _menhir_s _v) : 'freshtv14)

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1924 "Parser.ml"
    ) = 
# 126 "Parser.mly"
       (AX)
# 1928 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv12)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 55 "Parser.mly"
      (Formula.state_constant)
# 1942 "Parser.ml"
    ) = 
# 98 "Parser.mly"
              (Available)
# 1946 "Parser.ml"
     in
    _menhir_goto_state_constant _menhir_env _menhir_stack _menhir_s _v) : 'freshtv10)

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1960 "Parser.ml"
    ) = 
# 128 "Parser.mly"
       (AG)
# 1964 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.unary_temp_op)
# 1978 "Parser.ml"
    ) = 
# 127 "Parser.mly"
       (AF)
# 1982 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 55 "Parser.mly"
      (Formula.state_constant)
# 1996 "Parser.ml"
    ) = 
# 96 "Parser.mly"
           ( Active )
# 2000 "Parser.ml"
     in
    _menhir_goto_state_constant _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and parse_formula : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 67 "Parser.mly"
       (Formula.formula)
# 2019 "Parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACTIVE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | AF ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | AG ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | AVAILABLE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | AX ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | COMMAND _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | CONST _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | EF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EG ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ERROR ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EX ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EXISTS ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FINALLY ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FORALL ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | GLOBALLY ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LIVE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NEXT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 269 "<standard.mly>"
  

# 2084 "Parser.ml"
