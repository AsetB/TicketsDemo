//
//  DestinationsListView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 07.06.2024.
//

import SwiftUI

enum Destinations {
    static let istanbul = "Стамбул"
    static let phuket = "Пхукет"
    static let sochi = "Сочи"
    static let popular = "Популярное направление"
}

struct DestinationsListView: View {
    var body: some View {
        VStack {
            DestinationsListItem(destinationCity: Destinations.istanbul, image: .istanbul)
            DestinationsListItem(destinationCity: Destinations.sochi, image: .sochi)
            DestinationsListItem(destinationCity: Destinations.phuket, image: .phuket)
        }
        .padding(16)
        .background(Color.outerGray1)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct DestinationsListItem: View {
    var destinationCity: String
    var popular: String = Destinations.popular
    var image: ImageResource
    
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                VStack(alignment: .leading, spacing: 4) {
                    Text(destinationCity)
                        .foregroundStyle(Color.white)
                        .font(.addSFProDisplay(ofSize: 16, weight: .semibold))
                    Text(popular)
                        .foregroundStyle(Color.greySecondaryTitle)
                        .font(.addSFProDisplay(ofSize: 14))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Divider()
                .background(Color.searchDivider)
        }
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    DestinationsListView()
}
