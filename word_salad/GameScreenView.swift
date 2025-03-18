//
//  GameScreenView.swift
//  word_salad
//
//  Created by Nhu Ly on 2025-02-28.
//
import SwiftUI

struct GameScreenView: View {
    @State private var guess: String = ""
    @State private var score: Int = 0
    @State private var scrambledWord: String = ""
    @State private var originalWord: String = ""
    @State private var timeRemaining: Int = 120
    @State private var timer: Timer?
    @Binding var selectedLevel: Int
    @State private var navigateToGameOver = false
    
    private var wordLength: Int {
            switch selectedLevel {
            case 1:
                return 3
            case 2:
                return 4
            case 3:
                return 5
            case 4:
                return 6
            case 5:
                return 7
            default:
                return 3 // Default length
            }
        }

    var body: some View {
        ZStack {
            Color.customSand
                .ignoresSafeArea()
            VStack {
                Text("\(scrambledWord)")
                    .font(.custom("PAGKAKI-Regular", size: 50))
                    .padding(.horizontal, 40)
                    .padding(.top, 50)
                    .foregroundColor(Color.customBrown)
                    
                Text("Time Remaining: \(formattedTime)")
                    .font(.custom("PAGKAKI-Regular", size: 25))
                    .padding(.horizontal, 40)
                    .padding(.bottom, 80)
                    .foregroundColor(Color.customBrown)
                
                Text("Your Guess:")
                    .font(.custom("PAGKAKI-Regular", size: 30))
                    .padding(.horizontal, 40)
                    .padding(.bottom, 10)
                    .foregroundColor(Color.customBrown)
                
                TextField("", text: $guess)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .background(Color.white)
                    .cornerRadius(40)
                    .font(.custom("PAGKAKI-Regular", size: 25))
                    .frame(width: 250)
                    .padding(.bottom, 20)

                Button(action: {
                    print("---- Pressed Submit Button ----")
                    checkGuess()
                }) {
                    Text("Submit")
                        .font(.custom("PAGKAKI-Regular", size: 25))
                        .padding(.horizontal, 40)
                        .padding(.top, 10)
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
        .onAppear(perform: startGame)
        // Game Over Navigation
        .navigationDestination(isPresented: $navigateToGameOver) {
            GameOverView(finalScore: score, difficultyLevel: selectedLevel)
        }
    }
    
    private func startGame() {
       fetchRandomWord()
       startTimer()
   }

    private func fetchRandomWord() {
        let apiURL = "https://random-word-api.herokuapp.com/word?length=\(wordLength)"

        guard let url = URL(string: apiURL) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let words = try? JSONDecoder().decode([String].self, from: data), let word = words.first {
                DispatchQueue.main.async {
                    self.originalWord = word.uppercased()
                    self.scrambledWord = String(word.shuffled())
                }
            }
        }.resume()
    }

    private func startTimer() {
        timer?.invalidate() // Invalidate any existing timer
        timeRemaining = 120

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
                print("time's up")
                // Game Over navigation bool
                navigateToGameOver = true
            }
        }
    }

    private func checkGuess() {
        print("checking guess ...")
        if guess.uppercased() == originalWord {
            score += 10
            print("correct, core: \(score)")
        } else {
            print("wrong answer")
        }
        guess = ""
        fetchRandomWord()
    }

    private var formattedTime: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return "\(minutes):\(String(format: "%02d", seconds))"
    }

   
}

#Preview {
    GameScreenView(selectedLevel: .constant(1))
}
