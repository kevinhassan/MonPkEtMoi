//
//  EtatExtension.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

// MARK: -
/**
 Type Etat
 
 **libelleEtat**: Etat -> String
 */
extension Etat{
    
    /// Initialiser un `Etat`
    ///
    /// - Parameters:
    ///   - withLibelleEtat: `String` nom de l' `Etat`
    static func create(withLibelleEtat: String) throws -> Etat {
        let etat = Etat(context: CoreDataManager.context)
        
        etat.libelleEtat = withLibelleEtat
        
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return etat
    }
    /// Récupérer tous les types `Etat` en BD
    ///
    static func getAll() throws -> [Etat] {
        let request: NSFetchRequest<Etat> = Etat.fetchRequest()
        do {
            let etats: [Etat] = try CoreDataManager.context.fetch(request)
            return etats
        } catch let error as NSError {
            throw error
        }
    }
}

