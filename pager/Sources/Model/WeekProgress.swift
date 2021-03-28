//
//  WeekProgress.swift
//  pager
//
//  Created by Daniil Subbotin on 28.03.2021.
//

import UIKit

struct WeekProgressViewModel {
    let progressString: String
    let debt: String
    let progress: CGFloat
    
    static let `default` = WeekProgressViewModel(progressString: "24 / 40 на этой неделе", debt: "Задолженность 28 ч ", progress: 0.6)
}
