//
//  TabBarButton.swift
//  BeeMind
//
//  Created by Cristobal Serra on 29/06/25.
//

import SwiftUI

/// A reusable button for a single tab in the custom tab bar.
struct TabBarButton: View {
    
    // MARK: - Properties
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    var size: CGFloat = 30
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
                .foregroundColor(isSelected ? Color("TabBarSelected") : Color("TabBarUnselected"))
                .shadow(color: Color("Background"), radius: 4, x: 0, y: 2)
        }
    }
}

