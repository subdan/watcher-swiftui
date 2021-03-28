//
//  PagerView.swift
//
//  Originally Created by Majid Jabrayilov on 12/5/19.
//  Modified by Will Alexander on 10/3/2021
//  Modified by Daniil Subbotin on 29/3/2021
//  Copyright © 2019 Majid Jabrayilov. All rights reserved.
//  Copyright © 2020 appstrm. All rights reserved.
//  Copyright © 2021 Daniil Subbotin. All rights reserved.
//
import SwiftUI

class PagerViewModel: ObservableObject {
    
    var dragOffset: CGFloat?
    
    @Published var lastDrag: CGFloat = 0.0
    @Binding var currentIndex: Int
    
    init(currentIndex: Binding<Int>) {
        self._currentIndex = currentIndex
    }
}

struct PagerView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content
    
    @ObservedObject var viewModel: PagerViewModel
    
    private let spacing: CGFloat = 10
    private let minDragDistance: CGFloat = 10
    
    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
        
        viewModel = PagerViewModel(currentIndex: currentIndex)
    }
    
    var body: some View {
        GeometryReader { geometry in
            LazyHStack(spacing: spacing) {
                content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: (-CGFloat(viewModel.currentIndex) * (geometry.size.width + spacing)) + viewModel.lastDrag)
            .gesture(
                DragGesture(minimumDistance: minDragDistance, coordinateSpace: .global)
                .onChanged { value in
                    guard abs(value.translation.width) >= abs(value.translation.height) else { return }
                    if viewModel.dragOffset == nil {
                        viewModel.dragOffset = value.translation.width
                    }
                    viewModel.lastDrag = value.translation.width - (viewModel.dragOffset ?? 0)
                }
                .onEnded { value in
                    let offset = value.predictedEndTranslation.width / geometry.size.width
                    let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                    let newIndexBound = min(max(Int(newIndex), 0), self.pageCount - 1)
                    let indexToChangeTo = min(max(newIndexBound, currentIndex - 1), currentIndex + 1)
                    
                    if indexToChangeTo != viewModel.currentIndex {
                        withAnimation(.easeOutCubic) { viewModel.currentIndex = indexToChangeTo }
                    } else {
                        withAnimation(.easeOutCubic) { viewModel.lastDrag = 0 }
                    }
                    viewModel.dragOffset = nil
                }
            )
        }
        .padding()
    }
}

extension Animation {
    static var easeOutCubic: Animation {
        Animation.timingCurve(0.33, 1, 0.68, 1, duration: 0.35)
    }
}
