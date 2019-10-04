open Formula

let s = ref ""

let rec eval_atomic f =
  match f with
  Af1(x) -> x^s
  