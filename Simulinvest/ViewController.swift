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
    @IBOutlet weak var aporteMensalTextField: UITextField!
    @IBOutlet weak var periodoTextField: UITextField!
    //var textFields : [UITextField] = [saldoInicialTextField, aporteMensalTextField]
    @IBOutlet weak var sinalization: UILabel!
    @IBAction func simularButton(_ sender: Any) {
        
    }
    
    @IBAction func patati(_ sender: Any) {
        if (isFieldEmpty(sender: saldoInicialTextField) && isFieldEmpty(sender: aporteMensalTextField)){
            let alert = UIAlertController(title: "Alert", message: "Preencha pelo menos saldo inicial ou aporte mensal", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if isFieldEmpty(sender: periodoTextField){
            let alert = UIAlertController(title: "Alert", message: "Preencha o período", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        let poupanca = Investment(
            saldoInicial: Double(saldoInicialTextField.text!)!,
            aporteMensal: Double(aporteMensalTextField.text!)!,
            periodo: Int(periodoTextField.text!)!,
            tributavel: false,
            taxa: 0.1)
        var b : String
        b = String(format:"%f", poupanca.calculateInvestment())
        
        let alert = UIAlertController(title: "Alert", message: b, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    let numberFormatter = NumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        saldoInicialTextField!.delegate = self
        aporteMensalTextField!.delegate = self
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
    
    func isFieldEmpty(sender: UITextField) -> Bool {
        return (sender.text?.isEmpty)!
    }
    
    func calculateInvestments(saldoInicial:String, aporteMensalEntrado:String, periodo:String, taxa:Double) -> Double{
        var total:Double
        total = Double(saldoInicial)!
        var vezes:Int
        vezes = Int(periodo)!
        var aporteMensal:Double
        aporteMensal=Double(aporteMensalEntrado)!
        for _ in 1...vezes {
            total = (total+aporteMensal)*taxa
        }
         return total
        
    }
}

