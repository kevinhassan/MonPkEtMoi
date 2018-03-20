//
//  CoreDataMedicamentDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 17/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

class CoreDataMedicamentDAO: MedicamentDAO {
    private let entityName: String = "Medicament"
    internal static let instance: CoreDataMedicamentDAO = CoreDataMedicamentDAO()

    private init(){}

    func getAll() throws -> [Medicament]? {
        let request: NSFetchRequest<Medicament> = NSFetchRequest(entityName: self.entityName)
        let sort = NSSortDescriptor(key: #keyPath(Medicament.nomMedicament), ascending: true)
        request.sortDescriptors = [sort]
        do {
            let medicaments: [Medicament] = try CoreDataManager.context.fetch(request)
            return medicaments
        } catch let error as NSError {
            throw error
        }
    }
    func create() -> Medicament{
        return Medicament(context: CoreDataManager.context)
    }
    func save(medicament: Medicament) throws{
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    func remove(medicament: Medicament) throws{
        do{
            CoreDataManager.context.delete(medicament)
            try CoreDataManager.context.save()
        }catch let error as NSError{
            throw error
        }
    }
    func getByName(name: String) throws -> Medicament? {
        let predicate = NSPredicate(format: "nomMedicament == %@", name)
        let request: NSFetchRequest<Medicament> = NSFetchRequest(entityName: self.entityName)
        request.predicate = predicate

        do{
            let medicaments: [Medicament] = try CoreDataManager.context.fetch(request)
            if medicaments.count>0{
                return medicaments[0]
            }else{
                return nil
            }
        }catch let error as NSError{
            throw error
        }
    }
}
