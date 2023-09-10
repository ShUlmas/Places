//
//  LocationsViewModel.swift
//  Places
//
//  Created by O'lmasbek on 11/09/23.
//

import Foundation


class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
