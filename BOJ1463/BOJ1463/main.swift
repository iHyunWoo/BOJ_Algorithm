//
//  main.swift
//  BOJ1463
//
//  Created by 정현우 on 3/22/24.
//

import Foundation

let num = Int(readLine()!)!
var dp: [Int] = Array(repeating: Int.max - 1, count: num+1)

if num == 1 {
	print(0)
} else {
	dp[1] = 0
	for i in 2...num {
		dp[i] = min(dp[i], dp[i-1]+1)
		
		if (i%2 == 0) {
			dp[i] = min(dp[i], dp[i/2]+1)
		}
		
		if (i%3 == 0) {
			dp[i] = min(dp[i], dp[i/3]+1)
		}
	}
	
	print(dp[num])
}

