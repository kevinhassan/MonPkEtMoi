//
//  CoreDataTypeEvenementDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

class CoreDataTypeEvenementDAO: TypeEvenementDAO{
    private let entityName: String = "TypeEvenement"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }

    func getAll() throws-> [TypeEvenement]?{
        let request: NSFetchRequest<TypeEvenement> = NSFetchRequest(entityName: self.entityName)
        do{
            let typesEvent:[TypeEvenement] = try self.context.fetch(request)
            return typesEvent
        }catch let error as NSError{
            throw error
        }
    }
}
