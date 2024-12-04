//
//  QuestionFactory.swift
//  MovieQuiz
//
//  Created by Сергей Селюк on 30.11.2024.
//

import Foundation

class QuestionFactory {
    private var questions: [QuizQuestion] = [
        QuizQuestion(
            image: "The Godfather",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Dark Knight",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Kill Bill",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Avengers",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Deadpool",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Green Knight",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Old",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "The Ice Age Adventures of Buck Wild",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Tesla",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Vivarium",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false)
    ]
    

    func requestNextQuestion() -> QuizQuestion? { // 1
        // 2
        guard let index = (0..<questions.count).randomElement() else {
            return nil
        }
        
        return questions[safe: index] // 3
}
    subscript(index: Int) -> QuizQuestion? {
        get {
            if index >= 0 && index < questions.count {
                return questions[index]
            } else {
                return nil
            }
        }
            set(newValue) {
                if index >= 0 && index < questions.count {
                    questions[index] = newValue!
                }
            }
        }
    }