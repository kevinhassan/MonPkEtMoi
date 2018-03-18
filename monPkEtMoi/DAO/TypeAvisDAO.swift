//
//  TypeAvisDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 17/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import CoreData
import UIKit
import Foundation

protocol TypeAvisDAO {
    func getAll() throws-> [TypeAvis]?
    func save(typeAvis: TypeAvis) throws
    
}



