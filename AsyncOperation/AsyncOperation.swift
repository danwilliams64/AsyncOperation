//
//  AsyncOperation.swift
//  AsyncOperation
//
//  Copyright (c) 2015, Dan Williams
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

public class AsyncOperation: NSOperation {
    
    // MARK: - Properties
    public override var executing: Bool { return internalExecuting }
    public override var finished: Bool { return internalFinshed }
    public override var asynchronous: Bool { return true }
    
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
    internal func finish() {
        internalExecuting = false
        internalFinshed = true
    }
}