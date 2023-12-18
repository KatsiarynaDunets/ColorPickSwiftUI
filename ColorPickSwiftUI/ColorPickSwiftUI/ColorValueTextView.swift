//
//  ColorValueTextView.swift
//  ColorPickSwiftUI
//
//  Created by Kate on 13/12/2023.
//

import SwiftUI

struct ColorValueTextView: View {
    
    let colorValue: Double
    
    var body: some View {
        Text("\(lround(colorValue))")
            .foregroundColor(.white)
            .frame(width: 32)
    }
}

struct ColorValueTextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            ColorValueTextView(colorValue: 12)
        }
    }
}
