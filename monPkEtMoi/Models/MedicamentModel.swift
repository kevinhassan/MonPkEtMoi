//
//  MedicamentModel.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 19/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class MedicamentModel{
    private var descriptionMedicament: String?
    {
        get{
            return self.descriptionMedicament
        }
        set{
            self.descriptionMedicament = newValue
        }
    }
    private var dosageMedicament: [String]
    {
        get{
            return self.dosageMedicament
        }
        set{
            self.dosageMedicament = newValue
        }
    }
    private var nomMedicament: String
    {
        get{
            return self.nomMedicament
        }
        set{
            self.nomMedicament = newValue
        }
    }
    
    init(descriptionMedicament: String, dosageMedicament: [String], nomMedicament: String){
        self.descriptionMedicament = descriptionMedicament
        self.dosageMedicament = dosageMedicament
        self.nomMedicament = nomMedicament
    }
}
