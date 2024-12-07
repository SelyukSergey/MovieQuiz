//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Сергей Селюк on 04.12.2024.
//

import UIKit

class AlertPresenter {
    
    func presentAlert(with model: AlertModel, from controller: UIViewController) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: model.buttonText, style: .default) { _ in
            model.completion?()
        }
        
        alert.addAction(action)
        
        controller.present(alert, animated: true, completion: nil)
    }
}
