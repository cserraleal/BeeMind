//
//  ProfileView.swift
//  BeeMind
//
//  Created by Cristobal Serra on 29/06/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScreenContainer {
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color("TextPrimary"))
        }
    }
}

#Preview {
    ProfileView()
}

