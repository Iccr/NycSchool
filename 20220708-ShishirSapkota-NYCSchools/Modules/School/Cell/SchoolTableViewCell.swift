//
//  SchoolTableViewCell.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/8/22.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
