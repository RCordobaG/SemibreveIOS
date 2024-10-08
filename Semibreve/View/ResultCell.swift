//
//  ResultCellTableViewCell.swift
//  Semibreve
//
//  Created by Rodrigo Córdoba on 03/08/24.
//

import UIKit

class ResultCell: UITableViewCell {

    
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var IncorrectAnswerLabel: UILabel!
    @IBOutlet weak var CorrectAnswersLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
