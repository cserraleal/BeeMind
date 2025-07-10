//
//  BreathingMenuView.swift
//  BeeMind
//
//  Created by Cristobal Serra on 10/07/25.
//

import SwiftUI

/// A slide-up menu listing available breathing techniques.
struct BreathingMenuView: View {
    
    // MARK: - Breathing Options
    private var breathingOptions: [BreathingExerciseModel] = [
        BreathingExerciseModel(
            title: "Box Breathing",
            description: "Breathe in, hold, out, hold evenly",
            iconName: "square.grid.3x3",
            action: { print("Box Breathing selected") }
        ),
        BreathingExerciseModel(
            title: "4-7-8 Breathing",
            description: "Inhale 4s, hold 7s, exhale 8s",
            iconName: "waveform.path.ecg",
            action: { print("4-7-8 Breathing selected") }
        ),
        BreathingExerciseModel(
            title: "Equal Breathing",
            description: "Same duration for inhale and exhale",
            iconName: "equal.circle.fill",
            action: { print("Equal Breathing selected") }
        ),
        BreathingExerciseModel(
            title: "Relaxed Rhythm",
            description: "Gentle, natural rhythm for calm",
            iconName: "circle.dashed",
            action: { print("Relaxed Rhythm selected") }
        )
    ]
    
    // MARK: - Body
    var body: some View {
        ScreenContainer {
            ScrollContainer {
                
                // Title
                ScreenTitle(
                    title: "Breathing Techniques",
                    subtitle: "Choose your rhythm"
                )
                
                // Section Header
                SectionHeader(
                    title: "Available Exercises",
                    subtitle: nil
                )
                .padding(.top, 20)
                
                VStack(spacing: 12) {
                    ForEach(Array(breathingOptions.enumerated()), id: \.1.id) { index, option in
                            BreathingExerciseCard(
                                model: option,
                                animationDelay: Double(index) * 0.3 // staggered flip-in
                            )
                    }
                }
                .padding(.top, 6)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    BreathingMenuView()
}
