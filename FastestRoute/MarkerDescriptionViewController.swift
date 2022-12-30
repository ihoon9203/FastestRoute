//
//  MarkerDescriptionViewController.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 12/28/22.
//

import UIKit

class MarkerDescriptionViewController: UIViewController {

	@IBOutlet weak var sheetContainer: UIView!
	override func viewDidLoad() {
        super.viewDidLoad()
//		loadViewFromNib()
//		if let nib = Bundle.main.loadNibNamed("MarkerDescriptionView", owner: self),
//			let nibView = nib.first as? MarkerDescriptionView {
//			nibView.delegate = self
//			self.view.addSubview(nibView)
//		}
		
    }
//	func loadViewFromNib() {
//		if let nib = Bundle.main.loadNibNamed("MarkerDescriptionView", owner: self),
//			let nibView = nib.first as? MarkerDescriptionView {
//			if let carImageName = imageName {
//				if let carImage = UIImage(named: carImageName) {
//					nibView.carImage.image = carImage
//				}
//			}
//			nibView.carTitle.text = title
//			nibView.carDescription.text = carDescription
//			DispatchQueue.global().async {
//				if let imageName = self.imageName {
//					if let imageURL = URL(string: imageName) {
//						if let data = try? Data(contentsOf: imageURL) {
//							DispatchQueue.main.async {
//								nibView.carImage.image = UIImage(data: data)
//							}
//						}
//					}
//				}
//			}
//
//			self.view.addSubview(nibView)
//		}
//	}
}

extension MarkerDescriptionViewController: MarkerDescriptionViewDelegate {
	func notifyDeleteButtonTapped() {
		print("Tap!")
	}
	
	func notifyExitButtonTapped() {
		print("Exit!")
	}
	
	
}
