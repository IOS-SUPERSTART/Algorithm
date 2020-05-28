## 정렬: k번째 수

배열 array의 i번째 숫자부터 j번째 숫자까지 자르고 정렬했을 때, k번째에 있는 수를 구하려 합니다.

예를 들어 array가 [1, 5, 2, 6, 3, 7, 4], i = 2, j = 5, k = 3이라면

array의 2번째부터 5번째까지 자르면 [5, 2, 6, 3]입니다.<br>
1에서 나온 배열을 정렬하면 [2, 3, 5, 6]입니다.<br>
2에서 나온 배열의 3번째 숫자는 5입니다.

배열 array, [i, j, k]를 원소로 가진 2차원 배열 commands가 매개변수로 주어질 때, commands의 모든 원소에 대해 앞서 설명한 연산을 적용했을 때 나온 결과를 배열에 담아 return 하도록 solution 함수를 작성해주세요.

#### 제한사항

- array의 길이는 1 이상 100 이하입니다.
- array의 각 원소는 1 이상 100 이하입니다.
- commands의 길이는 1 이상 50 이하입니다.
- commands의 각 원소는 길이가 3입니다.


#### 입출력 예 설명

- [1, 5, 2, 6, 3, 7, 4]를 2번째부터 5번째까지 자른 후 정렬합니다. [2, 3, 5, 6]의 세 번째 숫자는 5입니다.
- [1, 5, 2, 6, 3, 7, 4]를 4번째부터 4번째까지 자른 후 정렬합니다. [6]의 첫 번째 숫자는 6입니다.
- [1, 5, 2, 6, 3, 7, 4]를 1번째부터 7번째까지 자릅니다. [1, 2, 3, 4, 5, 6, 7]의 세 번째 숫자는 3입니다


### 풀이 1

```swift 
import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map({key in array[(key[0]-1)...(key[1]-1)].sorted()[key[2]-1]})
}
```

### 풀이 2

```swift 
import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    // Int타입의 array answer 변수 생성 
    var answer:[Int] = []
    
    for i in commands {
        var newArray = Array(array[i[0]-1...i[1]-1])
        // 변수 newArray 정렬 
        newArray.sort()
        answer.append(newArray[i[2]-1])
    }
    return answer
}
```


## 정렬: 가장 큰 수 

0 또는 양의 정수가 주어졌을 때, 정수를 이어 붙여 만들 수 있는 가장 큰 수를 알아내 주세요.

예를 들어, 주어진 정수가 [6, 10, 2]라면 [6102, 6210, 1062, 1026, 2610, 2106]를 만들 수 있고, 이중 가장 큰 수는 6210입니다.

0 또는 양의 정수가 담긴 배열 numbers가 매개변수로 주어질 때, 순서를 재배치하여 만들 수 있는 가장 큰 수를 문자열로 바꾸어 return 하도록 solution 함수를 작성해주세요.


#### 제한 사항

- numbers의 길이는 1 이상 100,000 이하입니다.
- numbers의 원소는 0 이상 1,000 이하입니다.
- 정답이 너무 클 수 있으니 문자열로 바꾸어 return 합니다.


### 풀이 

```swift 
import Foundation

func solution(_ numbers:[Int]) -> String {
    let ans = numbers.map({ String($0) }).sorted(by: { $0+$1 > $1+$0 })
    if ans[0] == "0" {  // 0 또한 양의 정수이기에 "0000" 예외처리 
        return "0"
    }
    return ans.joined()
}
```


#### 공부한 내용 

> 클로저: {}로 감싸진 실행가능한 코드블럭(함수는 이름 있는 클로저로 생각하면 쉬움)    
함수의 이름을 지정해주지 않으며 파라미터와 반환갑을 가질 수도 있는 특징이 있다

클로저의 가장 큰 특징은 간결함과 유연함<br>
- $0: 첫번째 파라미터
- $1: 두번째 파라미터

<클로저 활용에 대표적인 메서드>
- sort: 정렬하여 반환 > 원본에 영향을 줌 // sorted: 기존 리스트를 건들지 않고 새로운 리스트에 정렬된 값을 반환 
- filter: 필터된 값을 반환
- map: 파라미터로 받은 클로저를 모든 요소에 실행한 그 결과를 반환
- reduce: 초기값이 있고 초기값과 첫번째 요소 ~ 끝번째 요소까지의 실행된 최종 결과값만을 반환

