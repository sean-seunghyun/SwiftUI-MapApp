//
//  LocationViewModel.swift
//  SwiftUI-MapApp
//
//  Created by sean on 2022/09/02.
//

import Foundation
import MapKit

class LocationsViewModel: ObservableObject{
    @Published var locations: [Location]
    @Published var currentLocation: Location{
        didSet{
            print("did set current Location")
            updateRegion(location: currentLocation)
        }
    }
    @Published var region: MKCoordinateRegion = MKCoordinateRegion()
    
    init(){
        print("init")
        let locations = LocationsDataService.locations
        self.locations = locations
        self.currentLocation = locations.first!
        self.updateRegion(location: currentLocation)
    }
    
    private func updateRegion(location: Location){
        self.region = MKCoordinateRegion(
            center: location.coordinates,
            latitudinalMeters: 750,
            longitudinalMeters: 750
        )
        print("complete update region")
    }
    
    
}
