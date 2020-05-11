# Grammar

```
-- programs ------------------------------------------------

entrypoints Program ;

Program.   Program ::= [Decl] ;

-- blocks --------------------------------------------------

Block.     Block ::= "{" [BlockInst] "}" ;

DeclInst.  BlockInst ::= Decl ;

StmtInst.  BlockInst ::= Stmt ;

separator  BlockInst "" ;

-- declarations --------------------------------------------

FnDecl.	   Decl ::= Type Ident "(" [Arg] ")" Block ;

Arg.       Arg ::= ArgType Ident ;

separator  Arg "," ;

VarDecl.   Decl ::= Type [Item] ";" ;

NoInit.    Item ::= Ident ; 

Init.      Item ::= Ident "=" Expr ;

separator nonempty Item "," ;

separator  Decl "" ;

-- statements ----------------------------------------------

Empty.     Stmt ::= ";" ;

BStmt.     Stmt ::= Block ;

Ass.        Stmt ::= Ident "=" Expr  ";" ;

Incr.       Stmt ::= Ident "++"  ";" ;

Decr.       Stmt ::= Ident "--"  ";" ;

Ret.        Stmt ::= "return" Expr ";" ;

VRet.       Stmt ::= "return" ";" ;

Cond.       Stmt ::= "if" "(" Expr ")" Stmt ;

CondElse.   Stmt ::= "if" "(" Expr ")" Stmt "else" Stmt ;

While.      Stmt ::= "while" "(" Expr ")" Stmt ;

SExp.       Stmt ::= Expr ";" ;

Break.      Stmt ::= "break" ";" ;

Continue.   Stmt ::= "continue" ";" ;

Print.      Stmt ::= "print" "(" Expr ")" ;

-- Types ---------------------------------------------------

Int.        Type ::= "int" ;

Str.        Type ::= "string" ;

Bool.       Type ::= "bool" ;

Void.       Type ::= "void" ;

internal    Fun. Type ::= Type "(" [ArgType] ")" ;

ValArgType. ArgType ::= Type ;

RefArgType. ArgType ::= Type "&" ;

separator   ArgType "," ;

-- Expressions ---------------------------------------------

EVar.       Expr6 ::= Ident ;

ELitInt.    Expr6 ::= Integer ;

ELitTrue.   Expr6 ::= "true" ;

ELitFalse.  Expr6 ::= "false" ;

EApp.       Expr6 ::= Ident "(" [Expr] ")" ;

EString.    Expr6 ::= String ;

Neg.        Expr5 ::= "-" Expr6 ;

Not.        Expr5 ::= "!" Expr6 ;

EMul.       Expr4 ::= Expr4 MulOp Expr5 ;

EAdd.       Expr3 ::= Expr3 AddOp Expr4 ;

ERel.       Expr2 ::= Expr2 RelOp Expr3 ;

EAnd.       Expr1 ::= Expr2 "&&" Expr1 ;

EOr.        Expr ::= Expr1 "||" Expr ;

coercions   Expr 6 ;

separator   Expr "," ;

-- operators -----------------------------------------------

Plus.       AddOp ::= "+" ;

Minus.      AddOp ::= "-" ;

Times.      MulOp ::= "*" ;

Div.        MulOp ::= "/" ;

Mod.        MulOp ::= "%" ;

LTH.        RelOp ::= "<" ;

LE.         RelOp ::= "<=" ;

GTH.        RelOp ::= ">" ;

GE.         RelOp ::= ">=" ;

EQU.        RelOp ::= "==" ;

NE.         RelOp ::= "!=" ;

-- comments ------------------------------------------------

comment    "#" ;

comment    "//" ;

comment    "/*" "*/" ;
```

## Conflicts

The grammar has at least one conflict. `Print` instruction may be written same as user's function named `print`.
Parser reads that as `Print` instruction, so user can't define and use function named `print`.

# Examples

## Hello World

```c
// Hello World!

int main() {
  print("Hello World!");
  return 0;
}
```

## Passing variable by reference

```c
// 1

void increase(int &x) {
  x++;
}

int main() {
  int x = 0;
  increase(x);
  print(x);

  return 0;
}
```

## Static binding and nested functions

```c
// 5
// 1

int main() {
  int x = 0;

  void increase_x() {
    x++;
  }

  void foo() {
    int x = 5;
    increase_x();

    print(x);
    print("\n");
  }

  foo();

  print(x);

  return 0;
}

```

## Error handling

```c
// Error: division by 0

int main() {
  int x = 2 / 0;

  return 0;
}
```

# Description

The language is based on the Latte programming language described here:
[https://www.mimuw.edu.pl/~ben/Zajecia/Mrj2013/Latte/description.html](https://www.mimuw.edu.pl/~ben/Zajecia/Mrj2013/Latte/description.html).

Most of the syntax and semantics is exactly the same as in C/Java.

Things that I've changed compared to Latte:
- There are two ways of passing parameters to the functions
  (by value and by reference like in C++).
- There is only one IO instruction (`print`).
- Static binding of variables.
- Error handling.
- Static typing.
- Nested functions.
- `break` and `continue` instructions.

# Points table

Na 15 punktów
- [x] 01 (trzy typy)
- [x] 02 (literały, arytmetyka, porównania)
- [x] 03 (zmienne, przypisanie)
- [x] 04 (print)
- [x] 05 (while, if)
- [x] 06 (funkcje lub procedury, rekurencja)
- [x] 07 (przez zmienną / przez wartość / in/out)
- [ ] 08 (zmienne read-only i pętla for)

Na 20 punktów
- [x] 09 (przesłanianie i statyczne wiązanie)
- [x] 10 (obsługa błędów wykonania)
- [x] 11 (funkcje zwracające wartość)

Na 30 punktów
- [x] 12 (4) (statyczne typowanie)
- [x] 13 (2) (funkcje zagnieżdżone ze statycznym wiązaniem)
- [ ] 14 (1) (rekordy/tablice/listy)
- [ ] 15 (2) (krotki z przypisaniem)
- [x] 16 (1) (break, continue)
- [ ] 17 (4) (funkcje wyższego rzędu, anonimowe, domknięcia)
- [ ] 18 (3) (generatory)

Razem: 27
