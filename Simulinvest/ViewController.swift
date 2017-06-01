//
//  ViewController.swift
//  Simulinvest
//
//  Created by LAB CCET on 31/05/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var saldoInicialTextField: UITextField!
    
    let numberFormatter = NumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        saldoInicialTextField!.delegate = self
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var originalString = textField.text
        
        // Replace any formatting commas
        originalString = originalString!.replacingOccurrences(of: ",", with: "")
        
        var doubleFromString:  Double!
        
        if originalString!.isEmpty {
            originalString = string
            doubleFromString = Double(originalString!)
            doubleFromString! /= 100
        } else {
            if string.isEmpty {
                // Replace the last character for 0
                let loc = originalString!.characters.count - 1
                let range = NSMakeRange(loc, 1)
                let newString = (originalString! as NSString).replacingCharacters(in: range, with: "0")
                doubleFromString = Double(newString)
                doubleFromString! /= 10
            } else {
                originalString = originalString! + string
                doubleFromString = Double(originalString!)
                doubleFromString! *= 10
            }
            
        }
        
        let finalString = numberFormatter.string(from: doubleFromString as NSNumber)
        textField.text = finalString
        return false
    }
}

