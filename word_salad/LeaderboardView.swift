//
//  LeaderboardView.swift
//  word_salad
//
//  Created by Nhan Tran on 2025-02-27.
//

import SwiftUI


struct Player: Identifiable {
    var id = UUID()
    var name: String
    var score: Int
    var difficulty: Int
}

struct LeaderboardView: View {
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
            Color.customSand
                .ignoresSafeArea()
            
            VStack {
                Text("Leaderboard")
                    .font(.custom("PAGKAKI-Regular", size: 30))
                    .foregroundColor(Color.customBrown)
                                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name")
                            .font(.custom("PAGKAKI-Regular", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.customBrown)  
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Score")
                            .font(.custom("PAGKAKI-Regular", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.customBrown)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("Difficulty")
                            .font(.custom("PAGKAKI-Regular", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.customBrown)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(Color.customOrange)
                    .cornerRadius(10)
                    .shadow(radius: 5)

                    
                    
                    List(samplePlayers.sorted { $0.score > $1.score }) { player in
                        HStack {
                            Text(player.name)
                                .font(.custom("PAGKAKI-Regular", size: 18))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(player.score)")
                                .font(.custom("PAGKAKI-Regular", size: 18))
                                .frame(maxWidth: .infinity, alignment: .center)
                            Text("\(player.difficulty)")  
                                .font(.custom("PAGKAKI-Regular", size: 18))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .padding()
                        .listRowBackground(Color.customSand)
                        .background(Color.customYellow)
                        .cornerRadius(8)
                        .padding(.vertical, 5)
                        
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .padding()
        }
    }
}

#Preview {
    LeaderboardView()
}
