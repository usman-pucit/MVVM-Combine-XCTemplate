//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Combine
import Foundation

protocol ___VARIABLE_ModuleName___ViewModelType {
    func request(_ request: Request)
}

/// define all states of view.
enum ___VARIABLE_ModuleName___ViewModelState {
    case show([___VARIABLE_ModuleName___Model])
    case error(String)
}

class ___VARIABLE_ModuleName___ViewModel {
    
    @Published var isLoading = false
    /// define immutable `stateDidUpdate` property so that subscriber can only read from it.
    private(set) lazy var stateDidUpdate = stateDidUpdateSubject.eraseToAnyPublisher()
    
    // MARK: - Private Properties
    
    private var cancellables: [AnyCancellable] = []
    private let useCase: ___VARIABLE_ModuleName___UseCaseType
    private let stateDidUpdateSubject = PassthroughSubject<___VARIABLE_ModuleName___ViewModelState, Never>()

    // MARK: Initializer

    init(useCase: ___VARIABLE_ModuleName___UseCaseType) {
        self.useCase = useCase
    }
}

extension ___VARIABLE_ModuleName___ViewModel: ___VARIABLE_ModuleName___ViewModelType {
   
    func request(_ request: Request){
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        isLoading = true
        useCase.request(request)
            .sink { [weak self] result in
                guard let `self` = self else { return }
                self.isLoading = false
                switch result {
                case .success(let value):
                    self.stateDidUpdateSubject.send(.show([value]))
                case .failure(let error):
                    self.stateDidUpdateSubject.send(.error(error.localizedDescription))
                }
            }.store(in: &cancellables)
    }
    
}
