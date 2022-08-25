//
//  ContentView.swift
//  Memorize
//
//  Created by Aleksandr Strokov on 03.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚁", "🚀", "🚲", "🏎", "🚗", "🚕", "🛥", "🛴", "🚃", "🚂", "🛸", "⛵️" ]
    @State var emojiCount = 12
    
    var body: some View {
        VStack {
            HStack {
                Text("Memorize!")
                    .font(.largeTitle)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji)} ).aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundColor(Color.red)
            HStack {
                vehicles
                Spacer()
                gaming
                Spacer()
                buildings
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button {
            if emojiCount < emojis.count {
            emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
            
        }
    }
    
    var shuffle: some View {
        Button {
            emojis = emojis.shuffled()
        } label: {
            Text("Shuffle")
        }
    }
    
    var vehicles: some View {
        Button {
            emojis = ["🚁", "🚀", "🚲", "🏎", "🚗", "🚕", "🛥", "🛴", "🚃", "🚂", "🛸", "⛵️" ].shuffled()
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles").font(.title2)
            }
        }
    }
    
    var gaming: some View {
        Button {
            emojis = ["🎮", "🎰", "👾", "🕹", "🎳", "🎲", "🎯", "🃏", "♣️", "♥️", "♦️", "♠️" ].shuffled()
        } label: {
            VStack {
                Image(systemName: "gamecontroller")
                Text("Gaming").font(.title2)
            }
        }
    }
    
    var buildings: some View {
        Button {
            emojis = ["🏛", "🏠", "🏩", "🏦", "🛖", "⛪️", "🏪", "🏥", "🏰", "🏢", "🕌", "🏯" ].shuffled()
        } label: {
            VStack {
                Image(systemName: "house")
                Text("Buildings").font(.title2)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.light)
        }
        ContentView()
            .preferredColorScheme(.dark)
    }
}
