(** 1.1.1 **)

type var = A | B | C | D
           
type bexp = 
| Btrue | Bfalse
| Bnot of bexp
| Band of bexp * bexp
| Bor of bexp * bexp
| Beq of bexp * bexp
| Bvar of var;;


type winstr =
  | Skip                          (* ne rien faire *)
  | Assign of var * bexp          (* v := e *)
  | Seq    of winstr * winstr         (* P ; Q *)
  | If     of bexp * winstr * winstr   (* i(v){P}{Q} *)
  | While  of bexp * winstr          (* w(v){P} *)

let exemple =
  Seq (Assign (A, Btrue),
  Seq (Assign (B, Btrue),
  Seq (Assign (C, Btrue),
       While (Bvar A,
         If (Bvar C, Seq (Assign (C, Bfalse), Assign (A, Bvar B)),
                Seq (Assign (B, Bfalse), Assign (C, Bvar A)))))));;

(** 1.1.2 **)

(**

V ::= 'a' | 'b' | 'c' | 'd'
C ::= '0' | '1'
E ::= C | V
I ::= ε
    | V ':' '=' E
    | 'i' '(' V ')' '{' P '}' '{' P '}'
    | 'w' '(' V ')' '{' P '}'
P ::= P ';' I | I

*)

(** 1.1.3 *)
(*
P ::= I S
S ::= ';' I S | ε
*)

(* 1.1.4 *)
(*
C  ::= '0' | '1'
V  ::= 'a' | 'b' | 'c' | 'd'
A  ::= C | V
E  ::= T E'
E' ::= '+' T E' | ε
T  ::= F T'
T' ::= '.' F T' | ε
F  ::= '!' F | A | '(' E ')'
*)

