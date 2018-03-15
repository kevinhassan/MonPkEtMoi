//
//  patientDAO.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 05/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

protocol PatientDAO {
    func get() throws-> Patient?
    func exist() throws -> Bool
}
