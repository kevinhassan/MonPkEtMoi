//
//  ActivitePrescriteExtension.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 21/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

extension ActivitePrescrite{
    static func create(withType: TypeActivite, withDuree: Int16, withDateD: NSDate, withDateF: NSDate) throws -> ActivitePrescrite {
        let newActivitePrescrite = ActivitePrescrite(context: CoreDataManager.context)
        newActivitePrescrite.dateFin = withDateF
        newActivitePrescrite.dateDebut = withDateD
        newActivitePrescrite.dureeActivite = withDuree
        newActivitePrescrite.avoirType = withType
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return newActivitePrescrite
    }
    
    static func getAll() throws -> [ActivitePrescrite] {
        let request: NSFetchRequest<ActivitePrescrite> = ActivitePrescrite.fetchRequest()
        do {
            let activites: [ActivitePrescrite] = try CoreDataManager.context.fetch(request)
            return activites
        } catch let error as NSError {
            throw error
        }
    }

}