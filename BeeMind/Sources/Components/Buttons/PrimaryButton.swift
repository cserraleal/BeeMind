//
//  PrimaryButton.swift
//  BeeMind
//
//  Created by Cristobal Serra on 2025-06-18.
//  A reusable primary action button used across the app (e.g., Start Meditation, Save Journal, etc.)
//

import SwiftUI

/// `PrimaryButton`
///
/// A reusable stylized button for main actions throughout the BeeMind app.
/// Automatically applies consistent colors, font, and padding.
/// Allows customization of title, background color, text color, and width behavior.
struct PrimaryButton: View {
    
    // MARK: - Public Properties
    
    /// The button title (visible label).
    let title: String
    
    /// Action to perform when the button is tapped.
    let action: () -> Void
    
    /// Optional background color (default: Primary Yellow from Assets).
    var backgroundColor: Color = Color("Primary")
    
    /// Optional text color (default: black).
    var textColor: Color = .black
    
    /// Whether the button should stretch to fill horizontal space.
    var isFullWidth: Bool = true
    
    // MARK: - View Body
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .padding(.vertical, 14)
                .padding(.horizontal, 24)
                .frame(maxWidth: isFullWidth ? .infinity : nil)
                .background(Color("Primary"))
                .foregroundColor(Color("ButtonPrimaryText"))
                .cornerRadius(12)
                .shadow(color: backgroundColor.opacity(0.3), radius: 4, x: 0, y: 2)
        }
        .padding(.horizontal, isFullWidth ? 16 : 0)
    }
}

// MARK: - Preview

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            PrimaryButton(
                title: "Start Meditation",
                action: { print("Meditation started") }
            )
            PrimaryButton(
                title: "Save Entry",
                action: { print("Journal saved") },
                backgroundColor: .blue,
                textColor: .white,
                isFullWidth: false
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
