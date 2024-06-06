//
//  EventCardView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 06.06.2024.
//

import SwiftUI

struct EventCardView: View {
    let events: Events
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image("artist_\(events.id)")
                .resizable()
                .scaledToFill()
                .frame(width: 132, height: 132)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Text(events.title)
                .foregroundStyle(Color.white)
                .font(.addSFProDisplay(ofSize: 16, weight: .semibold))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(events.town)
                    .foregroundStyle(Color.white)
                    .font(.addSFProDisplay(ofSize: 14))
                HStack(alignment: .center) {
                    Image(.planeCard)
                        .foregroundStyle(Color.searchPlaceholder)
                    Text("от \(events.price.value.getFormattedCurrency()) ₽")
                        .foregroundStyle(Color.white)
                        .font(.addSFProDisplay(ofSize: 14))
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    EventCardView(events: Events(id: 1, title: "Die Antwoord", town: "Будапешт", price: .init(value: 123)))
        .background(Color.appBackground)
}
