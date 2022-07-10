//
//  SchoolDetailApi.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import Foundation



protocol SchoolDetailApi: ApiServiceType {
    func getDetail(
        for name: String,
        success: @escaping ([SchoolDetail]) -> (),
        failure: @escaping (Error) -> ()
    )
}



extension SchoolDetailApi {
    func getDetail(
        for name: String,
        success: @escaping ([SchoolDetail]) -> (),
        failure: @escaping (Error) -> ()
    ) {
        let url = EndPoint.detail(for: name)
        api.request(url, params: nil) { result in
            success(result)
        } failure: { error in
            failure(error)
        }
    }
}
