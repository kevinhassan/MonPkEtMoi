//
//  EvenementModel.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 19/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class EvenementModel{
    var dateEvenement: NSDate
    var descriptionEvenenement: String?
    
    init(dateEvenement: NSDate, descriptionEvenement: String?){
        self.dateEvenement = dateEvenement
        self.descriptionEvenenement = descriptionEvenement
    }
}
