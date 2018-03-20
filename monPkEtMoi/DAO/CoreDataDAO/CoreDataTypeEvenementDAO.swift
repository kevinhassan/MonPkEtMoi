//
//  CoreDataTypeEvenementDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

class CoreDataTypeEvenementDAO:TypeEvenementDAO{
    private let entityName: String = "TypeEvenement"
    private let dao: TypeEvenement
    
    init(){
        self.dao = TypeEvenement(entity: CoreDataManager.entity(forName: self.entityName), insertInto: CoreDataManager.context)
    }
    func create(obj: TypeEvenementModel) throws {
        self.dao.libelleTypeEvenement = obj.libelleTypeEvenement
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw(error)
        }
    }
    func delete(obj: TypeEvenementModel) throws {
    }
    func update(obj: TypeEvenementModel) throws {
        do{
            try self.create(obj: obj)
        }catch let error as NSError{
            throw(error)
        }
    }
    func find() throws -> TypeEvenementModel? {
        return nil
    }
    func get() throws -> [TypeEvenementModel] {
        let request: NSFetchRequest<TypeEvenement> = NSFetchRequest(entityName: self.entityName)
        do{
            let typesEvenement:[TypeEvenement] = try CoreDataManager.context.fetch(request)
            let typesEvenementModel: [TypeEvenementModel] = typesEvenement.map{(type) in
                return TypeEvenementModel(libelleTypeEvenement: type.libelleTypeEvenement!)
            }
            return typesEvenementModel
        }catch let error as NSError{
            throw error
        }
    }
    // TODO: A corriger
    func produce(obj: TypeEvenementModel) -> TypeEvenement{
        self.dao.libelleTypeEvenement = obj.libelleTypeEvenement
        return self.dao
    }
}
