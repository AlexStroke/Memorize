//
//  ContentView.swift
//  Memorize
//
//  Created by Aleksandr Strokov on 03.08.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(Color.red)
        .padding(.horizontal)
    }
}




struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
            ContentView(viewModel: game)
                .preferredColorScheme(.light)
        }
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}

//    var vehicles: some View {
//        Button {
//            emojis = ["🚁", "🚀", "🚲", "🏎", "🚗", "🚕", "🛥", "🛴", "🚃", "🚂", "🛸", "⛵️" ].shuffled()
//            emojiCount = Int.random(in: 4...12)
//        } label: {
//            VStack {
//                Image(systemName: "car")
//                Text("Vehicles").font(.title2)
//            }
//        }
//    }
//
//    var gaming: some View {
//        Button {
//            emojis = ["🎮", "🎰", "👾", "🕹", "🎳", "🎲", "🎯", "🃏", "♣️", "♥️", "♦️", "♠️" ].shuffled()
//            emojiCount = Int.random(in: 4...12)
//        } label: {
//            VStack {
//                Image(systemName: "gamecontroller")
//                Text("Gaming").font(.title2)
//            }
//        }
//    }
//
//    var buildings: some View {
//        Button {
//            emojis = ["🏛", "🏠", "🏩", "🏦", "🛖", "⛪️", "🏪", "🏥", "🏰", "🏢", "🕌", "🏯" ].shuffled()
//            emojiCount = Int.random(in: 4...12)
//        } label: {
//            VStack {
//                Image(systemName: "house")
//                Text("Buildings").font(.title2)
//            }
//        }
//    }
//}
