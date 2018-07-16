class Solution {
public:
    void changeStr(vector<string>& output, string S, int idx){
        if(idx > S.size()){
            return;
        }

        if(idx == 0){
            output.push_back(S);
        }
        
        changeStr(output, S, idx + 1);
        
        if(S[idx] >= 'a' && S[idx] <= 'z'){
            S[idx] = toupper(S[idx]);
            output.push_back(S);
            changeStr(output, S, idx + 1);
        }
        else if(S[idx] >= 'A' && S[idx] <= 'Z'){
            S[idx] = tolower(S[idx]);
            output.push_back(S);
            changeStr(output, S, idx + 1);
        }
    }
    
    vector<string> letterCasePermutation(string S) {
        vector<string> output;
        changeStr(output, S, 0);
        return output;
    }
};