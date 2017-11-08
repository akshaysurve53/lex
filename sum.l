%{
#include<stdio.h>
#include<stdlib.h>
%}
digit [0-9]+
%%
{digit} return atoi(yytext);
%% 
main()
{
float num,sum=0,n=0;
while((num=yylex())>0)
{
sum=sum+num;
n=n+1;
}
printf("Avg:%f\n",sum/n);
yylex();
return 0;
}

