//
//  SectionCard.swift
//  BeeMind
//
//  Created by Cristobal Serra on 2025-06-18.
//

import SwiftUI

/// A reusable card container view with optional title and customizable content.
/// The background color can be enabled/disabled or customized.
struct SectionCard<Content: View>: View {
    
    // MARK: - Properties
    
    let title: String?
    let useBackground: Bool
    let backgroundColor: Color
    let content: Content
    
    // MARK: - Init
    
    /// Initializes a SectionCard with optional title and background settings.
    ///
    /// - Parameters:
    ///   - title: Optional title displayed at the top
    ///   - useBackground: Whether to show the card background (default: true)
    ///   - backgroundColor: The background color to use (default: Color("CardBackground"))
    ///   - content: Custom SwiftUI content inside the card
    init(
        title: String? = nil,
        useBackground: Bool = true,
        backgroundColor: Color = Color("CardBackground"),
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.useBackground = useBackground
        self.backgroundColor = backgroundColor
        self.content = content()
    }
    
    // MARK: - View Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            if let title = title {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color("CardPrimaryText"))
            }
            
            content
        }
        .padding()
        .background(
            Group {
                if useBackground {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(backgroundColor)
                        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                } else {
                    Color.clear
                }
            }
        )
    }
}

// MARK: - Preview

struct SectionCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // With background
            SectionCard(title: "With Background") {
                Text("This card uses default background")
            }
            
            // Without background
            SectionCard(title: "No Background", useBackground: false) {
                Text("This card has no background")
            }
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
        .previewLayout(.sizeThatFits)
    }
}

