//
//  HiveView.swift
//  BeeMind
//
//  Created by Cristobal Serra on 29/06/25.
//

import SwiftUI

/// HiveView shows interactive mental wellness exercises and games.
struct HiveView: View {
    
    // MARK: - State
    @State private var showBreathingMenu = false

    // MARK: - Exercise Models
    private var exerciseButtons: [ExerciseCardModel] {
        [
            ExerciseCardModel(
                title: "Start Breathing",
                iconName: "wind",
                backgroundColor: Color.blue,
                action: { showBreathingMenu = true } // ✅ Updated
            ),
            ExerciseCardModel(
                title: "Guided Meditation",
                iconName: "brain.head.profile",
                backgroundColor: Color.green,
                action: { print("Guided Meditation tapped") }
            ),
            ExerciseCardModel(
                title: "Stretching",
                iconName: "figure.walk",
                backgroundColor: Color.purple,
                action: { print("Stretching tapped") }
            )
        ]
    }

    // MARK: - MiniGame Models
    private var miniGames: [MiniGameCardModel] = [
        MiniGameCardModel(
            title: "Focus Tapper",
            iconName: "gamecontroller.fill",
            backgroundColor: Color.orange,
            action: { print("Focus Tapper") }
        ),
        MiniGameCardModel(
            title: "Breathe & Match",
            iconName: "puzzlepiece.extension",
            backgroundColor: Color.pink,
            action: { print("Breathe & Match") }
        ),
        MiniGameCardModel(
            title: "Visual Memory Grid",
            iconName: "circle.grid.cross",
            backgroundColor: Color.indigo,
            action: { print("Memory Grid") }
        ),
        MiniGameCardModel(
            title: "Zen Dots",
            iconName: "sparkles",
            backgroundColor: Color.yellow,
            action: { print("Zen Dots") }
        )
    ]
    
    // MARK: - Grid Layout
    private let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]
    
    // MARK: - View Body
    var body: some View {
        ScreenContainer {
            ScrollContainer {
                
                // 1. Title
                ScreenTitle(
                    title: "Welcome to the Hive",
                    subtitle: "Pick a mindful activity"
                )
                .padding(.top, 25)
                
                // 2. Exercises Section
                SectionHeader(
                    title: "Exercises",
                    subtitle: nil
                )
                .padding(.top, 20)
                
                VStack(spacing: 12) {
                    ForEach(Array(exerciseButtons.enumerated()), id: \.1.id) { index, model in
                        ExerciseCardButton(
                            model: model,
                            animationDelay: Double(index) * 0.3
                        )
                    }
                }
                
                // 3. Mini-Games Section
                SectionHeader(
                    title: "Mindfulness Mini-Games",
                    subtitle: "Train your mind with playful focus tools"
                )
                .padding(.top, 25)
                
                LazyVGrid(columns: gridColumns, spacing: 12) {
                    ForEach(Array(miniGames.enumerated()), id: \.1.id) { index, model in
                        MiniGameCardButton(
                            model: model,
                            animationDelay: Double(index) * 0.3
                        )
                    }
                }
            }
        }
        .sheet(isPresented: $showBreathingMenu) {
            BreathingMenuView() // ✅ Slide-up breathing menu
        }
    }
}

// MARK: - Preview
#Preview {
    HiveView()
}

