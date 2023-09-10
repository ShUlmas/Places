//
//  Location.swift
//  Places
//
//  Created by O'lmasbek on 11/09/23.
//

import Foundation
import MapKit


struct Location: Identifiable {
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        name + cityName
    }
}
