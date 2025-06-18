//
//  StatCard.swift
//  BeeMind
//
//  Created by Cristobal Serra on 18/06/25.
//

import SwiftUI

/// A reusable card-style component to display a key statistic.
/// Useful for visualizing progress like meditation streaks, journal entries, etc.
struct StatCard: View {
    
    // MARK: - Properties
    
    /// SF Symbol icon name
    let iconName: String
    
    /// Title of the statistic (e.g., "Meditation")
    let title: String
    
    /// Value to highlight (e.g., "7 Days")
    let value: String
    
    /// Optional background color (defaults to white/light gray)
    var backgroundColor: Color = Color("CardBackground")
    
    // MARK: - View Body
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            
            // Icon section
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)
                .foregroundColor(Color("IconPrimary"))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(Color("CardPrimaryText"))
                
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color("CardPrimaryText"))
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(backgroundColor)
                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
        .fixedSize()
    }
}

// MARK: - Preview
struct StatCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatCard(iconName: "flame.fill", title: "Streak", value: "7 Days")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            StatCard(iconName: "flame.fill", title: "Streak", value: "7 Days")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

