//
//  PriseExtension.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 24/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

// MARK: -
/**
 Type Prise
 
 **estPris**: Prise -> Boolean
 **heurePrise**: Prise -> NSDate
 **concernePosologie**: Prise -> Posologie
 */
extension Prise{
    /// Initialiser une `Prise`
    ///
    /// - Parameters:
    ///   - withHeurePrise:  `NSDate` heure du type `Prise`
    ///   - withPosologie: `Posologie` posologie concerné par le type `Prise`
    static func create(withHeurePrise: NSDate, withPosologie: Posologie) throws -> Prise {
        let prise = Prise(context:CoreDataManager.context)
        prise.heurePrise = withHeurePrise
        prise.concernePosologie = withPosologie
        prise.estPris = false
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return prise
    }
    // Prendre toutes les prises d'une posologie pour aujourd'hui
    static func getAllPrisesPosologieToday(posologie: Posologie) throws -> [Prise] {
        let predicate: NSPredicate = NSPredicate(format: "concernePosologie == %@ AND estPris == %@ AND heurePrise > %@ AND heurePrise < %@", posologie, false as CVarArg, DateHelper.startOfDay(day: NSDate()), DateHelper.endOfDay(day: NSDate()))
        let request: NSFetchRequest<Prise> = Prise.fetchRequest()
        request.predicate = predicate
        do{
            let prises:[Prise] = try CoreDataManager.context.fetch(request)
            return prises
        }catch let error as NSError{
            throw error
        }
    }
    // Prendre toutes les prises d'une posologie pour 6 mois en retard (marge de 15 minute)
    static func getAllPrisesPosologieSixMonthInLate(posologie: Posologie) throws -> [Prise] {
        let predicate: NSPredicate = NSPredicate(format: "concernePosologie == %@ AND estPris == %@", posologie, true as CVarArg)
        let request: NSFetchRequest<Prise> = Prise.fetchRequest()
        request.predicate = predicate
        do{
            var prises:[Prise] = try CoreDataManager.context.fetch(request)
            // ne récupérer que les prises où l'heure de prise est dépassée de 15 minutes
            prises = prises.filter{(prise) in
                return Calendar.current.date(byAdding: .minute, value: 15, to: prise.heurePrise! as Date)! < (prise.heureReelle! as Date)
            }
            return prises
        }catch let error as NSError{
            throw error
        }
    }
    // Compter le nombre de prise journalière pour un médicament
    static func countPriseJourMedicament(medicament: Medicament) -> Int {
        do{
            // posologie du médicament à prendre
            guard let posologieMedicament = try Posologie.get(withMedicament: medicament) else{
                return 0
            }
            // récupérer les prises associées à la posologie d'aujourd'hui
            let prises:[Prise] = try self.getAllPrisesPosologieToday(posologie: posologieMedicament)
            return prises.count
        }catch{
            return 0
        }
    }
    /// Passer la prise a effectuée
    func realiserPrise() throws{
        self.estPris = true
        self.heureReelle = NSDate()
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    // Compter le nombre de prise où le patient a pris en retard son médicament
    static func countPriseRetard(medicament: Medicament) -> Int {
        do{
            // posologie du médicament à prendre
            guard let posologieMedicament = try Posologie.get(withMedicament: medicament) else{
                return 0
            }
            // récupérer les prises associées à la posologie d'aujourd'hui
            let prises:[Prise] = try self.getAllPrisesPosologieSixMonthInLate(posologie: posologieMedicament)
            return prises.count
        }catch{
            return 0
        }
    }
}
