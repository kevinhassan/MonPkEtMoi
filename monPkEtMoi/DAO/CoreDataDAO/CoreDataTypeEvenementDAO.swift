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
    internal static let instance: CoreDataTypeEvenementDAO = CoreDataTypeEvenementDAO()

    private init(){}

    func getAll() throws-> [TypeEvenement]?{
        let request: NSFetchRequest<TypeEvenement> = NSFetchRequest(entityName: self.entityName)
        do{
            let typesEvent:[TypeEvenement] = try CoreDataManager.context.fetch(request)
            return typesEvent
        }catch let error as NSError{
            throw error
        }
    }
    func getByName(typeEvenement: String) throws -> TypeEvenement?{
        let predicate: NSPredicate = NSPredicate(format: "libelleTypeEvenement == %@", typeEvenement)
        let request: NSFetchRequest<TypeEvenement> = NSFetchRequest(entityName: self.entityName)
        request.predicate = predicate
        do{
            let typesEvent:[TypeEvenement] = try CoreDataManager.context.fetch(request)
            if (typesEvent.count > 0) {
                return typesEvent[0]
            }
            return nil
        }catch let error as NSError{
            throw error
        }
    }
    func create() -> TypeEvenement{
        return TypeEvenement(context: CoreDataManager.context)
    }
    func save(typeEvenement: TypeEvenement) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
}
