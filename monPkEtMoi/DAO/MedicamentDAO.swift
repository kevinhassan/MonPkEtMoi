//
//  PriseExtension.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

protocol MedicamentDAO {
    func getAll() throws -> [Medicament]?
    func getByName(name: String) throws -> Medicament?
    func save(medicament: Medicament) throws
    func remove(medicament: Medicament) throws
}
