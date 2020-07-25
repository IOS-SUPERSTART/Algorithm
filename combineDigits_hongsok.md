## [프로그래머스 - 자릿수 더하기](https://programmers.co.kr/learn/courses/18/lessons/1876)

### 문제 설명:
#### 자연수 N이 주어지면, N의 각 자릿수의 합을 구해서 return 하는 solution 함수를 만들어 주세요.
#### 예를들어 N = 123이면 1 + 2 + 3 = 6을 return 하면 됩니다.

```
import Foundation

// 테스트 케이스 n = 123, n = 987
func solution(_ n:Int) -> Int
{
    // n -> String, compactMap으로 ["1", "2", "3"], Char -> String
    var compacted = String(n).compactMap {String($0)}
    
    // ["1", "2", "3"] -> [1, 2, 3], reduce 하면 6
    var answer: Int = compacted.map{Int($0)!}.reduce(0){$0 + $1}
    
    return answer
}
```



```
// C++ 풀이
using namespace std;
int solution(int n)
{
	int sum = 0;
	while (n > 0)
	{
		// ex. n = 123
		// 123 % 10 = 3 (sum +=)
		// 123 / 10 = 12
		// 12 % 10 = 2 (sum +=)
		// 12 / 10 = 1
		// 1 % 10 = 1 (sum +=)
		// 1/ 10 = 0

		sum += n % 10;
		n /= 10;
	}
	return sum;
}
```
