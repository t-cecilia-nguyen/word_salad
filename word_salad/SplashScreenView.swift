//
//  SplashScreenView.swift
//  word_salad
//
//  Created by Trang Nguyen on 2025-02-12.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            ContentView() // Navigate to main menu
        } else {
            
            ZStack {
                Color.customSand
                    .ignoresSafeArea()
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    Text("By:\nAdam Simcoe\nNhan Tran\nNhu Ly\nTrang Nguyen")
                        .multilineTextAlignment(.center)
                        .font(.custom("PAGKAKI-Regular", size: 20))
                        .foregroundColor(Color.customBrown)
                    
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
