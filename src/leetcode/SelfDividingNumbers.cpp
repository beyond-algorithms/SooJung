class Solution {
public:
    bool checkNum(int a){
        string num = to_string(a);
        //str.find("") -> ""값을 찾는다 못찾으면 string::npos 반환
        if(num.find("0") != string::npos){
            return false;
        }
        
        int temp = 0;
        for(int i = 0; i < num.size(); i++){
            temp = num[i] - '0';      //ASCII 코드로 변환
            if((a % temp != 0)){
                return false;
            }
        }
        return true;
    }
    
    vector<int> selfDividingNumbers(int left, int right) {
        vector<int> output;
        
        for(int i = left; i <= right; i++){
            if(checkNum(i)){
                output.push_back(i);
            }
        }
        
        return output;
    }
};