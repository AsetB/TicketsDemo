//
//  SearchInputView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 06.06.2024.
//

import SwiftUI

struct SearchInputView: View {
    
    @Binding var value: String
    
    var action: (() -> Void)?
    
    var placeholder: String
    
    var body: some View {
        Button(action: {
            action?()
        }, label: {
            Text(value.isEmpty ? placeholder : value)
                .foregroundStyle(value.isEmpty ? Color.searchPlaceholder : Color.searchText)
                .font(.addSFProDisplay(ofSize: 16, weight: .semibold))
            Spacer()
        })
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    struct Preview: View {
        @State var value: String = ""
        var body: some View {
            SearchInputView(value: $value, placeholder: "Куда - Турция")
        }
    }

    return Preview()
}
