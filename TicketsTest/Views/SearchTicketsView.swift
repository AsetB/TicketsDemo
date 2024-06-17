//
//  SearchTicketsView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 10.06.2024.
//

import SwiftUI

struct SearchTicketsView: View {
    @StateObject var viewModel: SearchTicketsViewModel = SearchTicketsViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        //Общий контейнер
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                VStack(spacing: 26) {
                    //верхний блок
                    HStack(spacing: 8) {
                        Image(.arrowLeft)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color.blue1)
                            .onTapGesture {
                                dismiss()
                            }
                        VStack(alignment: .leading ,spacing: 4) {
                            Text(viewModel.from)
                                .font(.addSFProDisplay(ofSize: 16, weight: .semibold))
                                .foregroundStyle(Color.white) +
                            Text("-")
                                .font(.addSFProDisplay(ofSize: 16, weight: .semibold))
                                .foregroundStyle(Color.white) +
                            Text(viewModel.destination)
                                .font(.addSFProDisplay(ofSize: 16, weight: .semibold))
                                .foregroundStyle(Color.white)
                            Text("23 февраля, 1 пассажир")
                                .font(.addSFProDisplay(ofSize: 16, weight: .medium))
                                .foregroundStyle(Color.searchDivider)
                        }
                        .padding(.vertical, 8)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.outerGray3)
                    
                    //контейнер для билетов
                    ScrollView {
                        VStack(spacing: 24) {
                            ForEach(viewModel.ticketsOffers, id: \.id) { tickets in
                                TicketListItem(ticket: tickets, badgeText: tickets.badge ?? "")
                            }
                        }
                        .padding(.top)
                    }
                    .scrollIndicators(.never)
                }
                .padding(16)
                .frame(width: geometry.size.width, height: geometry.size.height)
                //кнопка синяя
                VStack {
                    HStack(spacing: 16) {
                        HStack(spacing: 4) {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundStyle(.white)
                                .frame(width: 16, height: 16)
                            Text("Фильтр")
                                .font(.addSFProDisplay(ofSize: 14, weight: .medium))
                                .foregroundStyle(.white)
                        }
                        HStack(spacing: 4) {
                            Image(.chart)
                                .foregroundStyle(.white)
                                .frame(width: 16, height: 16)
                            Text("График цен")
                                .font(.addSFProDisplay(ofSize: 14, weight: .medium))
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(10)
                }
                .background(Capsule().fill(Color.blue1))
                .padding(.bottom, geometry.safeAreaInsets.bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        //.ignoresSafeArea()
        //.edgesIgnoringSafeArea(.all)
        .onAppear {
            viewModel.fetchTickets()
        }
        .background(Color.black)
        
        
        
        
    }
}

#Preview {
    SearchTicketsView()
}
