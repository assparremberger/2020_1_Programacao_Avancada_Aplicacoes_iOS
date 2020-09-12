//
//  AlarmeViewController.swift
//  AppMapa
//
//  Created by Adalto Selau Sparremberger on 29/08/2020.
//  Copyright © 2020 Prof. Adalto. All rights reserved.
//

import UIKit
import MapKit

class AlarmeViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var localAlarme: CLLocation!
    var localizadorManager: CLLocationManager!

    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarGerenciador()

        let gesto = UILongPressGestureRecognizer(target: self, action: #selector( AlarmeViewController.marcar( gesto: ) ) )
        gesto.minimumPressDuration = 1
        mapa.addGestureRecognizer(gesto)
        
        
        
    }
    
    @IBAction func localizar(_ sender: Any) {
        let lat = CLLocationDegrees(exactly: -30.032660)!
        let lon = CLLocationDegrees(exactly: -51.223132)!
        
        let local = CLLocation(latitude: lat, longitude: lon)
        self.locationManager( self.localizadorManager, didUpdateLocations: [local] )
    }
    func configurarGerenciador(){
        localizadorManager = CLLocationManager()
        
        localizadorManager.delegate = self
        localizadorManager.desiredAccuracy = kCLLocationAccuracyBest
        localizadorManager.requestWhenInUseAuthorization()
        localizadorManager.startUpdatingLocation()
        
   //     localAtual = locationManager.location
        self.setarMapa(localizacao:  localizadorManager.location! )
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.setarMapa( localizacao: locations.last! )
        
  //      localAlarme = locations.last!
        print("Mudou de posicao")
        verificarAlarme(localAtual: locations.last!)
        
    }
    
    func verificarAlarme(localAtual: CLLocation){
        
        print("Entrou na funcao")
        if self.localAlarme != nil {
            
            print("Entrou no if")
            
            let distanciaAlarme: Double = 1 / 111.12
            let latAtual = localAtual.coordinate.latitude
            let lonAtual = localAtual.coordinate.longitude
            
            let latAlarme = localAlarme.coordinate.latitude
            let lonAlarme = localAlarme.coordinate.longitude
            
            if ((latAtual >= latAlarme - distanciaAlarme) && (latAtual  <= latAlarme + distanciaAlarme) ) &&
               ((lonAtual >= lonAlarme - distanciaAlarme) && (lonAtual <= lonAlarme + distanciaAlarme) ) {
                
                let texto = "Você está próximo do seu destino"
                let alerta: UIAlertController = UIAlertController(title: "Alarme", message: texto , preferredStyle: .alert)
                
                self.present( alerta, animated: true, completion: nil)
                
            }

        }
    }
    
    
    func setarMapa(localizacao: CLLocation) {
        
        let deltaLat: CLLocationDegrees = 0.01
        let deltaLon: CLLocationDegrees = 0.01
        
        let local: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: localizacao.coordinate.latitude, longitude: localizacao.coordinate.longitude)
        
        let area: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLat, longitudeDelta: deltaLon)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: local, span: area)
        
        self.mapa.setRegion(regiao, animated: true)
    }
    

    @objc func marcar( gesto: UIGestureRecognizer ){
        
        if gesto.state == .ended {
            
            let pontoClicado = gesto.location(in: self.mapa )
            let coordenadas = mapa.convert(pontoClicado, toCoordinateFrom: self.mapa)
            
            
            let pino = MKPointAnnotation()
            pino.coordinate = coordenadas
            pino.title = "Alarme"
            
            mapa.addAnnotation( pino )
            
            self.localAlarme = CLLocation(latitude: coordenadas.latitude, longitude: coordenadas.longitude)
            
            
        }
        
    }
  

}
