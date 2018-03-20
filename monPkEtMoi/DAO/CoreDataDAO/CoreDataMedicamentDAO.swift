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
    private let dao: Medicament
    
    init(){
        self.dao = Medicament(entity: CoreDataManager.entity(forName: self.entityName), insertInto: CoreDataManager.context)
    }
    func create(obj: MedicamentModel) throws {
        self.dao.descriptionMedicament = obj.descriptionMedicament
        self.dao.dosageMedicament = obj.dosageMedicament
        self.dao.nomMedicament = obj.nomMedicament
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw(error)
        }
    }
    func delete(obj: MedicamentModel) throws {
    }
    func update(obj: MedicamentModel) throws {
        do{
            try self.create(obj: obj)
        }catch let error as NSError{
            throw(error)
        }
    }
    func find() throws -> MedicamentModel? {
        return nil
    }
    func get() throws -> [MedicamentModel]{
        let request: NSFetchRequest<Medicament> = NSFetchRequest(entityName: self.entityName)
        do{
            let medocs:[Medicament] = try CoreDataManager.context.fetch(request)
            let medicaments:[MedicamentModel] = medocs.map{(medicament) in
                return MedicamentModel(descriptionMedicament: medicament.descriptionMedicament, dosageMedicament: medicament.dosageMedicament!, nomMedicament: medicament.nomMedicament!)
            }
            return medicaments
        }catch let error as NSError{
            throw error
        }
    }
    // TODO: A corriger
    func produce(obj: MedicamentModel) -> Medicament{
        self.dao.descriptionMedicament = obj.descriptionMedicament
        self.dao.dosageMedicament = obj.dosageMedicament
        self.dao.nomMedicament = obj.nomMedicament
        return self.dao
    }
}
