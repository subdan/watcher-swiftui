//
//  ContentView.swift
//  pager
//
//  Created by Daniil Subbotin on 26.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentPage = 0
    @State private var presentNewLoggedTime = false
    
    private let days = [
        DaylyLoggedTimeViewModel(day: DayLoggedTimeViewModel(monthDayName: "29 марта", weekdayName: "Понедельник", totalTime: "8 ч")),
        DaylyLoggedTimeViewModel(day: DayLoggedTimeViewModel(monthDayName: "30 марта", weekdayName: "Вторник", totalTime: "8 ч")),
        DaylyLoggedTimeViewModel(day: DayLoggedTimeViewModel(monthDayName: "31 марта", weekdayName: "Среда", totalTime: "8 ч")),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            WeekChooserView(todayHandler: {
                withAnimation {
                    currentPage = 1
                }
            })
            WeekProgressView(progress: .default)
            Spacer(minLength: 12)
            PagerView(pageCount: days.count, currentIndex: $currentPage) {
                ForEach(days) { dayData in
                    VStack(spacing: 0) {
                        DayView(day: dayData.day)
                        Spacer(minLength: 16)
                        Button(action: {
                            presentNewLoggedTime = true
                        }, label: {})
                        .buttonStyle(LogTimeButtonStyle())
                        ScrollView {
                            VStack {
                                Color.clear
                                    .padding(.top, -8)
                                ForEach(dayData.projectTimes) {
                                    ProjectTimeView(time: $0)
                                }
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $presentNewLoggedTime, content: {
                NavigationView {
                    LoggedTimeView()
                }
            })
            .ignoresSafeArea()
            .navigationTitle("Учет времени")
            .navigationBarItems(
                trailing: HStack(spacing: 8) {
                    Button(action: {}, label: {
                        Image(systemName: "person")
                    })
                    .frame(width: 34, height: 44, alignment: .trailing)
                    Button(action: {}, label: {
                        Image(systemName: "calendar")
                    })
                    .frame(width: 34, height: 44, alignment: .trailing)
                }.imageScale(.large)
//                .foregroundColor(Color.tint)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
        NavigationView {
            ContentView()
        }.environment(\.sizeCategory, .extraExtraExtraLarge)
        NavigationView {
            ContentView()
        }.environment(\.colorScheme, .dark)
    }
}
