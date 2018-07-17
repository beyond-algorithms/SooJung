class Solution {
public:
    bool lemonadeChange(vector<int>& bills) {
        int money5 = 0;
        int money10 = 0;
        
        int cnt = 0;
        while(cnt < bills.size()){
            if(bills[cnt] == 5){
                money5++;
            }
            if(bills[cnt] == 10){
                money10++;
                money5--;
            }
            if(bills[cnt] == 20){
                if(money10 > 0){
                    money10--;
                    money5--;
                }
                else{
                    money5 -= 3;
                }
            }
            
            if(money5 < 0){
                return false;
            }
            cnt++;
        }
        return true;
    }
};