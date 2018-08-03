class Solution {
public:
    vector<pair<int, int>> reconstructQueue(vector<pair<int, int>>& people) {
        sort(people.rbegin(), people.rend());        
        vector<pair<int, int>> res;
        res.reserve(people.size());
        // for(int i = 0; i < people.size(); i++){
        //     res.insert(res.begin() + people[i].second, people[i]);
        // } 
        return res;
        
        
        
        // auto comp = [](const pair<int, int>& p1, const pair<int, int>& p2)
        //         { return p1.first > p2.first || (p1.first == p2.first && p1.second < p2.second); };
        // sort(people.begin(), people.end(), comp);
        // vector<pair<int, int>> res;
        // for (auto& p : people) 
        //     res.insert(res.begin() + p.second, p);
        // return res;

    }
};

