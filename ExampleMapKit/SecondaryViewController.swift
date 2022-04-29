//
//  SecondaryViewController.swift
//  ExampleMapKit
//
//  Created by Consultant on 4/15/22.
//

import Foundation
import MapKit

class SecondaryViewController: UIViewController{
    
    @IBOutlet weak var mapViewOne: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Marker creation specifically for London
        let London = PersonLocation(coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
        
        // Place Marker on map
        mapViewOne.addAnnotation(London)
        
        // Region creation
        let Region = MKCoordinateRegion(center: London.coordinate, latitudinalMeters: 20000, longitudinalMeters: 20000)

        // Set view to Region
        mapViewOne.setRegion(Region, animated: false)
    }
}


class PersonLocation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
    self.coordinate = coordinate
    }
}



