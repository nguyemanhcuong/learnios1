//
//  ViewController.swift
//  PickerView and Keyboard
//
//  Created by cuongDeptrai on 4/6/19.
//  Copyright © 2019 cuongDeptrai. All rights reserved.

import UIKit
class ViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource , UITextFieldDelegate{
    
    var arraygenDer = ["male", "Feamle"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arraygenDer.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arraygenDer[row]
    }
    
    var SelectedGener = 0
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        SelectedGener = row
        LblHeight.text = arraygenDer[row]
        
    }
    
    @IBOutlet var LblHeight: UILabel!
    @IBOutlet var PickerView: UIPickerView!
    @IBOutlet var TextHeight: UITextField!
    @IBOutlet var TextAge: UITextField!
    @IBOutlet var DisplayHeight: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PickerView.delegate = self
        PickerView.dataSource = self

    }
    @IBAction func GetHeight(_ sender: Any) {
        
        let age: Int = Int(TextAge.text!)!
        let height: Int = Int(TextHeight.text!)!
        
        var BestWeigth = height*10 - (age/5)
        
        if SelectedGener == 0 {
            BestWeigth += 10
        } else {
            BestWeigth -= 10
        }
        
        DisplayHeight.text = "Best Weight \(BestWeigth)"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

