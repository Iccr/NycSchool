//
//  SchoolDetailModel.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import Foundation


struct SchoolDetail : Codable {
    let dbn : String?
    let school_name : String?
    let num_of_sat_test_takers : String?
    let sat_critical_reading_avg_score : String?
    let sat_math_avg_score : String?
    let sat_writing_avg_score : String?
}
