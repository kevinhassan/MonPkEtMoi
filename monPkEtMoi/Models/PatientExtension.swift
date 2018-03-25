//
//  PatientExtension.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

// MARK: -
/**
 Type Patient
 
 **adresse**: Patient -> String
 **mail**: Patient -> String
 **nom**: Patient -> String
 **prenom**: Patient -> String
 **tel**: Patient -> Int
 **tempsPreparation**: Patient -> Int16
 **dateNaissance**: Patient -> NSDate
 */
extension Patient{
    /// Initialiser un `Patient`
    ///
    /// - Parameters:
    ///   - withAdresse: `String` adresse du `Patient`
    ///   - withMail:  `String` mail du `Patient`
    ///   - withNom: `String` nom du `Patient`
    ///   - withPrenom: `String` prénom du `Patient`
    ///   - withTel: `String` téléphone du `Patient`
    ///   - withTempsPreparation: `Int64` temps de préparation du `Patient`
    ///   - withDateNaissance: `NSDate` date de naissance `Patient`
    static func create(withAdresse: String, withMail: String, withNom: String, withPrenom: String, withTel: String, withTempsPreparation: Int64, withDateNaissance: NSDate) throws -> Patient {
        
        let patient = Patient(context: CoreDataManager.context)
        
        /// adresse du patient
        patient.adresse = withAdresse
        /// mail du patient
        patient.mail = withMail
        /// nom du patient
        patient.nom = withNom
        /// prenom du patient
        patient.prenom = withPrenom
        /// tel du patient
        patient.tel = withTel
        /// temps de préparation du patient
        patient.tempsPreparation = withTempsPreparation
        /// date de naissance du patient
        patient.dateNaissance = withDateNaissance
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return patient
    }
    /// Editer les informations du `Patient`
    ///
    /// - Parameters:
    ///   - withAdresse: `String` adresse du `Patient`
    ///   - withMail:  `String` mail du `Patient`
    ///   - withNom: `Date` nom du `Patient`
    ///   - withPrenom: `Date` prénom du `Patient`
    ///   - withTel: `Date` téléphone du `Patient`
    ///   - withTempsPreparation: `Int64` temps de préparation du `Patient`
    ///   - withDateNaissance: `NSDate` date de naissance `Patient`
    func edit(withAdresse: String, withMail: String, withNom: String, withPrenom: String, withTel: String, withTempsPreparation: Int64, withDateNaissance: NSDate) throws {
        self.adresse = withAdresse
        self.mail = withMail
        self.nom = withNom
        self.prenom = withPrenom
        self.tel = withTel
        self.tempsPreparation = withTempsPreparation
        self.dateNaissance = withDateNaissance
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    /// Récupérer un `Patient` en BD
    ///
    /// Dans le cas actuel il ne peut exister qu'un seul patient donc aucun prédicat n'est appliqué
    static func get() throws -> Patient? {
        let request: NSFetchRequest<Patient> = Patient.fetchRequest()
        do {
            let patients: [Patient] = try CoreDataManager.context.fetch(request)
            if (patients.count > 0) {
                return patients[0]
            } else {
                return nil
            }
        } catch let error as NSError {
            throw error
        }
    }
    /// Voir si une instance de `Patient` existe
    ///
    /// Si le patient existe
    ///- retourne vrai
    ///
    /// Si le patient n'existe pas
    /// - retourne faux
    static func exists() throws -> Bool {
        do {
            guard let _: Patient = try self.get() else {
                return false
            }
            return true
        } catch let error as NSError {
            throw error
        }
    }
}
