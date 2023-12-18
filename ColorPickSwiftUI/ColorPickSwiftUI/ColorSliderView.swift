//
//  ColorSliderView.swift
//  ColorPickSwiftUI
//
//  Created by Kate on 13/12/2023.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    @State private var textValue = ""
    
    let tintColor: Color
    
    var body: some View {
        HStack {
            ColorValueTextView(colorValue: sliderValue)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(tintColor)
                .onChange(of: sliderValue) { isOnFocus in
                    textValue = String(lround(sliderValue))
                }
            
            ColorValueTFView(textValue: $textValue, value: $sliderValue)
        }
        .onAppear {
            textValue = String(lround(sliderValue))
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack { Color(.black)
            ColorSliderView(sliderValue: .constant(100), tintColor: .purple)
        }
    }
}
