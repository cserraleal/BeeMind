//
//  MoodSelector.swift
//  BeeMind
//
//  Created by Cristobal Serra on 18/06/25.

import SwiftUI

/// A reusable horizontal mood selector using SF Symbols.
/// Icons are colored from red to green and styled consistently.
struct MoodSelector: View {
    
    // SF Symbols representing moods (angry → sad → neutral → calm → happy)
    private let moods: [ (name: String, symbol: String, color: Color)] = [
        ("sad", "face.smiling", Color.red),     // sad
        ("angry", "face.dashed.fill", Color.orange),            // angry
        ("frustrated", "face.dashed.fill", Color.yellow),// frustrated
        ("calm", "face.dashed.fill", Color.green.opacity(0.8)),     // calm
        ("happy", "face.smiling", Color.green),     // calm
    ]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(moods, id: \.name) { mood in
                Image(systemName: mood.symbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(mood.color)
                    .padding(10)
                    .cornerRadius(12)
                    .shadow(color: mood.color.opacity(0.1), radius: 2, x: 0, y: 1)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    MoodSelector()
        .preferredColorScheme(.dark)
        .padding()
        .background(Color("Background"))
}
