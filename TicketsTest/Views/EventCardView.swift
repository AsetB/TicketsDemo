//
//  EventCardView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 06.06.2024.
//

import SwiftUI

struct EventCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(.artist1)
                .resizable()
                .scaledToFill()
                .frame(width: 132, height: 132)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Text("Die Antwoord")
                .foregroundStyle(Color.white)
                .font(.addSFProDisplay(ofSize: 16, weight: .semibold))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Будапешт")
                    .foregroundStyle(Color.white)
                    .font(.addSFProDisplay(ofSize: 14))
                HStack(alignment: .center) {
                    Image(.planeCard)
                        .foregroundStyle(Color.searchPlaceholder)
                    Text("от 22 264 ₽")
                        .foregroundStyle(Color.white)
                        .font(.addSFProDisplay(ofSize: 14))
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    EventCardView()
        .background(Color.appBackground)
}
