//
//  ContentView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 04.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TicketsTabView()
                .tabItem {
                    Label("Авиабилеты", image: .avia)
                        .font(.addSFProDisplay(ofSize: 10))
                }
            HotelsTabView()
                .tabItem {
                    Label("Отели", image: .hotels)
                        .font(.addSFProDisplay(ofSize: 10))
                }
            ShorterTabView()
                .tabItem {
                    Label("Короче", image: .koroche)
                        .font(.addSFProDisplay(ofSize: 10))
                }
            SubscriptionsTabView()
                .tabItem {
                    Label("Подписки", image: .subscriptions)
                        .font(.addSFProDisplay(ofSize: 10))
                }
            ProfileTabView()
                .tabItem {
                    Label("Профиль", image: .profile)
                        .font(.addSFProDisplay(ofSize: 10))
                }
        }
        .tint(Color.tabItemActive)
    }
}

#Preview {
    ContentView()
}
