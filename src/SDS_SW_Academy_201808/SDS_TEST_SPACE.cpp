#include <iostream>
#include <algorithm>
using namespace std;


int main() {
	int testCase;
	cin >> testCase;

	for (int i = 1; i <= testCase; i++) {
		int count = 0;
		int n, m, r1, c1, r2, c2;
		cin >> n >> m >> r1 >> c1 >> r2 >> c2;

		count += min(n - abs(r2 - r1), abs(r2 - r1));
		count += min(m - abs(c2 - c1), abs(c2 - c1));

		cout << "#" << i << " " << count << endl;
	}
	return 0;
}