//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Сергей Селюк on 04.12.2024.
//

import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: (() -> Void)?
}