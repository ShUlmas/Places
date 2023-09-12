//
//  LocationAnnotationView.swift
//  Places
//
//  Created by O'lmasbek on 12/09/23.
//

import SwiftUI

struct LocationAnnotationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.white)
                .padding(6)
                .background(Color.accentColor)
                .cornerRadius(21)
            Image(systemName: "triangle.fill")
                .resizable()
                .frame(width: 14, height: 12)
                .rotationEffect(Angle(degrees: 180))
                .foregroundColor(Color.accentColor)
                .offset(y: -4)
        }
        
    }
}

struct LocationAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationAnnotationView()
    }
}
