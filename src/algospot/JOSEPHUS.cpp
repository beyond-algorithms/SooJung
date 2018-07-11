#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;


struct soldier {
	int next;
	int prev;
};

int kill(vector<soldier>& soldiers, int index) {
	soldiers[soldiers[index].prev].next = soldiers[index].next;
	soldiers[soldiers[index].next].prev = soldiers[index].prev;
	return soldiers[index].next;
}

int isSurvive(vector<soldier>& soldiers, int index, int k) {
	int numKill = index;
	int tmp = 0;
	for (int i = 0; i < k - 1; i++) {
		tmp = soldiers[numKill].next;
		numKill = tmp;
	}
	return numKill;
}

int main() {
	int testCase;
	cin >> testCase;
	while (testCase--) {
		int n, k;
		cin >> n >> k;
		vector<soldier> soldiers(n);

		soldiers[0].prev = n - 1;
		soldiers[0].next = 1;
		for (int i = 1; i < n - 1; i++) {
			soldiers[i].next = i + 1;
			soldiers[i].prev = i - 1;
		}
		soldiers[n - 1].prev = n - 2;
		soldiers[n - 1].next = 0;

		int index = 0;
		index = kill(soldiers, 0);
		for (int i = 0; i < n - 3; i++) {
			index = kill(soldiers, isSurvive(soldiers, index, k));
		}

		cout << min(index + 1, soldiers[index].next + 1) << " " << max(index + 1, soldiers[index].next + 1) << endl;

	}
	return 0;
}