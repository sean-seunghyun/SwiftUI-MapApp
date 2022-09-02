//
//  LocationView.swift
//  SwiftUI-MapApp
//
//  Created by sean on 2022/09/02.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View {
        
        VStack {
            ForEach(locationViewModel.locations) { location in
                Text(location.name)
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {

    static var previews: some View {
        
        // Preview에서 보여주게 하려면 preview에 environmentObject 등록해줘야 함
        LocationView()
            .environmentObject(LocationViewModel())
    }
}
