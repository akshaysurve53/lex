%{
#include<stdio.h>
#include<ctype.h>
int choice=0;
char ch;
FILE *fp,*fp2;
%}

%%
[a-zA-Z|.] {
	if(choice==1)
	{
	ch=toupper(yytext[0]);
	printf("%c",ch);
	fputc(ch,fp2);
	}
	else if(choice==2)
	{
	ch=tolower(yytext[0]);
	printf("%c",ch);
	fputc(ch,fp2);
	}
	else if(choice==3)
	{
	if(ch=='.')
		{
		ch=toupper(yytext[0]);
		printf("%c",ch);}
	else
	{ch=yytext[0];
	printf("%c",ch);}
	fputc(ch,fp2);
	}
	else if(choice==4)
	{
	if(islower(yytext[0]))
	ch=toupper(yytext[0]);
	else if(isupper(yytext[0]))
	ch=tolower(yytext[0]);
	else
	ch=yytext[0];
	printf("%c",ch);
	fputc(ch,fp2);
	}
	else
	{
	ch=yytext[0];
	printf("%c",ch);
	fputc(ch,fp2);}
	}

%%
void main()
{
fp2=fopen("op.txt","w");
printf("1.upper\n2.lower\n3.sentence\n4.toggle\n");
printf("enter your choice:\t");
scanf("%d",&choice);
fp=fopen("ip.txt","r");
yyin=fp;
yylex();
fclose(fp);
return;
}
yywrap()
{}
