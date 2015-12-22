//
//  mapViewController.swift
//  WeatherForecast
//
//  Created by Shreshta Manu on 25/11/15.
//  Copyright © 2015 Shreshta Manu. All rights reserved.
//

import UIKit
import GoogleMaps

class mapViewController: UIViewController {

    
    @IBOutlet weak var map: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.cameraWithLatitude(latitude,
            longitude: longitude, zoom: 9)
        /*let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true*/
        self.map.camera = camera
        
        /*let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView*/
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}
