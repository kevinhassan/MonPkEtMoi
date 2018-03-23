//
//  ActivitePrescriteTableViewCell.swift
//  monPkEtMoi
//
//  Created by Yves-alain Agbodjogbe on 22/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ActivitePrescriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var libelleActivitePrescrite: UILabel!
    @IBOutlet weak var dureePrescriteLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
