//
//  EvenementExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 20/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

// MARK: -
/**
 Type Evenement
 
 **description**: Evenement -> String?
 **avoirType**: Evenement -> TypeEvenement
 **date**: Evenement -> NSDate
 */
extension Evenement{
    
    /// Initialiser un `Evenement`
    ///
    /// - Parameters:
    ///   - withDescription: `String?` description de l' `Evenement`
    ///   - withDate: `NSDate` date de l' `Evenement`
    ///   - withType: `TypeEvenement` type de l' `Evenement`
    static func create(withDescription: String?, withDate: NSDate, withType: TypeEvenement) throws -> Evenement {
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
    /// Récupérer tous les types `Evenement`en BD
    static func getAll() throws -> [Evenement] {
        let request: NSFetchRequest<Evenement> = Evenement.fetchRequest()
        do {
            let evenement: [Evenement] = try CoreDataManager.context.fetch(request)
            return evenement
        } catch let error as NSError {
            throw error
        }
    }
    
    /// Récupérer tous les évenements survenus avant 6 mois à partir d'aujourd'hui dans l'ordre ascendant
    static func getAllSixMonth() throws -> [Evenement] {
        let date = Calendar.current.date(byAdding: .month, value: -6, to: Date())
        let predicate = NSPredicate(format: "dateEvenement >= %@ AND dateEvenement =< %@", date! as NSDate, NSDate())
        let request: NSFetchRequest<Evenement> = Evenement.fetchRequest()
        request.predicate = predicate
        request.sortDescriptors = [NSSortDescriptor(key: "dateEvenement", ascending: true)]
        do {
            let evenements: [Evenement] = try CoreDataManager.context.fetch(request)
            return evenements
        } catch let error as NSError {
            throw error
        }
    }
    /// Compter les évenements survenus avant 6 mois à partir d'aujourd'hui
    static func countSixMonth() throws -> Int {
        do {
            let evenements: [Evenement] = try getAllSixMonth()
            return evenements.count
        } catch let error as NSError {
            throw error
        }
    }
}


