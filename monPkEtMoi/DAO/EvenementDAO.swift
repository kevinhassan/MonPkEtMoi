//
//  EvenementDAOExtension.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 14/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Evenement{
    static func getAll() throws -> [Evenement]{
        let request: NSFetchRequest<Evenement> = Evenement.fetchRequest()
        do {
            let events: [Evenement] = try CoreDataManager.context.fetch(request)
            return events
        } catch let error as NSError {
            throw error
        }
    }
}
