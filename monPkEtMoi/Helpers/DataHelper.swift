//
//  DataHelper.swift
//  monPkEtMoi
//
//  Created by macOS on 17/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

public class DataHelper {
    
    static func seedDataStore() {
        seedMedicament()
    }
    fileprivate static func seedMedicament(){
        let medicaments = MedicamentSeed().medicaments
        let medicamentDAO = CoreDataDAOFactory.getInstance().getMedicamentDAO()

        for medicament in medicaments {
            let newMedicament: Medicament = medicamentDAO.create()
            newMedicament.nomMedicament = medicament.nom
            newMedicament.dosageMedicament = medicament.doses
            do{
                try medicamentDAO.save(medicament: newMedicament)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
}
