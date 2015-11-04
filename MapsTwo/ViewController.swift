//
//  ViewController.swift
//  MapsTwo
//
//  Created by Diego Gomes on 04/11/2015.
//  Copyright (c) 2015 Nylon. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //40.689436, -74.044500
        
        var latitude: CLLocationDegrees = 40.689436
        var longitude: CLLocationDegrees = -74.044500
        
        var latDelta:CLLocationDegrees = 0.01
        var logDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, logDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        var annotantion = MKPointAnnotation()
        
        annotantion.coordinate = location
        annotantion.title = "Statue Of Liberty"
        annotantion.subtitle = "coming soon I'll get a photo Here!"
        
        mapView.addAnnotation(annotantion)
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        //time of you need press for make this place
        uilpgr.minimumPressDuration = 2.0
        
        mapView.addGestureRecognizer(uilpgr)
        
    }
    
    func action(gestureRecognizer:UIGestureRecognizer){
        var touchPoint = gestureRecognizer.locationInView(self.mapView)
        var newCoordinate:CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
        
        var newAnnotantion = MKPointAnnotation()
        
        newAnnotantion.coordinate = newCoordinate
        newAnnotantion.title = "Statue Of Liberty"
        newAnnotantion.subtitle = "coming soon I'll get a photo Here!"
        
        mapView.addAnnotation(newAnnotantion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

