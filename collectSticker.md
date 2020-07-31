```
// 첫번째 뜯는 경우, 뜯지 않은 경우
// 각각 dp1, dp2 초기화 후
// 다음 식으로 각 i의 최댓값 구함
// dp[i] = max(dp[i-1], dp[i-2] + sticker[i])

import Foundation

func solution(_ sticker:[Int]) -> Int{

	var dp1: [Int] = Array(repeating: 0, count: 100001) // 첫번째 스티커 뜯은 경우
	var dp2: [Int] = Array(repeating: 0, count: 100001) // 첫번째 뜯지 않은 경우

	var n = sticker.count

	if n == 0 { return 0 }
	if n == 1 { return sticker[0] }

	// 첫번째 스티커 뜯은 경우
	dp1[0] = sticker[0]
	dp1[1] = dp1[0]

	if n > 2 {
		for i in 2..<n-1 {
			dp1[i] = max(dp1[i-1], dp1[i-2] + sticker[i])
		}
	} // dp1[n-2]

	// 첫번째 스티커 뜯지 않은 경우
	dp2[0] = 0
	dp2[1] = sticker[1]

	if n > 2 {
		for i in 2..<n {
			dp2[i] = max(dp2[i-1], dp2[i-2] + sticker[i])
		}
	} // dp2[n-1]

	return max(dp1[n-2], dp2[n-1])
}

```
