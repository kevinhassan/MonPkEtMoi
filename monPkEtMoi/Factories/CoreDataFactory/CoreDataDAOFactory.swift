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
    typealias A = CoreDataPatientDAO
    typealias B = CoreDataEvenementDAO
    typealias C = CoreDataTypeEvenementDAO
    typealias D = CoreDataMedicamentDAO
    typealias E = CoreDataTypeSoignantDAO
    typealias F = CoreDataEtatDAO
    typealias G = CoreDataTypeAvisDAO
    typealias H = CoreDataPosologieDAO
    
    
    private static var instance: CoreDataDAOFactory?
    
    private init(){}
    
    static func getInstance() -> CoreDataDAOFactory{
        guard let instanceFactory = CoreDataDAOFactory.instance else {
            return CoreDataDAOFactory()
        }
        return instanceFactory
    }
    func getPatientDAO() -> CoreDataPatientDAO {
        return CoreDataPatientDAO()
    }
    func getEvenementDAO() -> CoreDataEvenementDAO {
        return CoreDataEvenementDAO()
    }
    func getTypeEvenementDAO() -> CoreDataTypeEvenementDAO {
        return CoreDataTypeEvenementDAO()
    }
    func getMedicamentDAO() -> CoreDataMedicamentDAO {
        return CoreDataMedicamentDAO()
    }
    func getTypeSoignantDAO() -> CoreDataTypeSoignantDAO{
        return CoreDataTypeSoignantDAO()
    }
    func getEtatDAO() -> CoreDataEtatDAO{
        return CoreDataEtatDAO()
    }
    func getTypeAvisDAO() -> CoreDataTypeAvisDAO{
        return CoreDataTypeAvisDAO()
    }
    func getPosologieDAO() -> CoreDataPosologieDAO{
        return CoreDataPosologieDAO()
    }
}
