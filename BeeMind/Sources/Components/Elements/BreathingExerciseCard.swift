//
//  BreathingExerciseCard.swift
//  BeeMind
//
//  Created by Cristobal Serra on 10/07/25.
//

import SwiftUI

/// A reusable card for listing a breathing exercise option with flip-in animation.
struct BreathingExerciseCard: View {
    
    let model: BreathingExerciseModel
    var animationDelay: Double = 0
    @State private var flipped = false

    var body: some View {
        Button(action: model.action) {
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: model.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color("ButtonPrimary"))
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4) {
                    Text(model.title)
                        .font(.headline)
                        .foregroundColor(Color("TextPrimary"))
                    Text(model.description)
                        .font(.subheadline)
                        .foregroundColor(Color("TextSecondary"))
                }

                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("CardBackground"))
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
            )
            .rotation3DEffect(
                .degrees(flipped ? 0 : 180),
                axis: (x: 1, y: 0, z: 0)
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


// MARK: - Preview
#Preview {
    VStack(spacing: 20) {
        BreathingExerciseCard(
            model: BreathingExerciseModel(
                title: "Box Breathing",
                description: "Breathe in, hold, out, hold evenly",
                iconName: "square.grid.3x3",
                action: { print("Box Breathing") }
            ),
            animationDelay: 0.0
        )
    }
    .padding()
    .background(Color("Background"))
}

