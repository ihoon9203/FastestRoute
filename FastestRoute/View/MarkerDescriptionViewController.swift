//
//  MarkerDescriptionViewController.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 12/28/22.
//

import UIKit

class MarkerDescriptionViewController: UIViewController {

	
	@IBOutlet weak var addButton: UIButton!
	@IBOutlet weak var deleteButton: UIButton!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var exitButton: UIButton!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var sheetContainer: UIView!
	weak var delegate: MarkerDescriptionViewDelegate?
	var markerID: String?
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	override func viewDidDisappear(_ animated: Bool) {
		if let markerID = markerID {
			if !MarkerListManager.markerListManager.containsMarker(markerID: markerID) {
				MarkerListManager.markerListManager.removeCurrentMarker()
			}
		}
		super.viewDidDisappear(true)
	}
	@IBAction func addTriggered(_ sender: Any) {
		delegate?.notifyAddButtonTapped(markerID ?? "", markerLabel: descriptionLabel.text ?? "")
		self.dismiss(animated: true)
	}
	@IBAction func deleteTriggered(_ sender: Any) {
		delegate?.notifyDeleteButtonTapped(markerID ?? "")
		self.dismiss(animated: true)
	}
	@IBAction func exitTriggered(_ sender: Any) {
		self.dismiss(animated: true)
	}
}
