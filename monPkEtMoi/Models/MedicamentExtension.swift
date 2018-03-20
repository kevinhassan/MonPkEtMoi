//
//  MedicamentExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 20/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//
import Foundation
import CoreData

extension Medicament{
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
    
    func edit(withDescription: String?, withNom: String?, withDosage: [String]?) {
        if let description = withDescription{
            self.descriptionMedicament = description
        }
        if let nom = withNom{
            self.nomMedicament = nom
        }
        if let dosage = withDosage{
            self.dosageMedicament = dosage
        }
    }
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
    static func getAll() throws -> [Medicament] {
        let request: NSFetchRequest<Medicament> = Medicament.fetchRequest()
        do {
            let medicaments: Medicament? = try CoreDataManager.context.fetch(request)
            return medicaments
        } catch let error as NSError {
            throw error
        }
    }
    func delete() throws {
        do{
            CoreDataManager.context.delete(self)
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }

}
