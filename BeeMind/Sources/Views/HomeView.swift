//
//  HomeView.swift
//  BeeMind
//
//  Created by Cristobal Serra on 18/06/25.
//

import SwiftUI

/// Main screen of the BeeMind app showing user stats, progress, and quick access sections.
struct HomeView: View {
    
    // MARK: - Properties (Mock data for now)
    let userName = "Cristóbal"
    let quote = "Taking even a single mindful breath can return you to the present moment."
    
    // MARK: - View Body
    var body: some View {
        ScreenContainer {
            ScrollContainer {
                
                // 1. Title and Greeting
                ScreenTitle(
                    title: "Hello \(userName)",
                    subtitle: "Let’s keep your mind clear today"
                )
                
                // 2. Section: Today’s Stats
                SectionHeader(
                    title: "Progress",
                    subtitle: nil
                )
                .padding(.top, 25)
                
                // 3. Horizontal Stat Cards
                LazyVGrid(
                    columns: [GridItem(.flexible()), GridItem(.flexible())],
                    alignment: .center,
                    spacing: 10
                ) {
                    StatCard(iconName: "flame.fill", title: "Streak", value: "5 d")
                        .frame(maxWidth: .infinity)
                    StatCard(iconName: "brain.head.profile", title: "Meditations", value: "12")
                        .frame(maxWidth: .infinity)
                    StatCard(iconName: "book.closed", title: "Journal", value: "7")
                        .frame(maxWidth: .infinity)
                    StatCard(iconName: "heart.fill", title: "Sessions", value: "7")
                }
                
                // 4. Quick Access Header
                SectionHeader(
                    title: "Buzz Breathing",
                    subtitle: "Calm your anxiety with a quick exercise"
                )
                .padding(.top, 25)
                
                // 4. Quick Access Buttons
                VStack(alignment:.center, spacing: 16) {
                    
                    PrimaryButton(
                    title: "Breathing Technique",
                    action: { print("Exercise Started...") },
                    backgroundColor: .blue,
                    textColor: .white,
                    isFullWidth: true)
                    
//                    PrimaryButton(
//                    title: "Guided Meditation",
//                    action: { print("Meditation Started...") },
//                    backgroundColor: .blue,
//                    textColor: .white,
//                    isFullWidth: true)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                // 5. Daily Mood
                // With background (default)
                SectionHeader(
                    title: "Daily Check-Up",
                    subtitle: "Reflect on how are you feeling so far")
                    .padding(.top, 25)
                
                SectionCard(title: nil, useBackground: false) {
                    MoodSelector()
                        .padding(.top, 1)
                }
                // 6. Daily Quote and Buttons
                // Daily Reflection Card
                SectionCard(title: "Daily Reflection") {
                    HStack {
                        Image(systemName: "figure.mind.and.body")
                            .foregroundColor(Color("IconPrimary"))
                            .imageScale(.large)
                        Text(quote)
                            .font(.body)
                            .foregroundColor(Color("CardPrimaryText"))
                    }
                }
                .padding(.top, 25)
            }
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}

