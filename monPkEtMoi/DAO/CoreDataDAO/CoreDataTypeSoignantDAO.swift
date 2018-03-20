//
//  CoreDataTypeSoignantDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 17/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import CoreData
import UIKit
import Foundation

class CoreDataTypeSoignantDAO: TypeSoignantDAO {
    private let entityName: String = "TypeSoignant"
    private let dao: TypeSoignant
    
    init(){
        self.dao = TypeSoignant(entity: CoreDataManager.entity(forName: self.entityName), insertInto: CoreDataManager.context)
    }
    func get() throws -> [TypeSoignantModel]? {
        let request: NSFetchRequest<TypeSoignant> = NSFetchRequest(entityName: self.entityName)
        do {
            let typesSoignant: [TypeSoignant] = try CoreDataManager.context.fetch(request)
            let types: [TypeSoignantModel] = typesSoignant.map{(type: TypeSoignant) in
                return TypeSoignantModel(libelleTypeSoignant: type.libelleTypeSoignant!)
            }
            return types
        } catch let error as NSError {
            throw error
        }
    }

    func create(obj: TypeSoignantModel) throws {
        self.dao.libelleTypeSoignant = obj.libelleTypeSoignant
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw(error)
        }
    }
    func delete(obj: TypeSoignantModel) throws {
    }
    func update(obj: TypeSoignantModel) throws {
        do{
            try self.create(obj: obj)
        }catch let error as NSError{
            throw(error)
        }
    }
    func find() throws -> TypeSoignantModel? {
        return nil
    }
}
