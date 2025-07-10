//
//  ExerciseCardButton.swift
//  BeeMind
//
//  Created by Cristobal Serra on 10/07/25.
//

import SwiftUI

/// A stylized card-like button for launching exercises.
struct ExerciseCardButton: View {
    
    let model: ExerciseCardModel
    let animationDelay: Double
    @State private var flipped = false
    @State private var isPressed = false

    var body: some View {
        Button(action: {
            model.action()
        }) {
            HStack(spacing: 12) {
                Image(systemName: model.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundColor(.white)
                    .padding(.leading, 8)
                
                Text(model.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(model.backgroundColor)
                    .shadow(color: model.backgroundColor.opacity(0.25), radius: 4, x: 0, y: 2)
            )
            .scaleEffect(isPressed ? 0.96 : 1.0)
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
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
        .padding(.horizontal, 4)
    }
}


// MARK: - Preview
#Preview {
    VStack(spacing: 20) {
        ExerciseCardButton(
            model: .init(
                title: "Start Breathing",
                iconName: "wind",
                backgroundColor: Color.blue,
                action: { print("Breathing") }
            ),
            animationDelay: 0.0
        )
        ExerciseCardButton(
            model: .init(
                title: "Guided Meditation",
                iconName: "brain.head.profile",
                backgroundColor: Color.green,
                action: { print("Meditation") }
            ),
            animationDelay: 0.3
        )
    }
    .padding()
    .background(Color("Background"))
}

