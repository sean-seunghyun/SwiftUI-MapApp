//
//  LocationViewModel.swift
//  SwiftUI-MapApp
//
//  Created by sean on 2022/09/02.
//

import Foundation

class LocationViewModel: ObservableObject{
    @Published var locations: [Location]
    
    init(){
        self.locations = LocationsDataService.locations
    }
}
