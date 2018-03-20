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
            let newMedicament: MedicamentModel = MedicamentModel(descriptionMedicament: nil, dosageMedicament: medicament.doses, nomMedicament: medicament.nom)
            do{
                try medicamentDAO.create(obj: newMedicament)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedEtat(){
        let etats = EtatSeed().etats
        let etatDAO = CoreDataDAOFactory.getInstance().getEtatDAO()
        
        for etat in etats {
            let newEtat: EtatModel = EtatModel(libelleEtat: etat)
            newEtat.libelleEtat = etat
            do{
                try etatDAO.create(obj: newEtat)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedTypeSoignant(){
        let typesSoignant = TypeSoignantSeed().typesSoignant
        let typeSoignantDAO = CoreDataDAOFactory.getInstance().getTypeSoignantDAO()
        
        for type in typesSoignant {
            let newType: TypeSoignantModel = TypeSoignantModel(libelleTypeSoignant: type)
            newType.libelleTypeSoignant = type
            do{
                try typeSoignantDAO.create(obj: newType)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedTypeEvenement(){
        let typesEvenement = TypeEvenementSeed().typesEvenement
        let typeEvenementDAO = CoreDataDAOFactory.getInstance().getTypeEvenementDAO()
        
        for type in typesEvenement {
            let newType: TypeEvenementModel = TypeEvenementModel(libelleTypeEvenement: type)
            newType.libelleTypeEvenement = type
            do{
                try typeEvenementDAO.create(obj: newType)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
    fileprivate static func seedTypeAvis(){
        let typesAvis = TypeAvisSeed().typesAvis
        let typeAvisDAO = CoreDataDAOFactory.getInstance().getTypeAvisDAO()
        
        for type in typesAvis {
            let newType: TypeAvisModel = TypeAvisModel(libelleTypeAvis: type)
            newType.libelleTypeAvis = type
            do{
                try typeAvisDAO.create(obj: newType)
            }catch {
                fatalError("Error cannot populate DB")
            }
        }
    }
}
