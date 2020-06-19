## 완전탐색: 모의고사


### 문제 설명

수포자는 수학을 포기한 사람의 준말입니다. 수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다. <br>
수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.

- 1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...
- 2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
- 3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...

1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때, <br>
가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.

### 제한 조건

시험은 최대 10,000 문제로 구성되어있습니다.<br>
문제의 정답은 1, 2, 3, 4, 5중 하나입니다.<br>
가장 높은 점수를 받은 사람이 여럿일 경우, return하는 값을 오름차순 정렬해주세요.<br>

### 입출력 예

answers	return<br>
[1,2,3,4,5]	[1]<br>
[1,3,2,4,2]	[1,2,3]<br>

### 입출력 예 설명
#### 입출력 예 #1

수포자 1은 모든 문제를 맞혔습니다.<br>
수포자 2는 모든 문제를 틀렸습니다.<br>
수포자 3은 모든 문제를 틀렸습니다.<br>
따라서 가장 문제를 많이 맞힌 사람은 수포자 1입니다.<br>

#### 입출력 예 #2

모든 사람이 2문제씩을 맞췄습니다.


### 문제풀이

프로그래머스 풀이 중 가장 직관적이었던 풀이었다. 

```swift 
import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let answer = (
        a: [1, 2, 3, 4, 5], // index % 5
        b: [2, 1, 2, 3, 2, 4, 2, 5], // index % 8
        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
    )
    var point = [1:0, 2:0, 3:0]

    for (i, v) in answers.enumerated() {
        if v == answer.a[i % 5] { point[1] = point[1]! + 1 }
        if v == answer.b[i % 8] { point[2] = point[2]! + 1 }
        if v == answer.c[i % 10] { point[3] = point[3]! + 1 }
    }

    return point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }
}
```


```swift 
import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let answer = (
        a : [1,2,3,4,5],
        b : [2,1,2,3,2,4,2,5],
        c : [3,3,1,1,2,2,4,4,5,5]
    )

    var point = [1:0, 2:0, 3:0]

    for (i, v) in answers.enumerated() {
        if v == answer.a[i % 5] { 
            point[1] = point[1]! + 1 
        }
        if v == answer.b[i % 8] {
            point[2] = point[2]! + 1
        }
        if v == answer.c[i % 10] {
            point[3] = point[3]! + 1
        }

    }
    return point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }
}
```


## 완전탐색: 소수찾기


### 문제 설명

한자리 숫자가 적힌 종이 조각이 흩어져있습니다. 흩어진 종이 조각을 붙여 소수를 몇 개 만들 수 있는지 알아내려 합니다.<br>
각 종이 조각에 적힌 숫자가 적힌 문자열 numbers가 주어졌을 때, 종이 조각으로 만들 수 있는 소수가 몇 개인지 return 하도록 solution 함수를 완성해주세요.

### 제한사항

- numbers는 길이 1 이상 7 이하인 문자열입니다.
- numbers는 0~9까지 숫자만으로 이루어져 있습니다.
- 013은 0, 1, 3 숫자가 적힌 종이 조각이 흩어져있다는 의미입니다.

#### 입출력 예

numbers	return<br>
17	3<br>
011	2<br>

#### 입출력 예 설명

예제 #1<br>
[1, 7]으로는 소수 [7, 17, 71]를 만들 수 있습니다.

예제 #2<br>
[0, 1, 1]으로는 소수 [11, 101]를 만들 수 있습니다.

11과 011은 같은 숫자로 취급합니다.

### 문제풀이

```swift 
```
