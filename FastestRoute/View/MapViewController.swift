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

class MapViewController: UIViewController {

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
	func presentSheetViewController(latlng: String, markerAddress: String) {
		let newView = MarkerDescriptionViewController()
		newView.delegate = self
		if let sheet = newView.sheetPresentationController {
			sheet.detents = [.medium()]
				sheet.largestUndimmedDetentIdentifier = .medium
				sheet.prefersScrollingExpandsWhenScrolledToEdge = false
				sheet.prefersEdgeAttachedInCompactHeight = true
				sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
			}
		self.present(newView, animated: true, completion: nil)
		newView.markerID = latlng
		newView.titleLabel.text = markerAddress
		newView.descriptionLabel.text = markerAddress
	}
}

extension MapViewController: NMFMapViewTouchDelegate {
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
extension MapViewController: MarkerAddressDataCommunicationProtocol {
	func notifyMarkerAddressDataProvided(_ markerAddress: String, _ latlng: String, _ marker: NMFMarker) {
		print(markerAddress)
		DispatchQueue.main.async {
			// marker appear on screen
			marker.mapView = self.naverMapView.mapView
			MarkerListManager.markerListManager.currentMarker = marker
			self.presentSheetViewController(latlng: latlng, markerAddress: markerAddress)
			marker.touchHandler = { (overlay) in
				// marker disappear from screen
				// marker.mapView = nil
				self.presentSheetViewController(latlng: latlng, markerAddress: markerAddress)
//				let newView = MarkerDescriptionViewController()
//				newView.delegate = self
//				if let sheet = newView.sheetPresentationController {
//					sheet.detents = [.medium()]
//						sheet.largestUndimmedDetentIdentifier = .medium
//						sheet.prefersScrollingExpandsWhenScrolledToEdge = false
//						sheet.prefersEdgeAttachedInCompactHeight = true
//						sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
//					}
//				self.present(newView, animated: true, completion: nil)
//				newView.markerID = latlng
//				newView.titleLabel.text = markerAddress
//				newView.descriptionLabel.text = markerAddress
				return true
			}
		}
	}
}
extension MapViewController: MarkerDescriptionViewDelegate {
	func notifyDeleteButtonTapped(_ markerID: String) {
		MarkerListManager.markerListManager.unassignMarker(markerID)
	}
	
	func notifyAddButtonTapped(_ markerID: String, markerLabel: String) {
		let latlng = markerID.split(separator: ",")
		let lng = Double(latlng[0])
		let lat = Double(latlng[1])
		let marker = NMFMarker(position: NMGLatLng(lat: lat ?? 0, lng: lng ?? 0))
		marker.mapView = self.naverMapView.mapView
		MarkerListManager.markerListManager.assignMarker(marker: marker, id: markerID, label: markerLabel)
	}
	
	
}
