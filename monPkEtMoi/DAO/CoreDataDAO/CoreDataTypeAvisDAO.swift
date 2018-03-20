//
//  CoreDataTypeAvisDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 17/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

class CoreDataTypeAvisDAO: TypeAvisDAO{
    private let entityName: String = "TypeAvis"
    private let dao: TypeAvis
    
    init(){
        self.dao = TypeAvis(entity: CoreDataManager.entity(forName: self.entityName), insertInto: CoreDataManager.context)
    }
    func get() throws -> [TypeAvisModel]? {
        let request: NSFetchRequest<TypeAvis> = NSFetchRequest(entityName: self.entityName)
        do {
            let etats: [TypeAvis] = try CoreDataManager.context.fetch(request)
            let etat:[TypeAvisModel] = etats.map{(type: TypeAvis) in
                return TypeAvisModel(libelleTypeAvis: type.libelleTypeAvis!)
            }
            return etat
        } catch let error as NSError {
            throw error
        }
    }

    func create(obj: TypeAvisModel) throws {
        self.dao.libelleTypeAvis = obj.libelleTypeAvis
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw(error)
        }
    }
    func delete(obj: TypeAvisModel) throws {
    }
    func update(obj: TypeAvisModel) throws {
        do{
            try self.create(obj: obj)
        }catch let error as NSError{
            throw(error)
        }
    }
    func find() throws -> TypeAvisModel? {
        return nil
    }

}
