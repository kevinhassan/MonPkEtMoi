//
//  TypeSoignantExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 20/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//
import Foundation
import CoreData

extension TypeSoignant{
    static func create(withLibelle: String) throws -> TypeSoignant {
        let type = TypeSoignant(context: CoreDataManager.context)
        
        type.libelleTypeSoignant = withLibelle
        
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return type
    }
    
    static func getAll() throws -> [TypeSoignant] {
        let request: NSFetchRequest<TypeSoignant> = TypeSoignant.fetchRequest()
        do {
            let types: [TypeSoignant] = try CoreDataManager.context.fetch(request)
            return types
        } catch let error as NSError {
            throw error
        }
    }
    
    static func getByName(withName name: String) throws -> TypeSoignant? {
        let libelleTS = name
    
        let request: NSFetchRequest<TypeSoignant> = TypeSoignant.fetchRequest()
        request.predicate = NSPredicate(format: "libelleTypeSoignant == %@", libelleTS)
        do {
            let types: [TypeSoignant] = try CoreDataManager.context.fetch(request)
            return types.first
        } catch let error as NSError {
            throw error
        }
    }
}


