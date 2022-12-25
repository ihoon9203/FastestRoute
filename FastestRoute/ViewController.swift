//
//  ViewController.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 12/25/22.
//

import UIKit
import NMapsMap

class ViewController: UIViewController {

	@IBOutlet var fullView: UIView!
	override func viewDidLoad() {
		super.viewDidLoad()
		let mapView = NMFMapView(frame: fullView.frame)
		mapView.mapType = .basic
		mapView.latitude = 37.5670135
		mapView.longitude = 126.9783740
		let utmk = NMGUtmk(x: 953935.5, y: 1952044.1)
		let latLng = utmk.toLatLng()
		fullView.addSubview(mapView)
		// Do any additional setup after loading the view.
	}


}

