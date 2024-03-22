//
//  main.swift
//  BOJ1806
//
//  Created by 정현우 on 3/22/24.
//

import Foundation

let firstInput: [Int] = readLine()!.split(separator: " ").map({Int($0)!})
let N = firstInput[0]
let S = firstInput[1]

let numbers: [Int] = readLine()!.split(separator: " ").map({Int($0)!})


var end = 0
var currentSum: Int = 0
var result: Int = N + 1
for i in 0..<N {
	while currentSum < S && end < N {
		currentSum += numbers[end]
		end += 1
	}
	
	if currentSum >= S {
		result = min(result, end-i)
	}
	
	currentSum -= numbers[i]
}

print(result == N + 1 ? 0 : result)


