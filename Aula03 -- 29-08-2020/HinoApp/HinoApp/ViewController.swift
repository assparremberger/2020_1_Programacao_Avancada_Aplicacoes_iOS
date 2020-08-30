//
//  ViewController.swift
//  HinoApp
//
//  Created by Adalto Selau Sparremberger on 29/08/2020.
//  Copyright © 2020 Prof. Adalto. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    @IBOutlet weak var sliderVolume: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let caminho = Bundle.main.path(forResource: "inter", ofType: "mp3"){
            let url = URL(fileURLWithPath: caminho)
            do{
                player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }catch{
                print("Erro ao criar o audio")
            }
        }else{
            print("Erro ao localizar o arquivo")
        }
        
    }

    @IBAction func atualizarVolume(_ sender: Any){
        player.volume = sliderVolume.value
    }
    

    @IBAction func play(_ sender: Any) {
        player.play()
    }
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    
    
    
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0
    }
}

