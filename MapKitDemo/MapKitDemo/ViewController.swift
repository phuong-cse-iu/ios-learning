//
//  ViewController.swift
//  MapKitDemo
//
//  Created by TranTPhuong on 1/1/17.
//  Copyright © 2017 Trunky Foundation. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var mapKitView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapKitView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        //10.782984, 106.695939
        
        slider.maximumValue = 1
        slider.minimumValue = 0
        slider.value = 0.01
        mapKitView.setupMap(lat: 10.782984, long: 106.695939, tilexich: 0.01)
        //10.783510, 106.694760
        
//        mapKitView.addAnnotation(dhKinhTe)
        mapKitView.addAnnotation(lat: 10.783510, long: 106.694760, title: "Dai hoc Kinh Te", subTitle: "Co so 5", imgName: "dhkinhte")
        
    }


    @IBAction func aSlider(_ sender: Any) {
        mapKitView.setupMap(lat: 10.782984, long: 106.695939, tilexich: Double(slider.value))
    }

}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView:MKAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "anno")
        annotationView.image = UIImage(named: "001")
        annotationView.frame.size = CGSize(width: 50, height: 50)
        annotationView.canShowCallout = true
        return annotationView
    }
    
    
}

extension MKMapView {
    func setupMap(lat: Double, long: Double, tilexich: Double) {
        
        let toadovatly:CLLocation = CLLocation(latitude: lat, longitude: long)
        let toadobando2D:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: toadovatly.coordinate.latitude, longitude: toadovatly.coordinate.longitude)
        let tilexich:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: tilexich, longitudeDelta: tilexich)
        let vunghienthi:MKCoordinateRegion = MKCoordinateRegion(center: toadobando2D, span: tilexich)
        self.setRegion(vunghienthi, animated: true)

    }
    
    
    func addAnnotation(lat: Double, long: Double, title: String, subTitle: String, imgName: String) {
        let toadovatly:CLLocation = CLLocation(latitude: lat, longitude: long)
        let toadobando2D:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: toadovatly.coordinate.latitude, longitude: toadovatly.coordinate.longitude)
        let pointNeedAnnotated:MKPointAnnotation = MKPointAnnotation()
        pointNeedAnnotated.coordinate = toadobando2D
        pointNeedAnnotated.title = title
        pointNeedAnnotated.subtitle = subTitle
        self.addAnnotations([pointNeedAnnotated])
    }
}

