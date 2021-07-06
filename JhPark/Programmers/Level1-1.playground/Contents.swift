import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let keypad = [(1,3), (0,0), (1,0), (2,0),
                  (0,1), (1,1), (2,1),
                  (0,2), (1,2), (2,2)]
    var left = (0, 3)
    var right = (2,3)
    var answer = ""
    for number in numbers {
        switch number {
        case 1,4,7:
            left = keypad[number]
            answer += "L"
        case 3,6,9:
            right = keypad[number]
            answer += "R"
        case 2,5,8,0:
            let leftDistance = toDistance(from: left, to: keypad[number])
            let rightDistance = toDistance(from: right, to: keypad[number])
            if leftDistance > rightDistance {
                right = keypad[number]
                answer += "R"
            }else if leftDistance < rightDistance {
                left = keypad[number]
                answer += "L"
            }else {
                if hand == "right" {
                    right = keypad[number]
                    answer += "R"
                }else {
                    left = keypad[number]
                    answer += "L"
                }
            }
        default:
            break
        }
    }
    
    return answer
}

func toDistance(from:(Int, Int), to:(Int, Int)) -> Int {
    let xDist = abs(from.0 - to.0) //[2]
    let yDist = abs(from.1 - to.1) //[3]
    return xDist + yDist
}

func solution2(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    
    var right = [4, 3]
    var left = [4, 1]
    
    
    for var number in numbers {
        if number == 0 {
            number = 11
        }
        switch number {
        case 1, 4, 7:
            answer += "L"
            let row: Int = number / 3 + 1
            left = [row, 1]
        case 3, 6, 9:
            answer += "R"
            let row: Int = number / 3
            right = [row, 3]
        default:
            let row: Int = (number / 3) + 1
            let numPos = [row, 2]
            let right_dist = dist(right, numPos)
            let left_dist = dist(left, numPos)
            
            if right_dist > left_dist {
                left = numPos
                answer += "L"
            } else if right_dist < left_dist {
                right = numPos
                answer += "R"
            } else {
                if hand == "right" {
                    right = numPos
                    answer += "R"
                } else {
                    left = numPos
                    answer += "L"
                }
            }
        }
    }
    return answer
}

func dist(_ handPos:[Int], _ numPos: [Int]) -> Int {
    let distance = abs(handPos[0] - numPos[0]) + abs(handPos[1] - numPos[1])
    return distance
}

let test1 = [1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5]
let test2 = [7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2, 7, 0, 0, 1, 7, 3, 1, 15, 10, 0, 0, 0, 8, 2, 8, 0, 0, 0, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2]
let test3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
print(solution2(test1, "right"))
print(solution2(test2, "left"))
print(solution2(test3, "right"))
