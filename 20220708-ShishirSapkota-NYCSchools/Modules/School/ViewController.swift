//
//  ViewController.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    var indicator = UIActivityIndicatorView(style: .large)
    
    
    var api: SchoolApi?
    var schools: [ListModelType] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.api = SchoolApi()
        self.navigationItem.title = "Schools"
        configureTableView()
        configureIndicator()
        getSchool()
        
    }
    
    private func configureTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
    }
    
    private func configureIndicator() {
        indicator.center = self.view.center
        indicator.hidesWhenStopped = true
        indicator.color = .red
        view.addSubview(indicator)
    }
    
    private func getSchool() {
        indicator.startAnimating()
        SchoolApi().getSchool { schools in
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
            }
            self.schools = schools
        } failure: { error in
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
            }
            self.showAlert(title: error.localizedDescription)
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let school = self.schools.elementAt(index: indexPath.row) else {
            return
        }
        RouterFactory
            .detailRouter(params: school, api: self.api ?? SchoolApi(), source: self)
            .route()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // in production this constant might be in enum or some constant related group
        return 60
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = self.schools.elementAt(index: indexPath.row) else {
            return UITableViewCell()
        }
        return configureSchoolCell(tableView, indexPath, model)
    }
    
    func configureSchoolCell(_ tableView: UITableView, _  indexPath: IndexPath, _ model: ListModelType) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "SchoolTableViewCell") as! SchoolTableViewCell
        cell.nameLabel.text = model.title
        return cell
    }
}



