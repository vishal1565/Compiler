#include<bits/stdc++.h>
using namespace std;

int main(){
    int n, sym, state = 0, input = -1, nxtState = 0, temp=-2;
    vector<pair <int, pair<int, int> > >stateTable;
    cout<<"Enter the Number of States: ";
    cin>>n;
    cout<<"Enter the Number of Symbols: ";
    cin>>sym;
    cout<<"Enter Transition Table in the format (State Input Next-State)"<<endl;
    
    while(state + input + nxtState != -3){
        stateTable.push_back(make_pair(state, make_pair(input, nxtState)));
        cin>>state>>input>>nxtState;
    }
    cout<<endl<<"Transition Table Entered is"<<endl;
    cout<<"State\tInput\tNext-State"<<endl;
    sort(stateTable.begin(),stateTable.end());
    for(int i=1;i<stateTable.size();i++){
        cout<<"S"<<stateTable[i].first<<"\t"<<stateTable[i].second.first<<"\t"<<"S"<<stateTable[i].second.second<<endl;
    }

    vector<int>finalStates;
    cout<<"Enter Final States(Enter -1 to stop)"<<endl;
    while(temp!=-1){
        cin>>temp;
        finalStates.push_back(temp);
    }
    finalStates.pop_back();
    temp = -2;

    while(1){
        vector<int>inputString;
        cout<<"Enter the Input String(Enter -1 to stop):";
        while(temp != -1){
            cin>>temp;
            inputString.push_back(temp);
        }
        inputString.pop_back();
        temp = -2;

        cout<<"String To Check: ";
        for(int i=0;i<inputString.size();i++){
            cout<<inputString[i];
        }
        cout<<endl;

        vector<int>s1, s2;
        s2.push_back(0);
        for(int i=0;i<inputString.size();i++){
            s1.clear();
            for(int j=0;j<s2.size();j++){
                s1.push_back(s2[j]);
            }
            s2.clear();
            for(int j=0;j<stateTable.size();j++){
                if(inputString[i] == stateTable[j].first){
                    for(int k=0;j<s1.size();k++){
                        if(s1[k]==stateTable[j].second.first){
                            s2.push_back(stateTable[j].second.second);
                        }
                    }
                }
            }

            int flag = 0;
            for(int i=0;i<s2.size();i++){
                for(int j=0;j<finalStates.size();j++){
                    if(s2[i] == finalStates[j]){
                        flag = 1;
                        cout<<"String ACCEPTED"<<endl<<endl;
                    }
                }
            }
            if(!flag){
                cout<<"String NOT ACCEPTED"<<endl<<endl;
            }
        }
    }
    return 0;
}