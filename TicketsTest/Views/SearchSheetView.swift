//
//  SearchSheetView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 07.06.2024.
//

import SwiftUI

struct SearchSheetView: View {
    
    @StateObject var viewModel: SearchSheetViewModel = SearchSheetViewModel()
    //@State var from: String = "Минск"
    //@State var destination: String = ""
    
    @State var isFromSelected = false
    
    @State var showSearchMainView: Bool = false
    
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
                    DestinationsListView()
                        .padding(.horizontal, 16)
                } else {
                    FastActionsView()
                        .padding(.horizontal, 16)
                    DestinationsListView()
                        .padding(.horizontal, 16)
                }
                
//                NavigationLink(destination: SearchMainView(), isActive: $showSearchMainView) {
//                    EmptyView()
//                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.outerGray3)
            .fullScreenCover(isPresented: $showSearchMainView, content: {
                SearchMainView()
            })
//            .navigationDestination(isPresented: $showSearchMainView) {
//                SearchMainView()
//                    .navigationBarBackButtonHidden()
//            }
        }
        .onAppear {
            viewModel.loadRoutes()
        }
        
        
    }
    
    private func checkFields() {
        if !viewModel.from.isEmpty && !viewModel.destination.isEmpty {
            showSearchMainView = true
        }
    }
}

#Preview {
    SearchSheetView()
}
