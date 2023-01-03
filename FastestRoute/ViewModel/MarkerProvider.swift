//
//  MarkerProvider.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 12/25/22.
//

import Foundation
import NMapsMap
import Dispatch

class MarkerProvider {
	let rgParser = ReverseGeocodeParser()
	var selectedGPSLonLat = ""
	var selectedAreaAddress: MarkerAddress?
	
	weak var markerAddressDelegate: MarkerAddressDataCommunicationProtocol?
	
	func getHumanLocation(_ symbol: String?) {
		var urlComponents = URLComponents(string: Constants.reverseGeocoderAddress)!

		urlComponents.queryItems = [
			URLQueryItem(name: "X-NCP-APIGW-API-KEY-ID", value: Constants.naver_key),
			URLQueryItem(name: "X-NCP-APIGW-API-KEY", value: Constants.naver_secret),
			URLQueryItem(name: "orders", value: Constants.address_full),
			URLQueryItem(name: "coords", value: selectedGPSLonLat),
			URLQueryItem(name: "output", value: "json")
		]
		if let url = urlComponents.url {
			var request = URLRequest(url: url)
			request.httpMethod = "GET"
			rgParser.parseRequestToMarker(request: request) { marker in
				self.selectedAreaAddress = marker
				var area = ""
//				var area0: String?
				var area1: String?
				var area2: String?
				var area3: String?
				var area4: String?
				var area5: String?
				
				var num1: String?
				var num2: String?
				
				for result in marker.results {
//					let a0 = result.region.area0
					let a1 = result.region.area1
					let a2 = result.region.area2
					let a3 = result.region.area3
					let a4 = result.region.area4
					
//					if a0?.name != "" {
//						area0 = a0?.name
//					}
					if a1?.name != "" {
						area1 = a1?.name
					}
					if a2?.name != "" {
						area2 = a2?.name
					}
					if a3?.name != "" {
						area3 = a3?.name
					}
					if a4?.name != "" {
						area4 = a4?.name
					}
					if let a5 = result.land {
						if a5.name != "" {
							area5 = a5.name
						}
						if let numb1 = a5.number1 {
							num1 = numb1
						}
						if let numb2 = a5.number2 {
							num2 = numb2
						}
					}
				}
//				if area0 != nil {
//					area += area0! + " "
//				}
				if area1 != nil {
					area += area1! + " "
				}
				if area2 != nil {
					area += area2! + " "
				}
				if area3 != nil {
					area += area3! + " "
				}
				if area4 != nil {
					area += area4! + " "
				}
				if area5 != nil {
					area += area5! + " "
				}
				if !(num1 == nil || num1 == "") {
					area += num1!
				}
				if !(num2 == nil || num2 == "") {
					area += "-\(num2!)"
				}
				area = area.trimmingCharacters(in: .whitespaces)
				if symbol != nil {
					area += " \(symbol!)"
				}
				let latlng = self.selectedGPSLonLat.split(separator: ",")
				let lng = Double(latlng[0])
				let lat = Double(latlng[1])
				let marker = NMFMarker(position: NMGLatLng(lat: lat ?? 0, lng: lng ?? 0))
				
				self.markerAddressDelegate?.notifyMarkerAddressDataProvided(area, self.selectedGPSLonLat, marker)
				
			} onFailure: { error in
				print(error)
			}

		}
	}
}
