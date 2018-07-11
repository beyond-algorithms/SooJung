#include <iostream>
#include <string>
using namespace std;

int main() {
	int testCase;
	cin >> testCase;
	while (testCase--) {
		string input = "";
		int num = 0, size = 0;
		cin >> input;
		num = input.size() / 2;
		while (num) {
			for (int i = 0; i < num*2 - 1; i++) {
				if (input[i] == '(' && input[i + 1] == ')') {
					input.erase(i, 2);
					break;
				}
				if (input[i] == '{' && input[i + 1] == '}') {
					input.erase(i, 2);
					break;
				}
				if (input[i] == '[' && input[i + 1] == ']') {
					input.erase(i, 2);
					break;
				}
			}
			num--;
		}
		if (input.size() == 0) {
			cout << "YES" << endl;
		}
		else {
			cout << "NO" << endl;
		}
	}
	return 0;
}