//
//  LocationDetailView.swift
//  SwiftUI-MapApp
//
//  Created by sean on 2022/09/06.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    static var isIPad: Bool {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    
    let location: Location
    var body: some View {
        ScrollView{
            VStack {
                imageTab
                cityTitle
                Divider()
                descriptionText
                Divider()
                cityMap
            }
        }.ignoresSafeArea()
    }
    
    
    struct LocationDetailView_Previews: PreviewProvider {
        static var previews: some View {
            LocationDetailView(location: LocationsDataService.locations.first!)
        }
    }
    
}

// MARK: - COMPONENTS

extension LocationDetailView{
    
    
    
    private var imageTab: some View{
        
        
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                // 탭뷰를 했을 때 이미지가 프레임보다 크면 부자연스러운 이미지 스크롤이 되므로 이미지 크기를 프레임 크기만큼 잘라줘야 한다.
                Image(imageName)
                    .resizable()
                    .scaledToFill()
//                    .frame(width: UIScreen.main.bounds.width)
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? .none :  UIScreen.main.bounds.width)

                    .clipped()
                
            }
        }
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
        .tabViewStyle(PageTabViewStyle())
        // 탭뷰를 했을 때는 프레임을 정확히 설정해줘야 제대로 나온다.
        .frame(height: 400)
        .overlay(
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color.primary)
                    .padding(10)
                    .background(.thinMaterial)
                    .cornerRadius(10)
                    .padding(.vertical, 40)
                    .padding(.leading, 20)
                
            }
                  ),alignment: .topLeading)
        
    }
    
    private var cityTitle: some View{
        VStack(alignment: .leading){
            Text(location.name)
                .font(.title)
            Text(location.cityName)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var descriptionText: some View{
        VStack(alignment: .leading, spacing: 20) {
            Text(location.description)
                .font(.subheadline)
            
            if let url = URL(string: location.link) {
                Link("Read More", destination: url)
                    .foregroundColor(Color.blue)
                    .font(.title3)
            }
            
        }.padding()
    }
    
    private var cityMap: some View{
        Map(coordinateRegion: .constant(
            MKCoordinateRegion(
                center: location.coordinates,
                latitudinalMeters: 4000,
                longitudinalMeters: 4000
            )
        ), annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationAnnotationView()
            }
        }
        .aspectRatio(1.0, contentMode: .fit)
        .cornerRadius(10)
        .allowsHitTesting(false)
        
    }
}
