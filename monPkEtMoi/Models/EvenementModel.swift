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
    var typeEvenement: TypeEvenementModel
    
    init(dateEvenement: NSDate, descriptionEvenement: String?, typeEvenement: TypeEvenementModel){
        self.dateEvenement = dateEvenement
        self.descriptionEvenenement = descriptionEvenement
        self.typeEvenement = typeEvenement
    }
}
