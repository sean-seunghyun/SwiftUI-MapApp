//
//  LocationsListView.swift
//  SwiftUI-MapApp
//
//  Created by sean on 2022/09/02.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var locationVM: LocationsViewModel
    var body: some View {
        List{
            ForEach(locationVM.locations) { location in
                Button {
                    withAnimation(.easeInOut){
                        locationVM.showNextRegion(location)
                    }
                    
                } label: {
                    locationListRow(location)
                }

            }
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
    }
}

extension LocationsListView{
    func locationListRow(_ location: Location) -> some View{
        return HStack() {
            if let locationImage = location.imageNames.first{
                Image(locationImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }

    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}
