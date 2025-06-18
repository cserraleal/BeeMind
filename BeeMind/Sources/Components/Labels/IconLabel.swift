//
//  IconLabel.swift
//  BeeMind
//
//  Created by Cristobal Serra on 18/06/25.
//

import SwiftUI

/// A reusable component that displays an SF Symbol icon next to a text label.
/// Designed for use in lists, buttons, or feature highlights.
struct IconLabel: View {
    
    // MARK: - Properties
    
    /// The SF Symbol name (e.g., "leaf.fill", "heart", etc.)
    let iconName: String
    
    /// The text label to display next to the icon
    let label: String
    
    /// The font size for the icon and label (optional, defaults to title3)
    var font: Font = .title3
    
    // MARK: - View Body
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(Color("IconPrimary"))
            
            Text(label)
                .font(font)
                .foregroundColor(Color("TextPrimary"))
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Preview
struct IconLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IconLabel(iconName: "heart.fill", label: "Mindfulness")
                .previewLayout(.sizeThatFits)
                .padding()
                

        }
        
    }
}
