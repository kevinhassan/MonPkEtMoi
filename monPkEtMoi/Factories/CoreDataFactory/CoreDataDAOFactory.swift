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
    func getEvenementDAO() -> CoreDataEvenementDAO {
        return CoreDataEvenementDAO(context: self.context)
    }
    func getTypeEvenementDAO() -> CoreDataTypeEvenementDAO {
        return CoreDataTypeEvenementDAO(context: self.context)
    }
    func getMedicamentDAO() -> CoreDataMedicamentDAO {
        return CoreDataMedicamentDAO(context: self.context)
    }
    func getTypeSoignantDAO() -> CoreDataTypeSoignantDAO{
        return CoreDataTypeSoignantDAO(context: self.context)
    }
    func getEtatDAO() -> CoreDataEtatDAO{
        return CoreDataEtatDAO(context: self.context)
    }
    func getTypeAvisDAO() -> CoreDataTypeAvisDAO{
        return CoreDataTypeAvisDAO(context: self.context)
    }
    func getPosologieDAO() -> CoreDataPosologieDAO{
        return CoreDataPosologieDAO(context: self.context)
    }
}
