//
//  MapModel.swift
//  Kanto
//
//  Created by Ivan OSYPENKO on 08.10.2018.
//  Copyright © 2018 Ivan OSYPENKO. All rights reserved.
//

import Foundation
import MapKit

struct Place {
    var title: String
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var show: Bool
}

class PlacesContainer {
    
    var pubs = [Place]()
    
    func initPlace(title: String, subtitle: String?, latitude: Double, longtitude: Double, show: Bool) {
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let newPlace = Place(title: title, subtitle: subtitle, coordinate: coordinate, show: show)
        self.pubs.append(newPlace)
    }
}

final class Annotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
//
        super.init()
    }
}


