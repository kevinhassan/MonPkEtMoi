//
//  PosologieModel.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 19/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class PosologieModel{
    var dateDebutPosologie: NSDate
    var dateFinPosologie: NSDate
    var dosagePosologie: [String]
    var heuresPrise: [NSDate]
    var nbMedicament: Int16
    
    init(dateDebutPosologie: NSDate, dateFinPosologie: NSDate, dosagePosologie: [String], heuresPrise: [NSDate], nbMedicament: Int16){
        self.dateDebutPosologie = dateDebutPosologie
        self.dateFinPosologie = dateFinPosologie
        self.dosagePosologie = dosagePosologie
        self.heuresPrise = heuresPrise
        self.nbMedicament = nbMedicament
    }
}
