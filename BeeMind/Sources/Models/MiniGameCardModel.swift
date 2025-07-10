//
//  MiniGameCardModel.swift
//  BeeMind
//
//  Created by Cristobal Serra on 10/07/25.
//

import SwiftUI

/// Model representing a single mini-game card in the Hive view.
struct MiniGameCardModel: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
    let backgroundColor: Color
    let action: () -> Void
}
