%{
#include<stdio.h>
int count1 = 0, count2 = 0;
%}
%%
[a,e,i,o,u,A,E,I,O,U] {count1++;}
[a-z A-Z] {count2++;}
"\n" {printf("No of Vowels : %d\nNo of Consonants : %d\n",count1,count2);count1=0;count2=0;}
%%

void main(){
    yylex();
}