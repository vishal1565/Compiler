%{
#include<stdio.h>
int count = 0;
%}

%%
"abb"[a-zA-z0-9]*"ccd" {count++;}
[a-zA-Z]* {}
%%

int main(void)
{
    FILE *fp;
    char *fileName = malloc(sizeof(char));
    printf("Enter FileName : ");
    scanf("%s",fileName);
    fp = fopen(fileName,"r");
    yyin = fp;
    yylex();
    printf("\nNo of Strings starting with 'abb' and ending with 'ccd' Found : %d\n",count);
    return 0;
}