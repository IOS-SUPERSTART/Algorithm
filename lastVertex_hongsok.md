## [프로그래머스 - 나머지 한 점](https://programmers.co.kr/learn/courses/18/lessons/1878)

### 문제 설명
#### 직사각형을 만드는 데 필요한 4개의 점 중 3개의 좌표가 주어질 때, 나머지 한 점의 좌표를 구하려고 합니다. 
#### 점 3개의 좌표가 들어있는 배열 v가 매개변수로 주어질 때, 직사각형을 만드는 데 필요한 나머지 한 점의 좌표를 return 하도록 solution 함수를 완성해주세요. 
#### 단, 직사각형의 각 변은 x축, y축에 평행하며, 반드시 직사각형을 만들 수 있는 경우만 입력으로 주어집니다.
<img src="https://www.notion.so/3489b6c673ff4a67b76a157d9bbd5470#901201f7a8234821a37579919df09077"  width="500" height="300">


```
// x1, x2, y1, y2 각 2개 씩
// 조건문, 해시문 등으로 구현 가능
// 여기선 비트 연산 XOR ^ 활용 (배타적 논리합)
// x1 xor x1 xor x2 = x2
// y1 xor y2 xor y2 = y1
// return (x2, y1)

import Foundation

var vertex = [[1, 4], [3, 4], [3, 10]]
var ans = [0, 0]

for i in 0..<vertex.count {
    ans[0] ^= vertex[i][0]
    ans[1] ^= vertex[i][1]
}
print(ans)
```


```
// C++ 풀이
#include <iostream>
#include <vector>
using namespace std;

vector<int> solution(vector<vector<int>>v) {
	vector<int> ans = {0,0};
	for(int i = 0; i < 3; ++i) {
		ans[0] ^= v[i][0];
		ans[1] ^= v[i][1];
	}
	return ans;
}
```
