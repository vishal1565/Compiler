%{
#include<stdio.h>
int print = 0, scan = 0;
%}
%%
"printf" {print++;}
"scanf" {scan++;}
%%

void main(){
    extern FILE *yyin;
    yyin = fopen("test.c","r");
    printf("Input Source Code is\n\n");
    yylex();
    printf("\n*********************************************************************\n");
    printf("End of Source File\n");
    printf("No of printf = %d\n",print);
    printf("No of scanf = %d\n",scan);
}