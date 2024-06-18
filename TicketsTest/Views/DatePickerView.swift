//
//  DatePickerView.swift
//  TicketsTest
//
//  Created by Aset Bakirov on 18.06.2024.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var pickedDate: Date
    
    var body: some View {
        VStack {
            DatePicker("", selection: $pickedDate)
                .datePickerStyle(.graphical)
                .frame(maxHeight: 400)
        }
        .padding()
    }
}

//#Preview {
//    @State var date: Date = Date.now
//    DatePickerView(pickedDate: $date)
//}
