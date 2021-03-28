//
//  LoggedTimeView.swift
//  pager
//
//  Created by Daniil Subbotin on 29.03.2021.
//

import SwiftUI

struct LoggedTimeView: View {
    
    @State private var hour: Int = 8
    @State private var description: String = "Описание рабочих задач"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Часы")
                .padding()
            
            GeometryReader { proxy in
                HStack(spacing: 0) {
                    Picker("Часы", selection: $hour) {
                        ForEach(0..<9) { hour in
                            Text(String(hour))
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: proxy.size.width / 2)
                    .clipped()
                    Picker("Часы", selection: $hour) {
                        ForEach(0..<30) { hour in
                            Text(String(hour))
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: proxy.size.width / 2)
                    .clipped()
                }
            }
            
            Text("Описание")
                .padding()
            
            TextEditor(text: $description)
                .border(Color.red)
                .padding()
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Добавить")
            })
            .buttonStyle(LogTimeButtonStyle())
            .padding()
        }
        .navigationBarItems(leading: Button(action: {}, label: {
            Image(systemName: "xmark")
        }))
        .navigationTitle("Alpina Digital")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LoggedTimeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoggedTimeView()
        }
    }
}
