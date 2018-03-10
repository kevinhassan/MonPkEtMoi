//
//  DataCoreManager.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 08/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import CoreData
import UIKit

class CoreDataManager : NSObject{
    static var context : NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Application failed")
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    @discardableResult
    class func save() -> NSError?{
        
        do {
            try CoreDataManager.context.save()
            return nil
        } catch let error as NSError {
            return error
        }
    }
}

