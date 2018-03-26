//
//  ShowPosologieViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 24/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowPosologieViewController: UIViewController {

    @IBOutlet weak var nomMedicamentLabel: UILabel!
    @IBOutlet weak var estPrisLabel: UILabel!
    @IBOutlet weak var nbMedicamentLabel: UILabel!
    @IBOutlet weak var dosagePosologieLabel: UILabel!
    @IBOutlet weak var dateDebutLabel: DateLabel!
    @IBOutlet weak var dateFinLabel: DateLabel!
    @IBOutlet weak var heurePriseLabel: TimeLabel!

    
    var prise: Prise? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        let posologie: Posologie = (prise?.concernePosologie)!
        nomMedicamentLabel.text = posologie.concerneMedicament?.nomMedicament
        if (prise?.estPris)!{
            estPrisLabel.text = "Oui"
        }else{
            estPrisLabel.text = "Non"
        }
        nbMedicamentLabel.text = String(describing:posologie.nbMedicament)
        dosagePosologieLabel.text = posologie.dosagePosologie
        dateDebutLabel.setDate(date: posologie.dateDebutPosologie!)
        dateFinLabel.setDate(date: posologie.dateFinPosologie!)
        heurePriseLabel.setDate(heure: (prise?.heurePrise!)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func realiserPrise(_ sender: Any) {
        do{
            try self.prise?.realiserPrise()
            DialogBoxHelper.alertAsk(view: self, WithTitle: "Prise", andMessage: "Avez-vous pris le médicament ?", closureContinue: {(action) in
                self.performSegue(withIdentifier: "returnToPosologies", sender: self)
            }, closureCancel: nil)
        }catch{
            DialogBoxHelper.alert(view: self, errorMessage: "Echec lors de la réalisation de la prise")
        }
    }
}
