//
//  CoreDataEvenementDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

class CoreDataEvenementDAO: EvenementDAO{
    private let entityName: String = "Evenement"
    private let dao: Evenement
    
    init(){
        self.dao = Evenement(entity: CoreDataManager.entity(forName: self.entityName), insertInto: CoreDataManager.context)
    }
    func create(obj: EvenementModel) throws {
        let typeEvenementDAO = CoreDataTypeEvenementDAO()
        self.dao.avoirType = typeEvenementDAO.produce(obj: obj.typeEvenement)
        self.dao.dateEvenement = obj.dateEvenement
        self.dao.descriptionEvenement = obj.descriptionEvenenement
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw(error)
        }
    }
    func delete(obj: EvenementModel) throws {
    }
    func update(obj: EvenementModel) throws {
        do{
            try self.create(obj: obj)
        }catch let error as NSError{
            throw(error)
        }
    }
    func find() throws -> EvenementModel? {
        return nil
    }
}
