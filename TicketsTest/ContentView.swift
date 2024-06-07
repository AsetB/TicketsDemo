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
                    TabItemView(title: TabItems.avia, icon: .avia)
                }
            HotelsTabView()
                .tabItem {
                    TabItemView(title: TabItems.hotels, icon: .hotels)
                }
            ShorterTabView()
                .tabItem {
                    TabItemView(title: TabItems.shorter, icon: .koroche)
                }
            SubscriptionsTabView()
                .tabItem {
                    TabItemView(title: TabItems.subscriptions, icon: .subscriptions)
                }
            ProfileTabView()
                .tabItem {
                    TabItemView(title: TabItems.profile, icon: .profile)
                }
        }
        .tint(Color.tabItemActive)
    }
}

#Preview {
    ContentView()
}
