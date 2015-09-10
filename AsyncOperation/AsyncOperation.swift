//
//  AsyncOperation.swift
//  AsyncOperation
//
//  Created by Daniel Williams on 24/08/2015.
//  Copyright © 2015 Dan Williams. All rights reserved.
//

import Foundation

public class AsyncOperation: NSOperation {
    
    // MARK: - Properties
    public override var executing: Bool { get { return internalExecuting }}
    public override var finished: Bool { get { return internalFinshed }}
    public override var asynchronous: Bool { get { return true }}
    
    internal var internalExecuting = false {
        willSet {
           willChangeValueForKey("isExecuting")
        }
        didSet {
            didChangeValueForKey("isExecuting")
        }
    }
    
    internal var internalFinshed = false {
        willSet {
            willChangeValueForKey("isFinished")
        }
        didSet {
            didChangeValueForKey("isFinished")
        }
    }
    
    // MARK: - NSOperation
    
    public override func start() {
        internalExecuting = true
        execute()
    }
    
    // MARK: - Public
    
    /**
    Override `execute` with the operation's main logic.
    */
    public func execute() { fatalError("`execute` method not overridden by superclass.") }
    
    /**
    Called from within the `execute` function when the operation has completed.
    */
    public func finish() {
        internalExecuting = false
        internalFinshed = true
        self.completionBlock?()
    }
}