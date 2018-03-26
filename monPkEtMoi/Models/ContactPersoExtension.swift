//
//  ContactPersoExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 25/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData
// MARK: -
/**
 Type ContactPerso
 
 **mailContact**: ContactPerso -> String
 **nomContact**: ContactPerso -> String
 **prenomContact**: ContactPerso -> String
 **telContact**: ContactPerso -> String
 **adresseContact**: ContactPerso -> String
 */
extension ContactPerso{
    /// Initialiser un `ContactPerso`
    ///
    /// - Parameters:
    ///   - withMail:  `String` mail du `ContactPerso`
    ///   - withNom: `String` nom du `ContactPerso`
    ///   - withPrenom: `String` prénom du `ContactPerso`
    ///   - withTel: `String` téléphone du `ContactPerso`
    ///   - withAdresse: `String` adresse du `ContactPerso`
    static func create(withMail: String, withNom: String, withPrenom: String, withTel: String, withAdresse: String) throws -> ContactPerso {
        
        let contactPerso = ContactPerso(context: CoreDataManager.context)
        
        /// mail du contactPerso
        contactPerso.mailContact = withMail
        /// nom du contactPerso
        contactPerso.nomContact = withNom
        /// prenom du contactPerso
        contactPerso.prenomContact = withPrenom
        /// tel du contactPerso
        contactPerso.telContact = withTel
        /// adresse du contactPerso
        contactPerso.adresseContact = withAdresse
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return contactPerso
    }
    /// Récupérer tous les types `ContactPerso` stockés
    static func getAll() throws -> [ContactPerso] {
        let request: NSFetchRequest<ContactPerso> = ContactPerso.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "nomContact", ascending: true)]
        do {
            let contactPerso: [ContactPerso] = try CoreDataManager.context.fetch(request)
            return contactPerso
        } catch let error as NSError {
            throw error
        }
    }
}
