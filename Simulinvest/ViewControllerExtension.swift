//
//  ViewControllerExtension.swift
//  Simulinvest
//
//  Created by LAB CCET on 03/07/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import  Foundation
import UIKit

extension UIViewController{
    func alerta(mensagem: String){
        let alert = UIAlertController(title: "Alert", message: mensagem, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func doubleToCurrency(value: Double) -> String{
        return String(format: "R$%.02f", locale: Locale.current, arguments: [value])
    }
}
