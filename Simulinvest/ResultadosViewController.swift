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
    
    @IBOutlet weak var poupancaButton: UIButton!
    @IBOutlet weak var resultadoPoupancaLabel: UILabel!
    @IBOutlet weak var resultadoTesouroDiretoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let investment = poupancaInvestment {
            resultadoPoupancaLabel.text = doubleToCurrency(value: investment.calculateInvestment())
        }
        if let tesouroDireto = tesouroDiretoInvestment{
            resultadoTesouroDiretoLabel.text = doubleToCurrency(value: tesouroDireto.calculateInvestment())
        }
        poupancaButton.tag = 1
    }

    @IBAction func poupancaButton(_ sender: Any) {
        if let investment = poupancaInvestment {
            parcelas = investment.parcelas
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "poupancaSegue"{
            if let vc = segue.destination as? ExtratoTableViewController {
                if let investment = poupancaInvestment {
                    parcelas = investment.parcelas
                    vc.investment = investment
                }
            }
        }else{
            if let vc = segue.destination as? ExtratoTableViewController {
                if let investment = tesouroDiretoInvestment {
                    parcelas = investment.parcelas
                    vc.investment = investment
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
