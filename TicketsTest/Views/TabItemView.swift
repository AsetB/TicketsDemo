//
//  TabItemView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 07.06.2024.
//

import SwiftUI

struct TabItemView: View {
    var title: String
    var icon: ImageResource
    
    
    var body: some View {
        VStack(spacing: 3) {
            Image(icon)
                .resizable()
                .scaledToFill()
                .frame(width: 24, height: 24)
            Text(title)
                .font(.addSFProDisplay(ofSize: 10))
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TabItemView(title: "Авиабилеты", icon: .avia)
}
