//
//  SwiftUI_MapAppApp.swift
//  SwiftUI-MapApp
//
//  Created by sean on 2022/09/02.
//

import SwiftUI

@main
struct SwiftUI_MapAppApp: App {
    
    @StateObject var locationViewModel: LocationsViewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(locationViewModel)
        }
    }
}
