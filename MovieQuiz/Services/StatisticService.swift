//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Сергей Селюк on 05.12.2024.
//

import Foundation

final class StatisticService: StatisticServiceProtocol {
    private let storage: UserDefaults = .standard
    
    private enum Keys: String {
        case gamesCount
        case bestGameCorrect
        case bestGameTotal
        case bestGameDate
        case totalQuestions
        case totalCorrect
    }
    
    var totalAccuracy: Double {
        get {
            let totalQuestions = storage.integer(forKey: Keys.totalQuestions.rawValue)
            let totalCorrect = storage.integer(forKey: Keys.totalCorrect.rawValue)
            
            guard totalQuestions > 0 else {
                return 0.0
            }
            
            let accuracy = Double(totalCorrect) / Double(totalQuestions) * 100.0
            return accuracy
        }
    }
    
    
    var gamesCount: Int {
        get {
            return storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.bestGameCorrect.rawValue)
            let total = storage.integer(forKey: Keys.bestGameTotal.rawValue)
            let date = storage.object(forKey: Keys.bestGameDate.rawValue) as? Date ?? Date()
            
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: Keys.bestGameCorrect.rawValue)
            storage.set(newValue.total, forKey: Keys.bestGameTotal.rawValue)
            storage.set(newValue.date, forKey: Keys.bestGameDate.rawValue)
        }
    }
    
    func store(correct count: Int, total amount: Int) {
        // Инкрементируем количество сыгранных квизов
        let newGamesCount = gamesCount + 1
        gamesCount = newGamesCount
        
        let previousTotalCorrect = storage.integer(forKey: Keys.totalCorrect.rawValue)
        let updatedTotalCorrect = previousTotalCorrect + count
        storage.set(updatedTotalCorrect, forKey: Keys.totalCorrect.rawValue)
        
        let previousTotalQuestions = storage.integer(forKey: Keys.totalQuestions.rawValue)
        let updatedTotalQuestions = previousTotalQuestions + amount
        storage.set(updatedTotalQuestions, forKey: Keys.totalQuestions.rawValue)
        
        // Обновляем лучшие показатели, если текущее значение лучше
        if count >= bestGame.correct || (count == bestGame.correct && amount <= bestGame.total) {
            storage.set(count, forKey: Keys.bestGameCorrect.rawValue)
            storage.set(amount, forKey: Keys.bestGameTotal.rawValue)
            storage.set(Date(), forKey: Keys.bestGameDate.rawValue)
        }
    }
}
