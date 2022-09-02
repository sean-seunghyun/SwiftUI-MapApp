//
//  LocationView.swift
//  SwiftUI-MapApp
//
//  Created by sean on 2022/09/02.
//

import SwiftUI
import MapKit
struct LocationsView: View {
    @EnvironmentObject private var locationViewModel: LocationsViewModel
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $locationViewModel.region)
        }.ignoresSafeArea()
    }
    
 
}

struct LocationsView_Previews: PreviewProvider {

    static var previews: some View {
        
        // Preview에서 보여주게 하려면 preview에 environmentObject 등록해줘야 함
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
