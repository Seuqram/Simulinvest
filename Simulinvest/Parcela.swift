//
//  Parcela.swift
//  Simulinvest
//
//  Created by LAB CCET on 14/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import Foundation

public class Parcela{
    var saldo : Double
    var juros : Double
    var indice : Int
    
    public init (saldo: Double, juros: Double, indice: Int){
        self.saldo = saldo
        self.juros = juros
        self.indice = indice
    }
}
