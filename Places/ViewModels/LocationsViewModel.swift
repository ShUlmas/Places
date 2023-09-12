//
//  LocationsViewModel.swift
//  Places
//
//  Created by O'lmasbek on 11/09/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    // locations array
    @Published var locations: [Location]
    
    // current location
    @Published var mapLocation: Location {
        didSet {
            self.updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    // show locations list view
    @Published var showLocationsListView: Bool = false
    
    let mapSpan = MKCoordinateSpan(
        latitudeDelta: 0.1,
        longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
        
    }
    
    func updateMapRegion(location: Location) {
        mapRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan)
    }
    
    func showToggleLocationsView() {
        withAnimation(.spring()) {
            showLocationsListView = !showLocationsListView
        }
    }
    
    func changeLocation(location: Location) {
        withAnimation(.spring()) {
            mapLocation = location
            showLocationsListView.toggle()
        }
    }
}
