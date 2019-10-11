
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
    | RELEASE
    | OR
    | NOT
    | NEXT
    | NEQ
    | LTE
    | LT
    | LIVE
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
# 41 "Parser.ml"
  )
    | COMMAND of (
# 4 "Parser.mly"
       (string)
# 46 "Parser.ml"
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
  | MenhirState44
  | MenhirState42
  | MenhirState31
  | MenhirState30
  | MenhirState29
  | MenhirState27
  | MenhirState0

# 63 "Parser.mly"
  
  open Formula

# 82 "Parser.ml"

let rec _menhir_goto_tempForm : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 52 "Parser.mly"
      (Formula.tempForm)
# 87 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv159 * _menhir_state * (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 97 "Parser.ml"
        )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.tempForm)
# 101 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv157 * _menhir_state * (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 107 "Parser.ml"
        )) * _menhir_state * (
# 52 "Parser.mly"
      (Formula.tempForm)
# 111 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 116 "Parser.ml"
        ))), _, (_2 : (
# 52 "Parser.mly"
      (Formula.tempForm)
# 120 "Parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 52 "Parser.mly"
      (Formula.tempForm)
# 125 "Parser.ml"
        ) = 
# 77 "Parser.mly"
                           (Tf2(_1,_2))
# 129 "Parser.ml"
         in
        _menhir_goto_tempForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv158)) : 'freshtv160)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv173 * _menhir_state * (
# 52 "Parser.mly"
      (Formula.tempForm)
# 137 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv169 * _menhir_state * (
# 52 "Parser.mly"
      (Formula.tempForm)
# 147 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv167 * _menhir_state * (
# 52 "Parser.mly"
      (Formula.tempForm)
# 153 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 52 "Parser.mly"
      (Formula.tempForm)
# 158 "Parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 68 "Parser.mly"
       (Formula.formula)
# 164 "Parser.ml"
            ) = 
# 73 "Parser.mly"
                 ( Form(_1))
# 168 "Parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv165) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 68 "Parser.mly"
       (Formula.formula)
# 176 "Parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv163) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 68 "Parser.mly"
       (Formula.formula)
# 184 "Parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv161) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 68 "Parser.mly"
       (Formula.formula)
# 192 "Parser.ml"
            )) : (
# 68 "Parser.mly"
       (Formula.formula)
# 196 "Parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv162)) : 'freshtv164)) : 'freshtv166)) : 'freshtv168)) : 'freshtv170)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv171 * _menhir_state * (
# 52 "Parser.mly"
      (Formula.tempForm)
# 206 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)) : 'freshtv174)
    | _ ->
        _menhir_fail ()

and _menhir_goto_binary_temp_op : _menhir_env -> 'ttv_tail -> (
# 57 "Parser.mly"
      (Formula.binary_temp_op)
# 216 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv155 * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 224 "Parser.ml"
    )) * (
# 57 "Parser.mly"
      (Formula.binary_temp_op)
# 228 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACTIVE ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | AF ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | AG ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | AVAILABLE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | AX ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | COMMAND _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | CONST _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | EF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | EG ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | ERROR ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | EX ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | EXISTS ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | FINALLY ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | FORALL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | GLOBALLY ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LIVE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | NEXT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42) : 'freshtv156)

and _menhir_goto_binary_op : _menhir_env -> 'ttv_tail -> (
# 61 "Parser.mly"
      (Formula.binary_op)
# 279 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv153 * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 287 "Parser.ml"
    )) * (
# 61 "Parser.mly"
      (Formula.binary_op)
# 291 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACTIVE ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | AF ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | AG ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | AVAILABLE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | AX ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | COMMAND _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | CONST _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | EF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | EG ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | ERROR ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | EX ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | EXISTS ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | FINALLY ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | FORALL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | GLOBALLY ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LIVE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | NEXT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv154)

and _menhir_reduce27 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 342 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : (
# 53 "Parser.mly"
      (Formula.boolForm)
# 348 "Parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 52 "Parser.mly"
      (Formula.tempForm)
# 353 "Parser.ml"
    ) = 
# 76 "Parser.mly"
             (Tf1(_1))
# 357 "Parser.ml"
     in
    _menhir_goto_tempForm _menhir_env _menhir_stack _menhir_s _v

and _menhir_run34 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv151) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : (
# 61 "Parser.mly"
      (Formula.binary_op)
# 370 "Parser.ml"
    ) = 
