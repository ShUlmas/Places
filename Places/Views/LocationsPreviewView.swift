//
//  LocationsPreviewView.swift
//  Places
//
//  Created by O'lmasbek on 12/09/23.
//

import SwiftUI

struct LocationsPreviewView: View {
    let location: Location
    
    @EnvironmentObject var viewModel: LocationsViewModel
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                currentPlaceImage
                currentPalaceTitle
            }
            VStack {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
                .offset(y: 60)
        )
        .clipped()
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.3), radius: 12, x: 2, y: 10)
    }
}

struct LocationsPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green
            LocationsPreviewView(location: LocationsDataService.locations.first!)
        }
        .environmentObject(LocationsViewModel())
    }
}

extension LocationsPreviewView {
    // image
    private var currentPlaceImage: some View {
        ZStack {
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(12)
                    .padding(6)
                    .background(Color.white)
                    .cornerRadius(12)
            }
        }
    }
    // title
    private var currentPalaceTitle: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(Font.custom("Rubik-Medium", size: 22))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(location.cityName)
                .font(Font.custom("Rubik-Regular", size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    // learn more button
    private var learnMoreButton: some View {
        Button {
            // action
        } label: {
            Text("Learn more")
                .font(Font.custom("Rubik-Medium", size: 18))
                .padding(8)
                .frame(width: 120)
        }
        .buttonStyle(.borderedProminent)
    }

    // next button
    private var nextButton: some View {
        Button {
            viewModel.nextButtonTapped()
        } label: {
            Text("Next")
                .font(Font.custom("Rubik-Medium", size: 18))
                .buttonStyle(.bordered)
                .padding(8)
                .frame(width: 120)
        }
        .buttonStyle(.bordered)
    }
}
