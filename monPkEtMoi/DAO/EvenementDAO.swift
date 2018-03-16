//
//  EvenementDAO.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 14/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData
import UIKit

import Foundation

protocol EvenementDAO {
    func getAll() throws-> [Evenement]?
    func save(evenement: Evenement) throws
}

