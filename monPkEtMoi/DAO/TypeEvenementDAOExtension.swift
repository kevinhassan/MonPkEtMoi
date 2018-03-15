//
//  TypeEvenementDAOExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 14/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import CoreData
import UIKit
import Foundation

extension TypeEvenement{
    static func getAll() throws -> [TypeEvenement] {
        let request: NSFetchRequest<TypeEvenement> = TypeEvenement.fetchRequest()
        do {
            let typesEvenement: [TypeEvenement] = try CoreDataManager.context.fetch(request)
            return typesEvenement
        } catch let error as NSError {
            throw error
        }
    }
}
