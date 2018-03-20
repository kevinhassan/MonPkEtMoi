//
//  CoreDataPosologieDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 18/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

class CoreDataPosologieDAO: PosologieDAO{
    private let entityName: String = "Posologie"
    private let dao: Posologie
    
    init(){
        self.dao = Posologie(entity: CoreDataManager.entity(forName: self.entityName), insertInto: CoreDataManager.context)
    }
    func create(obj: PosologieModel) throws{
        let medicamentDAO = CoreDataMedicamentDAO()

        self.dao.dateDebutPosologie = obj.dateDebutPosologie
        self.dao.dateFinPosologie = obj.dateFinPosologie
        self.dao.heuresPrise = obj.heuresPrise
        self.dao.concerneMedicament = medicamentDAO.produce(obj: obj.medicament!)
        self.dao.nbMedicament = obj.nbMedicament
        self.dao.dosagePosologie = obj.dosagePosologie
        
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw(error)
        }
    }
    func delete(obj: PosologieModel) throws {
    }
    func update(obj: PosologieModel) throws {
        do{
            try self.create(obj: obj)
        }catch let error as NSError{
            throw(error)
        }
    }
    func find() throws -> PosologieModel? {
        return nil
    }
}
