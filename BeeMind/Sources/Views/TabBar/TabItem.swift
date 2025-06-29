//
//  TabItem.swift
//  BeeMind
//
//  Created by Cristobal Serra on 29/06/25.
//

import SwiftUI

/// Model that represents the configuration of a single tab.
struct TabItem {
    let title: String          // Tab name (not shown in UI now, but useful for future)
    let icon: String           // SF Symbol icon
    let view: AnyView          // Associated screen view
}
