//
//  TestAsyncOperation.swift
//  AsyncOperation
//
//  Created by Daniel Williams on 24/08/2015.
//  Copyright © 2015 Dan Williams. All rights reserved.
//

import Foundation

internal class TestAsyncOperation: AsyncOperation {
    
    /**
    A `TestAsyncOperation` counts to 3 then finishes.
    */
    internal override func execute() {
        
        dispatch_async(dispatch_queue_create("background queue", nil)) {
            sleep(2)
            
            dispatch_async(dispatch_get_main_queue()) {
                self.finish()
            }
        }
    }
}