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
            ProgressView(value: progress.progress, total: 1)
                .progressViewStyle(MyProgressViewStyle())
        }
    }
}

struct MyProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color.progressBg)
            Rectangle()
                .fill(Color.progressFg)
                .scaleEffect(
                    x: CGFloat(configuration.fractionCompleted!),
                    anchor: .leading)
        }
        .frame(height: 4)
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
