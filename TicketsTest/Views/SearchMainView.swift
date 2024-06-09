//
//  SearchMainView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 07.06.2024.
//

import SwiftUI

struct SearchMainView: View {
    
    @ObservedObject var viewModel: SearchMainViewModel = SearchMainViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 18) {
                //общий
                VStack(spacing: 15) {
                    //первые 3 блока
                    
                    //1: блок городов
                    HStack(spacing: 8) {
                        Image(.arrowLeft)
                            .foregroundStyle(.white)
                        VStack(spacing: 8) {
                            HStack {
                                Text("Минск")
                                    .foregroundStyle(Color.white)
                                    .font(.addSFProDisplay(ofSize: 16, weight: .semibold))
                                Spacer()
                                Image(.changeCities)
                                    .foregroundStyle(.white)
                            }
                            Divider()
                                .background(Color.searchDivider)
                            HStack {
                                Text("Сочи")
                                    .foregroundStyle(Color.white)
                                    .font(.addSFProDisplay(ofSize: 16, weight: .semibold))
                                Spacer()
                                Image(.cross)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .padding(16)
                    .background(Color.outerGray1)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    //2:блок кнопок
                    ScrollView(.horizontal) {
                        HStack(spacing: 8) {
                            HStack(spacing: 8) {
                                Image(systemName: "plus")
                                    .foregroundStyle(.white)
                                Text("Обратно")
                                    .foregroundStyle(.white)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 10)
                            .background(Color.outerGray1)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            
                            HStack(spacing: 8) {
                                Text("24 фев, сб")
                                    .foregroundStyle(.white)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 10)
                            .background(Color.outerGray1)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            
                            HStack(spacing: 8) {
                                Image(systemName: "person.fill")
                                    .foregroundStyle(.white)
                                Text("1, эконом")
                                    .foregroundStyle(.white)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 10)
                            .background(Color.outerGray1)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            
                            HStack(spacing: 8) {
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundStyle(.white)
                                Text("фильтры")
                                    .foregroundStyle(.white)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 10)
                            .background(Color.outerGray1)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                        }
                    }
                    .scrollIndicators(.hidden)
                    //.contentMargins(16)
                    
                    //3:Блок рейсов
                    VStack {
                        VStack(alignment: .leading ,spacing: 8) {
                            Text("Прямые рейсы")
                                .foregroundStyle(Color.white)
                                .font(.addSFProDisplay(ofSize: 20, weight: .semibold))
                            //items
                            VStack(spacing: 8) {
                                ForEach(viewModel.flightsOffers, id: \.id) { flight in
                                    FlightsListItem(tickets: flight)
                                }
                            }
                            
                        }
                        .background(Color.outerGray11)
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        .padding(.bottom, 6)
                    }
                    .background(Color.outerGray11)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                VStack(spacing: 24) {
                    //кнопка и подписка
                }
            }
        }
        .onAppear {
            viewModel.fetchFlights()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBackground)
    }
}

#Preview {
    SearchMainView()
}
