## 해시: 위장 

스파이들은 매일 다른 옷을 조합하여 입어 자신을 위장합니다.

예를 들어 스파이가 가진 옷이 아래와 같고 <br>
오늘 스파이가 동그란 안경, 긴 코트, 파란색 티셔츠를 입었다면 다음날은 청바지를 추가로 입거나 동그란 안경 대신 검정 선글라스를 착용하거나 해야 합니다.

```
종류	이름
얼굴	동그란 안경, 검정 선글라스
상의	파란색 티셔츠
하의	청바지
겉옷	긴 코트
```

스파이가 가진 의상들이 담긴 2차원 배열 clothes가 주어질 때 서로 다른 옷의 조합의 수를 return 하도록 solution 함수를 작성해주세요.

### 제한사항

- clothes의 각 행은 [의상의 이름, 의상의 종류]로 이루어져 있습니다.
- 스파이가 가진 의상의 수는 1개 이상 30개 이하입니다.
- 같은 이름을 가진 의상은 존재하지 않습니다.
- clothes의 모든 원소는 문자열로 이루어져 있습니다.
- 모든 문자열의 길이는 1 이상 20 이하인 자연수이고 알파벳 소문자 또는 '_' 로만 이루어져 있습니다.
- 스파이는 하루에 최소 한 개의 의상은 입습니다.

### 입출력 예

clothes	return <br>
[[yellow_hat, headgear], [blue_sunglasses, eyewear], [green_turban, headgear]]	5 <br>
[[crow_mask, face], [blue_sunglasses, face], [smoky_makeup, face]]	3 

#### 입출력 예 설명

##### 예제 #1

headgear에 해당하는 의상이 yellow_hat, green_turban이고 eyewear에 해당하는 의상이 blue_sunglasses이므로 아래와 같이 5개의 조합이 가능합니다.

1. yellow_hat
2. blue_sunglasses
3. green_turban
4. yellow_hat + blue_sunglasses
5. green_turban + blue_sunglasses

##### 예제 #2

face에 해당하는 의상이 crow_mask, blue_sunglasses, smoky_makeup이므로 아래와 같이 3개의 조합이 가능합니다.

1. crow_mask
2. blue_sunglasses
3. smoky_makeup


### 문제 풀이 

```swift
import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic:[String:Int] = [:]
    clothes.forEach { (element) in
        if dic.keys.contains(element[1]) {
            dic[element[1]]! += 1
        } else {
            dic[element[1]] = 1
        }
    }
    
    var answer = 1
    for v in dic {
        answer *= v.value+1
    }
    return answer-1
}
```


#### 공부해볼 내용

[forEach](https://developer.apple.com/documentation/swift/array/1689783-foreach)

- for-in과 동일하게 각각의 Element들을 호출
- forEach에서는 break, continue 구문을 사용할 수 없고, return을 통해서 빠져나갈 수 있다. (continue처럼 동작함)
  - for-in에서는 break, continue을 사용할 수 있고, return을 이용해서 빠져나오려면 에러가 난다.

for-in은 swift에서 제공하는 built-in(내장함수)이며, forEach는 collection에서 제공하는 기능으로 클로저 방식으로 사용된다. <br>
따라서 collectiond을 이용해 호출하며 각각의 element를 parameter로 하여 element의 개수만큼 호출된다.

따라서 break를 사용하지 못하며 return하여 종료하여도 다음 element를 인자로 가진 closure가 실행되기에 문제가 없다.

