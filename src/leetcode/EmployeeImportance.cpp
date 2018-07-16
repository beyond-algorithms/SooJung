/*
// Employee info
class Employee {
public:
    // It's the unique ID of each node.
    // unique id of this employee
    int id;
    // the importance value of this employee
    int importance;
    // the id of direct subordinates
    vector<int> subordinates;
};
*/
class Solution {
public:    
        
    int getImportance(vector<Employee*> employees, int id) {
        vector<int> employeesId(employees.size(), -1);
            for(int i = 0; i < employees.size(); i++){
                employeesId[i] = employees[i]->id;
        }

        int idx = find(employeesId.begin(), employeesId.end(), id) - employeesId.begin();
        
        int sum = employees[idx]->importance;
        if(employees[idx]->subordinates.empty()){
            return sum;
        }
                
        for(int i = 0; i < employees[idx]->subordinates.size(); i++){
            sum += getImportance(employees, employees[idx]->subordinates[i]);
        }
        return sum;
    }
};