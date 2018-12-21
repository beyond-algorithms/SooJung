#include <iostream>
#include <vector>
using namespace std;

int checkMap(int y, int x, vector<vector<int> >& citymap) {
	if (citymap[y - 1][x - 1] * citymap[y - 1][x] * citymap[y - 1][x + 1] * citymap[y][x - 1] * citymap[y][x] * citymap[y][x + 1] * citymap[y + 1][x - 1] * citymap[y + 1][x] * citymap[y + 1][x + 1] == 0) {
		return 0;
	}
	else if (citymap[y - 1][x - 1] == 1 || citymap[y - 1][x] == 1 || citymap[y - 1][x + 1] == 1 || citymap[y][x - 1] == 1 || citymap[y][x] == 1 || citymap[y][x + 1] == 1 || citymap[y + 1][x - 1] == 1 || citymap[y + 1][x] == 1 || citymap[y + 1][x + 1] == 1) {
		if (citymap[y - 1][x - 1] == 2 || citymap[y - 1][x] == 2 || citymap[y - 1][x + 1] == 2 || citymap[y][x - 1] == 2 || citymap[y][x] == 2 || citymap[y][x + 1] == 2 || citymap[y + 1][x - 1] == 2 || citymap[y + 1][x] == 2 || citymap[y + 1][x + 1] == 2) {
			if (citymap[y - 1][x - 1] == 3 || citymap[y - 1][x] == 3 || citymap[y - 1][x + 1] == 3 || citymap[y][x - 1] == 3 || citymap[y][x] == 3 || citymap[y][x + 1] == 3 || citymap[y + 1][x - 1] == 3 || citymap[y + 1][x] == 3 || citymap[y + 1][x + 1] == 3) {
				return 1;
			}
		}
	}
	return 0;

}

int main() {
	int testCase;
	cin >> testCase;

	for (int i = 1; i <= testCase; i++) {
		int count = 0;
		int n;
		cin >> n;
		vector<vector<int> > citymap = vector<vector<int> >(n + 2, vector<int>(n + 2, -1));

		for (int i = 1; i < n + 1; i++) {
			for (int j = 1; j < n + 1; j++) {
				cin >> citymap[j][i];
			}
		}

		for (int i = 1; i < n + 1; i++) {
			for (int j = 1; j < n + 1; j++) {
				count += checkMap(j, i, citymap);
			}
		}

		cout << "#" << i << " " << count << endl;
	}

	return 0;
}