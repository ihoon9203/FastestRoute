//
//  Marker.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 12/25/22.
//

import Foundation
import NMapsMap

struct Marker {
	var priority: Int
	var id: String
	var label: String
	var alias: String?
	var marker: NMFMarker
	
	func getlatlng() -> (Double, Double) {
		let latlng = self.id.split(separator: ",")
		let lng = Double(latlng[0])!
		let lat = Double(latlng[1])!
		return (lng, lat)
	}
}
