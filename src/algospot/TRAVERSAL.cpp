#include <iostream>
#include <vector>
using namespace std;

vector<int> postorder;

void getpostorder(vector<int>& preorder, vector<int> arr, int idx){
	if(postorder.size() == preorder.size()){
		return;
	}

	if(preorder[idx] == arr[0]){
		postorder.insert(0, 1, preorder[idx]);
		getpostorder(preorder, arr.assign(1, arr.end());
	}

	if(preorder[idx] == arr[arr.size() - 1]){
		getpostorder(preorder, arr.assign(0, arr[arr.size() - 2]));
		postorder.push_back(preorder[idx]);

	}

	//int arrIdx = find(arr.begin(), arr.end(), preorder[idx]);
	getpostorder(preorder, arr.assign(0, find(arr.begin(), arr.end(), preorder[idx])));
	getpostorder(preorder, arr.assign(find(arr.begin(), arr.end(), preorder[idx])), arr.end());
	postorder.push_back(preorder[idx]);
	return;
}

int main(){
	int testCase;
	cin >> testCase;
	while(testCase--){
		int n;
		cin >> n;
		vector<int> preorder, inorder;
		postorder = vector<int>(n);

		for(int i = 0; i < n; i ++){
			cin >> preorder[i];
		}
		for(int i = 0; i < n; i ++){
			cin >> inorder[i];
		}


		getpostorder(preorder, inorder, 0);
	}
}