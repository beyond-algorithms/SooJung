//문제 1.
//입력으로 + 를 받았을 때 맨 마지막 바로 앞 값을 어떻게 받아올 것인가?
//-> end()는 vector의 capacity의 맨 끝 다음 자리를 가리키는 것 같고, back()은 마지막 원소를 참조하기 때문에 back()에서 포인터 이용해서 값을 구했음
//(count[count.size() - 2]로 했을 경우도 성공함

//문제 2.
//입력에 숫자가 들어오면 ASCII코드로 변환해서 사용하려고 했음 -> 오류 & 음수일때는 어떻게 변환하지?
//-> sscanf를 이용해서 직접 값을 넣어줌 sscanf의 첫번째 매개변수는 char형이 들어와야해서 str.c_str()이용
//(atoi() 이용하려고 했는데 표준 라이브러리가 아니어서 leetcode에서는 인식이 안되는 것 같았고
//stringstream도 이용하려고 했으나 계속 오류남.....왤까..)

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