# 112 "Parser.mly"
        (Xor)
# 374 "Parser.ml"
     in
    _menhir_goto_binary_op _menhir_env _menhir_stack _v) : 'freshtv152)

and _menhir_run35 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv149) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.binary_temp_op)
# 387 "Parser.ml"
    ) = 
# 116 "Parser.mly"
         (W)
# 391 "Parser.ml"
     in
    _menhir_goto_binary_temp_op _menhir_env _menhir_stack _v) : 'freshtv150)

and _menhir_run36 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv147) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.binary_temp_op)
# 404 "Parser.ml"
    ) = 
# 119 "Parser.mly"
          (U)
# 408 "Parser.ml"
     in
    _menhir_goto_binary_temp_op _menhir_env _menhir_stack _v) : 'freshtv148)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv145) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.binary_temp_op)
# 421 "Parser.ml"
    ) = 
# 117 "Parser.mly"
              (M)
# 425 "Parser.ml"
     in
    _menhir_goto_binary_temp_op _menhir_env _menhir_stack _v) : 'freshtv146)

and _menhir_run38 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv143) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : (
# 57 "Parser.mly"
      (Formula.binary_temp_op)
# 438 "Parser.ml"
    ) = 
# 118 "Parser.mly"
            (R)
# 442 "Parser.ml"
     in
    _menhir_goto_binary_temp_op _menhir_env _menhir_stack _v) : 'freshtv144)

and _menhir_run39 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv141) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : (
# 61 "Parser.mly"
      (Formula.binary_op)
# 455 "Parser.ml"
    ) = 
# 110 "Parser.mly"
       ( Or )
# 459 "Parser.ml"
     in
    _menhir_goto_binary_op _menhir_env _menhir_stack _v) : 'freshtv142)

and _menhir_run40 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv139) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : (
# 61 "Parser.mly"
      (Formula.binary_op)
# 472 "Parser.ml"
    ) = 
# 113 "Parser.mly"
        (Imp)
# 476 "Parser.ml"
     in
    _menhir_goto_binary_op _menhir_env _menhir_stack _v) : 'freshtv140)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv137) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : (
# 61 "Parser.mly"
      (Formula.binary_op)
# 489 "Parser.ml"
    ) = 
# 111 "Parser.mly"
        ( And )
# 493 "Parser.ml"
     in
    _menhir_goto_binary_op _menhir_env _menhir_stack _v) : 'freshtv138)

and _menhir_goto_boolForm : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 53 "Parser.mly"
      (Formula.boolForm)
# 500 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv109 * _menhir_state * (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 510 "Parser.ml"
        )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 514 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | RELEASE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | S_RELEASE ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | UNTIL ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | WEAK ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv105 * _menhir_state * (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 540 "Parser.ml"
            )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 544 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 549 "Parser.ml"
            ))), _, (_2 : (
# 53 "Parser.mly"
      (Formula.boolForm)
# 553 "Parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 53 "Parser.mly"
      (Formula.boolForm)
# 558 "Parser.ml"
            ) = 
# 83 "Parser.mly"
                           (Bf4(_1,_2))
# 562 "Parser.ml"
             in
            _menhir_goto_boolForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv106)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv107 * _menhir_state * (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 572 "Parser.ml"
            )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 576 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)) : 'freshtv110)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 585 "Parser.ml"
        )) * (
# 57 "Parser.mly"
      (Formula.binary_temp_op)
# 589 "Parser.ml"
        )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 593 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | RELEASE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | S_RELEASE ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | UNTIL ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | WEAK ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv111 * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 619 "Parser.ml"
            )) * (
# 57 "Parser.mly"
      (Formula.binary_temp_op)
# 623 "Parser.ml"
            )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 627 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 53 "Parser.mly"
      (Formula.boolForm)
