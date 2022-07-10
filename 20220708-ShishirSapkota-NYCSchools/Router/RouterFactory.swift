//
//  RouterFactory.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import UIKit


class RouterFactory {
    static func detailRouter(params: ListModelType, api: SchoolDetailApi, source: UIViewController) -> Router {
        SchoolDetailRouter(school: params, api: api, source: source)
    }
}
