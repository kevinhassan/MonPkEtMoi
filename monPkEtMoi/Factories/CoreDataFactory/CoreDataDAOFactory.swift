//
//  CoreDataDAOFactory.swift
//  monPkEtMoi
//
//  Created by macOS on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class CoreDataDAOFactory: ProtocolDAOFactory{
    
    private static var instance: CoreDataDAOFactory = CoreDataDAOFactory()
    
    private init(){
        
    }
    static func getInstance() -> CoreDataDAOFactory{
        return CoreDataDAOFactory.instance
    }
    func getPatientDAO() -> PatientDAO {
        return CoreDataPatientDAO()
    }
}
