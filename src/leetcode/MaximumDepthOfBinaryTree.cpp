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
    int visit(TreeNode* node, int depth){
        if(node == NULL){
            return 0;
        }
        return depth + max(visit(node->left, depth), visit(node->right, depth));
    }
    
    int maxDepth(TreeNode* root) {
        return visit(root, 1);
    }
};