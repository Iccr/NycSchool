//
//  SchoolApi.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import Foundation

// Here are the concrete class that makes network request for list view and detail view respectively
struct SchoolFetcher: SchoolListApi {}

struct SchoolDetailFetcher: SchoolDetailApi {}
    
