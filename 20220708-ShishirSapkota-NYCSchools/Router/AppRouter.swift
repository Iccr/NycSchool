//
//  AppRouter.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import UIKit

class AppRouter: Router {
    var source: UIViewController!
    
    
    init(source: UIViewController) {
        self.source = source
    }
    
    func route() {
        assertionFailure("not handled from subclass class")
    }
    
}


