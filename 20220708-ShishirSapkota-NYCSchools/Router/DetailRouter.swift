//
//  DetailRouter.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import UIKit


class SchoolDetailRouter: Router {
    var source: UIViewController!
    var school: ListModelType
    var api: SchoolDetailApi
    
    init(school: ListModelType, api: SchoolDetailApi, source: UIViewController) {
        self.source = source
        self.school = school
        self.api = api
    }
    
    func route() {
        let vc = UIStoryboard(name: "SchoolDetail", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.school = school
        vc.api = self.api
        self.source?.navigationController?.pushViewController(vc, animated: true)
    }
}
