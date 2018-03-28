//
//  AddTrackerViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 27/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddTrackerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var etats:[Etat] = []
    var posEtat: Int = 0
    @IBOutlet weak var etatTF: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let typePicker = UIPickerView()
        typePicker.delegate = self
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: true)
        etatTF.inputAccessoryView = toolbar
        etatTF.inputView = typePicker
        
        do{
            etats = try Etat.getAll()
        }catch let error as NSError{
            DialogBoxHelper.alert(view:self, error: error)
        }
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Fermer le clavier
    func donePressed(){
        etatTF.resignFirstResponder()
    }

    
    @IBAction func addTracker(_ sender: Any) {
        if (etatTF.text!.isEmpty){
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire invalide")
        }else{
            do{
                let _ = try Tracker.create(withDate: NSDate(), withEtat: etats[posEtat])
                performSegue(withIdentifier: "addTracker", sender: self)
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Erreur lors de l'ajout")
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - UIPickerView Delegation
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return etats.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return etats[row].libelleEtat
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        posEtat = row
        etatTF.text = etats[pickerView.selectedRow(inComponent: 0)].libelleEtat
    }

    
    // MARK: - Envoyer la posologie à la vue suivante
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
