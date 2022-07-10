//
//  ListingModelType.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import Foundation

protocol  ListModelType: Decodable {
    var id: String {get}
    var title: String {get}
}
