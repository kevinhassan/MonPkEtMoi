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
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [TypeSoignant]? {
        let request: NSFetchRequest<TypeSoignant> = NSFetchRequest(entityName: self.entityName)
        do {
            let etats: [TypeSoignant] = try CoreDataManager.context.fetch(request)
            return etats
        } catch let error as NSError {
            throw error
        }
    }

    func create() -> TypeSoignant{
        return TypeSoignant(context: self.context)
    }
    func save(typeSoignant: TypeSoignant) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
}
