//
//  Models.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/8/22.
//

import Foundation

struct School {
    let dbn : String?
    let school_name : String?
}

extension School: ListModelType {
 
    var id: String {
        dbn ?? ""
    }
    
    var title: String {
        school_name ?? ""
    }
    
}


