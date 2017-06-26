//
//  ResultadosViewController.swift
//  Simulinvest
//
//  Created by LAB CCET on 07/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import UIKit

class ResultadosViewController: UIViewController {
    
    public var poupancaInvestment : Investment?
    public var tesouroDiretoInvestment : Investment?
    public var parcelas : [Parcela] = []
    public var investimento : Investment?
    

    @IBOutlet weak var resultadoPoupancaLabel: UILabel!
    @IBOutlet weak var resultadoTesouroDiretoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let investment = poupancaInvestment {
            resultadoPoupancaLabel.text = ViewController.doubleToCurrency(value: investment.calculateInvestment())
        }
        if let tesouroDireto = tesouroDiretoInvestment{
            resultadoTesouroDiretoLabel.text = ViewController.doubleToCurrency(value: tesouroDireto.calculateInvestment())
        }
        
        
    }

    @IBAction func poupancaButton(_ sender: Any) {
        if let investment = poupancaInvestment {
            parcelas = investment.parcelas
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ExtratoTableViewController {
            if let investment = poupancaInvestment {
                parcelas = investment.parcelas
                vc.investment = investment
            }
            //vc.investment = investimento
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func alerta(mensagem: String){
        let alert = UIAlertController(title: "Alert", message: mensagem, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
