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
    

    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarGerenciador()

        let gesto = UILongPressGestureRecognizer(target: self, action: #selector( AlarmeViewController.marcar( gesto: ) ) )
        gesto.minimumPressDuration = 1
        mapa.addGestureRecognizer(gesto)
        
    }
    
    func configurarGerenciador(){
        let locationManager = CLLocationManager()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
   //     localAtual = locationManager.location
        self.setarMapa(localizacao:  locationManager.location! )
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.setarMapa( localizacao: locations.last! )
        
        localAlarme = locations.last!
        
        
        
    }
    
    func verificarAlarme(localAtual: CLLocation){
        if self.localAlarme != nil {
            
            let distanciaAlarme: Double = 0.5 / 111.12
            let latAtual = localAtual.coordinate.latitude
            let lonAtual = localAtual.coordinate.longitude
            
            let latAlarme = localAlarme.coordinate.latitude
            let lonAlarme = localAlarme.coordinate.longitude
            
            if latAtual - latAlarme <= distanciaAlarme  {
                if lonAtual - lonAlarme <= distanciaAlarme{
                    
                }
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
            
            
            
            
        }
        
    }
  

}
