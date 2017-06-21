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
    @IBOutlet weak var periodoSegmentedControl: UISegmentedControl!
    @IBOutlet weak var sinalization: UILabel!
    @IBOutlet weak var simularButton: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var periodo = Int(periodoTextField.text!)!
        if periodoSegmentedControl.selectedSegmentIndex == 1{
            periodo = periodo * 12
        }
        let poupanca = Investment(
            saldoInicial: getValueFromTextField(textField: saldoInicialTextField),
            aporteMensal: getValueFromTextField(textField: aporteMensalTextField),
            periodo: periodo,
            taxa: 0.1)
        let tesouroDireto = Investment(
            saldoInicial: getValueFromTextField(textField: saldoInicialTextField),
            aporteMensal: getValueFromTextField(textField: aporteMensalTextField),
            periodo: periodo,
            taxa: 0.2,
            taxaTributacao: 0.05)
        if let vc = segue.destination as? ResultadosViewController {
            vc.poupancaInvestment = poupanca
            vc.tesouroDiretoInvestment = tesouroDireto
        }
    }
    
    @IBAction func valueChanged(_ sender: UITextField) {
        if (saldoInicialTextField.text! != "" || aporteMensalTextField.text! != "") && (periodoTextField.text != ""){
            simularButton.isEnabled = true
        }else{
            simularButton.isEnabled = false
        }
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
    
    func alerta(mensagem: String){
        let alert = UIAlertController(title: "Alert", message: mensagem, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getValueFromTextField(textField: UITextField) -> Double{
        let variavel = textField.text
        if variavel == ""{
            return 0.0
        }else{
            return Double(variavel!)!
        }
        
    }
    
    class func doubleToCurrency(value: Double) -> String{
        return String(format: "R$%.02f", locale: Locale.current, arguments: [value])
    }
}

