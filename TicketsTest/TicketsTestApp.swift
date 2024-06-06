//
//  TicketsTestApp.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 04.06.2024.
//

import SwiftUI

@main
struct TicketsTestApp: App {
    init() {
        setTabbar()
    }
    
    func setTabbar() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.tabItem
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
