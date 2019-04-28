%{
#include<stdio.h>
%}

%%
"printf" fprintf(yyout,"write");
.|\n fprintf(yyout,"%s",yytext);

"scanf" fprintf(yyout,"read");
.|\n fprintf(yyout,"%s",yytext);
%%

int main(void)
{
yyin=fopen("test.c","r");
yyout=fopen("test1.c","w");
yylex();
return 0;
}