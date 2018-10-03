//
//  Array Extension.swift
//  Be App
//
//  Created by Taylor Smith on 10/3/18.
//  Copyright © 2018 Taylor Smith. All rights reserved.
//

import Foundation


extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
