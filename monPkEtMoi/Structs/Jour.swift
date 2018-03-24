//
//  Jour.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 24/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

/// Correspondance entre jours et chiffre 
/// 
/// Dimanche correspond au jour 1 d'après le calendrier grégorien

struct Jour{
    var jours: [(String,Int)] = [("Lundi",2),("Mardi",3),("Mercredi",4),("Jeudi",5),("Vendredi",6),("Samedi",7),("Dimanche",1)]
    
    func getJourIndex(jour: Int) -> Int{
        var i = 0
        while (jours[i].1 != jour && i<jours.count) {
            i = i+1
        }
        return i
    }
}
