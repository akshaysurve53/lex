%{
#include<stdio.h>
#include<string.h>
FILE *fp,*fp1;
char find[20],replace[20];
%}

%%
[a-zA-Z]+ {if(strcmp(find,yytext)==0) fprintf(fp1,replace); else fprintf(fp1,yytext);}
[ ] {fprintf(fp1,yytext);}
%%
int main(int argc,char **argv)
{
printf("enter string to be found:");
scanf("%s",find);
printf("enter string to be replace:");
scanf("%s",replace);
fp=fopen(argv[1],"r+");
fp1=fopen("abcd.txt","w");
yyin=fp;
yylex();
fclose(fp);
fclose(fp1);
return 0;
}
int yywrap()
{}
