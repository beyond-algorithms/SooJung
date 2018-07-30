/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    
    void makeArr(TreeNode* root, vector<int>& valArr){
        if(root != NULL){
            valArr.push_back(root->val);
            makeArr(root->left, valArr);
            makeArr(root->right, valArr);
        }
    }
    
    int minDiffInBST(TreeNode* root) {
        vector<int> valArr;
        makeArr(root, valArr);
        
        int minDifference = INT_MAX, difference;
        for(int i = 0; i < valArr.size(); i++){
            for(int j = i; j < valArr.size(); j++){
                if(i != j){
                    difference = abs(valArr[i] - valArr[j]);
                    if(difference < minDifference){
                        minDifference = difference;
                    }
                }
            }
        }
        return minDifference;
    }
};