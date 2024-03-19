//
//  main.swift
//  BOJ2606
//
//  Created by 정현우 on 3/19/24.
//

import Foundation

let computerCount: Int = Int(readLine()!)!
let networkCount: Int = Int(readLine()!)!

var network: [[Int]] = []
for _ in 0..<networkCount {
	network.append(readLine()!.split(separator: " ").map({Int($0)!}))
}

// 양뱡향 인접행렬
var adjMatrix: [[Int]] = Array(repeating: [], count: computerCount+1)
var isVisted: [Bool] = Array(repeating: false, count: computerCount+1)
network.forEach({ line in
	adjMatrix[line[0]].append(line[1])
	adjMatrix[line[1]].append(line[0])
})

var result: Int = 0

func dfs(_ n: Int) {
	let adjComputer = adjMatrix[n]
	adjComputer.forEach({ computer in
		if !isVisted[computer] {
			isVisted[computer] = true
			result += 1
			dfs(computer)
		}
	})
}
isVisted[1] = true
dfs(1)
print(result)
