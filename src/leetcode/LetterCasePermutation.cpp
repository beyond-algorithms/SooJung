class Solution {
public:
    void changeStr(vector<string>& output, string S, int idx){
        if(idx == 0){
            output.push_back(S);
        }
        if(idx > S.size()){
            return;
        }
        
        changeStr(output, S, idx + 1);
        
        if(S[idx] >= 'a' && S[idx] <= 'z'){
            S[idx] = toupper(S[idx]);
            output.push_back(S);
        }
        else if(S[idx] >= 'A' && S[idx] <= 'Z'){
            S[idx] = tolower(S[idx]);
            output.push_back(S);
        }
        
        changeStr(output, S, idx + 1);
    }
    
    vector<string> letterCasePermutation(string S) {
        vector<string> output;
        changeStr(output, S, 0);
        
        sort(output.begin(), output.end());
        output.erase(unique(output.begin(), output.end()), output.end());
        reverse(output.begin(), output.end());
        return output;
    }
};