//
//  SliderValueTF.swift
//  ColorPickSwiftUI
//
//  Created by Kate on 18/12/2023.
//

import SwiftUI

struct SliderValueTF: View {
    @Binding var sliderValue: Double
    @State private var showAlert = false
    @State private var newValue = 0.0

    var body: some View {
        TextField("", text: textValue, onCommit: {
            sliderValue = newValue
        })
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Incorrect Format"),
                message: Text("Please, enter value from 0 to 255")
            )
        }
    }
}

extension SliderValueTF {
    var textValue: Binding<String> {
        Binding<String>(
            get: { "\(round(sliderValue))" },
            set: { if let number = NumberFormatter().number(from: $0) {
                let doubleValue = number.doubleValue
                if !(0 ... 255).contains(doubleValue) { newValue = 0
                    showAlert.toggle()
                    return
                }
                newValue = doubleValue
            }
            }
        )
    }
}

struct SlidetValueTF_Previews: PreviewProvider {
    static var previews: some View {
        SliderValueTF(sliderValue: .constant(120.0))
    }
}
