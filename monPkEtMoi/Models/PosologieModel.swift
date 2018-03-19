//
//  PosologieModel.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 19/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class PosologieModel{
    private var dateDebutPosologie: NSDate
    private var dateFinPosologie: NSDate
    private var dosagePosologie: [String]
    private var heuresPrise: [NSDate]
    private var nbMedicament: Int16
    
    init(dateDebutPosologie: NSDate, dateFinPosologie: NSDate, dosagePosologie: [String], heuresPrise: [NSDate], nbMedicament: Int16){
        self.dateDebutPosologie = dateDebutPosologie
        self.dateFinPosologie = dateFinPosologie
        self.dosagePosologie = dosagePosologie
        self.heuresPrise = heuresPrise
        self.nbMedicament = nbMedicament
    }
}
