//
//  MarkerAddressDataCommunicationProtocol.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 12/28/22.
//

import Foundation

protocol MarkerAddressDataCommunicationProtocol: NSObject {
	func notifyMarkerAddressDataProvided(_ markerAddress: String)
}
