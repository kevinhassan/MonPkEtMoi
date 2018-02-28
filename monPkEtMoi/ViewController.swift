//
//  ViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 27/02/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var names : [String] = []
    @IBOutlet weak var contactMedic: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.names.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.contactMedic.dequeueReusableCell(withIdentifier: "contactMedicalCell",for: indexPath) as! ContactMedicTableViewCell
        cell.prenomMedic.text = self.names[indexPath.row]
        return cell
    
    }
    
}

