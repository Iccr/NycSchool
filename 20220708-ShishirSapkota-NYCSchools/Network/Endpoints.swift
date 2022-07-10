//
//  Endpoints.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/8/22.
//

import Foundation


struct EndPoint {
    static var schools: URL {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else {
            fatalError( "Invalid URL for getting schools" )
        }
        return url
    }
    
    static func detail(for name: String) -> URL {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(name)") else {
            fatalError( "Invalid URL for getting schools" )
        }
        return url
    }
    
    enum Methods: String {
        case get =  "GET"
    }
}




