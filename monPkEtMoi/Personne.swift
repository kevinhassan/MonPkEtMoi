//
//  Personne.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 05/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData



/**
 Person type
 
 **nom**: Person -> String
 **prenom**: Person -> String
 **nomcomplet**: Person -> String
 **birthDate**: Person -> NSDate?
 **age**: Person -> Int?
 */
class Persons{
    
    let firstname : String
    let lastname  : String
    /// birth date property: `(Date|Empty)` a `Person` can have no birth date
    let birthdate : Date?
    var persons :[Personne] = 
    
    /// initialize a `Person`
    ///
    /// - Parameters:
    ///   - firstname: `String` first name of `Person`
    ///   - lastname:  `String` last name of `Person`
    init(firstname: String, lastname: String){
        self.firstname = firstname
        self.lastname  = lastname
    }
    
    /// initialize a `Person`
    ///
    /// - Parameters:
    ///   - firstname: `String` first name of `Person`
    ///   - lastname:  `String` last name of `Person`
    ///   - birthdate: `Date` birth date pf `Person`
    init(firstname: String, lastname: String, birthdate: Date){
        self.firstname = firstname
        self.lastname  = lastname
        self.birthdate = birthdate
    }
    
    /// fullname property: `String` firstname lastname (read-only)
    var fullname: String {
        return self.firstname + " " + self.lastname
    }
    
    /// age property: (Int|Empty) - empty if no birthdate, else age in years
    var age : Int? {
        guard let birth = self.birthdate else{
            return nil
        }
        let today : Date = Date()
        return Calendar.current.dateComponents([.year], from: birth, to: today).year
    }
}

