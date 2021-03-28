//
//  LogTimeButton.swift
//  pager
//
//  Created by Daniil Subbotin on 28.03.2021.
//

import SwiftUI

struct LogTimeButtonStyle: ButtonStyle {
    
    private let height: CGFloat = 56
    
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 4, style: .continuous)
            .fill(configuration.isPressed ? Color.tint.opacity(0.7) : Color.tint)
            .frame(height: height)
            .overlay(
                Image.plus
                    .foregroundColor(.white)
            )
    }
}

struct LogTimeButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button(action: {}, label: {})
                .buttonStyle(LogTimeButtonStyle())
                .previewLayout(.fixed(width: 300, height: 56))
        }
    }
}
