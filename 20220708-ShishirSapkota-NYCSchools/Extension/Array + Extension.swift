//
//  Array + Extension.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import Foundation


extension Array {
    func elementAt(index: Int) -> Array.Iterator.Element? {
        if index < self.count && index >= 0 {
            return self[index]
        }
        return nil
    }
}

