//
//  ScoreTableViewCell.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/9/22.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var satTestTakersLabel: UILabel!
    @IBOutlet weak var satCriticalReadingScoreLabel: UILabel!
    @IBOutlet weak var satMathScoreLabel: UILabel!
    @IBOutlet weak var satWritingScoreLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
