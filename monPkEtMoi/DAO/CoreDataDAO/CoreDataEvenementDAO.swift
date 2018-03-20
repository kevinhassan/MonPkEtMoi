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
    internal static let instance: CoreDataEvenementDAO = CoreDataEvenementDAO()

    private init(){}
    
    func getAll() throws -> [Evenement]? {
        let request: NSFetchRequest<Evenement> = NSFetchRequest(entityName: self.entityName)
        do{
            let events:[Evenement] = try CoreDataManager.context.fetch(request)
            return events
        }catch let error as NSError{
            throw error
        }
    }
    
    func create() -> Evenement{
        return Evenement(context: CoreDataManager.context)
    }
    
    func save(evenement event: Evenement) throws {
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
}
