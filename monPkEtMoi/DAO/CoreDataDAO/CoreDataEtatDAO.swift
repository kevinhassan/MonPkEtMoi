//
//  CoreDataEtatDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 17/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import CoreData
import UIKit
import Foundation

class CoreDataEtatDAO: EtatDAO {
    private let entityName: String = "Etat"
    private let dao: Etat

    init(){
        self.dao = Etat(entity: CoreDataManager.entity(forName: self.entityName), insertInto: CoreDataManager.context)
    }
    func get() throws -> [EtatModel]? {
        let request: NSFetchRequest<Etat> = NSFetchRequest(entityName: self.entityName)
        do {
            let etats: [Etat] = try CoreDataManager.context.fetch(request)
            let etat:[EtatModel] = etats.map{(et: Etat) in
                return EtatModel(libelleEtat: et.libelleEtat!)
            }
            return etat
        } catch let error as NSError {
            throw error
        }
    }
    
    func create(obj: EtatModel) throws {
        self.dao.libelleEtat = obj.libelleEtat
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw(error)
        }
    }
    func delete(obj: EtatModel) throws {
    }
    func update(obj: EtatModel) throws {
        do{
            try self.create(obj: obj)
        }catch let error as NSError{
            throw(error)
        }
    }
    func find() throws -> EtatModel? {
        return nil
    }
    
}
