//
//  ScrollContainer.swift
//  BeeMind
//
//  Created by Cristobal Serra on 18/06/25.
//

import SwiftUI

/// A reusable vertical scroll container with padding and hidden scroll indicators.
/// Use inside `ScreenContainer` when the screen's content should scroll.
struct ScrollContainer<Content: View>: View {
    
    // MARK: - Properties
    
    /// The dynamic content to be displayed inside the scroll view
    let content: () -> Content
    
    // MARK: - Init
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                content()
            }
            .padding(.bottom, 20)
            .padding(.top, 10)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ScreenContainer {
        ScrollContainer {
            ForEach(0..<10) { index in
                Text("Scrollable Item \(index + 1)")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
            }
        }
    }
}
