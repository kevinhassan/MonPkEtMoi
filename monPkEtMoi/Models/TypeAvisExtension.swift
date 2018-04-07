//
//  TypeAvisExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 20/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

// MARK: -
/**
 Type TypeAvis
 
 **libelleTypeAvis**: TypeAvis -> String
 */

extension TypeAvis{
    /// Initialiser un `TypeAvis`
    ///
    /// - Parameters:
    ///   - withLibelle: `String` nom associé au `TypeAvis`
    static func create(withLibelle: String) throws -> TypeAvis {
        let type = TypeAvis(context: CoreDataManager.context)
        
        type.libelleTypeAvis = withLibelle
        
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return type
    }
    /// Récupérer tous les types `TypeAvis` stockés
    static func getAll() throws -> [TypeAvis] {
        let request: NSFetchRequest<TypeAvis> = TypeAvis.fetchRequest()
        do {
            let types: [TypeAvis] = try CoreDataManager.context.fetch(request)
            return types
        } catch let error as NSError {
            throw error
        }
    }
}

