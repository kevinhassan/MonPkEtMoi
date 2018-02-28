//
//  ContactMedicTableViewCell.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 28/02/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ContactMedicTableViewCell: UITableViewCell {

    @IBOutlet weak var nameMedic: UILabel!
    @IBOutlet weak var prenomMedic: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
