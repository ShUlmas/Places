//
//  LocationsView.swift
//  Places
//
//  Created by O'lmasbek on 11/09/23.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    @State var maxWithforiPad: CGFloat = 700

    var body: some View {
        ZStack {
            mapLayer
            VStack(spacing: 0) {
                header
                    
                Spacer()
                locationPreviewStack
                    
            }
        }
        .sheet(item: $viewModel.sheetLocation) { location in
            LocationDetailView(location: location)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

//MARK: -  Header location name view
extension LocationsView {
    private var header: some View {
        VStack {
            Button {
                viewModel.showToggleLocationsView()
            } label: {
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.primary)
                    .font(Font.custom("Rubik-Bold", size: 22))
                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(Font.custom("Rubik-Bold", size: 18))
                            .foregroundColor(Color.primary)
                            .padding()
                            .rotationEffect(Angle(
                                degrees: viewModel.showLocationsListView ? 180 : 0))
                    }
            }
            .frame(maxWidth: maxWithforiPad)
            if viewModel.showLocationsListView {
                LocationsListView()
                    .frame(maxWidth: maxWithforiPad)
            }
        }
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y:12)
        .padding()
        
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion:$viewModel.mapRegion,
            annotationItems: viewModel.locations) { location in
            MapAnnotation(coordinate: location.coordinates) {
                withAnimation(.spring()) {
                    LocationAnnotationView()
                        .scaleEffect(location == viewModel.mapLocation ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            viewModel.changeLocation(location: location)
                        }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    private var locationPreviewStack: some View {
        ZStack {
            ForEach(viewModel.locations) { location in
                if location == viewModel.mapLocation {
                    LocationsPreviewView(location: location)
                        .padding()
                        .frame(maxWidth: maxWithforiPad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
    }
}
