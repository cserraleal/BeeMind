//
//  ExerciseCardModel.swift
//  BeeMind
//
//  Created by Cristobal Serra on 10/07/25.
//


import SwiftUI

/// Model representing a single exercise in the Hive view.
struct ExerciseCardModel: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
    let backgroundColor: Color
    let action: () -> Void
}
