//
//  TypeAvisModel.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 19/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

class TypeAvisModel {
    private var libelleTypeAvis: String
    {
        get{
            return self.libelleTypeAvis
        }
        set{
            self.libelleTypeAvis = newValue
        }
    }
    
    init(libelleTypeAvis: String){
        self.libelleTypeAvis = libelleTypeAvis
    }
}
