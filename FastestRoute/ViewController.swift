//
//  ViewController.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 12/25/22.
//

import UIKit
import CoreLocation
import NMapsMap
import Dispatch

class ViewController: UIViewController {

	@IBOutlet var fullView: UIView!
	let markerProvider = MarkerProvider()
	var naverMapView: NMFNaverMapView!
	override func viewDidLoad() {
		super.viewDidLoad()
		markerProvider.markerAddressDelegate = self
		naverMapView = NMFNaverMapView(frame: fullView.frame)
		naverMapView.mapView.touchDelegate = self
		naverMapView.mapView.mapType = .basic
		naverMapView.showLocationButton = true
		naverMapView.mapView.positionMode = .normal
		naverMapView.showCompass = true
		if let currentPositionCoord = CLManager.sharedLocationManager.location?.coordinate {
			naverMapView.mapView.moveCamera(NMFCameraUpdate(scrollTo: NMGLatLng(lat: currentPositionCoord.latitude, lng: currentPositionCoord.longitude)))
		}
		naverMapView.showCompass = true
		fullView.addSubview(naverMapView)
		
		// Do any additional setup after loading the view.
	}
}

extension ViewController: NMFMapViewTouchDelegate {
	func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
		let latlngString = String(latlng.lng) + "," + String(latlng.lat)
		markerProvider.selectedGPSLonLat = latlngString
		markerProvider.getHumanLocation(nil)
	}
	func mapView(_ mapView: NMFMapView, didTap symbol: NMFSymbol) -> Bool {
		let latlngString = String(symbol.position.lng) + "," + String(symbol.position.lat)
		markerProvider.selectedGPSLonLat = latlngString
		markerProvider.getHumanLocation(symbol.caption)
		return true
	}
}
extension ViewController: MarkerAddressDataCommunicationProtocol {
	func notifyMarkerAddressDataProvided(_ markerAddress: String, _ marker: NMFMarker) {
		print(markerAddress)
		DispatchQueue.main.async {
			marker.mapView = self.naverMapView.mapView
			marker.touchHandler = { (overlay) in
				print(overlay)
				marker.mapView = nil
				let newView = MarkerDescriptionViewController()
				if let sheet = newView.sheetPresentationController {
						sheet.detents = [.medium()]
						sheet.largestUndimmedDetentIdentifier = .medium
						sheet.prefersScrollingExpandsWhenScrolledToEdge = false
						sheet.prefersEdgeAttachedInCompactHeight = true
						sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
					}
				self.present(newView, animated: true, completion: nil)
				return true
			}
		}
	}
}
