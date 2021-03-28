//
//  WeekChooserView.swift
//  pager
//
//  Created by Daniil Subbotin on 28.03.2021.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner, fillColor: Color) -> some View {
        background(
            ZStack {
                RoundedCorner(radius: radius, corners: corners)
                    .fill(fillColor)
                RoundedCorner(radius: radius, corners: corners)
                    .stroke(Color.separator, lineWidth: 1)
            }
        )
    }
}

struct BorderedButtonStyle: ButtonStyle {
    
    enum Position {
        case left
        case middle
        case right
        case single
    }
    
    let position: Position
    
    private var corners: UIRectCorner {
        switch position {
        case .left:
            return [.bottomLeft, .topLeft]
        case .right:
            return [.bottomRight, .topRight]
        case .single:
            return [.allCorners]
        case .middle:
            return []
        }
    }
    
    private var horizontalPadding: CGFloat {
        switch position {
        case .single:
            return 14
        default:
            return 10
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, horizontalPadding)
            .frame(height: 40)
            .frame(maxWidth: maxWidth)
            .background(
                Rectangle()
                    .fill(Color.clear)
                    .cornerRadius(4, corners: corners, fillColor: configuration.isPressed ? .progressBg : Color(.systemBackground))
            )
    }
    
    var maxWidth: CGFloat? {
        switch position {
        case .middle:
            return .infinity
        default:
            return nil
        }
    }
}

struct WeekChooserView: View {
    
    let todayHandler: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: 0) {
                Button(action: {}, label: {
                    Image.arrow.rotationEffect(.degrees(180), anchor: .center)
                })
                .buttonStyle(BorderedButtonStyle(position: .left))
                
                Button(action: {}, label: {
                    Text("22.11–29.11")
                })
                .buttonStyle(BorderedButtonStyle(position: .middle))
                
                Button(action: {}, label: {
                    Image.arrow
                })
                .buttonStyle(BorderedButtonStyle(position: .right))
            }
            Button(action: todayHandler, label: {
                Text("Сегодня")
            })
            .buttonStyle(BorderedButtonStyle(position: .single))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}

struct WeekChooserView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeekChooserView(todayHandler: {})
            WeekChooserView(todayHandler: {})
                .preferredColorScheme(.dark)
            WeekChooserView(todayHandler: {})
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
//        .previewLayout(.sizeThatFits)
    }
}
