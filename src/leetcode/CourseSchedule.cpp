class Solution {
public:    
    bool canFinish(int numCourses, vector<pair<int, int>>& prerequisites) {
        vector<vector<int>> courseSchedule(numCourses, vector<int>(numCourses, -1));
        sort(prerequisites.begin(), prerequisites.end());
        for(int i = 0; i < prerequisites.size(); i++){
            if(prerequisites[i].second < prerequisites[i].first){
                for(int j = 0; j < numCourses; j++){
                    if(courseSchedule[prerequisites[i].second][j] == 1){
                        courseSchedule[prerequisites[i].first][j] = 1;
                    }
                }
            }
            courseSchedule[prerequisites[i].first][prerequisites[i].second] = 1;
            
        }
        
        bool checkEmpty = false;
        for(int i = 0; i < numCourses; i++){
            if(find(courseSchedule[i].begin(), courseSchedule[i].end(), 1) == courseSchedule[i].end()){
                checkEmpty = true;
            }
        }
        if(checkEmpty == false){
            return false;
        }
        
        
        for(int i = 0; i < numCourses; i++){
            for(int j = 0; j < numCourses; j++){
                if(courseSchedule[i][j] == 1 && courseSchedule[j][i] == 1){
                    return false;
                }
                
            }
        }
        return true;
    }
};