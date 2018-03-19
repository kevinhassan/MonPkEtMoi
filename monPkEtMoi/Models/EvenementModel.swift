//
//  EvenementModel.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 19/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class EvenementModel{
    private var dateEvenement: NSDate
    private var descriptionEvenenement: String?
    
    init(dateEvenement: NSDate, descriptionEvenement: String?){
        self.dateEvenement = dateEvenement
        self.descriptionEvenenement = descriptionEvenement
    }
}
