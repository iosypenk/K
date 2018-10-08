//
//  TabController.swift
//  Kanto
//
//  Created by Ivan OSYPENKO on 08.10.2018.
//  Copyright © 2018 Ivan OSYPENKO. All rights reserved.
//

import UIKit

class TabController: UITabBarController {

    let dataModel = PlacesContainer()
    var index : Int?
    var showAll = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataModel.initPlace(title: "School 42", subtitle: "French Kicker table playground", latitude: 48.896839, longtitude: 2.319037, show: true)
        self.dataModel.initPlace(title: "UNIT Factory", subtitle: "Kicker table playground", latitude: 50.468994, longtitude: 30.462168, show: true)
        self.dataModel.initPlace(title: "Porter Pub", subtitle: "near UNIT", latitude: 50.469869, longtitude: 30.459556, show: true)
        self.dataModel.initPlace(title: "Playpub", subtitle: "xz", latitude: 50.462839, longtitude: 30.466705, show: true)
        self.dataModel.initPlace(title: "VDosku", subtitle: "good name", latitude: 50.468976, longtitude: 30.469646, show: true)
        self.dataModel.initPlace(title: "This is Пивбар", subtitle: "this is horosho", latitude: 50.440702, longtitude: 30.523785, show: true)
        self.dataModel.initPlace(title: "Mad dog in the Fog", subtitle: "THE BEST PUB NAME I'VE EVER SEEN", latitude: 37.772952, longtitude: -122.428145, show: true)
        self.dataModel.initPlace(title: "The Pub", subtitle: "really?", latitude: 37.807085, longtitude: -122.420674, show: true)
        self.dataModel.initPlace(title: "The Irish Bank", subtitle: "irish pub", latitude: 37.794388, longtitude: -122.400929, show: true)
    }

}
