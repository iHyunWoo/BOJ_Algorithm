//
//  main.swift
//  BOJ2579
//
//  Created by 정현우 on 3/13/24.
//

import Foundation

let stairCount: Int = Int(readLine()!)!
var stair: [Int] = [0]
for _ in 0..<stairCount {
	stair.append(Int(readLine()!)!)
}

// dp[i]에 i층을 올라갈 때의 최대 점수를 기록
var dp: [Int] = Array(repeating: 0, count: stairCount+1)
dp[1] = stair[1]

if stairCount > 1 {
	dp[2] = dp[1] + stair[2]
}

// 3층부턴 연속으로 모두 갈 수 없기 때문에
// 두가지 케이스를 비교
// 1. 지금으로부터 -3층에서 -1층을 밟고 현재 계단 밟는 경우
// 2. 지금으로부터 -2층을 밟고 현재 계단 밟는 경우
// -2층 밟고, -1층 밟고 현재 계단 밟는 경우는 3층 연속이니 제외
// -3층 밟고, -2층밟고, -1층밟고, 현재도 제외
// -3층 밟고, -2층밟고, 현재도 제외
if stairCount > 2 {
	for i in 3...stairCount {
		dp[i] = max(dp[i-3]+stair[i-1], dp[i-2]) + stair[i]
	}
}

print(dp[stairCount])
