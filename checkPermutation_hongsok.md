## [프로그래머스 - 순열 검사](https://programmers.co.kr/learn/courses/18/lessons/1877)
### 문제 설명 :
### 길이가 n인 배열에 1부터 n까지 숫자가 중복 없이 한 번씩 들어 있는지를 확인하려고 합니다.
### 1부터 n까지 숫자가 중복 없이 한 번씩 들어 있는 경우 true를, 아닌 경우 false를 반환하도록 함수 solution을 완성해주세요.

```
import Foundation

func solution(_ arr:[Int]) -> Bool {
    
    var answer = true
    var requiedArray = [Int]()
    
	// 길이가 n인 배열 requiredArray = [1, 2, 3, ... , n]
    for i in 1...arr.count {
        requiedArray.append(i)
    }
    
	// 검사해야 될 arr (ex. [4, 1, 3, 2]) 정렬하고 requiredArray와 비교
    if requiedArray == arr.sorted() {
        answer = true
    } else {
        answer = false
    }

    return answer
}
```

```
// C++
// 방법1 - 배열의 길이 n, 1~n 의 숫자가 있는지 확인 (중복 없는 배열)
#include <vector>
using namespace std;

int chk[100001] = { 0 };
bool solution(vector<int> arr)
{
	int n = arr.size();
	// 범위를 벗어나는 숫자가 있는지 검사
	for(int i = 0; i < n; ++i) {
		if (arr[i] < 1 || arr[i] > n)
			return false;
		chk[arr[i]]++;
	}
	// 1~n까지의 숫자가 있는지 검사
	for (int i = 1; i <= n; ++i)
		if(chk[i] != 1)
			return false;
	bool answer = true;
	return true;
}
```

```
// C++
// 방법2 - 길이가 n인 정렬된 배열 순회하면서 1~n 까지의 숫자가 있는지 확인 
#include <vector>
#include <algorithm> // 정렬 사용
using namespace std;

bool solution(vector<int> arr)
{
	// arr 정렬
	sort(arr.begin(), arr.end());

	// arr 순회하면서 1~arr.size()가 있는지 확인
	for(int i = 0; i< arr.size(); ++i)
		if(arr[i] != i + 1)
			return false;

	return true;
}
```
