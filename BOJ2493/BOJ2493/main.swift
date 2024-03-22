//
//  main.swift
//  BOJ2493
//
//  Created by 정현우 on 3/22/24.
//

import Foundation

let towerCount = Int(readLine()!)!
var towers: [Int] = readLine()!.split(separator: " ").map({Int($0)!})
var stack: [Int] = []
var result: [Int] = Array(repeating: 0, count: towerCount)

for i in (0..<towerCount).reversed() {
	while !stack.isEmpty && towers[i] > towers[stack.last!] {
		let current = stack.removeLast()
		result[current] = i + 1
	}
	stack.append(i)
	
}

print(result.map({String($0)}).joined(separator: " "))
