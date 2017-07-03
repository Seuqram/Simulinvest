//
//  ExtratoTableViewController.swift
//  Simulinvest
//
//  Created by LAB CCET on 14/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import UIKit

class ExtratoTableViewController: UITableViewController {
    
    public var parcelas : [Parcela]?
    var investment : Investment?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        parcelas = investment?.parcelas
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return parcelas!.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "## | SALDO + APORTE + RENDIMENTO"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDetail", for: indexPath)
        if let parcela = parcelas?[indexPath.row]{
            if let investmentt = investment{
                cell.textLabel!.text = String(parcela.indice) + "/" + String(investmentt.periodo)
                cell.detailTextLabel!.text = doubleToCurrency(value: ((parcela.saldo) - (investment?.aporteMensal)!)) + " + " + doubleToCurrency(value: (investment?.aporteMensal)!) + " + " + doubleToCurrency(value: (parcela.juros))
            }
        }
        return cell
    }
    
}
