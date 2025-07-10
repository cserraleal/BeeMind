//
//  BoxBreathingView.swift
//  BeeMind
//
//  Created by Cristobal Serra on 10/07/25.
//

import SwiftUI

/// Enum representing each phase of the Box Breathing cycle.
enum BreathingPhase: CaseIterable {
    case inhale
    case hold1
    case exhale
    case hold2

    var duration: Int {
        return 4
    }

    func next() -> BreathingPhase {
        switch self {
        case .inhale: return .hold1
        case .hold1: return .exhale
        case .exhale: return .hold2
        case .hold2: return .inhale
        }
    }

    var displayName: String {
        switch self {
        case .inhale: return "Inhale"
        case .hold1, .hold2: return "Hold"
        case .exhale: return "Exhale"
        }
    }
}

/// Full-screen breathing exercise based on the Box Breathing technique.
struct BoxBreathingView: View {
    
    // MARK: - State
    @Environment(\.dismiss) private var dismiss
    @State private var isRunning = false
    @State private var currentPhase: BreathingPhase = .inhale
    @State private var timeRemaining: Int = 4
    @State private var timer: Timer? = nil

    // MARK: - Body
    var body: some View {
        ScreenContainer {
            ZStack {
                VStack(spacing: 30) {
                    
                    // Phase Label
                    Text(currentPhase.displayName)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextPrimary"))
                        .padding(.top, 40)
                    
                    // Countdown Circle
                    Circle()
                        .strokeBorder(Color("ButtonPrimary"), lineWidth: 6)
                        .frame(width: 200, height: 200)
                        .shadow(radius: 5)
                        .overlay(
                            Text("\(timeRemaining)s")
                                .font(.title)
                                .foregroundColor(Color("TextPrimary"))
                        )
                    
                    // Start/Stop Button
                    Button(action: {
                        if isRunning {
                            stopBreathing()
                        } else {
                            startBreathing()
                        }
                    }) {
                        Text(isRunning ? "Stop" : "Start")
                            .font(.headline)
                            .padding()
                            .frame(width: 140)
                            .background(Color("ButtonPrimary"))
                            .foregroundColor(Color("ButtonPrimaryText"))
                            .cornerRadius(12)
                    }
                    .padding(.top, 40)
                }
                
                // Close Button (top-left)
                VStack {
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color("TextPrimary"))
                                .padding(12)
                                .background(Color("CardBackground"))
                                .clipShape(Circle())
                                .shadow(radius: 2)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }

    // MARK: - Breathing Control

    private func startBreathing() {
        isRunning = true
        currentPhase = .inhale
        timeRemaining = currentPhase.duration

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                currentPhase = currentPhase.next()
                timeRemaining = currentPhase.duration
            }
        }
    }

    private func stopBreathing() {
        isRunning = false
        timer?.invalidate()
        timer = nil
        currentPhase = .inhale
        timeRemaining = currentPhase.duration
    }
}

// MARK: - Preview
#Preview {
    BoxBreathingView()
}
