//
//  LocationDetailView.swift
//  Places
//
//  Created by O'lmasbek on 13/09/23.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    let location: Location
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                locationImagesTabView
                locationTitleView
                Divider()
                descriptionView
                Divider()
                linkView
                mapLayer
            }
        }
        .scrollIndicators(.hidden)
        .background(.ultraThinMaterial)
        .ignoresSafeArea()
        .overlay(alignment: .topLeading) {
            Button {
                viewModel.sheetLocation = nil
            } label: {
                Image(systemName: "xmark")
                    .tint(Color.primary)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(12)
                    .padding(12)
                    .shadow(radius: 5)
            }
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}

extension LocationDetailView {
    private var locationImagesTabView: some View {
        VStack {
            TabView {
                ForEach(location.imageNames, id: \.self) { locationImage in
                    Image(locationImage)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width)
                        .scaledToFill()
                        .clipped()
                }
            }
            .frame(height: 500)
            .tabViewStyle(PageTabViewStyle())
        }
    }
    
    private var locationTitleView: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(Font.custom("Rubik-Bold", size: 24))
            Text(location.cityName)
                .font(Font.custom("Rubik-Medium", size: 18))
                .foregroundColor(.secondary)
        }
        .padding()
    }
    
    private var descriptionView: some View {
        VStack {
            Text(location.description)
                .font(Font.custom("Rubik-Regular", size: 16))
                .foregroundColor(Color.secondary)
        }
        .padding(.horizontal)
    }
    
    private var linkView: some View {
        Link(destination: URL(string: location.link)!) {
            Text("Read through wikipedia")
                .font(Font.custom("Rubik-Regular", size: 16))
                .foregroundColor(.blue)
        }
        .padding(.horizontal)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
            annotationItems: [location]) { locaion in
            MapAnnotation(coordinate: locaion.coordinates) {
                LocationAnnotationView()
            }
        }
        .allowsHitTesting(false)
        .cornerRadius(20)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}
