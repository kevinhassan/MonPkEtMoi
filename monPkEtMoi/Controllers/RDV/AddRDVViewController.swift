//
//  AddRDVViewController.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 21/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddRDVViewController: UITableViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var dateRDV: DatePicker!
   
    @IBOutlet weak var heureRDV: TimePicker!
    
    @IBOutlet weak var typeSoignant: UITextField!
    
    @IBOutlet weak var descriptionRDV: UITextField!
    
    @IBOutlet weak var lieuRDV: UITextField!
    
    
    var typesSoignants : [TypeSoignant] = []
    var posSoignant: Int?
    var newRDV: RDV? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let typePicker = UIPickerView()
        typePicker.delegate = self
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: true)
        typeSoignant.inputAccessoryView = toolbar
        typeSoignant.inputView = typePicker
        
        do{
            typesSoignants = try TypeSoignant.getAll()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    // MARK: - Fermer le clavier
    func donePressed(){
        typeSoignant.resignFirstResponder()
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
            return typesSoignants.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return typesSoignants[row].libelleTypeSoignant
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        posSoignant = row
        typeSoignant.text = typesSoignants[pickerView.selectedRow(inComponent: 0)].libelleTypeSoignant!
    }
    
    
    //MARK: - Sauvegarder la posologie si le formulaire est valide
    func saveRDV(withTypeSoignant ts : TypeSoignant, withDateRDV dateRDV : NSDate, withDescription descriptionRDV : String, withHeureRDV heureRDV : NSDate, withLieuRDV lieuRDV : String) {
        do{
            newRDV = try RDV.create(withTypeSoignant : ts, withDateRDV: dateRDV, withDescription: descriptionRDV.description, withHeureRDV: heureRDV, withLieuRDV: lieuRDV.description)
            DialogBoxHelper.alert(view: self, WithTitle: "Rendez-vous ajouté", andMessage: "Ajout avec succès", closure: {(action) in
                self.performSegue(withIdentifier: "showRdv", sender: self)
            })
        } catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }

    // MARK: - Formulaire à envoyer s'il est conforme
    @IBAction func addRDV(_ sender: UIBarButtonItem)
    {
        let inputs:[String: UITextField] = ["dateRDV": dateRDV,"heureRDV": heureRDV, "typeSoignant": typeSoignant,"descriptionRDV": descriptionRDV]
        
        if (FormValidatorHelper.validateForm(inputs) && dateRDV.getDate()! as Date > Date()){
            let typeSoignant = typesSoignants[posSoignant!]
            let dateRDV:NSDate = ((self.dateRDV))!.getDate()!
            let heureRDV:NSDate = ((self.heureRDV))!.getDate()!
            saveRDV(withTypeSoignant : typeSoignant,withDateRDV: dateRDV, withDescription: descriptionRDV.description, withHeureRDV: heureRDV, withLieuRDV: lieuRDV.description)
            DialogBoxHelper.alert(view: self, WithTitle: "Bienvenue", andMessage: "Le compte a été créé avec succès", closure: {(action)->() in
                self.performSegue(withIdentifier: "unwindToShowRDV", sender: self)
            })
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ShowRDVViewController
        destinationVC.rdvs!.append(self.newRDV!)
    }
}
