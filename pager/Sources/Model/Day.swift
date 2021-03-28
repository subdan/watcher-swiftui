//
//  Day.swift
//  pager
//
//  Created by Daniil Subbotin on 28.03.2021.
//

struct DayLoggedTimeViewModel {
    let monthDayName: String
    let weekdayName: String
    let totalTime: String
    
    static let `default` = DayLoggedTimeViewModel(monthDayName: "30.06", weekdayName: "Вторник", totalTime: "8 ч")
}
