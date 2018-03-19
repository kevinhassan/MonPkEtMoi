//
//  TypeSoignantModel.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 19/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class TypeSoignantModel{
    private var libelleTypeSoignant: String
    {
        get{
            return self.libelleTypeSoignant
        }
        set{
            self.libelleTypeSoignant = newValue
        }
    }
    
    init(libelleTypeSoignant: String){
        self.libelleTypeSoignant = libelleTypeSoignant
    }
}
