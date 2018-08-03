class Solution {
public:
    void recursion(int num, vector<int>& output){
        int curOutputSize = output.size();
        for(int i = 0; i < curOutputSize; i++){
            if(output.size() == num + 1){
                return;
            }
            output.push_back(output[i] + 1);
        }
        recursion(num, output);
    }
    
    vector<int> countBits(int num) {
        vector<int> output;
        output.push_back(0);
        recursion(num, output);
        return output;
    }
};