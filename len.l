%{
#include<stdio.h>
#include<string.h>
int len=0;
int maxlen=0;
char word[100];
%}

%%
[a-zA-Z0-9]+ {printf("%s",yytext);
		len=yyleng;
		if(len>=maxlen)
		{
		maxlen=len;
		strcpy(word,yytext);
		}
	}

%%

void main()
{
FILE *fp;
fp=fopen("text.txt","r");
yyin=fp;
yylex();
printf("longest string is:\t%s\n",word);
fclose(fp);
return;
}
yywrap()
{}

