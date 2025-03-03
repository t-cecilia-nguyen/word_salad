//
//  ContentView.swift
//  word_salad
//
//  Created by Trang Nguyen on 2025-02-12.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var isGameStarted: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customSand
                    .ignoresSafeArea()
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    
                    Text("Please enter your name:")
                        .font(.system(size: 20))
                    
                    TextField("UPPERlowerTest", text: $name)
                        .padding(.top, 10)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .cornerRadius(40)
                        .font(.custom("PAGKAKI-Regular", size: 20))
                    
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
                    
                    Button(action: {
                        print("Leaderboard Button")
                    }) {
                        Text("Leaderboard")
                            .font(.custom("PAGKAKI-Regular", size: 30))
                            .padding(.horizontal, 40)
                            .padding(.top, 10)
                            .foregroundColor(Color.customBrown)
                            .background(Color.customOrange)
                            .cornerRadius(40)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
