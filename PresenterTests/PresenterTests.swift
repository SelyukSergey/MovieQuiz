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
final class MovieQuizPresenterTests: XCTestCase {
    func testPresenterConvertModel() throws {
        let viewControllerMock = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        let viewModel = sut.convert(model: question)
        
        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question Text")
        XCTAssertEqual(viewModel.questionNumber, "1/10")
    }
}
