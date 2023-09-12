//
//  LocationsListView.swift
//  Places
//
//  Created by O'lmasbek on 11/09/23.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject var viewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.changeLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .listRowBackground(Color.clear)
            }
        }
        .scrollIndicators(.hidden)
        .listStyle(PlainListStyle())
    }
}


struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsListView {
    private func listRowView(location: Location) -> some View {
        HStack {
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .scaledToFill()
                    .cornerRadius(12)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(location.name)
                    .font(Font.custom("Rubik-Bold", size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(location.cityName)
                    .font(Font.custom("Rubik-Medium", size: 16))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
