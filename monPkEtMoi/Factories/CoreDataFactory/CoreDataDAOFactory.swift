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
        return CoreDataPatientDAO.instance
    }
    func getEvenementDAO() -> CoreDataEvenementDAO {
        return CoreDataEvenementDAO.instance
    }
    func getTypeEvenementDAO() -> CoreDataTypeEvenementDAO {
        return CoreDataTypeEvenementDAO.instance
    }
    func getMedicamentDAO() -> CoreDataMedicamentDAO {
        return CoreDataMedicamentDAO.instance
    }
    func getTypeSoignantDAO() -> CoreDataTypeSoignantDAO{
        return CoreDataTypeSoignantDAO.instance
    }
    func getEtatDAO() -> CoreDataEtatDAO{
        return CoreDataEtatDAO.instance
    }
    func getTypeAvisDAO() -> CoreDataTypeAvisDAO{
        return CoreDataTypeAvisDAO.instance
    }
    func getPosologieDAO() -> CoreDataPosologieDAO{
        return CoreDataPosologieDAO.instance
    }
}
