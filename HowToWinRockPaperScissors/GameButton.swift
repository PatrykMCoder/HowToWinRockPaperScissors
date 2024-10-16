//
//  GameButton.swift
//  HowToWinRockPaperScissors
//
//  Created by Patryk Marciszewski on 16/10/2024.
//

import SwiftUI

struct GameButton: View {
    let name: String
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            GameImage(name: name)
        }
    }
}

#Preview {
    GameButton(name: "rock") {
        
    }
}
