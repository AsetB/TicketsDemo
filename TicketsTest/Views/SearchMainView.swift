//
//  SearchMainView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 07.06.2024.
//

import SwiftUI

struct SearchMainView: View {
    
    @StateObject var viewModel: SearchMainViewModel = SearchMainViewModel()
    @State private var isPriceSubscribed: Bool = false
    @State private var isSearchTicketViewPresented: Bool = false
    @State private var isDatePickerPresented: Bool = false
    @State private var choosenDate: Date = Date.now
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 18) {
                    //общий
                    VStack(spacing: 15) {
                        //первые 3 блока
                        
                        //1: блок городов
                        HStack(spacing: 8) {
                            Image(.arrowLeft)
                                .foregroundStyle(.white)
                                .onTapGesture {
                                    dismiss()
                                }
                            VStack(spacing: 8) {
                                HStack {
                                    TextField("", text: $viewModel.from, prompt: Text("Откуда - Минск")
                                        .foregroundStyle(Color.searchPlaceholder)
                                        .font(.addSFProDisplay(ofSize: 16, weight: .semibold)))
                                    .foregroundStyle(Color.searchText)
                                    Spacer()
                                    Image(.changeCities)
                                        .foregroundStyle(.white)
                                        .onTapGesture {
                                            let a = viewModel.destination
                                            let b = viewModel.from
                                            viewModel.destination = b
                                            viewModel.from = a
                                        }
                                }
                                Divider()
                                    .background(Color.searchDivider)
                                HStack {
                                    TextField("", text: $viewModel.destination, prompt: Text("Куда - Турция")
                                        .foregroundStyle(Color.searchPlaceholder)
                                        .font(.addSFProDisplay(ofSize: 16, weight: .semibold)))
                                    .foregroundStyle(Color.searchText)
                                    Spacer()
                                    Image(.cross)
                                        .foregroundStyle(.white)
                                        .onTapGesture {
                                            viewModel.destination = ""
                                        }
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
                                .onTapGesture {
                                    isDatePickerPresented = true
                                }
                                
                                HStack(spacing: 8) {
                                    Text(currentDateFormatted(for: viewModel.choosenDate) ?? "")
                                        .foregroundStyle(.white)
                                }
                                .padding(.vertical, 8)
                                .padding(.horizontal, 10)
                                .background(Color.outerGray1)
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                                .onTapGesture {
                                    isDatePickerPresented = true
                                }
                                
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
                                        FlightsListItem(flights: flight)
                                    }
                                }
                                //button - показать все
                                HStack {
                                    Spacer()
                                    VStack(alignment: .center) {
                                        Button("Показать все") {
                                            //
                                        }
                                        .font(.addSFProDisplay(ofSize: 16, weight: .semibold))
                                    }
                                    .padding(.vertical, 10)
                                    .frame(alignment: .center)
                                    Spacer()
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
                        VStack(alignment: .center) {
                            Button("Посмотреть все билеты") {
                                isSearchTicketViewPresented = true
                            }
                            .font(.addSFProDisplay(ofSize: 16, weight: .mediumItalic))
                            .foregroundStyle(Color.white)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 42)
                        .padding(.vertical, 5)
                        .background(Color.blue1)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        VStack {
                            HStack {
                                Image(systemName: "bell.fill")
                                    .foregroundStyle(Color.blue1)
                                    .frame(width: 24, height: 24)
                                Text("Подписка на цену")
                                    .font(.addSFProDisplay(ofSize: 16))
                                    .foregroundStyle(Color.white)
                                Spacer()
                                Button("", image: isPriceSubscribed ? .toggleOn : .toggleOff) {
                                    isPriceSubscribed.toggle()
                                }
                                .frame(width: 50, height: 30)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                        }
                        .background(Color.outerGray3)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .navigationDestination(isPresented: $isSearchTicketViewPresented) {
                    SearchTicketsView()
                        .navigationBarBackButtonHidden()
                }
                .sheet(isPresented: $isDatePickerPresented, onDismiss: {
                    //
                }, content: {
                    DatePickerView(pickedDate: $viewModel.choosenDate)
                        .presentationDetents([.medium])
                        .presentationCornerRadius(16)
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.appBackground)
        }
        .onAppear {
            viewModel.fetchFlights()
            viewModel.loadRoutes()
        }
    }
}

#Preview {
    SearchMainView()
}
