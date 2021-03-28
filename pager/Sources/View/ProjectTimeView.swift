//
//  ProjectTimeView.swift
//  pager
//
//  Created by Daniil Subbotin on 28.03.2021.
//

import SwiftUI

struct ProjectTimeView: View {
    
    let time: LoggedTimeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(time.projectName)
                Spacer()
                Text(time.time)
            }
            Text(time.description)
                .foregroundColor(.gray)
        }
        .lineLimit(1)
        .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .strokeBorder(Color.separator)
        )
    }
}

struct ProjectTimeCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProjectTimeView(time: LoggedTimeViewModel.default)
                .previewLayout(.sizeThatFits)
            ProjectTimeView(time: LoggedTimeViewModel(projectName: "Очень длинное название проекта", description: "Очень длинное описание проекта занимающее несколько строчек", time: "7 ч 30 мин"))
                .previewLayout(.sizeThatFits)
            ProjectTimeView(time: LoggedTimeViewModel(projectName: "Очень длинное название проекта", description: "Очень длинное описание проекта занимающее несколько строчек", time: "7 ч 30 мин"))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            ProjectTimeView(time: LoggedTimeViewModel(projectName: "Очень длинное название проекта", description: "Очень длинное описание проекта занимающее несколько строчек", time: "7 ч 30 мин"))
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