# 632 "Parser.ml"
            ))), (_2 : (
# 57 "Parser.mly"
      (Formula.binary_temp_op)
# 636 "Parser.ml"
            ))), _, (_3 : (
# 53 "Parser.mly"
      (Formula.boolForm)
# 640 "Parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 53 "Parser.mly"
      (Formula.boolForm)
# 645 "Parser.ml"
            ) = 
# 84 "Parser.mly"
                                     (Bf5(_1,_2,_3))
# 649 "Parser.ml"
             in
            _menhir_goto_boolForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv113 * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 659 "Parser.ml"
            )) * (
# 57 "Parser.mly"
      (Formula.binary_temp_op)
# 663 "Parser.ml"
            )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 667 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)) : 'freshtv116)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv121 * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 676 "Parser.ml"
        )) * (
# 61 "Parser.mly"
      (Formula.binary_op)
# 680 "Parser.ml"
        )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 684 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | RELEASE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | S_RELEASE ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | UNTIL ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | WEAK ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv117 * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 710 "Parser.ml"
            )) * (
# 61 "Parser.mly"
      (Formula.binary_op)
# 714 "Parser.ml"
            )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 718 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 53 "Parser.mly"
      (Formula.boolForm)
# 723 "Parser.ml"
            ))), (_2 : (
# 61 "Parser.mly"
      (Formula.binary_op)
# 727 "Parser.ml"
            ))), _, (_3 : (
# 53 "Parser.mly"
      (Formula.boolForm)
# 731 "Parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 53 "Parser.mly"
      (Formula.boolForm)
# 736 "Parser.ml"
            ) = 
# 82 "Parser.mly"
                                (Bf3(_1,_2,_3))
# 740 "Parser.ml"
             in
            _menhir_goto_boolForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv118)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv119 * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 750 "Parser.ml"
            )) * (
# 61 "Parser.mly"
      (Formula.binary_op)
# 754 "Parser.ml"
            )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 758 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)) : 'freshtv122)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv127 * _menhir_state * (
# 60 "Parser.mly"
      (Formula.unary_op)
# 767 "Parser.ml"
        )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 771 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | RELEASE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | S_RELEASE ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | UNTIL ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | WEAK ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv123 * _menhir_state * (
# 60 "Parser.mly"
      (Formula.unary_op)
# 797 "Parser.ml"
            )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 801 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 60 "Parser.mly"
      (Formula.unary_op)
# 806 "Parser.ml"
            ))), _, (_2 : (
# 53 "Parser.mly"
      (Formula.boolForm)
# 810 "Parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 53 "Parser.mly"
      (Formula.boolForm)
# 815 "Parser.ml"
            ) = 
# 81 "Parser.mly"
                      (Bf2(_1,_2))
# 819 "Parser.ml"
             in
            _menhir_goto_boolForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv124)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv125 * _menhir_state * (
# 60 "Parser.mly"
      (Formula.unary_op)
# 829 "Parser.ml"
            )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 833 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)) : 'freshtv128)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv131 * _menhir_state * (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 842 "Parser.ml"
        )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 846 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | RELEASE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | S_RELEASE ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | UNTIL ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | WEAK ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            _menhir_reduce27 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv129 * _menhir_state * (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 876 "Parser.ml"
            )) * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 880 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)) : 'freshtv132)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 889 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AND ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | IMP ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | RELEASE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | S_RELEASE ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | UNTIL ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | WEAK ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            _menhir_reduce27 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv133 * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 919 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)) : 'freshtv136)
    | _ ->
        _menhir_fail ()

and _menhir_goto_comp : _menhir_env -> 'ttv_tail -> (
# 59 "Parser.mly"
      (Formula.comp)
# 929 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv103 * _menhir_state * (
# 55 "Parser.mly"
      (Formula.valueId)
