//
//  EtatModel.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 19/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class EtatModel{
    private var libelleEtat: String
    {
        get{
            return self.libelleEtat
        }
        set{
            self.libelleEtat = newValue
        }
    }
    
    init(libelleEtat: String){
        self.libelleEtat = libelleEtat
    }
}
