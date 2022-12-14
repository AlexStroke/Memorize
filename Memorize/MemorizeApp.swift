//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Aleksandr Strokov on 03.08.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
