//
//  FSPOAViewController.swift
//  AppMapa
//
//  Created by Adalto Selau Sparremberger on 29/08/2020.
//  Copyright © 2020 Prof. Adalto. All rights reserved.
//

import UIKit
import MapKit

class FSPOAViewController: UIViewController, MKMapViewDelegate {

    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    var local : CLLocationCoordinate2D!
    
    @IBAction func afastar(_ sender: Any) {
        setarMapa(delta: 0.1)
    }
    @IBAction func aproximar(_ sender: Any) {
        setarMapa(delta: 0.005)
    }
    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        latitude = CLLocationDegrees(exactly: -30.035182)
        longitude = CLLocationDegrees(exactly: -51.226631)

        
        local =  CLLocationCoordinate2D(latitude: self.latitude, longitude:self.longitude)
       
        setarMapa(delta: 0.1)
        
        let pino = MKPointAnnotation()
        pino.coordinate = local
        pino.title = "FSPOA"
        pino.subtitle = "Faculdade Senac POA"
        
        mapa.addAnnotation( pino )


    }
    
    
    func setarMapa(delta: Double) {
        
        let deltaLat: CLLocationDegrees = delta
        let deltaLon: CLLocationDegrees = delta
        
        
        
        let area: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLat, longitudeDelta: deltaLon)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: local, span: area)
        
        mapa.setRegion(regiao, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
