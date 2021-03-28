//
//  DayView.swift
//  pager
//
//  Created by Daniil Subbotin on 28.03.2021.
//

import SwiftUI

struct DayView: View {
    let day: DayLoggedTimeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(day.monthDayName)
            HStack {
                Text(day.weekdayName)
                Spacer()
                Text(day.totalTime)
            }
        }
        .lineLimit(1)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DayView(day: .default)
                .previewLayout(.sizeThatFits)
            DayView(day: .default)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
