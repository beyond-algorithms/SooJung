class Solution {
public:
    int calPoints(vector<string>& ops) {
        vector<int> count;

        int cnt = 0;
        while(cnt < ops.size()){
            if(ops[cnt] == "+"){
                count.push_back(count.back() + *(&count.back() - 1));
            }
            else if(ops[cnt] == "D"){
                count.push_back(count.back() * 2);
            }
            else if(ops[cnt] == "C"){
                count.pop_back();
            }
            else{
                int num = 0;
                sscanf(ops[cnt].c_str(), "%d", &num);
                count.push_back(num);
            }
            cnt++;
        }
        
        int sum = 0;
        for(int i = 0; i < count.size(); i++){
            sum += count[i];
        }
        return sum;
    }
};