//
//  MarkerDescriptionVCDelegate.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 12/28/22.
//

import Foundation

protocol MarkerDescriptionVCDelegate: NSObject {
	func MarkerDescVCDidFinish(_ controller: MarkerDescriptionViewController)
}

protocol MarkerDescriptionViewDelegate: NSObject {
	func notifyDeleteButtonTapped()
	func notifyExitButtonTapped()
}
