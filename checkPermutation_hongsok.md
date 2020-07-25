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
