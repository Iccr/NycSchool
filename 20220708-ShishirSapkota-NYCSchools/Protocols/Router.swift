//
//  Router.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import UIKit

// Router handles all the navigation logic. The function route is in its implementation class so each router can have its own routing logic
// see SchoolDetailRouter
protocol Router {
    var source: UIViewController! {get}
    func route()    
}


