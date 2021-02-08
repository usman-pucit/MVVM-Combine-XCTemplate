//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Combine
import Foundation

protocol ___VARIABLE_ModuleName___UseCaseType {
    func request(_ request: Request) -> AnyPublisher<Result<___VARIABLE_ModuleName___Model, APIError>, Never>
}

class ___VARIABLE_ModuleName___UseCase {
    // MARK: -  Properties

    var apiClient: APIClientType

    // MARK: - Initializer

    init(apiClient: APIClientType = APIClient()) {
        self.apiClient = apiClient
    }
}

// MARK: - Extension

extension ___VARIABLE_ModuleName___UseCase: ___VARIABLE_ModuleName___UseCaseType {
    func request(_ request: Request) -> AnyPublisher<Result<___VARIABLE_ModuleName___Model, APIError>, Never> {
        return apiClient
            .execute(request)
            .subscribe(on: Scheduler.backgroundWorkScheduler)
            .receive(on: Scheduler.mainScheduler)
            .eraseToAnyPublisher()
    }
}
