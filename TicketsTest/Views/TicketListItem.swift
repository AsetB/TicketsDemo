//
//  TicketListItem.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 10.06.2024.
//

import SwiftUI

struct TicketListItem: View {
    var badgeText: String = "Самый удобный"
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            //внутренний контейнер
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("6 990 ₽")
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
                                    Text("03:15")
                                        .foregroundStyle(Color.white)
                                        .font(.addSFProDisplay(ofSize: 14, weight: .medium))
                                    Text("VKO")
                                        .foregroundStyle(Color.searchDivider)
                                        .font(.addSFProDisplay(ofSize: 14, weight: .mediumItalic))
                                }
                                Text("—")
                                    .foregroundStyle(Color.searchDivider)
                                    .padding(.top, -2)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("03:15")
                                        .foregroundStyle(Color.white)
                                        .font(.addSFProDisplay(ofSize: 14, weight: .medium))
                                    Text("AER")
                                        .foregroundStyle(Color.searchDivider)
                                        .font(.addSFProDisplay(ofSize: 14, weight: .mediumItalic))
                                }
                            }
                        }
                        HStack {
                            Text("4ч в пути / Без пересадок")
                                .foregroundStyle(Color.white)
                                .font(.addSFProDisplay(ofSize: 14))
                        }
                    }
                }
                .padding(.top, 21)
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
            .background(Color.outerGray11)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            BadgeView(text: badgeText)
                .padding(.top, -8)
        }
        .padding()
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
    TicketListItem()
}
