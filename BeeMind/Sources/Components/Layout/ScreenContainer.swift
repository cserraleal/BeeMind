//
//  ScreenContainer.swift
//  BeeMind
//
//  Created by Cristobal Serra on 18/06/25.
//

import SwiftUI

/// A reusable container that wraps full-screen content,
/// applying safe area handling, consistent padding, and background color.
/// Use this as the outer wrapper for most screens in the app.
struct ScreenContainer<Content: View>: View {
    
    // MARK: - Properties
    
    /// Content passed into the container
    let content: () -> Content
    
    // MARK: - Init
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // Background color
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            // Main content with padding and safe area
            VStack {
                content()
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    ScreenContainer {
        VStack(alignment: .leading, spacing: 16) {
            Text("Hello from ScreenContainer")
                .font(.title)
                .foregroundColor(Color("TextPrimary"))
            Text("This content is wrapped in a consistent layout.")
                .font(.body)
                .foregroundColor(Color("TextPrimary"))
        }
    }
}
