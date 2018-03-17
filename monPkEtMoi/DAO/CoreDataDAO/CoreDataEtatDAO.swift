//
//  CoreDataEtatDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 17/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import CoreData
import UIKit
import Foundation

class CoreDataEtatDAO: EtatDAO {
    private let entityName: String = "Etat"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [Etat]? {
        let request: NSFetchRequest<Etat> = NSFetchRequest(entityName: self.entityName)
        do {
            let etats: [Etat] = try CoreDataManager.context.fetch(request)
            return etats
        } catch let error as NSError {
            throw error
        }
    }
    
    func create() -> Etat{
        return Etat(context: self.context)
    }
    func save(etat: Etat) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
}
