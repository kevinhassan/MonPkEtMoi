//
//  TypeActiviteExtension.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 21/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import CoreData

extension TypeActivite{
    static func create(withLibelle: String) throws -> TypeActivite {
        let type = TypeActivite(context: CoreDataManager.context)
        
        type.libelleTypeActivite = withLibelle
        
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return type
    }
    
    static func getAll() throws -> [TypeActivite] {
        let request: NSFetchRequest<TypeActivite> = TypeActivite.fetchRequest()
        do {
            let types: [TypeActivite] = try CoreDataManager.context.fetch(request)
            return types
        } catch let error as NSError {
            throw error
        }
    }
}
