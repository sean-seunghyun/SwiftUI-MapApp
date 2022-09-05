//
//  LocationAnnotationView.swift
//  SwiftUI-MapApp
//
//  Created by sean on 2022/09/05.
//

import SwiftUI

struct LocationAnnotationView: View {
    var body: some View {
        VStack{
            Image(systemName: "map.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.white)
                .padding(4)
                .background(Color("AccentColor"))
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .rotationEffect(Angle(degrees: 180))
                .foregroundColor(Color("AccentColor"))
                .frame(width: 10, height: 10)
                .offset( y: -10)
        }
        .padding(.bottom, 60)
    }
}

struct LocationAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            LocationAnnotationView()
        }
    }
}
