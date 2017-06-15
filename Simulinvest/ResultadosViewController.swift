//
//  ResultadosViewController.swift
//  Simulinvest
//
//  Created by LAB CCET on 07/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

/*var investiments : [Investment?] = []
investiments += [poupancaInvestment, tesouroDiretoInvestment]*/

import UIKit

class ResultadosViewController: UIViewController {
    
    public var poupancaInvestment : Investment?
    public var tesouroDiretoInvestment : Investment?

    @IBOutlet weak var resultadoPoupancaLabel: UILabel!
    @IBOutlet weak var resultadoTesouroDiretoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let investment = poupancaInvestment {
            resultadoPoupancaLabel.text = String(investment.calculateInvestment())
            var parcelas : String
            parcelas = String(investment.parcelas[0].saldo) + "\n"
            for indice in 1 ... (investment.periodo - 1){
                parcelas += String(investment.parcelas[indice].saldo) + "\n"
                
            }
            alerta(mensagem: parcelas)
        }
        if let tesouroDireto = tesouroDiretoInvestment{
            resultadoTesouroDiretoLabel.text = String(tesouroDireto.calculateInvestment())
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alerta(mensagem: String){
        let alert = UIAlertController(title: "Alert", message: mensagem, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
