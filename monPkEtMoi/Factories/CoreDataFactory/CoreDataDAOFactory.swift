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
    
    private static var instance: CoreDataDAOFactory = CoreDataDAOFactory()
    private let context: NSManagedObjectContext = CoreDataManager.context
    
    private init(){
        
    }
    static func getInstance() -> CoreDataDAOFactory{
        return CoreDataDAOFactory.instance
    }
    func getPatientDAO() -> PatientDAO {
        return CoreDataPatientDAO(context: self.context)
    }
}
