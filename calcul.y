%{
#include<ctype.h>
#include<stdio.h>
#define YYSTYPE double
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS

%%
lines	: lines expr '\n' { printf("%g\n",$2); }
	| lines '\n'
	| /*e*/
	;
expr	:  expr '+' expr  { $$ = $1 + $3; }
	|  expr '-' expr { $$ = $1 - $3; }
	|  expr '*' expr { $$ = $1 * $3; }
	|  expr '/' expr { $$ = $1 / $3; }
	|  '(' expr ')'  { $$ = $2; }
	|  '-'expr %prec UMINUS { $$ = -$2; }
	|  NUMBER
	;
%%

yylex()
{
int c;
while( ( c = getchar() ) == ' ');
if ( ( c =='.') || ( isdigit(c) ))
{
ungetc(c,stdin);
scanf("%lf",&yylval);
return NUMBER;
}
return c;
}
yyerror()
{

}
main()
{
yyparse();
}
