//
//  main.swift
//  BOJ13335
//
//  Created by 정현우 on 3/21/24.
//

import Foundation

let firstInput: [Int] = readLine()!.split(separator: " ").map({Int($0)!})
let truckCount = firstInput[0]
let distance = firstInput[1]
let maxWeight = firstInput[2]

var trucks: [Int] = readLine()!.split(separator: " ").map({Int($0)!})
var bridge: [Int] = Array(repeating: 0, count: distance)
var time: Int = 0
var currentWeight: Int = 0

while !trucks.isEmpty {
	time += 1
	let outTruck = bridge.removeFirst()
	currentWeight -= outTruck
	
	if currentWeight+trucks.first! <= maxWeight {
		// 다음 트럭이 다리에 올라가도 무게가 괜찮다면
		let currentTruck = trucks.removeFirst()
		bridge.append(currentTruck)
		currentWeight += currentTruck
	} else {
		bridge.append(0)
	}
}
// trucks를 다 비웠으면 bridge도 다 비움
while !bridge.isEmpty {
	time += 1
	bridge.removeFirst()
}


print(time)
