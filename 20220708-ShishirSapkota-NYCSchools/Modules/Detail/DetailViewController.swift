//
//  DetailViewController.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/8/22.
//


import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var school: ListModelType?
    var api: SchoolDetailApi?
    var indicator = UIActivityIndicatorView(style: .large)
    var schoolDetails: [SchoolDetail] = [] {
        didSet {
            DispatchQueue.main.async {
                if self.schoolDetails.isEmpty {
                    self.view.bringSubviewToFront(self.noDataLabel)
                }else {
                    self.tableView.reloadData()
                }
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = school?.title ?? ""
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.separatorStyle = .none
        if let id = school?.id {
            getDetail(for: id)
        }
        // Do any additional setup after loading the view.
        configureIndicator()
    }
    
    private func configureIndicator() {
        indicator.center = self.view.center
        indicator.hidesWhenStopped = true
        indicator.color = .red
        view.addSubview(indicator)
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension DetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        schoolDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.schoolDetails.elementAt(index: indexPath.row)
        return configureCell(tableView, indexPath, model: model)
    }
    
    
    private func configureCell(_ tableView: UITableView, _ indexPath: IndexPath, model: SchoolDetail?) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreTableViewCell") as! ScoreTableViewCell
        cell.satTestTakersLabel.text = model?.num_of_sat_test_takers ?? ""
        cell.satCriticalReadingScoreLabel.text = model?.sat_critical_reading_avg_score ?? ""
        cell.satMathScoreLabel.text = model?.sat_math_avg_score ?? ""
        cell.satWritingScoreLabel.text = model?.sat_writing_avg_score ?? ""
        return cell
    }

}

extension DetailViewController {
    func getDetail(for id: String) {
        indicator.startAnimating()
        api?.getDetail(for: id, success: { schoolDetails in
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
            }
            self.schoolDetails = schoolDetails
        }, failure: { error in
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
            }
            self.showAlert(title: error.localizedDescription)
        })
    }
}



