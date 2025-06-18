//
//  SectionHeader.swift
//  BeeMind
//
//  Created by Cristobal Serra on 18/06/25.
//

import SwiftUI

/// A reusable label used to title a section within a screen.
/// Optionally includes a subtitle for context.
struct SectionHeader: View {
    
    // MARK: - Properties
    
    /// Main section title (required)
    let title: String
    
    /// Optional section subtitle (e.g., instructions or context)
    let subtitle: String?
    
    /// Vertical spacing between title and subtitle
    var spacing: CGFloat = 2.0
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("TextPrimary"))
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.footnote)
                    .foregroundColor(Color("TextSecondary"))
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Preview
struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SectionHeader(
                title: "Today’s Progress",
                subtitle: "Your mindfulness streak and stats"
            )
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
            
            SectionHeader(
                title: "Meditation",
                subtitle: "Ready to reach a new state of mind?"
            )
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        }
        .padding()
    }
}

