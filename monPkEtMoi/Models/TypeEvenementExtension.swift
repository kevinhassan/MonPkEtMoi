//
//  TypeEvenementExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 20/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

extension TypeEvenement{
    static func create(withLibelle: String) throws -> TypeEvenement {
        let type = TypeEvenement(context: CoreDataManager.context)
        
        type.libelleTypeEvenement = withLibelle
        
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return type
    }
    
    static func getAll() throws -> [TypeEvenement] {
        let request: NSFetchRequest<TypeEvenement> = TypeEvenement.fetchRequest()
        do {
            let types: [TypeEvenement] = try CoreDataManager.context.fetch(request)
            return types
        } catch let error as NSError {
            throw error
        }
    }
}

