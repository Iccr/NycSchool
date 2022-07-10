//
//  SchoolApi.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import Foundation



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
