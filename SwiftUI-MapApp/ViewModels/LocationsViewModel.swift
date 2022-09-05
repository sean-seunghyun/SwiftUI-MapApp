//
//  LocationViewModel.swift
//  SwiftUI-MapApp
//
//  Created by sean on 2022/09/02.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject{
    @Published var locations: [Location]
    @Published var currentLocation: Location{
        didSet{
            updateRegion(location: currentLocation)
        }
    }
    @Published var region: MKCoordinateRegion = MKCoordinateRegion()
    
    @Published var showList: Bool = false
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.currentLocation = locations.first!
        self.updateRegion(location: currentLocation)
    }
    
    private func updateRegion(location: Location){
        self.region = MKCoordinateRegion(
            center: location.coordinates,
            latitudinalMeters: 10000,
            longitudinalMeters: 10000
        )
    }
    
    func toggleShowList(){
        self.showList = !self.showList
    }
    
    func showNextRegion(_ location: Location){
        withAnimation {
            self.currentLocation = location
            self.showList = false
        }
        
    }
    
    func showNextLocation(){

        
        guard let currentIndex = locations.firstIndex(where: {
            $0 == self.currentLocation
        })else{
            print("Could not find the location. This should never happen")
            return
        }
               
        let nextIndex = currentIndex + 1
        if !self.locations.indices.contains(nextIndex){
            guard let firstLocation = locations.first else{
                print("Could not set the first location. This should never happen")
                return
            }
            showNextRegion(firstLocation)
            return
        }
        
        showNextRegion(locations[nextIndex])
        
    }
    
    
}
