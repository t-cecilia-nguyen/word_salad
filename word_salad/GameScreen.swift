//
//  GameScreen.swift
//  word_salad
//
//  Created by Nhu Ly on 2025-02-28.
//

import SwiftUI


struct Player: Identifiable {
    var id = UUID()
    var name: String
    var score: Int
    var difficulty: Int
}

struct G: View {
    // seed data for leaderboard
    let samplePlayers = [
        Player(name: "Alice", score: 120, difficulty: 1),
        Player(name: "Bob", score: 100, difficulty: 2),
        Player(name: "Charlie", score: 90, difficulty: 3),
        Player(name: "Dave", score: 80, difficulty: 4),
        Player(name: "Eve", score: 70, difficulty: 5)
    ]
    
    var body: some View {
        ZStack {
            
        }
    }
}
