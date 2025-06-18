//
//  ScreenTitle.swift
//  BeeMind
//
//  Created by Cristobal Serra on 18/06/25.
//

import SwiftUI

/// A reusable screen-level title view that displays a main heading
/// and an optional subtitle beneath it. Used on top of primary screens.
struct ScreenTitle: View {
    
    // MARK: - Properties
    
    /// Main screen title (required)
    let title: String
    
    /// Optional subtitle (e.g., motivational message, greeting)
    let subtitle: String?
    
    /// Optional vertical spacing between title and subtitle
    var spacing: CGFloat = 4.0
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("TextPrimary"))
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(Color("TextSecondary"))
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Preview
struct ScreenTitle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScreenTitle(title: "Good evening, Cristóbal", subtitle: "Let’s keep your mind clear today")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            ScreenTitle(title: "Welcome back", subtitle: nil)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        .padding()
    }
}
