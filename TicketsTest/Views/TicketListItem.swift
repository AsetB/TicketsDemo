//
//  TicketListItem.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 10.06.2024.
//

import SwiftUI

struct TicketList: View {
    var body: some View {
        TicketListItem(ticket: Tickets(id: 1, badge: "Самый удобный", price: .init(value: 1234), departure: Tickets.Departure(town: "Aset", date:"2024-02-23T04:00:00", airport:"SVE" ), arrival: Tickets.Arrival(town:"Aset", date:"2024-02-23T08:30:00", airport:"AER"), hasTransfer: true))
        TicketListItem(ticket: Tickets(id: 1, badge: "Рекомендуем", price: .init(value: 1234), departure: Tickets.Departure(town: "Aset", date:"2024-02-23T04:00:00", airport:"SVE" ), arrival: Tickets.Arrival(town:"Aset", date:"2024-02-23T08:30:00", airport:"AER"), hasTransfer: false))
    }
}

struct TicketListItem: View {
    var ticket: Tickets
    var badgeText: String = "Самый удобный"
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            //внутренний контейнер
            VStack(alignment: .leading, spacing: 16) {
                Text("\(ticket.price.value.getFormattedCurrency()) ₽")
                    .foregroundStyle(Color.white)
                    .font(.addSFProDisplay(ofSize: 22, weight: .semibold))
                //second row
                HStack(alignment: .top, spacing: 16) {
                    HStack(spacing: 8) {
                        Image(systemName: "circle.fill")
                            .foregroundStyle(Color.red1)
                            .frame(width: 24, height: 24)
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(formateDateString(fromString:ticket.departure.date) ?? "")
                                    .foregroundStyle(Color.white)
                                    .font(.addSFProDisplay(ofSize: 14, weight: .medium))
                                Text(ticket.departure.airport)
                                    .foregroundStyle(Color.searchDivider)
                                    .font(.addSFProDisplay(ofSize: 14, weight: .mediumItalic))
                            }
                            Text("—")
                                .foregroundStyle(Color.searchDivider)
                                .padding(.top, -2)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(formateDateString(fromString:ticket.arrival.date) ?? "")
                                    .foregroundStyle(Color.white)
                                    .font(.addSFProDisplay(ofSize: 14, weight: .medium))
                                Text(ticket.arrival.airport)
                                    .foregroundStyle(Color.searchDivider)
                                    .font(.addSFProDisplay(ofSize: 14, weight: .mediumItalic))
                            }
                        }
                    }
                    HStack {
                        if ticket.hasTransfer {
                            let time = timeDifference(from: ticket.departure.date, to: ticket.arrival.date)
                            Text("\(time ?? "") в пути / Без пересадок")
                                .foregroundStyle(Color.white)
                                .font(.addSFProDisplay(ofSize: 14))
                        } else {
                            let time = timeDifference(from: ticket.departure.date, to: ticket.arrival.date)
                            Text("\(time ?? "") в пути")
                                .foregroundStyle(Color.white)
                                .font(.addSFProDisplay(ofSize: 14)) +
                            Text(" / Без пересадок")
                                .foregroundStyle(Color.clear)
                                .font(.addSFProDisplay(ofSize: 14))
                        }
                    }
                    .frame(alignment: .leading)
                }
            }
            .padding(.top, 21)
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity)
            .background(Color.outerGray11)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            if badgeText.isEmpty {
                BadgeView(text: ticket.badge ?? "").hidden()
            } else {
                BadgeView(text: ticket.badge ?? "")
                    .padding(.top, -8)
            }
            
        }
        //.frame(maxWidth: .infinity)
        //.padding()
        //.background(Color.black)
    }
}

struct BadgeView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.addSFProDisplay(ofSize: 14, weight: .mediumItalic))
            .foregroundStyle(Color.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 2)
            .background(Capsule().fill(Color.blue1))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TicketList()
    //TicketListItem(ticket: Tickets(id: 1, badge: "Самый", price: .init(value: 1234), departure: Tickets.Departure(town: "Aset", date:"2024-02-23T04:00:00", airport:"SVE" ), arrival: Tickets.Arrival(town:"Aset", date:"2024-02-23T08:30:00", airport:"AER"), hasTransfer: true))
    
}
