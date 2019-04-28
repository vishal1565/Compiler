%{
#include<stdio.h>
int count = 0;
%}
%%
"ab" {count++;}
[a-zA-Z] {}
"\n" {printf("No of Occurances of 'ab' : %d\n",count);count=0;}
%%

void main(){
    yylex();
}