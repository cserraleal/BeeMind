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
    @State private var showProfile = false
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // Main screen content
            selectedTab.item.view
                .padding(.bottom, 60)
            
            // ✅ Insert this block right HERE
            VStack {
                HStack {
                    Spacer()
                    ProfileIconButton(action: {
                        showProfile = true
                    })
                }
                .padding(.horizontal, 16)
                .padding(.top, 20)
                
                Spacer()
            }
            
            // Bottom custom tab bar
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
            .background(Color("Background"))
            .ignoresSafeArea(edges: .bottom)
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: -2)
        }
        .sheet(isPresented: $showProfile) {
            ProfileView()
        }

    }
}

// MARK: - Preview
struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomTabBarView()
                .preferredColorScheme(.light)
            CustomTabBarView()
                .preferredColorScheme(.dark)
        }
    }
}
