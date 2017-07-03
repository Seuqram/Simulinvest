//
//  Investment.swift
//  Simulinvest
//
//  Created by LAB CCET on 05/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import Foundation

public class Investment {
    var saldoInicial : Double
    var aporteMensal : Double
    var periodo : Int
    var tributavel : Bool
    var taxa : Double
    var taxaTributacao : Double
    var parcelas : [Parcela]
    
    public convenience init (saldoInicial: Double, aporteMensal: Double, periodo: Int, taxa: Double){
        self.init(
            saldoInicial: saldoInicial,
            aporteMensal: aporteMensal,
            periodo: periodo,
            tributavel: false,
            taxa: taxa,
            taxaTributacao: 0
            )
        
    }
    
    public convenience init (saldoInicial: Double, aporteMensal: Double, periodo: Int, taxa: Double, taxaTributacao: Double){
        self.init(
            saldoInicial: saldoInicial,
            aporteMensal: aporteMensal,
            periodo: periodo,
            tributavel: true,
            taxa: taxa,
            taxaTributacao: taxaTributacao
        )
        
    }
    
    public init (saldoInicial: Double, aporteMensal: Double, periodo: Int, tributavel: Bool, taxa: Double, taxaTributacao: Double){
        self.saldoInicial = saldoInicial
        self.aporteMensal = aporteMensal
        self.periodo = periodo
        self.tributavel = tributavel
        self.taxa = taxa
        self.taxaTributacao = taxaTributacao
        self.parcelas = []
        self.calculaparcelas()
    }
    
    public func calculateInvestment() -> Double {
        var total = self.saldoInicial
        for _ in 1...periodo{
            total = (total + aporteMensal) * (1 + taxa)
        }
        if self.tributavel{
            //total = total * (1 - taxaTributacao)
        }
        return total
    }
    
    private func calculaparcelas(){
        var total = self.saldoInicial
        for indice in 1...periodo{
            parcelas += [Parcela(saldo: total + aporteMensal,
                                     juros: (total + aporteMensal) * taxa,
                                     indice: indice)]
            total = (total + aporteMensal) * (1 + taxa)
        }
    }
}
