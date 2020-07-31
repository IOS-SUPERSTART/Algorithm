// Dynamic Programming 문제

// 테스트 케이스1
// [[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]]
//  0	1	1	1
//  1	1	1	1
//  1	1	1	1
//  0	0	1	0
//  3 x 3 = 9

// 테스트 케이스2
// [[0,0,1,1],[1,1,1,1]]
// 0 0 1 1
// 1 1 1 1
// 2 x 2 = 4

// dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-2]) + 1

import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 1001), count: 1001)
    
    var answer:Int = 0
    var row = board.count
    var col = board[0].count
    for i in 1...row {
        for j in 1...col {
            if (board[i-1][j-1] != 0) {
                dp[i][j] = min(dp[i][j-1], min(dp[i-1][j], dp[i-1][j-1])) + 1
                answer = max(answer, dp[i][j]);
            }
        }
    }
    return answer * answer
}
