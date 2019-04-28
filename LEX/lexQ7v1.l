%{
#include<stdio.h>
int comment1 = 0, comment2=0;
%}

%%
[/][/]([ a-zA-Z0-9]*|[./]*)*[\n]* {comment2++;}
[/][*]([ ./a-zA-Z0-9]*[\n]*)*[*][/] {comment1++;}
[\n] {}
%%

int main(void)
{
    yyin = fopen("removeComment.c","r");
    yyout = fopen("noComment.c","w");
    yylex();
    printf("No of Single Line comment : %d\n",comment1);
    printf("No of Multi Line comment : %d\n",comment2);
    return 0;
}