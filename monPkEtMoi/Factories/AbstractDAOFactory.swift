//
//  AbstractDAOFactory.swift
//  monPkEtMoi
//
//  Created by macOS on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class AbstractDAOFactory {
    static func getInstance(type: TypeFactory){
        switch type {
            case .CoreData:
                return CoreDataDAOFactory.getInstance()
            default:
                return CoreDataDAOFactory.getInstance()
        }
    }
}