# 937 "Parser.ml"
    )) * (
# 59 "Parser.mly"
      (Formula.comp)
# 941 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMAND _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | CONST _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27) : 'freshtv104)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_atomicForm : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 54 "Parser.mly"
      (Formula.atomicForm)
# 965 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv101) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 54 "Parser.mly"
      (Formula.atomicForm)
# 974 "Parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv99) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 54 "Parser.mly"
      (Formula.atomicForm)
# 982 "Parser.ml"
    )) : (
# 54 "Parser.mly"
      (Formula.atomicForm)
# 986 "Parser.ml"
    )) = _v in
    ((let _v : (
# 53 "Parser.mly"
      (Formula.boolForm)
# 991 "Parser.ml"
    ) = 
# 80 "Parser.mly"
               (Bf1(_1) )
# 995 "Parser.ml"
     in
    _menhir_goto_boolForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv100)) : 'freshtv102)

and _menhir_goto_valueId : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 55 "Parser.mly"
      (Formula.valueId)
# 1002 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState44 | MenhirState42 | MenhirState31 | MenhirState30 | MenhirState29 | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * (
# 55 "Parser.mly"
      (Formula.valueId)
# 1012 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv69) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv67) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 59 "Parser.mly"
      (Formula.comp)
# 1027 "Parser.ml"
            ) = 
# 102 "Parser.mly"
       (Eq)
# 1031 "Parser.ml"
             in
            _menhir_goto_comp _menhir_env _menhir_stack _v) : 'freshtv68)) : 'freshtv70)
        | LT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv71) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 59 "Parser.mly"
      (Formula.comp)
# 1044 "Parser.ml"
            ) = 
# 104 "Parser.mly"
       (Lt)
# 1048 "Parser.ml"
             in
            _menhir_goto_comp _menhir_env _menhir_stack _v) : 'freshtv72)) : 'freshtv74)
        | LTE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv77) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv75) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 59 "Parser.mly"
      (Formula.comp)
# 1061 "Parser.ml"
            ) = 
# 106 "Parser.mly"
        (Lte)
# 1065 "Parser.ml"
             in
            _menhir_goto_comp _menhir_env _menhir_stack _v) : 'freshtv76)) : 'freshtv78)
        | NEQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv81) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv79) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 59 "Parser.mly"
      (Formula.comp)
# 1078 "Parser.ml"
            ) = 
# 103 "Parser.mly"
        (Neq)
# 1082 "Parser.ml"
             in
            _menhir_goto_comp _menhir_env _menhir_stack _v) : 'freshtv80)) : 'freshtv82)
        | ST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv85) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv83) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 59 "Parser.mly"
      (Formula.comp)
# 1095 "Parser.ml"
            ) = 
# 105 "Parser.mly"
       (St)
# 1099 "Parser.ml"
             in
            _menhir_goto_comp _menhir_env _menhir_stack _v) : 'freshtv84)) : 'freshtv86)
        | STE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv89) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv87) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : (
# 59 "Parser.mly"
      (Formula.comp)
# 1112 "Parser.ml"
            ) = 
# 107 "Parser.mly"
        (Ste)
# 1116 "Parser.ml"
             in
            _menhir_goto_comp _menhir_env _menhir_stack _v) : 'freshtv88)) : 'freshtv90)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv91 * _menhir_state * (
# 55 "Parser.mly"
      (Formula.valueId)
# 1126 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)) : 'freshtv94)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv97 * _menhir_state * (
# 55 "Parser.mly"
      (Formula.valueId)
# 1135 "Parser.ml"
        )) * (
# 59 "Parser.mly"
      (Formula.comp)
# 1139 "Parser.ml"
        )) * _menhir_state * (
# 55 "Parser.mly"
      (Formula.valueId)
# 1143 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv95 * _menhir_state * (
# 55 "Parser.mly"
      (Formula.valueId)
# 1149 "Parser.ml"
        )) * (
# 59 "Parser.mly"
      (Formula.comp)
# 1153 "Parser.ml"
        )) * _menhir_state * (
# 55 "Parser.mly"
      (Formula.valueId)
# 1157 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 55 "Parser.mly"
      (Formula.valueId)
# 1162 "Parser.ml"
        ))), (_2 : (
# 59 "Parser.mly"
      (Formula.comp)
# 1166 "Parser.ml"
        ))), _, (_3 : (
# 55 "Parser.mly"
      (Formula.valueId)
# 1170 "Parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 54 "Parser.mly"
      (Formula.atomicForm)
# 1175 "Parser.ml"
        ) = 
# 88 "Parser.mly"
                         (Af2(_1,_2,_3))
# 1179 "Parser.ml"
         in
        _menhir_goto_atomicForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv96)) : 'freshtv98)

