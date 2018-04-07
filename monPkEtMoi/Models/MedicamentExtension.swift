//
//  MedicamentExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 20/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//
import Foundation
import CoreData

// MARK: -
/**
 Type Medicament
 
 **descriptionMedicament**: Medicament -> String?
 **nomMedicament**: Medicament -> String
 **dosageMedicament**: Medicament -> [String]?
 */
extension Medicament{
    
    /// Initialiser un `Medicament`
    ///
    /// - Parameters:
    ///   - descriptionMedicament: `String?`description du `Medicament`
    ///   - nomMedicament: `String` nom du `Medicament`
    ///   - dosageMedicament: Medicament -> `[String]?` dosage associé au `Medicament`
    static func create(withDescription: String?, withNom: String, withDosage: [String]?) throws -> Medicament {
        
        let medicament = Medicament(context: CoreDataManager.context)
        
        medicament.descriptionMedicament = withDescription
        medicament.nomMedicament = withNom
        medicament.dosageMedicament = withDosage
        
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return medicament
    }
    
    /// Editer les informations du `Medicament`
    ///
    /// Mettre à jours seulement l'information souhaitée
    ///
    /// - Parameters:
    ///   - withDescription: `String?` description du `Medicament`
    ///   - withNom:  `String?` nom du `Medicament`
    ///   - withDosage: `[String]?` dosage du `Medicament`
    func edit(withDescription: String?, withNom: String?, withDosage: [String]?) throws{
        if let description = withDescription{
            self.descriptionMedicament = description
        }
        if let nom = withNom{
            self.nomMedicament = nom
        }
        if let dosage = withDosage{
            self.dosageMedicament = dosage
        }
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    /// Editer les informations du `Medicament`
    ///
    /// Récupérer les médicaments correspondant au nom passé en paramètre
    ///
    /// - Parameters:
    ///   - withNom: `String` nom `Medicament` recherché
    static func get(withNom: String) throws -> Medicament? {
        let predicate = NSPredicate(format: "nomMedicament == %@", withNom)
        let request: NSFetchRequest<Medicament> = Medicament.fetchRequest()
        request.predicate = predicate
        do {
            let medicament: Medicament? = try CoreDataManager.context.fetch(request).first
            return medicament
        } catch let error as NSError {
            throw error
        }
    }
    /// Récupérer tous les types `Medicament` stockés
    static func getAll() throws -> [Medicament] {
        let request: NSFetchRequest<Medicament> = Medicament.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "nomMedicament", ascending: true)]
        do {
            let medicaments: [Medicament] = try CoreDataManager.context.fetch(request)
            return medicaments
        } catch let error as NSError {
            throw error
        }
    }
    /// Supprimer le `Medicament`
    func delete() throws {
        do{
            CoreDataManager.context.delete(self)
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }

}
