#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(){
	int n,sym,i,j,k,initialState,flag=0,temp=0;
	
	// TAKING DFA INPUTS
	
	printf("Enter the number of States: ");
	scanf("%d",&n);
	printf("Enter the number of Symbols: ");
	scanf("%d",&sym);
	
	printf("Enter the Transitions\n");
	int states[n][sym];
	for(i=0;i<n;i++){
		for(j=0;j<sym;j++){
			printf("On %d input enter transition state for state S%d: ",j,i);
			scanf("%d",&states[i][j]);
			if(states[i][j]>=n){
				j--;
				printf("Error!!\nNot a Valid State\n");
			}
		}
	}
	
	// CHECKING STRING IN DFA
	
	printf("Enter Initial State: ");
	scanf("%d",&initialState);
	char finalStates[100];
	printf("Enter Final States: ");
	scanf("%s",&finalStates);
	while(1){
		char input[100];
		printf("Enter a String to check: ");
		scanf("%s",&input);
		int curr;
		int l = (int)strlen(input);
		
		//CHECKING IF STRING IS VALID OR NOT
		for(i=0;i<l;i++){
			if((int)input[i]-48>=sym){
				printf("Not A Valid String!! \nTry Again!!\n\n");
				temp=-1;
				break;
			}
		}
		if(temp==-1){continue;}
		
		// NOW CHECKING IF STRING IS ACCEPTED IN DFA OR NOT
		for(i=0;i<l;i++){
			curr = (int)input[i]-48;
			flag = states[flag][curr];
		}
		l = (int)strlen(finalStates);
		for(i=0;i<l;i++){
			if(flag==(int)finalStates[i]-48){
				printf("******************************\nString Accepted in DFA\n******************************\n\n");
				temp=1;
				break;
			}
		}
		if(!temp){
			printf("******************************\nString was NOT Accepted by DFA\n******************************\n\n");
			temp=0;
		}
	}
	return 0;
}