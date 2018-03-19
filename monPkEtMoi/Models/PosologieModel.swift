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
    {
        get{
            return self.dateDebutPosologie
        }
        set{
            self.dateDebutPosologie = newValue
        }
    }
    private var dateFinPosologie: NSDate
    {
        get{
            return self.dateFinPosologie
        }
        set{
            self.dateFinPosologie = newValue
        }
    }
    private var dosagePosologie: [String]
    {
        get{
            return self.dosagePosologie
        }
        set{
            self.dosagePosologie = newValue
        }
    }
    private var heuresPrise: [NSDate]
    {
        get{
            return self.heuresPrise
        }
        set{
            self.heuresPrise = newValue
        }
    }
    private var nbMedicament: Int16
    {
        get{
            return self.nbMedicament
        }
        set{
            self.nbMedicament = newValue
        }
    }
    
    init(dateDebutPosologie: NSDate, dateFinPosologie: NSDate, dosagePosologie: [String], heuresPrise: [NSDate], nbMedicament: Int16){
        self.dateDebutPosologie = dateDebutPosologie
        self.dateFinPosologie = dateFinPosologie
        self.dosagePosologie = dosagePosologie
        self.heuresPrise = heuresPrise
        self.nbMedicament = nbMedicament
    }
}
