//
//  main.swift
//  BOJ10815
//
//  Created by 정현우 on 3/22/24.
//

import Foundation

let N = Int(readLine()!)!
let ownCards: [Int] = readLine()!.split(separator: " ").map({(Int($0)!)}).sorted()
let M = Int(readLine()!)!
let cardList: [Int] = readLine()!.split(separator: " ").map({(Int($0)!)})

func binarySearch(_ card: Int) -> Bool {
	var start = 0
	var end = N-1
	
	while start <= end {
		let mid = (start+end) / 2
		
		if ownCards[mid] == card {
			return true
		}
		
		if ownCards[mid] > card {
			end = mid - 1
		} else {
			start = mid + 1
		}
	}
	
	return false
}

var result: [Int] = []
for card in cardList {
	result.append(binarySearch(card) ? 1 : 0)
}

print(result.map({String($0)}).joined(separator: " "))


