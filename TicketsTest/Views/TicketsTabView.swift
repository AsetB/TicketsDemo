//
//  TicketsTabView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 04.06.2024.
//

import SwiftUI

struct TicketsTabView: View {
    
    @State var from: String = "Минск"
    @State var destination: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 32) {
                VStack(spacing: 38) {
                    Text("Поиск дешевых\nавиабилетов")
                        .foregroundStyle(Color.mainTitle)
                        .font(.addSFProDisplay(ofSize: 22, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .lineLimit(.max)
                    
                    VStack {
                        HStack(spacing: 0) {
                            Image(.search)
                                .padding(.leading, 8)
                            
                            VStack(spacing: 8) {
                                SearchInputView(value: $from, placeholder: "Откуда - Минск")
                                
                                Divider()
                                    .background(Color.searchDivider)
                                
                                SearchInputView(value: $destination, placeholder: "Куда - Турция")
                            }
                            .padding(16)
                        }
                        .background(Color.outerGray4)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(16)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.outerGray1)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.top, 26)
                .padding(.horizontal, 16)
                
                VStack(spacing:26) {
                    Text("Музыкально отлететь")
                        .foregroundStyle(Color.mainTitle)
                        .font(.addSFProDisplay(ofSize: 22, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 24) {
                           EventCardView()
                            EventCardView()
                            EventCardView()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.appBackground)
        }
    }
}

#Preview {
    TicketsTabView()
}
