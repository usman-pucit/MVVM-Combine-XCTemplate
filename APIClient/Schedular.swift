//
//  Schedular.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Combine
import Foundation

// MARK: - Class

/// Scheduler class to manage Background Oprations
final class Scheduler {
    static let mainScheduler = RunLoop.main

    static var backgroundWorkScheduler: OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.qualityOfService = QualityOfService.userInitiated
        return operationQueue
    }()
}
