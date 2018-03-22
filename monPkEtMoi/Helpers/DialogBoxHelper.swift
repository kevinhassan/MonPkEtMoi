//
//  DialogBoxHelper.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 08/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import UIKit

class DialogBoxHelper{
    /// Instancier un popup d'information
    /// - Parameters:
    ///   - view : `UIViewController` vue sur laquelle s'affiche le popup
    ///   - WithTitle: `String` titre du popup
    ///   - andMessage: `String` message contenu dans le popup
    ///   - closure: `((UIAlertAction) -> Void)?` closure a exécuter après un click sur le bouton "continuer" si non optionnelle
    class func alert(view: UIViewController, WithTitle title : String, andMessage msg: String = "", closure: ((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let continueAction = UIAlertAction(title: "Ok", style: .default, handler: closure)
        alert.addAction(continueAction)
        view.present(alert, animated: true)
    }
    /// Instancier une popup d'erreur
    /// - Parameters:
    ///   - view : `UIViewController` vue sur laquelle s'affiche la popup
    ///   - error: `NSError` erreur retourné lorsqu'une erreur se produit avec la BD
    class func alert(view: UIViewController, error: NSError){
        self.alert(view: view, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
    }
    /// Instancier une popup d'erreur
    /// - Parameters:
    ///   - view : `UIViewController` vue sur laquelle s'affiche la popup
    ///   - errorMessage: `String` afficher un message d'erreur formaté
    class func alert(view: UIViewController, errorMessage: String){
        self.alert(view: view, WithTitle: "Erreur", andMessage: "\(errorMessage)")
    }
}

