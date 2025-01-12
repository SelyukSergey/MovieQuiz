import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    
    var quizStepViewModel: QuizStepViewModel?
    var quizResultsViewModel: QuizResultsViewModel?
    var isCorrectAnswer: Bool?
    var loadingIndicatorShown: Bool = false
    var networkErrorMessage: String?
    
    func show(quiz step: QuizStepViewModel) {
        quizStepViewModel = step
    }
    
    func show(quiz result: QuizResultsViewModel) {
        quizResultsViewModel = result
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        self.isCorrectAnswer = isCorrectAnswer
    }
    
    func showLoadingIndicator() {
        loadingIndicatorShown = true
    }
    
    func hideLoadingIndicator() {
        loadingIndicatorShown = false
    }
    
    func showNetworkError(message: String) {
        networkErrorMessage = message
    }
}
