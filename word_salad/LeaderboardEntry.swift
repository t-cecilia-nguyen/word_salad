//
//  LeaderboardEntry.swift
//  word_salad
//
//  Created by Nhan Tran on 2025-03-29.
//

import Foundation

struct LeaderboardEntry: Codable, Identifiable {
    let id = UUID()
    let name: String
    let score: Int
    let difficulty: Int
}

class LeaderboardManager {
    static let shared = LeaderboardManager()
    private let key = "leaderboard_data"

    func saveScore(name: String, score: Int, difficulty: Int) {
        var entries = loadScores()
        entries.append(LeaderboardEntry(name: name, score: score, difficulty: difficulty))
        entries.sort { $0.score > $1.score }
        if entries.count > 20 {
            entries = Array(entries.prefix(20))
        }

        if let encoded = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    func clearScores() {
        UserDefaults.standard.removeObject(forKey: key)
    }

    func loadScores() -> [LeaderboardEntry] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let entries = try? JSONDecoder().decode([LeaderboardEntry].self, from: data) else {
            return []
        }
        return entries
    }
}
