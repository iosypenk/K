//
//  MapServices.swift
//  Kanto
//
//  Created by Ivan OSYPENKO on 08.10.2018.
//  Copyright © 2018 Ivan OSYPENKO. All rights reserved.
//

import Foundation
import MapKit


//MARK: -MapTypes
enum MapTypes {
    case hybrid
    case standart
    case satellite
}

class MapManager: MKMapView, MKMapViewDelegate {
    
    private let locationManager = CLLocationManager()
    private var currentCoordinate: CLLocationCoordinate2D?
    var mapStyle : MapTypes = .standart
    var mapMarks = [Annotation]()
    
    func showDeviceLocation() {
        self.mapType = .standard
        self.showsCompass = true
        self.showsScale = true
        configureLocationServices()
    }
    
    func addMark(place : Place) {
        self.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        let someAnnotation = Annotation(coordinate: place.coordinate, title: place.title, subtitle: place.subtitle)    
        self.addAnnotation(someAnnotation)
        mapMarks.append(someAnnotation)
    }
    
    func clearMark() {
        self.removeAnnotations(mapMarks)
    }
    
    func moveToDeviceLocation() {
        if let coordinate = currentCoordinate {
            moveToLocation(with: coordinate)
        }
    }
    
    func chaneMapType(mapeType: MapTypes) {
        if mapeType == .satellite {
            self.mapType = .satellite
        } else if mapeType == .standart {
            self.mapType = .standard
        } else if mapeType == .hybrid {
            self.mapType = .hybrid
        }
        
    }

    //MARK: 1
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
        guard let latestLocation = locations.first else { return }
        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
        }
        currentCoordinate = latestLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("didChangeAuthorization status")
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: manager)
        }
    }
    
    //MARK: - Annotation for Pin
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let comment = self.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView {
            comment.animatesWhenAdded = true
            comment.titleVisibility = .adaptive
            return comment
        }
        return nil
    }
}

//MARK:  - CLLocationManagerDelegate
extension MapManager: CLLocationManagerDelegate {
    
    func moveToLocation (with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegionMakeWithDistance(coordinate, 2500, 2500)
        self.setRegion(zoomRegion, animated: true)
    }
    
    private func beginLocationUpdates(locationManager: CLLocationManager) {
        self.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToLatestLocation (with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegionMakeWithDistance(coordinate, 5000, 5000)
        self.setRegion(zoomRegion, animated: true)
    }
    
    func zoomToLatestLocation (with coordinate: CLLocationCoordinate2D, zoom: CLLocationDistance) {
        let zoomRegion = MKCoordinateRegionMakeWithDistance(coordinate, zoom, zoom)
        self.setRegion(zoomRegion, animated: true)
    }
    
    private func configureLocationServices() {
        locationManager.delegate = self
        
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: locationManager)
        }
    }
    
}
