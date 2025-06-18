//
//  SectionCard.swift
//  BeeMind
//
//  Created by Cristobal Serra on 2025-06-18.
//  A reusable card container with consistent background, padding, and rounded style
//

import SwiftUI

/// A reusable card container view with optional title and customizable content.
struct SectionCard<Content: View>: View {
    let title: String?
    let content: Content
    
    // MARK: - Init
    init(title: String? = nil, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    // MARK: - View Body
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let title = title {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            
            content
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
        .padding(.horizontal)
    }
}

// MARK: - Preview
struct SectionCard_Previews: PreviewProvider {
    static var previews: some View {
        SectionCard(title: "Meditation") {
            HStack {
                Image(systemName: "figure.mind.and.body")
                    .foregroundColor(.accentColor)
                    .imageScale(.large)
                Text("Take a moment to breathe.")
            }
        }
        .previewLayout(.sizeThatFits)
        .background(Color(UIColor.systemGroupedBackground))
    }
}
