//
//  ViewController.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 12/25/22.
//

import UIKit
import CoreLocation
import NMapsMap

class ViewController: UIViewController {

	@IBOutlet var fullView: UIView!
	let markerProvider = MarkerProvider()
	override func viewDidLoad() {
		super.viewDidLoad()
		markerProvider.markerAddressDelegate = self
		let mapView = NMFNaverMapView(frame: fullView.frame)
		mapView.mapView.touchDelegate = self
		mapView.mapView.mapType = .basic
		mapView.showLocationButton = true
		mapView.mapView.positionMode = .normal
		mapView.showCompass = true
		if let currentPositionCoord = CLManager.sharedLocationManager.location?.coordinate {
			mapView.mapView.moveCamera(NMFCameraUpdate(scrollTo: NMGLatLng(lat: currentPositionCoord.latitude, lng: currentPositionCoord.longitude)))
		}
		mapView.showCompass = true
		fullView.addSubview(mapView)
		
		// Do any additional setup after loading the view.
	}
}

extension ViewController: NMFMapViewTouchDelegate {
	func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
		let latlngString = String(latlng.lng) + "," + String(latlng.lat)
		markerProvider.selectedGPSLonLat = latlngString
		markerProvider.getHumanLocation()
	}
	func mapView(_ mapView: NMFMapView, didTap symbol: NMFSymbol) -> Bool {
		print(symbol)
		return true
	}
}
extension ViewController: MarkerAddressDataCommunicationProtocol {
	func notifyMarkerAddressDataProvided(_ markerAddress: String) {
		print(markerAddress)
	}
}
