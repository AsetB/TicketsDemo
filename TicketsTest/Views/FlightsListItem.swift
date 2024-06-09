//
//  FlightsListItem.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 07.06.2024.
//

import SwiftUI

struct FlightsListItem: View {
    let tickets: Flights
    
    private func cirleColor(id: Int) -> Color {
        switch id {
        case 1:
            return Color(Color.red1)
        case 10:
            return Color(Color.blue1)
        case 30:
            return Color(Color.white)
        default:
            return Color(Color.white)
        }
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "circle.fill")
                .frame(width: 24, height: 24)
                .foregroundStyle(cirleColor(id: tickets.id))
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(tickets.title)
                        .font(.addSFProDisplay(ofSize: 14, weight: .mediumItalic))
                        .foregroundStyle(Color.white)
                    Spacer()
                    HStack(spacing: 0) {
                        Text("\(tickets.price.value.getFormattedCurrency()) ₽")
                            .font(.addSFProDisplay(ofSize: 14, weight: .mediumItalic))
                            .foregroundStyle(Color.blue1)
                        Image(.arrowShortRight)
                            .frame(width: 16, height: 16)
                            .foregroundStyle(Color.blue1)
                    }
                }
                HStack {
                    ForEach(tickets.timeRange, id: \.self) { time in
                        Text(time)
                            .font(.addSFProDisplay(ofSize: 14))
                            .foregroundStyle(Color.white)
                            .lineLimit(1)
                    }
//                    Text(tickets.timeRange.joined(separator: " "))
//                        .font(.addSFProDisplay(ofSize: 14))
//                        .foregroundStyle(Color.white)
//                        .lineLimit(1)
                }
                Divider()
                    .background(Color.searchDivider)
            }
        }
        .background(Color.outerGray11)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FlightsListItem(tickets: Flights(id: 1, title: "Уральские авиалинии", timeRange: ["13:10", "13:10","13:10"], price: .init(value: 4999)))
}
