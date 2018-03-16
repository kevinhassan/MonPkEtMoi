//
//  CoreDataEvenementDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

import Foundation
import CoreData

class CoreDataEvenementDAO: EvenementDAO{
    private let entityName: String = "Evenement"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }

    func getAll() throws -> [Evenement]? {
        let request: NSFetchRequest<Evenement> = NSFetchRequest(entityName: self.entityName)
        do{
            let events:[Evenement] = try self.context.fetch(request)
            return events
        }catch let error as NSError{
            throw error
        }
    }
    
    func create() -> Evenement{
        return Evenement(context: self.context)
    }
    
    func save(evenement event: Evenement) throws {
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
}
