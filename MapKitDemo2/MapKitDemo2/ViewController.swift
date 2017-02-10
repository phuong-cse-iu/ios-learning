//
//  ViewController.swift
//  MapKitDemo2
//
//  Created by TranTPhuong on 1/16/17.
//  Copyright © 2017 Trunky Foundation. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var slider: UISlider!
    var myRoute:MKRoute = MKRoute()
    override func viewDidLoad() {
        super.viewDidLoad()
        // 10.782921, 106.695928
        //10.782300, 106.694512
        map.delegate = self
        slider.minimumValue = 0.01
        slider.maximumValue = 1
        slider.value = 0.01
        map.setupMap(kinhdo: 10.782921, vido: 106.695928, tilexich: Double(slider.value))
        map.themdiadiem(kinhdo: 10.782921, vido: 106.695928, title: "ho con rua", subTitle: "day la ho con rua", imgName: "001")
        map.themdiadiem(kinhdo: 10.782300, vido: 106.694512, title: "Dh kien truc", subTitle: "day la dai hoc kien truc", imgName: "006")
        let toado1:CLLocation = CLLocation(latitude: 10.782921, longitude: 106.695928)
        let toado2:CLLocation = CLLocation(latitude: 10.782300, longitude: 106.694512)

        MAP_Directions(DiemBatDau: toado1, DiemDen: toado2, tittle1: "ho con rua", tittle2: "dh kien truc", imgName1: "001", imgName2: "002")
    }

    
    @IBAction func aSlider(_ sender: Any) {
        map.setupMap(kinhdo: 10.782921, vido: 106.695928, tilexich: Double(slider.value))
    }

}

extension MKMapView {
    func setupMap(kinhdo:Double, vido:Double, tilexich:Double) {
        let toadovatly:CLLocation = CLLocation(latitude: kinhdo, longitude: vido)
        let toadobando:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: toadovatly.coordinate.latitude, longitude: toadovatly.coordinate.longitude)
        let tilexich:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: tilexich, longitudeDelta: tilexich)
        let vunghienthi:MKCoordinateRegion = MKCoordinateRegion(center: toadobando, span: tilexich)
        self.setRegion(vunghienthi, animated: true)

    }
    
    func themdiadiem(kinhdo:Double, vido:Double, title:String, subTitle:String, imgName:String) {
        let diadiem:CustomPointAnnotation = CustomPointAnnotation()
        let toadovatly:CLLocation = CLLocation(latitude: kinhdo, longitude: vido)
        let toadobando:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: toadovatly.coordinate.latitude, longitude: toadovatly.coordinate.longitude)
        diadiem.coordinate.latitude = toadobando.latitude
        diadiem.coordinate.longitude = toadobando.longitude
        diadiem.title = title
        diadiem.subtitle = subTitle
        diadiem.imgName = imgName
        self.addAnnotations([diadiem])
    }
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let customPointAnno = annotation as! CustomPointAnnotation
        let diadiem:MKAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "anno")
        diadiem.image = UIImage(named: customPointAnno.imgName)
        diadiem.frame.size = CGSize(width: 50, height: 50)
        diadiem.canShowCallout = true
        return diadiem
    }
    
    // ham chi duong
    func MAP_Directions (DiemBatDau locationA: CLLocation,DiemDen locationB: CLLocation,tittle1:String,tittle2:String,imgName1:String,imgName2:String){
        let point1 = CustomPointAnnotation()
        point1.coordinate = CLLocationCoordinate2DMake(locationA.coordinate.latitude, locationA.coordinate.longitude)
        point1.title = tittle1
        point1.subtitle = "Bat dau di"
        point1.imgName = imgName1
        map.addAnnotation(point1)
        
        let point2 = CustomPointAnnotation()
        point2.coordinate = CLLocationCoordinate2DMake(locationB.coordinate.latitude, locationB.coordinate.longitude)
        point2.title = tittle2
        point2.subtitle = "Da den"
        point2.imgName = imgName2
        map.addAnnotation(point2)
        map.setRegion(MKCoordinateRegionMake(point1.coordinate, MKCoordinateSpanMake(0.01,0.01)), animated: true)
        
        
        let source = MKMapItem(placemark: MKPlacemark(coordinate: point1.coordinate, addressDictionary: nil))
        let destination = MKMapItem(placemark: MKPlacemark(coordinate: point2.coordinate, addressDictionary: nil))
        let directionsRequest = MKDirectionsRequest()
        directionsRequest.source = source
        directionsRequest.destination = destination
        directionsRequest.transportType = MKDirectionsTransportType.walking
        
        let directions = MKDirections(request: directionsRequest)
        directions.calculate(completionHandler: {(response, error) in
            if error == nil {
                self.myRoute = response!.routes[0]
                self.map.add((self.myRoute.polyline))
                print("\((self.myRoute.distance) / 1000) km")
                print(self.myRoute.steps.count)
                for i in 0...response!.routes.first!.steps.count - 1 {
                    print(self.myRoute.steps[i].instructions)
                    print(self.myRoute.steps[i].distance)
                }
            }else {
                print(error)
            }
        })
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let myLineRenderer = MKPolylineRenderer(polyline: (myRoute.polyline))
        myLineRenderer.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        myLineRenderer.lineWidth = 1
        return myLineRenderer
    }


    
    
}

class CustomPointAnnotation:MKPointAnnotation {
    var imgName:String = ""
}

