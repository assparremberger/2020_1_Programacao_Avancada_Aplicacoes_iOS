//
//  ViewController.swift
//  AppBitcoin
//
//  Created by Adalto Selau Sparremberger on 15/08/2020.
//  Copyright © 2020 Prof. Adalto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblPreco: UILabel!
    @IBOutlet weak var btnAtualizar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.buscaPreco()
    }

    func formatarValor(valor: NSNumber) -> String{
        let formato = NumberFormatter()
        formato.numberStyle = .decimal
        formato.locale = Locale(identifier: "pt_BR")
        
        if var valorFinal = formato.string(from: valor){
            valorFinal = "R$ " + valorFinal
            return valorFinal
        }
        return "R$ 0,00"
    }
    
    
    
    
    @IBAction func atualizar(_ sender: Any) {
        self.buscaPreco()
    }
    
    func buscaPreco(){
        self.btnAtualizar.setTitle("Atualizando...", for: .disabled)
        
        if let url = URL(string: "https://blockchain.info/pt/ticker"){
            
            let task = URLSession.shared.dataTask(with: url) { (dados, response, erro) in
                
                if erro == nil {
                    
                    if let dadosRetornados = dados{

                        do{
                            if let objJSON = try JSONSerialization.jsonObject(with: dadosRetornados, options: []) as? [String: Any]{
                                
                                if let brl = objJSON["BRL"] as? [String: Any]{
     
                                    if let preco = brl["buy"] as? Float{
                                        
                                        let precoBR = self.formatarValor(valor: NSNumber(value: preco))
                                        self.lblPreco.text = precoBR
                                        self.btnAtualizar.setTitle("Atualizar", for: .normal)
                                        
                                    }
                                }
                            }
                        }catch{
                            print("Erro ao tratar os dados.")
                        }
                    }
                }else{
                    print("Erro na requisição.")
                    print( erro! )
                }
            }
            task.resume()
        }
    }
}

