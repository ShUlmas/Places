//
//  PlacesApp.swift
//  Places
//
//  Created by O'lmasbek on 10/09/23.
//

import SwiftUI

@main
struct PlacesApp: App {
    
    @StateObject private var viewModel = LocationsViewModel()
    
        var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
