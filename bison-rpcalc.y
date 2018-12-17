/* 逆ポーランド記法電卓 */

%{
#define YYSTYPE double
#include <math.h>
%}

%token NUM

%% /* 文法規則とアクションが続く */

input:    /* 空 */
        | input line
;

line:     '\n'
        | exp '\n'  { printf ("\t%.10g\n", $1); }
;

exp:      NUM             { $$ = $1;         }
        | exp exp '+'     { $$ = $1 + $2;    }
        | exp exp '-'     { $$ = $1 - $2;    }
        | exp exp '*'     { $$ = $1 * $2;    }
        | exp exp '/'     { $$ = $1 / $2;    }
      /* べき乗関数 */
        | exp exp '^'     { $$ = pow ($1, $2); }
      /* 単項のマイナス    */
        | exp 'n'         { $$ = -$1;        }
;

%%
#include <stdio.h>
#include "bison-rpcalc.lex.c"

int main () {
  yyparse ();
}
