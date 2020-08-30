//
//  ViewController.swift
//  AppComprasPos
//
//  Created by Adalto Selau Sparremberger on 15/08/2020.
//  Copyright © 2020 Prof. Adalto. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {

//    var auth: Auth!
//    var listaProdutos: [Produto]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        auth = Auth.auth()
//
//        listaProdutos = []
//
//        auth.addStateDidChangeListener { (autenticacao, usuario) in
//
//            if let logado = usuario{
//                print( "Usuário logado")
//
//                print( logado.uid )
//            }else{
//                print( "Usuário não logado")
//            }
//
//        }
        
    }
    
//    func criarUsuario(){
//
//
//        auth.createUser(withEmail: "joao@joao.com", password: "123456") { (usuario, erro) in
//            if erro == nil {
//                print("Usuário criado com sucesso")
//            }else{
//                print("Não foi possível criar o usuário")
//            }
//        }
//
//    }
//
//    func entrar(){
//        auth.signIn(withEmail: "joao@joao.com", password: "123456") { (usuario, erro) in
//            if erro == nil {
//                print("Usuário entrou com sucesso")
//            }else{
//                print("Não foi entrar")
//            }
//        }
//    }
//
//    func cadastrar(){
//        let banco = Database.database().reference()
//        let produtosBanco = banco.child("produtos")
//        let p1 = produtosBanco.childByAutoId()
//        p1.child("nome").setValue("Coca-cola")
//        p1.child("preco").setValue( 5.99 )
//
//
//    }
//
//    func listar(){
//        let banco = Database.database().reference()
//        let produtosBanco = banco.child("produtos")
//        listaProdutos = []
//        produtosBanco.observe( .value) { (dados) in
//            let prod = Produto()
//            prod.nome = dados.childSnapshot(forPath: "nome").value as! String
//            prod.preco = dados.childSnapshot(forPath: "preco").value as! Float
//            self.listaProdutos.append( prod )
//
//
//        }
//        print( listaProdutos )
//    }


}

