//
//  ReverseGeocodeParser.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 12/25/22.
//

import Foundation

class ReverseGeocodeParser {
	func parseRequestToMarker(request: URLRequest, onSuccess: @escaping (MarkerAddress)->(), onFailure: @escaping (Error) -> ()) {
				let task = URLSession.shared.dataTask(with: request) { data, response, error in
  			do {
  				if let data = data {
  					let markerAddress = try JSONDecoder().decode(MarkerAddress.self, from: data)
  					onSuccess(markerAddress)
  				}
  			} catch {
  				onFailure(error)
  			}
  		}
  		task.resume()
  	}
//	func parseRequestToMarker(request: URLRequest, onSuccess: @escaping ([Zone])->(), onFailure: @escaping (Error) -> ()) {
//		let task = URLSession.shared.dataTask(with: request) { data, response, error in
//			do {
//				if let data = data {
//					let zoneList = try JSONDecoder().decode([Zone].self, from: data )
//					onSuccess(zoneList)
//				}
//			} catch {
//				onFailure(error)
//			}
//		}
//		task.resume()
//	}
}
