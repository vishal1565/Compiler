%{
#include<stdio.h>
int flag = 0;
%}
%%
"AND" {flag++;}
"and" {flag++;}
"OR" {flag++;}
"or" {flag++;}
"BUT" {flag++;}
"but" {flag++;}
[a-zA-Z]* {}
%%

void main(){
    yylex();
    if(flag>0)
        printf("Compound Statement\n");
    else
        printf("Simple Statement\n");
}