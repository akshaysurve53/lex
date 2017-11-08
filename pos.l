%{
#include<stdio.h>
%}

%%
exam|name|girl|boy {printf("\n%s is a noun",yytext);}
my|i|am|he|she {printf("\n%s is a pronoun",yytext);}
is|was|were {printf("\n%s is a verb",yytext);}
beautiful|ugly {printf("\n%s is a adjective",yytext);}
a|an|the {printf("\n%s ia a article",yytext);}
[a-z]+ {printf("\n%s is a plain text",yytext);}

%%

void main()
{
yylex();
}

