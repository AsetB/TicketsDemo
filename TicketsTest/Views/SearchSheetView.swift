//
//  SearchSheetView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 07.06.2024.
//

import SwiftUI

struct SearchSheetView: View {
    
    @StateObject var viewModel: SearchSheetViewModel = SearchSheetViewModel()
    
    @State var isFromSelected = false
    @State var isSearchMainViewPresented: Bool = false
    @State var isPlugPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 26) {
                RoundedRectangle(cornerRadius: 5)
                           .frame(width: 38, height: 5)
                           .foregroundColor(Color.greySecondaryTitle)
                           .padding(.top, 16)
                
                VStack(alignment: .leading ,spacing: 8) {
                    HStack(alignment: .center, spacing: 8) {
                        Image(.planeSearch)
                            .foregroundColor(Color.searchDivider)
                        TextField("", text: $viewModel.from, prompt: Text("Откуда - Минск")
                            .foregroundStyle(Color.searchPlaceholder)
                            .font(.addSFProDisplay(ofSize: 16, weight: .semibold)))
                        .foregroundStyle(Color.searchText)
                        .onTapGesture {
                            isFromSelected = true
                        }
                        .onSubmit {
                            checkFields()
                        }
                    }
                    
                    Divider()
                        .background(Color.searchDivider)
                    
                    HStack(alignment: .center, spacing: 8) {
                        Image(.search)
                            .foregroundColor(Color.searchDivider)
                        TextField("", text: $viewModel.destination, prompt: Text("Куда - Турция")
                            .foregroundStyle(Color.searchPlaceholder)
                            .font(.addSFProDisplay(ofSize: 16, weight: .semibold)))
                        .foregroundStyle(Color.searchText)
                        .onTapGesture {
                            isFromSelected = false
                        }
                        .onSubmit {
                            checkFields()
                        }
                        Image(.cross)
                            .foregroundStyle(.white)
                            .onTapGesture {
                                viewModel.destination = ""
                            }
                        
                    }
                }
                .padding(16)
                .background(Color.outerGray1)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.33),
                        radius: 3, x: 0, y: 5)
                .padding(.horizontal, 16)
                
                //TODO: КЛИКАБЕЛЬНЫЕ элементы
                if isFromSelected {
                    VStack {
                        DestinationsListItem(destinationCity: Destinations.istanbul, image: .istanbul)
                            .onTapGesture {
                                viewModel.destination = Destinations.istanbul
                            }
                        DestinationsListItem(destinationCity: Destinations.sochi, image: .sochi)
                            .onTapGesture {
                                viewModel.destination = Destinations.sochi
                            }
                        DestinationsListItem(destinationCity: Destinations.phuket, image: .phuket)
                            .onTapGesture {
                                viewModel.destination = Destinations.phuket
                            }
                    }
                    .padding(16)
                    .background(Color.outerGray1)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 16)
                } else {
                    HStack(alignment: .top, spacing: 16) {
                        FastActionsItem(icon: .command, title: FastActions.complexRoute, accentColor: .green1)
                            .onTapGesture {
                                isPlugPresented = true
                            }
                        FastActionsItem(icon: .globe, title: FastActions.anywhereRoute, accentColor: .blue1)
                            .onTapGesture {
                                viewModel.destination = FastActions.anywhereRoute
                            }
                        FastActionsItem(icon: .calendar, title: FastActions.weekend, accentColor: .darkBlue1)
                            .onTapGesture {
                                isPlugPresented = true
                            }
                        FastActionsItem(icon: .fire, title: FastActions.hotSale, accentColor: .red1)
                            .onTapGesture {
                                isPlugPresented = true
                            }
                    }
                    .padding(.horizontal, 16)
                    .navigationDestination(isPresented: $isPlugPresented) {
                        PlugView()
                    }
                    VStack {
                        DestinationsListItem(destinationCity: Destinations.istanbul, image: .istanbul)
                            .onTapGesture {
                                viewModel.destination = Destinations.istanbul
                            }
                        DestinationsListItem(destinationCity: Destinations.sochi, image: .sochi)
                            .onTapGesture {
                                viewModel.destination = Destinations.sochi
                            }
                        DestinationsListItem(destinationCity: Destinations.phuket, image: .phuket)
                            .onTapGesture {
                                viewModel.destination = Destinations.phuket
                            }
                    }
                    .padding(16)
                    .background(Color.outerGray1)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 16)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.outerGray3)
            .fullScreenCover(isPresented: $viewModel.isSearchMainViewPresented, content: {
                SearchMainView()
            })
        }
        .onAppear {
            viewModel.loadRoutes()
        }
        
        
    }
    
    private func checkFields() {
        if !viewModel.from.isEmpty && !viewModel.destination.isEmpty {
            viewModel.isSearchMainViewPresented = true
        }
    }
}

#Preview {
    SearchSheetView()
}
