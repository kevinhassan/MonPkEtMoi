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
    private var dosageMedicament: [String]
    private var nomMedicament: String
    
    init(descriptionMedicament: String, dosageMedicament: [String], nomMedicament: String){
        self.descriptionMedicament = descriptionMedicament
        self.dosageMedicament = dosageMedicament
        self.nomMedicament = nomMedicament
    }
}
