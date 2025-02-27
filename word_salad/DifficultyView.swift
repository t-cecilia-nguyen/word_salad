//
//  DifficultyView.swift
//  word_salad
//
//  Created by Nhan Tran on 2025-02-27.
//

import SwiftUI

struct DifficultyView: View {
    var body: some View {
        ZStack {
            Color.customSand
                .ignoresSafeArea()
            
            VStack {
                Text("Difficulty:")
                    .font(.custom("PAGKAKI-Regular", size: 30))
                    .foregroundColor(Color.customBrown)
                
                ForEach(1...5, id: \.self) { level in
                    Button(action: {
                        print("Level \(level) selected")
                    }) {
                        Text("Level \(level)")
                            .font(.custom("PAGKAKI-Regular", size: 24))
                                .padding(.top, 10)
                            .foregroundColor(Color.customBrown)
                            .frame(width: 180, height: 75)
                            .background(levelColor(level))
                            .cornerRadius(10)
                            .shadow(radius: 3)
                        
                    }
                }
            }
            .padding()
        }
    }
    
    func levelColor(_ level: Int) -> Color {
        switch level {
        case 1: return Color.customLightGreen
        case 2: return Color.customTeal
        case 3: return Color.customGreen
        case 4: return Color.customYellow
        case 5: return Color.customOrange
        default: return Color.white
        }
    }
}

#Preview {
    DifficultyView()
}
