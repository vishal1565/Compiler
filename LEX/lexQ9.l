%{
#include<stdio.h>
int countId = 0, countInt = 0, count = 0, countDecimal=0;
%}
%%
[a-zA-Z]([a-zA-Z_]|[0-9])* {countId++;}
[0-9]*[.][0-9]* {count++;}
[0-9]* {countInt++;}
[a-zA-Z0-9]* {count++;}
[<>(){}%""''=%,;&\:#.] {}
[\n] {}
[-] {}
%%

void main(){
    char *fileName = malloc(sizeof(char));
    printf("Enter FileName : ");
    scanf("%s",fileName);
    yyin=fopen(fileName,"r");
    yylex();
    printf("\nNo of Identifiers : %d\n",countId);
    printf("No of Integers : %d\n",countInt);
    printf("No of String which are not String Nor Identifiers : %d\n",count);
}