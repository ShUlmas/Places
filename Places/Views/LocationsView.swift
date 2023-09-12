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

    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                header
                Spacer()
            }
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
            if viewModel.showLocationsListView {
                
                LocationsListView()
            }
        }
        
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y:12)
        .padding()
        
    }
}
