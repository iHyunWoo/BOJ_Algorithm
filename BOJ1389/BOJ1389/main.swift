//
//  main.swift
//  BOJ1389
//
//  Created by 정현우 on 3/19/24.
//

import Foundation

let firstInput: [Int] = readLine()!.split(separator: " ").map({Int($0)!})
let friendCount = firstInput[0]
let realationCount = firstInput[1]

// 인접 리스트 그래프
var adjGraph: [[Int]] = Array(repeating: [], count: friendCount+1)
for _ in 0..<realationCount {
	let relation: [Int] = readLine()!.split(separator: " ").map({Int($0)!})
	adjGraph[relation[0]].append(relation[1])
	adjGraph[relation[1]].append(relation[0])  // 양방향
}

// 특정 노드를 기준으로 다른 노드까지의 거리를 저장하는 배열(기준 노드가 변할때마다 초기화)
var bacon: [Int] = Array(repeating: 0, count: friendCount+1)
var isVisited: [Bool] = Array(repeating: false, count: friendCount+1)

func bfs(_ start: Int) {
	var queue: [Int] = []
	queue.append(start)
	isVisited[start] = true
	
	while !queue.isEmpty {
		let now = queue.removeFirst()
		
		for i in adjGraph[now] {
			if !isVisited[i] {
				queue.append(i)
				// 큐에 넣을 때 방문처리해서 또 방문 안하게
				isVisited[i] = true
				// 이전 depth + 1 == 현재 depth
				bacon[i] = bacon[now] + 1
			}
		}
	}
}

var result = Int.max
var resultNumber = 0

for i in 1...friendCount {
	bacon = Array(repeating: 0, count: friendCount+1)
	isVisited = Array(repeating: false, count: friendCount+1)
	bfs(i)
	var current = 0
	bacon.forEach({current += $0})
	if result > current {
		result = current
		resultNumber = i
	}
}

print(resultNumber)

