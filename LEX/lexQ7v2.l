%{
#include<stdio.h>
int comment1 = 0, comment2=0, flag=0;
%}

%%
((\/)(\/).*"\n") {comment1++;}
("/*")(.*|("\n")*) {flag=1,comment2++;}
"*/" {if(flag==1){}}
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