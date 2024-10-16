//
//  GameButton.swift
//  HowToWinRockPaperScissors
//
//  Created by Patryk Marciszewski on 16/10/2024.
//

import SwiftUI

struct GameImage: View {
    let name: String
    var body: some View {
        Image(name).resizable().frame(maxWidth: 150, maxHeight: 150)
    }
}

#Preview {
    GameImage(name: "rock")
}
