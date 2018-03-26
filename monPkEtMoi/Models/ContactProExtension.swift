//
//  ContactProExtension.swift
//  monPkEtMoi
//
//  Created by macOS on 25/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

// MARK: -
/**
 Type ContactPro
 
 **mailContact**: ContactPro -> String
 **nomContact**: ContactPro -> String
 **prenomContact**: ContactPro -> String
 **telContact**: ContactPro -> String
 **etreDuType**: ContactPro -> TypeSoignant
 */
extension ContactPro{
    /// Initialiser un `ContactPro`
    ///
    /// - Parameters:
    ///   - withMail:  `String` mail du `ContactPro`
    ///   - withNom: `String` nom du `ContactPro`
    ///   - withPrenom: `String` prénom du `ContactPro`
    ///   - withTel: `String` téléphone du `ContactPro`
    ///   - withTypeSoignant: `TypeSoignant` type du soignant `ContactPro`
    static func create(withMail: String, withNom: String, withPrenom: String, withTel: String, withTypeSoignant: TypeSoignant) throws -> ContactPro {
        
        let contactPro = ContactPro(context: CoreDataManager.context)
        
        /// mail du ContactPro
        contactPro.mailContact = withMail
        /// nom du ContactPro
        contactPro.nomContact = withNom
        /// prenom du ContactPro
        contactPro.prenomContact = withPrenom
        /// tel du ContactPro
        contactPro.telContact = withTel
        /// Type de soignant pour le ContactPro
        contactPro.etreDuType = withTypeSoignant
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return contactPro
    }
    /// Récupérer tous les types `ContactPro` stockés
    static func getAll() throws -> [ContactPro] {
        let request: NSFetchRequest<ContactPro> = ContactPro.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "nomContact", ascending: true)]
        do {
            let contactsPro: [ContactPro] = try CoreDataManager.context.fetch(request)
            return contactsPro
        } catch let error as NSError {
            throw error
        }
    }
}
