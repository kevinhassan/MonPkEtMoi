//
//  PosologieExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 20/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

// MARK: -
/**
 Type Posologie
 
 **nbMedicament**: Posologie -> Int16
 **dosagePosologie**: Posologie -> String
 **dateDebutPosologie**: Posologie -> NSDate
 **dateFinPosologie**: Posologie -> NSDate
 **heuresPrise**: Posologie -> [NSDate]
 **concerneMedicament**: Posologie -> Medicament
 */
extension Posologie{
    /// Initialiser une `Posologie`
    ///
    /// - Parameters:
    ///   - withNbMedicament: `Int16` nombre de médicament à prendre pour la `Posologie`
    ///   - withDosage:  `String` dosage de la `Posologie`
    ///   - withDateDebut: `NSDate` date de début de la `Posologie`
    ///   - withDateFin: `NSDate` date de fin de la `Posologie`
    ///   - withHeures: `[NSDate]` heures de prises de la `Posologie`
    ///   - withMedicament: `Medicament` médicament concerné par la `Posologie`
    static func create(withNbMedicament: Int16, withDosage: String, withDateDebut: NSDate, withDateFin: NSDate, withHeures: [NSDate], withMedicament: Medicament) throws -> Posologie {
        
        let posologie = Posologie(context: CoreDataManager.context)
        
        posologie.nbMedicament = withNbMedicament
        posologie.dosagePosologie = withDosage
        posologie.dateDebutPosologie = withDateDebut
        posologie.dateFinPosologie = withDateFin
        posologie.heuresPrise = withHeures
        posologie.concerneMedicament = withMedicament
        posologie.heuresPrise = withHeures
        
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return posologie
    }
    /// Editer les informations de la `Posologie`
    ///
    /// Modifier seulement l'information souhaitée
    /// - Parameters:
    ///   - withNbMedicament: `Int16?` nombre de médicament à prendre pour la `Posologie`
    ///   - withDosage:  `String?` dosage de la `Posologie`
    ///   - withDateDebut: `NSDate?` date de début de la `Posologie`
    ///   - withDateFin: `NSDate?` date de fin de la `Posologie`
    ///   - withHeures: `[NSDate]?` heures de prises de la `Posologie`
    func edit(withNbMedicament: Int16?, withDosage: String?, withDateDebut: NSDate?, withDateFin: NSDate?, withHeures: [NSDate]?) throws{
        if let nbMedicament = withNbMedicament{
            self.nbMedicament = nbMedicament
        }
        if let dosagePosologie = withDosage{
            self.dosagePosologie = dosagePosologie
        }
        if let dateDebutPosologie = withDateDebut{
            self.dateDebutPosologie = dateDebutPosologie
        }
        if let dateFinPosologie = withDateFin{
            self.dateFinPosologie = dateFinPosologie
        }
        if let heuresPrise = withHeures{
            self.heuresPrise = heuresPrise
        }
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    /// Récupérer les types `Posologie` du type`Medicament` en BD
    /// - Parameters:
    ///   - withMedicament: `Medicament` dont on veut les types `Posologie`
    static func get(withMedicament: Medicament) throws -> [Posologie]? {
        let predicate = NSPredicate(format: "concerneMedicament == %@", withMedicament)
        let request: NSFetchRequest<Posologie> = Posologie.fetchRequest()
        request.predicate = predicate
        do {
            let posologies: [Posologie]? = try CoreDataManager.context.fetch(request)
            return posologies
        } catch let error as NSError {
            throw error
        }
    }
    /// Récupérer tous les types `RDV` sans condition
    static func getAll() throws -> [Posologie] {
        let request: NSFetchRequest<Posologie> = Posologie.fetchRequest()
        do {
            let posologies: [Posologie] = try CoreDataManager.context.fetch(request)
            return posologies
        } catch let error as NSError {
            throw error
        }
    }

    /// Récupérer tous les types `Médicament` ayant une posologie dont la date de fin n'est pas dépassée
    static func getAllMedicamentPrescrit() throws -> [Medicament]{
        let predicate: NSPredicate = NSPredicate(format: "dateFinPosologie > %@", NSDate())
        let request: NSFetchRequest<Posologie> = Posologie.fetchRequest()
        request.predicate = predicate
        do{
            let posologies:[Posologie] = try CoreDataManager.context.fetch(request)
            let medicaments:[Medicament] = posologies.map{$0.concerneMedicament!}
            return medicaments
        }catch let error as NSError{
            throw error
        }
    }
    
    /// Supprimer une `Posologie`
    func delete() throws {
        do{
            CoreDataManager.context.delete(self)
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
}
