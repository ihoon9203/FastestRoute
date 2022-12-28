//
//  MarkerAddress.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 12/27/22.
//

import Foundation

struct MarkerAddress: Codable {
	var status: Status
	var results: [Result]
	
}
struct Status: Codable {
	var name: String
	var code: Int
	var message: String
}
struct Result: Codable {
	var region: Region
	var land: Land?
}
struct Region: Codable {
	var area0: Area0?
	var area1: Area1?
	var area2: Area2?
	var area3: Area3?
	var area4: Area4?
}
struct Area0: Codable {
	var name: String
}
struct Area1: Codable {
	var name: String
}
struct Area2: Codable {
	var name: String
}
struct Area3: Codable {
	var name: String
}
struct Area4: Codable {
	var name: String
}
struct Land: Codable {
	var name: String?
	
	var number1: String?
	var number2: String?
	
	var addition0: Addition0?
	var addition1: Addition1?
	var addition2: Addition2?
	var addition3: Addition3?
	var addition4: Addition4?
}
struct Addition0: Codable {
	var type: String
	var value: String
}
struct Addition1: Codable {
	var type: String
	var value: String
}
struct Addition2: Codable {
	var type: String
	var value: String
}
struct Addition3: Codable {
	var type: String
	var value: String
}
struct Addition4: Codable {
	var type: String
	var value: String
}
