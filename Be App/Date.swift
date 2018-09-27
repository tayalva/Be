//
//  Date.swift
//  Be App
//
//  Created by Taylor Smith on 9/27/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import Foundation

extension Date {
    func toMillis() -> Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
