//
//  TabRouter.swift
//  BeeMind
//
//  Created by Cristobal Serra on 29/06/25.
//

import SwiftUI

/// Enum representing each tab in the bottom tab bar.
enum TabRoute: CaseIterable, Hashable {
    case home, hive, journal, progress, profile

    /// Returns the TabItem model for this route.
    var item: TabItem {
        switch self {
        case .home:
            return TabItem(
                title: "Home",
                icon: "house",
                view: AnyView(HomeView())
            )
        case .hive:
            return TabItem(
                title: "Hive",
                icon: "brain.head.profile",
                view: AnyView(HiveView())
            )
        case .journal:
            return TabItem(
                title: "Journal",
                icon: "book.closed",
                view: AnyView(JournalView())
            )
        case .progress:
            return TabItem(
                title: "Progress",
                icon: "chart.bar.xaxis",
                view: AnyView(ProgressView())
            )
        case .profile:
            return TabItem(
                title: "Session",
                icon: "calendar",
                view: AnyView(SessionView())
            )
        }
    }
}

