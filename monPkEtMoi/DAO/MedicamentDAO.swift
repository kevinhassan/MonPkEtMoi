//
//  PriseExtension.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

extension Medicament{
    static func getAll() throws -> [Medicament] {
        let request: NSFetchRequest<Medicament> = Medicament.fetchRequest()
        do {
            let medicaments: [Medicament] = try CoreDataManager.context.fetch(request)
            return medicaments
        } catch let error as NSError {
            throw error
        }
    }
}
