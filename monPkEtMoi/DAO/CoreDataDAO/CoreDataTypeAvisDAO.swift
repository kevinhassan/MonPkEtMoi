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
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [TypeAvis]? {
        let request: NSFetchRequest<TypeAvis> = NSFetchRequest(entityName: self.entityName)
        do {
            let types: [TypeAvis] = try CoreDataManager.context.fetch(request)
            return types
        } catch let error as NSError {
            throw error
        }
    }
    
    func create() -> TypeAvis{
        return TypeAvis(context: self.context)
    }
    func save(typeAvis: TypeAvis) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
}
