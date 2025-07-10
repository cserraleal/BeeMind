//
//  BreathingExerciseModel.swift
//  BeeMind
//
//  Created by Cristobal Serra on 10/07/25.
//

import SwiftUI

/// Represents a single breathing technique option in the menu.
struct BreathingExerciseModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let iconName: String
    let action: () -> Void
}
