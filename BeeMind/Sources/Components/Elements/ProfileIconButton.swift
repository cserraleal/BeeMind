//
//  ProfileIconButton.swift
//  BeeMind
//
//  Created by Cristobal Serra on 29/06/25.
//


import SwiftUI

/// A reusable icon button (top-right) that opens the user's profile or settings screen.
struct ProfileIconButton: View {
    
    // MARK: - Properties
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 26, height: 26)
                .foregroundColor(Color("ButtonPrimary"))
                .padding(10) // Touch-friendly
        }
        .background(Color.clear) // In case of future tap targets
        .contentShape(Rectangle()) // Ensures full tappable area
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        Color("Background")
            .ignoresSafeArea()
        HStack {
            Spacer()
            ProfileIconButton(action: { print("Profile tapped") })
        }
        .padding()
    }
}

