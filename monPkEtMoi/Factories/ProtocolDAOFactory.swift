//
//  ProtocolDAOFactory.swift
//  monPkEtMoi
//
//  Created by macOS on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

protocol ProtocolDAOFactory {
    associatedtype A
    associatedtype B
    associatedtype C
    associatedtype D
    associatedtype E
    associatedtype F
    
    func getPatientDAO() -> A
    func getEvenementDAO() -> B
    func getTypeEvenementDAO() -> C
    func getMedicamentDAO() -> D
    func getTypeSoignantDAO() -> E
    func getEtatDAO() -> F
}


