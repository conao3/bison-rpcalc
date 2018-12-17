/*
 * 字句解析器は、数値を読めば、double型の値をスタックに積んで
 * トークン「NUM」を返し、数値以外を読めば、その文字のアスキー符号を返す。
 * 空白とタブは読み飛ばされる。ファイルが終わると0を返す。
 */

#include <ctype.h>

int yylex () {
  int c;

  /* 空白類を読み飛ばす  */
  while ((c = getchar ()) == ' ' || c == '\t')  
    ;
  /* 数値を処理する   */
  if (c == '.' || isdigit (c))                
    {
      ungetc (c, stdin);
      scanf ("%lf", &yylval);
      return NUM;
    }
  /* ファイルの終わりを処理する  */
  if (c == EOF)                            
    return 0;
  /* 1文字を返す */
  return c;                                
}
