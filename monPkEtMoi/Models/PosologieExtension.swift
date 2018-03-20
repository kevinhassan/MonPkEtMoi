//
//  PosologieExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 20/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

extension Posologie{
    static func create(withNbMedicament: Int16, withDosage: String, withDateDebut: NSDate, withDateFin: NSDate, withHeures: [NSDate], withMedicament: Medicament) throws -> Posologie {
        
        let posologie = Posologie(context: CoreDataManager.context)
        
        posologie.nbMedicament = withNbMedicament
        posologie.dosagePosologie = withDosage
        posologie.dateDebutPosologie = withDateDebut
        posologie.dateFinPosologie = withDateFin
        posologie.heuresPrise = withHeures
        posologie.concerneMedicament = withMedicament
        posologie.heuresPrise = withHeures
        
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return posologie
    }
    
    func edit(withNbMedicament: Int16?, withDosage: String?, withDateDebut: NSDate?, withDateFin: NSDate?, withHeures: [NSDate]?) {
        if let nbMedicament = withNbMedicament{
            self.nbMedicament = nbMedicament
        }
        if let dosagePosologie = withDosage{
            self.dosagePosologie = dosagePosologie
        }
        if let dateDebutPosologie = withDateDebut{
            self.dateDebutPosologie = dateDebutPosologie
        }
        if let dateFinPosologie = withDateFin{
            self.dateFinPosologie = dateFinPosologie
        }
        if let heuresPrise = withHeures{
            self.heuresPrise = heuresPrise
        }
    }
    static func get(withMedicament: Medicament) throws -> [Posologie]? {
        let predicate = NSPredicate(format: "concerneMedicament == %@", withMedicament)
        let request: NSFetchRequest<Posologie> = Posologie.fetchRequest()
        request.predicate = predicate
        do {
            let posologies: [Posologie]? = try CoreDataManager.context.fetch(request)
            return posologies
        } catch let error as NSError {
            throw error
        }
    }
    func delete() throws {
        do{
            CoreDataManager.context.delete(self)
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    
}
