//
//  LoggedTimeViewModel.swift
//  pager
//
//  Created by Daniil Subbotin on 28.03.2021.
//

import Foundation

struct LoggedTimeViewModel: Identifiable {
    let id: String = UUID().uuidString
    let projectName: String
    let description: String
    let time: String
    
    static var `default` = LoggedTimeViewModel(projectName: "Проект", description: "Синк команды", time: "30 мин")
}

struct DaylyLoggedTimeViewModel: Identifiable {
    let id = UUID()
    let day: DayLoggedTimeViewModel
    let projectTimes = [
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default,
        LoggedTimeViewModel.default
    ]
}
