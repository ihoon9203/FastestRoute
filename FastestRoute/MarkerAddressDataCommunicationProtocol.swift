//
//  MarkerAddressDataCommunicationProtocol.swift
//  FastestRoute
//
//  Created by Jeonghoon Oh on 12/28/22.
//

import Foundation
import NMapsMap

protocol MarkerAddressDataCommunicationProtocol: NSObject {
	func notifyMarkerAddressDataProvided(_ markerAddress: String, _ marker: NMFMarker)
}
