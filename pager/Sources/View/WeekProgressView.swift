//
//  WeekProgressView.swift
//  pager
//
//  Created by Daniil Subbotin on 28.03.2021.
//

import SwiftUI

struct WeekProgressView: View {
    
    let progress: WeekProgressViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(progress.progressString)
                Spacer()
                Text(progress.debt)
            }
            .font(Font.footnote)
            .padding(.horizontal, 16)
            Rectangle()
                .fill(Color.progressBg)
                .overlay(
                    GeometryReader { proxy in
                        Color.progressFg
                            .frame(width: proxy.size.width * progress.progress)
                    }
                )
                .frame(height: 4)
        }
    }
}

struct WeekProgressView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeekProgressView(progress: .default)
                .previewLayout(.sizeThatFits)
            WeekProgressView(progress: .default)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .previewLayout(.sizeThatFits)
            WeekProgressView(progress: .default)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
