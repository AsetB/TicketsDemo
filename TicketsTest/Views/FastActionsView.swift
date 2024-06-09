//
//  FastActionsView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 07.06.2024.
//

import SwiftUI

enum FastActions {
    static let complexRoute: String = "Сложный маршрут"
    static let anywhereRoute: String = "Куда угодно"
    static let weekend: String = "Выходные"
    static let hotSale: String = "Горячие билеты"
}

struct FastActionsView: View {
    
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            FastActionsItem(icon: .command, title: FastActions.complexRoute, accentColor: .green1)
            FastActionsItem(icon: .globe, title: FastActions.anywhereRoute, accentColor: .blue1)
            FastActionsItem(icon: .calendar, title: FastActions.weekend, accentColor: .darkBlue1)
            FastActionsItem(icon: .fire, title: FastActions.hotSale, accentColor: .red1)
        }
    }
}

struct FastActionsItem: View {
    var icon: ImageResource
    var title: String
    var accentColor: ColorResource
    
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Image(icon)
                    .foregroundColor(.white)
                    .padding(12)
            }
            .background(Color(accentColor))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(title)
                .foregroundStyle(Color.white)
                .font(.addSFProDisplay(ofSize: 14))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
//        .onTapGesture {
//            print("tapped")
//        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FastActionsView()
        .background(Color.outerGray3)
}