and _menhir_goto_unary_temp_op : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1186 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState29 | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state * (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1196 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACTIVE ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | AF ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | AG ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | AVAILABLE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | AX ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | COMMAND _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | CONST _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | EF ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | EG ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | ERROR ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | EX ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | EXISTS ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | FINALLY ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | FORALL ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | GLOBALLY ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | LIVE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | NEXT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | NOT ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv64)
    | MenhirState44 | MenhirState42 | MenhirState31 | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state * (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1248 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACTIVE ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | AF ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | AG ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | AVAILABLE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | AX ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | COMMAND _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | CONST _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | EF ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | EG ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | ERROR ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | EX ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | EXISTS ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | FINALLY ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | FORALL ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | GLOBALLY ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | LIVE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | NEXT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | NOT ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31) : 'freshtv66)
    | _ ->
        _menhir_fail ()

and _menhir_goto_state_constant : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 56 "Parser.mly"
      (Formula.state_constant)
# 1301 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv61) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 56 "Parser.mly"
      (Formula.state_constant)
# 1310 "Parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 56 "Parser.mly"
      (Formula.state_constant)
# 1318 "Parser.ml"
    )) : (
# 56 "Parser.mly"
      (Formula.state_constant)
# 1322 "Parser.ml"
    )) = _v in
    ((let _v : (
# 54 "Parser.mly"
      (Formula.atomicForm)
# 1327 "Parser.ml"
    ) = 
# 87 "Parser.mly"
                   (Af1(_1))
# 1331 "Parser.ml"
     in
    _menhir_goto_atomicForm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv60)) : 'freshtv62)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv45 * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 1343 "Parser.ml"
        )) * (
# 61 "Parser.mly"
      (Formula.binary_op)
# 1347 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv47 * _menhir_state * (
# 53 "Parser.mly"
      (Formula.boolForm)
# 1356 "Parser.ml"
        )) * (
# 57 "Parser.mly"
      (Formula.binary_temp_op)
# 1360 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state * (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1369 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51 * _menhir_state * (
# 60 "Parser.mly"
      (Formula.unary_op)
# 1378 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state * (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1387 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * (
# 55 "Parser.mly"
      (Formula.valueId)
# 1396 "Parser.ml"
        )) * (
# 59 "Parser.mly"
      (Formula.comp)
# 1400 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv58)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 2 "Parser.mly"
       (string)
# 1412 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv43) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 2 "Parser.mly"
       (string)
# 1422 "Parser.ml"
    )) : (
# 2 "Parser.mly"
       (string)
# 1426 "Parser.ml"
    )) = _v in
    ((let _v : (
# 55 "Parser.mly"
      (Formula.valueId)
# 1431 "Parser.ml"
    ) = 
# 91 "Parser.mly"
        (Variable(_1))
# 1435 "Parser.ml"
     in
    _menhir_goto_valueId _menhir_env _menhir_stack _menhir_s _v) : 'freshtv44)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv41) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 60 "Parser.mly"
      (Formula.unary_op)
# 1449 "Parser.ml"
    ) = 
# 135 "Parser.mly"
        (Not)
# 1453 "Parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv39) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 60 "Parser.mly"
      (Formula.unary_op)
# 1461 "Parser.ml"
    )) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv37 * _menhir_state * (
# 60 "Parser.mly"
      (Formula.unary_op)
# 1468 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACTIVE ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | AF ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | AG ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | AVAILABLE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | AX ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | COMMAND _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | CONST _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | EF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | EG ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | ERROR ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | EX ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | EXISTS ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | FINALLY ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | FORALL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | GLOBALLY ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | LIVE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | NEXT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv38)) : 'freshtv40)) : 'freshtv42)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv35) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1526 "Parser.ml"
    ) = 
# 126 "Parser.mly"
         (X)
