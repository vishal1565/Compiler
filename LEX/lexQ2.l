%{
#include<stdio.h>
int negative = 0, positive = 0, negfrac = 0, posfrac = 0;
%}
%%
^[-][0-9]+ {negative++;}
[0-9]+ {positive++;}
[-][0-9]*[.][0-9]* {negfrac++;}
[+]*[0-9]*[.][0-9]* {posfrac++;}
"\n" {printf("No of Negative Numbers : %d\nNo of Positive Numbers : %d\nNo of Positive Fractions : %d\nNo of Negative Fraction : %d\n",negative,positive,posfrac,negfrac);}
%%

void main(){
    yylex();
}