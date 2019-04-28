%{
#include <stdio.h>
int flag = 0, flag1 = 1;
%}

%%
[-] {flag1--;}
[4][0-1][.]*[0-9]* {flag1--;}
[4][2][.]*[0]* {flag1--;}
[1-3][0-9][.][0-9]* {flag1--;}
[4][2][.][0]*[1-9] {flag++;}
[4][2-9]+ {flag++;}
[5-9][0-9]+ {flag++;}
[1-9][0-9][0-9]+ {flag++;}
[.] {}
[0-9] {}
%%
int main()
{
	printf("Enter the Number : ");
	yylex();
	if(flag && flag1){
		printf("Number is greater than 42\n");
	}
	else{
		printf("Number is not greater than 42\n");
	}
    return 0;
}
