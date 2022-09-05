//
//  LocationView.swift
//  SwiftUI-MapApp
//
//  Created by sean on 2022/09/02.
//

import SwiftUI
import MapKit
struct LocationsView: View {
    @EnvironmentObject private var locationVM: LocationsViewModel
    
    var body: some View {
        ZStack{
            mapLayer
            
            VStack{
                header
                Spacer()
                bottomLocationBox
            }
            
        }
    }
}

// MARK: - COMPONENTS
extension LocationsView{
    
    var mapLayer: some View{
        Map(coordinateRegion: $locationVM.region,
            annotationItems: locationVM.locations) { location in
            MapAnnotation(coordinate:
                            location.coordinates) {
                LocationAnnotationView()
                    .scaleEffect(location == locationVM.currentLocation ? 1 : 0.7)
                    .onTapGesture {
                        locationVM.showNextRegion(location)
                    }
            }
        }
            .ignoresSafeArea()
    }
    
    var header: some View{
        
        VStack(spacing: 0) {
            HStack() {
                
                Button {
                    withAnimation(.easeInOut){
                        locationVM.toggleShowList()
                    }
                    
                } label: {
                    
                    Text("\(locationVM.currentLocation.name),  \(locationVM.currentLocation.cityName)")
                        .foregroundColor(.primary)
                        .fontWeight(.black)
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .animation(.none, value: locationVM.currentLocation)
                        .overlay(
                            Image(systemName: "arrow.down")
                                .font(.title2)
                                .foregroundColor(Color.primary)
                                .rotationEffect(locationVM.showList ? Angle.degrees(180) :
                                                    Angle.degrees(0))
                            ,
                            alignment: .leading
                        )
                        .padding(.leading)
                }
                
                
            }
            if locationVM.showList{
                LocationsListView()
            }
            
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(radius: 20)
        .padding()
    }
    
    var bottomLocationBox: some View{
        ZStack {
            ForEach(locationVM.locations) { location in
                if location == locationVM.currentLocation{
                    LocationPreviewView(location: locationVM.currentLocation)
                        .shadow(radius: 25)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
                
            }
            
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        // Preview에서 보여주게 하려면 preview에 environmentObject 등록해줘야 함
        LocationsView()
            .environmentObject(LocationsViewModel())
            .previewInterfaceOrientation(.portrait)
    }
}
