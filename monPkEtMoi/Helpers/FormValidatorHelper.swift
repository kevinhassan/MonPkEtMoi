//
//  FormValidatorViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 13/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class FormValidatorHelper {

    class func validateForm(_ inputs: [String: UITextField])-> Bool {
        // Filtrer les valeurs optionnelles (textField vide)
        let res = inputs.filter{(key, input) in !(input.text?.isEmpty ?? true)}
        // Si même taille alors pas de valeurs vides
        return res.count == (inputs.count)
    }
}
