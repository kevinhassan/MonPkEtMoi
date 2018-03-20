//
//  EvenementExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 20/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

extension Evenement{
    static func create(withDescription: String, withDate: NSDate, withType: TypeEvenement) throws -> Etat {
        let evenement = Evenement(context: CoreDataManager.context)
        
        evenement.descriptionEvenement = withDescription
        evenement.dateEvenement = withDate
        evenement.avoirType = withType
        
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return evenement
    }
    
    static func getAll() throws -> [Evenement] {
        let request: NSFetchRequest<Evenement> = Evenement.fetchRequest()
        do {
            let evenement: [Evenement] = try CoreDataManager.context.fetch(request)
            return evenement
        } catch let error as NSError {
            throw error
        }
    }
}


