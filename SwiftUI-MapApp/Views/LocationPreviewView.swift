//
//  LoationPreviewView.swift
//  SwiftUI-MapApp
//
//  Created by sean on 2022/09/02.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var locationVM: LocationsViewModel
    
    var location: Location
    var body: some View {
        
        
        HStack(alignment: .bottom){
            VStack(alignment: .leading, spacing: 15){
                imageSection
                titleSection
            }
            Spacer()
            VStack {
                learnMoreButton
                nextButton
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.thinMaterial)
                .offset(y: 45)
        )
        .cornerRadius(10)
    }
    
}

struct LoationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.clear
            
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .environmentObject(LocationsViewModel())
        }
    }
}

extension LocationPreviewView{
    
    var imageSection: some View{
        ZStack{
            if let locationImage = location.imageNames.first{
                Image(locationImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .padding(5)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
    
    var titleSection: some View{
        VStack(alignment: .leading){
            Text(location.name)
                .font(.title)
                .fontWeight(.semibold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
    var learnMoreButton: some View{
        Button {
            learnMoreButtonPressed()
        } label: {
            Text("Learn More")
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
        
    }
    
    var nextButton: some View{
        Button {
            nextButtonPressed()
            
        } label: {
            Text("Next")
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
    
    
    func nextButtonPressed(){
        locationVM.showNextLocation()
    }
    
    func learnMoreButtonPressed(){
        locationVM.showDetail = true
    }
}
