//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Сергей Селюк on 04.12.2024.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {               
    func didReceiveNextQuestion(question: QuizQuestion?)
}
