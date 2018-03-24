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
    /// Récupérer le type `Posologie` du type`Medicament` en BD qui est toujours d'actualité
    /// - Parameters:
    ///   - withMedicament: `Medicament` dont on veut les types `Posologie`
    static func get(withMedicament: Medicament) throws -> Posologie? {
        let predicate = NSPredicate(format: "concerneMedicament == %@ AND dateFinPosologie > %@", withMedicament, NSDate())
        let request: NSFetchRequest<Posologie> = Posologie.fetchRequest()
        request.predicate = predicate
        do {
            let posologies: [Posologie]? = try CoreDataManager.context.fetch(request)
            return posologies?.first
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
            print(posologies.count)
            let medicaments:[Medicament] = posologies.map{$0.concerneMedicament!}
            print(medicaments.count)
            return medicaments
        }catch let error as NSError{
            throw error
        }
    }
    // Prendre toutes les prises d'une posologie pour aujourd'hui
    static func getAllPrisesPosologie(posologie: Posologie) throws -> [Prise] {
        let predicate: NSPredicate = NSPredicate(format: "concernePosologie == %@", posologie)
        let request: NSFetchRequest<Prise> = Prise.fetchRequest()
        request.predicate = predicate
        do{
            let prises:[Prise] = try CoreDataManager.context.fetch(request)
            return prises
        }catch let error as NSError{
            throw error
        }
    }
    // compter le nombre de prise journalière pour un médicament
    static func countPriseJourMedicament(medicament: Medicament) -> Int {
        do{
            // posologie du médicament à prendre
            let posologieMedicament:Posologie = (try Posologie.get(withMedicament: medicament))!
            // récupérer les prises associées à la posologie d'aujourd'hui
            let prises:[Prise] = try Posologie.getAllPrisesPosologie(posologie: posologieMedicament)
            return prises.count
        }catch{
            return 0
        }

    }
    
    func generatePrises(){
        let calendar = NSCalendar.current
        let date1 = calendar.startOfDay(for: (self.dateDebutPosologie! as? Date)!)
        let date2 = calendar.startOfDay(for: (self.dateFinPosologie! as? Date)!)
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        print(components.day)
        
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
