//
//  LocalizacaoViewController.swift
//  AppMapa
//
//  Created by Adalto Selau Sparremberger on 29/08/2020.
//  Copyright © 2020 Prof. Adalto. All rights reserved.
//

import UIKit
import MapKit

class LocalizacaoViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblVelocidade: UILabel!
    @IBOutlet weak var mapa: MKMapView!
    
    var localAtual: CLLocation!
    
    @IBAction func mostrarEndereco(_ sender: Any) {
        
        CLGeocoder().reverseGeocodeLocation( localAtual ){ (endereco , erro)
            in
            
            if erro == nil {
                if let dadosEndereco = endereco?.first{
                    
                    var texto = "Rua: " + dadosEndereco.thoroughfare!
                    texto += "\nNúmero: " + dadosEndereco.subThoroughfare!
                    texto += "\nBairro: " + dadosEndereco.subLocality!
                    texto += "\nCidade: " + dadosEndereco.locality!
                    texto += "\nCEP: " + dadosEndereco.postalCode!
               //     texto += "\nSubArea: " + dadosEndereco.subAdministrativeArea!
                    if let areaAdministrativa = dadosEndereco.administrativeArea {
                        texto += "\nArea: " + areaAdministrativa
                    }
                    texto += "\nPaís: " + dadosEndereco.country!
                    
                    let alerta: UIAlertController = UIAlertController(title: "Endereço", message: texto , preferredStyle: .alert)
                    
                    self.present( alerta, animated: true, completion: nil)
                    
                    
                }
            }
            
        }
        
    }
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        localAtual = locationManager.location
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
  //      print(locations)
        
        let localizacao: CLLocation = locations.last!
        
        self.localAtual = localizacao
        
        lblLatitude.text = String( localizacao.coordinate.latitude )
        lblLongitude.text = String( localizacao.coordinate.longitude )
        
        if localizacao.speed > 0 {
            lblVelocidade.text = String( localizacao.speed )
        }else{
            lblVelocidade.text = "0"
        }
        
        self.setarMapa(localizacao: localizacao)
    }
    
    func setarMapa(localizacao: CLLocation) {
        
        let deltaLat: CLLocationDegrees = 0.01
        let deltaLon: CLLocationDegrees = 0.01
        
        let local: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: localizacao.coordinate.latitude, longitude: localizacao.coordinate.longitude)
        
        let area: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLat, longitudeDelta: deltaLon)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: local, span: area)
        
        mapa.setRegion(regiao, animated: true)
    }

    

}
