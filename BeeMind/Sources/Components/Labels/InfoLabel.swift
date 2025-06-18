//
//  InfoLabel.swift
//  BeeMind
//
//  Created by Cristobal Serra on 18/06/25.
//

import SwiftUI

/// A small, rounded label used to show metadata such as duration, level, or status.
struct InfoLabel: View {
    
    // MARK: - Properties
    
    /// Text to display inside the label (e.g., "5 min")
    let text: String
    
    /// Optional SF Symbol name for an icon (e.g., "clock")
    let iconName: String?
    
    /// Background color for the capsule
    var backgroundColor: Color = Color("AccentBackground")
    
    /// Text color
    var textColor: Color = Color("TextPrimary")
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 4) {
            if let iconName = iconName {
                Image(systemName: iconName)
                    .font(.caption)
                    .foregroundColor(Color("IconPrimary")) // <-- Use icon color here
            }
            Text(text)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(textColor) // <-- Keep textColor configurable
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
        .background(
            Capsule()
                .fill(backgroundColor)
        )
    }
}

// MARK: - Preview

struct InfoLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack(alignment: .leading, spacing: 8) {
                InfoLabel(text: "5 min", iconName: "clock")
                InfoLabel(text: "Beginner", iconName: "person.fill")
                InfoLabel(text: "Completed", iconName: "checkmark.circle.fill")
                InfoLabel(text: "7 entries", iconName: nil)
            }
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
            
            VStack(alignment: .leading, spacing: 8) {
                InfoLabel(text: "5 min", iconName: "clock")
                InfoLabel(text: "Beginner", iconName: "person.fill")
                InfoLabel(text: "Completed", iconName: "checkmark.circle.fill")
                InfoLabel(text: "7 entries", iconName: nil)
            }
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        }
    }
}
