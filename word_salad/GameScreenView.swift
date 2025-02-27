//
//  GameScreenView.swift
//  word_salad
//
//  Created by Nhu Ly on 2025-02-28.
//

import SwiftUI

struct GameScreenView: View {
    @State var guess: String = ""
    @State var minute: Int = 2
    @State var seconds: Int = 00
    @State var score: Int = 0
    
    var body: some View {
        ZStack {
            Color.customSand
                .ignoresSafeArea()
            VStack {
                Text("TEXT FROM API")
                    .font(.custom("PAGKAKI-Regular", size: 40))
                    .padding(.horizontal, 40)
                    .padding(.top, 50)
                    .foregroundColor(Color.customBrown)
                    
                Text("Time Remaining: \(minute)m \(seconds)s")
                    .font(.custom("PAGKAKI-Regular", size: 25))
                    .padding(.horizontal, 40)
                    .foregroundColor(Color.customBrown)
                Spacer()
                Text("Guess")
                    .font(.custom("PAGKAKI-Regular", size: 30))
                    .padding(.horizontal, 40)
                    .padding(.bottom, 10)
                    .foregroundColor(Color.customBrown)
                
                TextField("TEXT FROM API", text: $guess)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .background(Color.white)
                    .cornerRadius(40)
                    .font(.custom("PAGKAKI-Regular", size: 25))
                    .frame(width: 250)
                    .padding(.bottom, 15)


                Button(action: {
                    print("Submit Button")
                }) {
                    Text("Submit")
                        .font(.custom("PAGKAKI-Regular", size: 25))
                        .padding(.horizontal, 40)
                        .foregroundColor(Color.customBrown)
                        .background(Color.customGreen)
                        .cornerRadius(40)
                }
                Spacer()
                Text("Current Score: \(score)")
                    .font(.custom("PAGKAKI-Regular", size: 25))
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)
                    .foregroundColor(Color.customBrown)
            }
        }
    }
}

#Preview {
    GameScreenView()
}
