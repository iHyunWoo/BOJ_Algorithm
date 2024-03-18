//
//  main.swift
//  BOJ1149
//
//  Created by 정현우 on 3/13/24.
//

import Foundation

let houseCount: Int = Int(readLine()!)!
var houseCost: [[Int]] = []
for _ in 0..<houseCount {
	houseCost.append(readLine()!.split(separator: " ").map({Int($0)!}))
}

// dp[i][j] -> i번째 집을 j컬러로 칠할때 최소비용
var dp: [[Int]] = Array(repeating: [], count: houseCount)
dp[0] = houseCost[0]

for i in 1..<houseCount {
	dp[i] = [
		houseCost[i][0] + min(dp[i-1][1], dp[i-1][2]),
		houseCost[i][1] + min(dp[i-1][0], dp[i-1][2]),
		houseCost[i][2] + min(dp[i-1][0], dp[i-1][1]),
	]
}

print(min(dp.last![0], dp.last![1], dp.last![2]))

