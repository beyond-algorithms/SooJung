#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
using namespace std;


struct packItem {
	string name;
	int volume;
	int numOfImportance;
}

bool cmp_packItem(packItem a, packItem b){
	return a.volume < b.volume;
}

int sumVolume(vector<int>& listPackingIdx, vector<vector<int> >& listOfVolume, int leftVolume, int maxVolume){
	if(leftVolume == 0){
		return 0;
	}

	if(dp[leftVolume] != -1){
		return dp[leftVolume];
	}

	int n = find(listOfVolume.begin(),listOfVolume.end(), leftVolume);
	if(n != listOfVolume.end()){

	}
	return sumVolume(listOfName, listOfVolume, volume - 1, maxVolume);
}

int main(){
	int testCase;
	cin >> testCase;
	while(testCase--){
		dp = vector<int>(-1);

		int num, capacity;
		cin >> num >> capacity;
		vector<packItem> listItem(num);
		vector<packItem> dp(capacity, -1);
		vector<string> packlist;
		for(int i = 0; i < num; i++){
			cin >> listItem[i].name >> listItem[i].volume >> listItem[i].numOfImportance;
		}

		sort(listItem.begin(), listItem.end(), cmp_packItem);

		int packVolume = 0;
		while(packVolume <= capacity){
			for(int i = 0; i < listItem.size(); i++){
				packVolume += listItem[i].volume;

			}
		}
	}
	return 0;
	
}