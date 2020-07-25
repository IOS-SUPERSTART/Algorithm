[프로그래머스 - 자릿수 더하기](https://programmers.co.kr/learn/courses/18/lessons/1876)

'''
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
'''
