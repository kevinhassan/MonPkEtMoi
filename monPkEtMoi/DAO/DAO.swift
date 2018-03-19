//
//  DAO.swift
//  monPkEtMoi
//
//  Created by macOS on 19/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

protocol DAO {
    associatedtype T
    
    func create(obj: T) -> Bool
    func delete(obj: T) -> Bool
    func update(obj: T) -> Bool
    func find() -> T?
}
