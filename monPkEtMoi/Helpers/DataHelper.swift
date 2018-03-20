//
//  DataHelper.swift
//  monPkEtMoi
//
//  Created by macOS on 17/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation

public class DataHelper {
    
    static func seedDataStore() {
        seedMedicament()
        seedEtat()
        seedTypeSoignant()
        seedTypeEvenement()
    }
    fileprivate static func seedMedicament(){
        let medicaments = MedicamentSeed().medicaments
        
        for medicament in medicaments {
            do{
                let _: Medicament = try Medicament.create(withDescription: nil, withNom: medicament.nom, withDosage: medicament.doses)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedEtat(){
        let etats = EtatSeed().etats
        
        for etat in etats {
            do{
                let _: Etat = try Etat.create(withLibelleEtat: etat)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedTypeSoignant(){
        let typesSoignant = TypeSoignantSeed().typesSoignant
        
        for type in typesSoignant {
            do{
                let _: TypeSoignant = try TypeSoignant.create(withLibelle: type)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedTypeEvenement(){
        let typesEvenement = TypeEvenementSeed().typesEvenement
        
        for type in typesEvenement {
            do{
                let _: TypeEvenement = try TypeEvenement.create(withLibelle: type)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedTypeAvis(){
        let typesAvis = TypeAvisSeed().typesAvis
        
        for type in typesAvis {
            do{
                let _: TypeAvis = try TypeAvis.create(withLibelle: type)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
}
