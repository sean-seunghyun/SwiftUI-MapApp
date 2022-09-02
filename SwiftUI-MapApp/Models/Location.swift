//
//  Location.swift
//  SwiftUI-MapApp
//
//  Created by sean on 2022/09/02.
//

import Foundation
import CoreLocation

struct Location: Identifiable{
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    var id: String{
        return name+cityName
    }
}