# 1530 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv36)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv33) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 56 "Parser.mly"
      (Formula.state_constant)
# 1544 "Parser.ml"
    ) = 
# 96 "Parser.mly"
         ( Live )
# 1548 "Parser.ml"
     in
    _menhir_goto_state_constant _menhir_env _menhir_stack _menhir_s _v) : 'freshtv34)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv31) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1562 "Parser.ml"
    ) = 
# 125 "Parser.mly"
             (G)
# 1566 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv32)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv29) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1580 "Parser.ml"
    ) = 
# 122 "Parser.mly"
           (A)
# 1584 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv30)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1598 "Parser.ml"
    ) = 
# 124 "Parser.mly"
            (F)
# 1602 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1616 "Parser.ml"
    ) = 
# 123 "Parser.mly"
           (E)
# 1620 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv26)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1634 "Parser.ml"
    ) = 
# 130 "Parser.mly"
       (EX)
# 1638 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 56 "Parser.mly"
      (Formula.state_constant)
# 1652 "Parser.ml"
    ) = 
# 98 "Parser.mly"
          ( Error )
# 1656 "Parser.ml"
     in
    _menhir_goto_state_constant _menhir_env _menhir_stack _menhir_s _v) : 'freshtv22)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1670 "Parser.ml"
    ) = 
# 132 "Parser.mly"
       (EG)
# 1674 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv20)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv17) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1688 "Parser.ml"
    ) = 
# 131 "Parser.mly"
       (EF)
# 1692 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv18)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 3 "Parser.mly"
       (string)
# 1699 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv15) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 3 "Parser.mly"
       (string)
# 1709 "Parser.ml"
    )) : (
# 3 "Parser.mly"
       (string)
# 1713 "Parser.ml"
    )) = _v in
    ((let _v : (
# 55 "Parser.mly"
      (Formula.valueId)
# 1718 "Parser.ml"
    ) = 
# 92 "Parser.mly"
          (Constant(_1))
# 1722 "Parser.ml"
     in
    _menhir_goto_valueId _menhir_env _menhir_stack _menhir_s _v) : 'freshtv16)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "Parser.mly"
       (string)
# 1729 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 4 "Parser.mly"
       (string)
# 1739 "Parser.ml"
    )) : (
# 4 "Parser.mly"
       (string)
# 1743 "Parser.ml"
    )) = _v in
    ((let _v : (
# 55 "Parser.mly"
      (Formula.valueId)
# 1748 "Parser.ml"
    ) = 
# 93 "Parser.mly"
            (Command(_1))
# 1752 "Parser.ml"
     in
    _menhir_goto_valueId _menhir_env _menhir_stack _menhir_s _v) : 'freshtv14)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1766 "Parser.ml"
    ) = 
# 127 "Parser.mly"
       (AX)
# 1770 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv12)

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 56 "Parser.mly"
      (Formula.state_constant)
# 1784 "Parser.ml"
    ) = 
# 99 "Parser.mly"
              (Available)
# 1788 "Parser.ml"
     in
    _menhir_goto_state_constant _menhir_env _menhir_stack _menhir_s _v) : 'freshtv10)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1802 "Parser.ml"
    ) = 
# 129 "Parser.mly"
       (AG)
# 1806 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 58 "Parser.mly"
      (Formula.unary_temp_op)
# 1820 "Parser.ml"
    ) = 
# 128 "Parser.mly"
       (AF)
# 1824 "Parser.ml"
     in
    _menhir_goto_unary_temp_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 56 "Parser.mly"
      (Formula.state_constant)
# 1838 "Parser.ml"
    ) = 
# 97 "Parser.mly"
           ( Active )
# 1842 "Parser.ml"
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
# 68 "Parser.mly"
       (Formula.formula)
# 1861 "Parser.ml"
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
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | AF ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | AG ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | AVAILABLE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | AX ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | COMMAND _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | CONST _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | EF ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EG ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ERROR ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EX ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EXISTS ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FINALLY ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FORALL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | GLOBALLY ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LIVE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NEXT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NOT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 269 "<standard.mly>"
  

# 1926 "Parser.ml"
