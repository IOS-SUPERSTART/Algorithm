import Foundation

func solution(_ numbers:[Int]) -> String {
    var result = ""
    
    let strings = numbers.compactMap{ String($0) }.sorted(by: {
        guard let first = Int($0 + $1) else {
            return false
        }
        guard let second = Int($1 + $0) else {
            return false
        }
        return first > second
    })
    
    for str in strings {
        result += str
    }
    if (result[result.startIndex] == "0") {
        return "0"
    }
    
    return result
}
// 맨 앞수



solution([6, 10, 2])
solution([3, 30, 34, 5, 9])
solution([0, 0, 0, 0, 0])
