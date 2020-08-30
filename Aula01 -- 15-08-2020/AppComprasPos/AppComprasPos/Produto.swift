//
//  Produto.swift
//  AppComprasPos
//
//  Created by Adalto Selau Sparremberger on 15/08/2020.
//  Copyright © 2020 Prof. Adalto. All rights reserved.
//

import UIKit

class Produto {
    
    var nome: String?
    var preco: Float?
    
    init(){
        
    }
    
    init(nome: String , preco: Float) {
        self.nome = nome
        self.preco = preco
    }
    
}
