// land는 N행 4열
// 1행부터 한 행씩
// 같은 열 연속해서 밟을 수 없음

// 테스트 케이스
// land = [[1,2,3,5],[5,6,7,8],[4,3,2,1]]
// [[1,2,3,5],
//  [5,6,7,8],
//  [4,3,2,1]]
// answer = 16

import Foundation

func solution(_ land:[[Int]]) -> Int{

	var answer = 0
	var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 4), count: 1000001)
	var r = land.count // 행 개수 row
	
	// 행 쪼개기
	for i in 0...3 {
	    dp[0][i] = land[0][i]
	}
	
	for i in 1..<r{
	    for j in 0...3 {
	        for k in 0...3 {
	            if (j != k) {
	                dp[i][j] = max(dp[i][j], land[i][j] + dp[i-1][k])
	            }
	        }
	    }
	}
	
	for i in 0...3 {
	    answer = max(answer, dp[r-1][i])
	}

	return answer
}
