//
//  ViewController.swift
//  AppMapa
//
//  Created by Adalto Selau Sparremberger on 29/08/2020.
//  Copyright © 2020 Prof. Adalto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake{
            print("Movimentou")
        }
    }


}

