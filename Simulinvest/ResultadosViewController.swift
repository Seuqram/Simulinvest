//
//  ResultadosViewController.swift
//  Simulinvest
//
//  Created by LAB CCET on 07/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import UIKit

class ResultadosViewController: UIViewController {
    
    public var investment : Investment?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let alert = UIAlertController(title: "Alert", message: String(describing: investment?.calculateInvestment()), preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
