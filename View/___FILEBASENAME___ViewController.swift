//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import Combine

class ___VARIABLE_ModuleName___ViewController: UIViewController {

    // MARK: Properties

    private var viewModel: ___VARIABLE_ModuleName___ViewModel!
    private var cancellable: [AnyCancellable] = []
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ___VARIABLE_ModuleName___ViewModel(useCase: ___VARIABLE_ModuleName___UseCase())
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.stateDidUpdate.sink(receiveValue: { [unowned self] state in
            // Todo ...
        }).store(in: &cancellable)
    }
}
