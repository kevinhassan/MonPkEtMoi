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

    func getPatientDAO() -> A
    func getEvenementDAO() -> B
    func getTypeEvenementDAO() -> C
}


