//
//  ApiServiceType.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import Foundation


// Whichever class follows this protocol, They get shared instance of NetworkManager for free
// see SchoolListApi protocol for example
protocol ApiServiceType {
    var api: NetworkManager { get }
}

extension ApiServiceType {
    var api: NetworkManager { NetworkManager.shared }
}
