//
//  MarkerListManager.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 1/1/23.
//

import Foundation
import NMapsMap

class MarkerListManager {
	static let markerListManager = MarkerListManager()
	var markerList = [Marker]()
	var currentMarker: NMFMarker?
	private init(){}
	func removeCurrentMarker() {
		if let thisMarker = currentMarker {
			thisMarker.mapView = nil
			currentMarker = nil
		}
	}
	func unassignMarker(_ id: String) {
		var markerIndex = -1
		for (index, marker) in markerList.enumerated() {
			if marker.id == id {
				marker.marker.mapView = nil
				markerIndex = index
				break
			}
		}
		if markerIndex > -1 {
			markerList.remove(at: markerIndex)
		}
	}
	func assignMarker(marker: NMFMarker, id: String, label: String) {
		let newMarker = Marker(priority: markerList.count, id: id, label: label, marker: marker)
		markerList.append(newMarker)
	}
	func containsMarker(marker: Marker) -> Bool {
		for markerInstance in markerList {
			if markerInstance.id == marker.id {
				return true
			}
		}
		return false
	}
	func containsMarker(markerID: String) -> Bool {
		for markerInstance in markerList {
			if markerInstance.id == markerID {
				return true
			}
		}
		return false
	}
}
