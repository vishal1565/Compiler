%{
#include<stdio.h>
int chars = 0, words = 0, spaces = 0, lines = 0;
%}

%%
[\n] {lines++;}
[\t] {spaces++;}
[" "] {spaces++;chars++;}
[a-zA-Z]* {words++;chars++;}
[^\n\t] {}
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
    printf("\nCharacters : %d\n",chars);
    printf("Words : %d\n",words);
    printf("Spaces : %d\n",spaces);
    printf("Lines : %d\n",lines);
    return 0;
}