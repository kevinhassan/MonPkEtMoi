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
        let medicamentDAO = CoreDataDAOFactory.getInstance().getMedicamentDAO()

        for medicament in medicaments {
            let newMedicament: Medicament = medicamentDAO.create()
            newMedicament.nomMedicament = medicament.nom
            newMedicament.dosageMedicament = medicament.doses
            do{
                try medicamentDAO.save(medicament: newMedicament)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedEtat(){
        let etats = EtatSeed().etats
        let etatDAO = CoreDataDAOFactory.getInstance().getEtatDAO()
        
        for etat in etats {
            let newEtat: Etat = etatDAO.create()
            newEtat.libelleEtat = etat
            do{
                try etatDAO.save(etat: newEtat)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedTypeSoignant(){
        let typesSoignant = TypeSoignantSeed().typesSoignant
        let typeSoignantDAO = CoreDataDAOFactory.getInstance().getTypeSoignantDAO()
        
        for type in typesSoignant {
            let newType: TypeSoignant = typeSoignantDAO.create()
            newType.libelleTypeSoignant = type
            do{
                try typeSoignantDAO.save(typeSoignant: newType)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedTypeEvenement(){
        let typesEvenement = TypeEvenementSeed().typesEvenement
        let typeEvenementDAO = CoreDataDAOFactory.getInstance().getTypeEvenementDAO()
        
        for type in typesEvenement {
            let newType: TypeEvenement = typeEvenementDAO.create()
            newType.libelleTypeEvenement = type
            do{
                try typeEvenementDAO.save(typeEvenement: newType)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedTypeAvis(){
        let typesAvis = TypeAvisSeed().typesAvis
        let typeAvisDAO = CoreDataDAOFactory.getInstance().getTypeAvisDAO()
        
        for type in typesAvis {
            let newType: TypeAvis = typeAvisDAO.create()
            newType.libelleTypeAvis = type
            do{
                try typeAvisDAO.save(typeAvis: newType)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
}
