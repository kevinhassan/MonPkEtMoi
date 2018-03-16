//
//  CoreDataDAOFactory.swift
//  monPkEtMoi
//
//  Created by macOS on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

class CoreDataDAOFactory: ProtocolDAOFactory{
    
    private static var instance: CoreDataDAOFactory?
    private let context: NSManagedObjectContext = CoreDataManager.context
    
    private init(){}
    static func getInstance() -> CoreDataDAOFactory{
        guard let instanceFactory = CoreDataDAOFactory.instance else {
            return CoreDataDAOFactory()
        }
        return instanceFactory
    }
    func getPatientDAO() -> CoreDataPatientDAO {
        return CoreDataPatientDAO(context: self.context)
    }
}
