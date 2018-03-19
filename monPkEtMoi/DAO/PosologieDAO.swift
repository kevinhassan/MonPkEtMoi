//
//  PosologieDAO.swift
//  monPkEtMoi
//
//  Created by macOS on 18/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

protocol PosologieDAO: {
    func getAll() throws-> [Posologie]?
    func save(posologie: Posologie) throws
}
