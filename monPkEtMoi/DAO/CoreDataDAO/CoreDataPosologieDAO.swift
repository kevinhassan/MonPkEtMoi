//
//  CoreDataPosologieDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 18/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

class CoreDataPosologieDAO: PosologieDAO{
    private let entityName: String = "Posologie"
    private let context: NSManagedObjectContext
    
    init(context:  NSManagedObjectContext){
        self.context = context
    }
    func getAll() throws -> [Posologie]? {
        let request: NSFetchRequest<Posologie> = NSFetchRequest(entityName: self.entityName)
        do {
            let types: [Posologie] = try CoreDataManager.context.fetch(request)
            return types
        } catch let error as NSError {
            throw error
        }
    }
    
    func create() -> Posologie{
        return Posologie(context: self.context)
    }
    func save(posologie: Posologie) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
}
