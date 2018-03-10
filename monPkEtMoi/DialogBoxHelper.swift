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
    class func alert(view: UIViewController, WithTitle title : String, andMessage msg: String = ""){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(cancelAction)
        view.present(alert, animated: true)
    }
    class func alert(view: UIViewController, error: NSError){
        self.alert(view: view, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
    }
    class func alert(view: UIViewController, errorMessage: String){
        self.alert(view: view, WithTitle: "Erreur", andMessage: "\(errorMessage)")
    }
}

