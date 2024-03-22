//
//  main.swift
//  BOJ2110
//
//  Created by 정현우 on 3/22/24.
//

import Foundation

let firstInput: [Int] = readLine()!.split(separator: " ").map({Int($0)!})
let houseCount = firstInput[0]
let routerCount = firstInput[1]

var houses: [Int] = []
for _ in 0..<houseCount {
	houses.append(Int(readLine()!)!)
}
let sortedHouses = houses.sorted()

var start = 1
var end = sortedHouses.last! - sortedHouses.first!

while start <= end {
	let mid = (start + end) / 2
	
	let installCount = canInstallRouteCount(mid)
	if installCount < routerCount {
		end = mid - 1
	} else {
		start = mid + 1
	}
}
print(start - 1)

func canInstallRouteCount(_ distance: Int) -> Int {
	var count = 1
	var lastInstall = sortedHouses[0]
	
	for house in sortedHouses {
		if house - lastInstall >= distance {
			count += 1
			lastInstall = house
		}
	}
	
	return count
}

