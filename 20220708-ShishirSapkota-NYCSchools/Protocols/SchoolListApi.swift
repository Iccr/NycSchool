//
//  SchoolApi.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import Foundation


// Any class conforming to SchoolListApi can intitiate requests to get the school list
protocol SchoolListApi: ApiServiceType {
    func getSchool(
        success: @escaping ([ListModelType]) -> (),
        failure: @escaping (Error) -> ()
    )
}

extension SchoolListApi {
    func getSchool(
        success: @escaping ([ListModelType]) -> (),
        failure: @escaping (Error) -> ()
    ) {
        let url = EndPoint.schools
        api.request(url, params: nil) { (result: [School]) in
            success(result)
        } failure: { error in
            failure(error)
        }
    }
}
