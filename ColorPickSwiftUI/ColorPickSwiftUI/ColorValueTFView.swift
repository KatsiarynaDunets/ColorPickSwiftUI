//
//  ColorValueTFView.swift
//  ColorPickSwiftUI
//
//  Created by Kate on 13/12/2023.
//

import SwiftUI

struct ColorValueTFView: View {
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        TextField("", text: $textValue) { _ in
            withAnimation {
                checkValue()
            }
        }
            .keyboardType(.decimalPad)
            .multilineTextAlignment(.trailing)
            .padding([.horizontal], 4)
            .frame(width: 50, height: 30)
            .background(Color.white)
            .cornerRadius(5)
            .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
                Text("Please enter value from 0 to 255")
            }
    }
    
    private func checkValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        textValue = "0"
    }
}

struct ColorValueTFView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorValueTFView(textValue: .constant("123"), value: .constant(123))
        }
    }
}
