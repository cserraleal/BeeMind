//
//  JournalView.swift
//  BeeMind
//
//  Created by Cristobal Serra on 29/06/25.
//

import SwiftUI

struct JournalView: View {
    var body: some View {
        ScreenContainer {
            Text("Journal")
                .font(.largeTitle)
                .foregroundColor(Color("TextPrimary"))
        }
    }
}

#Preview {
    JournalView()
}
