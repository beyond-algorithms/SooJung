#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
	int testCase;
	cin >> testCase;
	while (testCase--) {
		int stringNum, count = 0;
		string first, str;
		cin >> stringNum;
		cin >> first;

		vector<string> correctStr(stringNum);
		for (int i = 0; i < stringNum; i++) {
			cin >> correctStr[i];
		}
		for (int i = 0; i < stringNum; i++) {
			if (i % 2 == 0) {
				str = first + first;
				count += str.find(correctStr[i]);
				first = correctStr[i];
			}
			if (i % 2 == 1) {
				reverse(first.begin(), first.end());
				str = first + first;
				string next = correctStr[i];
				reverse(next.begin(), next.end());
				count += str.size() - (str.find(next) + next.size());
				first = correctStr[i];
			}
		}
		cout << count << endl;

	}
	return 0;
}