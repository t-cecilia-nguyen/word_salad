//
//  GameOverView.swift
//  word_salad
//
//  Created by Adam Simcoe on 2025-03-18.
//

import SwiftUI

struct GameOverView: View {
    
    var finalScore: Int
    var difficultyLevel: Int
    @State private var isGameStarted: Bool = false
    @State private var isLeaderboardOpened: Bool = false

    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.customSand
                    .ignoresSafeArea()
                
                VStack {
                    // Game Over Text
                    Text("Game Over!")
                        .font(.custom("PAGKAKI-Regular", size: 40))
                        .foregroundColor(Color.customBrown)
                        .padding(.bottom, 30)
                    
                    // Final Score Text
                    Text("Level \(difficultyLevel) Final Score:")
                        .font(.custom("PAGKAKI-Regular", size: 35))
                        .foregroundColor(Color.customBrown)
                        .padding(.bottom, 0)
                    
                    // Final Score Value
                    Text("\(finalScore)")
                        .font(.custom("PAGKAKI-Regular", size: 35))
                        .foregroundColor(Color.customBrown)
                        .padding(.bottom, 30)
                    
                    // New Game Button Navigation
                    Button(action: {
                        print("New Game Button")
                        isGameStarted = true
                    }) {
                        Text("New Game")
                            .font(.custom("PAGKAKI-Regular", size: 30))
                            .padding(.horizontal, 40)
                            .padding(.top, 10)
                            .foregroundColor(Color.customBrown)
                            .background(Color.customGreen)
                            .cornerRadius(40)
                    }.navigationDestination(isPresented: $isGameStarted) {
                        DifficultyView()
                    }
                    
                    // Leaderboard Button Navigation
                    Button(action: {
                        print("Leaderboard Button")
                        isLeaderboardOpened = true
                    }) {
                        Text("Leaderboard")
                            .font(.custom("PAGKAKI-Regular", size: 30))
                            .padding(.horizontal, 40)
                            .padding(.top, 10)
                            .foregroundColor(Color.customBrown)
                            .background(Color.customOrange)
                            .cornerRadius(40)
                    }
                    .navigationDestination(isPresented: $isLeaderboardOpened) {
                        LeaderboardView()
                    }
                }
                .padding()
            }
        }
    }
}

// Update when DB implemented
#Preview {
    GameOverView(finalScore: 120, difficultyLevel: 3)
}
