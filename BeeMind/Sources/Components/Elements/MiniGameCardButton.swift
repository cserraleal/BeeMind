//
//  MiniGameCardButton.swift
//  BeeMind
//
//  Created by Cristobal Serra on 10/07/25.
//

import SwiftUI

/// A reusable card-style button for displaying a single mini-game option.
struct MiniGameCardButton: View {
    
    let model: MiniGameCardModel
    let animationDelay: Double
    @State private var flipped = false

    var body: some View {
        Button(action: model.action) {
            VStack(spacing: 10) {
                Image(systemName: model.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundColor(.white)
                
                Text(model.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 100)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(model.backgroundColor)
                    .shadow(color: model.backgroundColor.opacity(0.2), radius: 4, x: 0, y: 2)
            )
            .rotation3DEffect(
                .degrees(flipped ? 0 : 180),
                axis: (x: 0, y: 1, z: 0)
            )
            .opacity(flipped ? 1 : 0)
            .animation(.easeOut(duration: 0.5), value: flipped)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    flipped = true
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

