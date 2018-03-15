//
//  ProtocolDAOFactory.swift
//  monPkEtMoi
//
//  Created by macOS on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

protocol ProtocolDAOFactory {
    func getPatientDAO() -> PatientDAO
}

