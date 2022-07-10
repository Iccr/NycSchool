//
//  ListingModelType.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import Foundation

// This is used for the listing. Since we are showing only name of the school in the school list, It only have title.  Title is the name of the school
protocol  ListModelType: Decodable {
    var id: String {get}
    var title: String {get}
}
