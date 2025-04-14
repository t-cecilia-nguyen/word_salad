//
//  LeaderboardView.swift
//  word_salad
//
//  Created by Nhan Tran on 2025-02-27.
//  100898539

import SwiftUI


struct Player: Identifiable {
    var id = UUID()
    var name: String
    var score: Int
    var difficulty: Int
}

struct LeaderboardView: View {
    let players: [LeaderboardEntry] = LeaderboardManager.shared.loadScores()
    @State private var showClearAlert = false
    
    var body: some View {
        ZStack {
            Color.customSand
                .ignoresSafeArea()
            
            VStack {
                Button(action: {
                    showClearAlert = true
                }) {
                    Text("Leaderboard")
                        .font(.custom("PAGKAKI-Regular", size: 30))
                        .foregroundColor(Color.customBrown)
                }
                .buttonStyle(PlainButtonStyle())
                .alert("Clear leaderboard?", isPresented: $showClearAlert) {
                    Button("Clear", role: .destructive) {
                        LeaderboardManager.shared.clearScores()
                    }
                    Button("Cancel", role: .cancel) { }
                }
                                
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

                    List(players.sorted { $0.score > $1.score }) { player in
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
