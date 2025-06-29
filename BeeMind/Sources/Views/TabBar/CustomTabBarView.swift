//
//  CustomTabBarView.swift
//  BeeMind
//
//  Created by Cristobal Serra on 29/06/25.
//

import SwiftUI

/// A fully custom tab bar view with full screen layout and safe area handling.
struct CustomTabBarView: View {
    
    // MARK: - State
    @State private var selectedTab: TabRoute = .home
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // Main screen content
            selectedTab.item.view
                .padding(.bottom, 60)
                 // Allow content to flow to top under notch if needed
            
            // Custom Tab Bar
            HStack {
                ForEach(TabRoute.allCases, id: \.self) { route in
                        Spacer()
                        TabBarButton(
                            icon: route.item.icon,
                            isSelected: selectedTab == route,
                            action: {
                                selectedTab = route
                            }
                        )
                        Spacer()
                    }
            }
            .frame(height: 60)
            //.padding(.bottom, 5) // Optional: buffer from gesture bar
            .background(Color("Background"))
            .ignoresSafeArea(edges: .bottom)
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: -2)
        }
    }
}

// MARK: - Preview
#Preview {
    CustomTabBarView()
        .preferredColorScheme(.light)
}

