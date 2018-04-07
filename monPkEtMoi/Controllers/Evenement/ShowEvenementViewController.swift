//
//  ShowEvenementViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 26/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowEvenementViewController: UIViewController {

    @IBOutlet weak var dateLabel: DateLabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    var evenement: Evenement? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.setDate(date: (evenement?.dateEvenement)!)
        typeLabel.text = evenement?.avoirType?.libelleTypeEvenement
        descriptionText.text = evenement?.descriptionEvenement
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
