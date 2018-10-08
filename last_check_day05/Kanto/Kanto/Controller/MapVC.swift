//
//  FirstViewController.swift
//  Kanto
//
//  Created by Ivan OSYPENKO on 08.10.2018.
//  Copyright © 2018 Ivan OSYPENKO. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MapManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showDeviceLocation()
        if let tabBar = tabBarController as? TabController {
            for key in tabBar.dataModel.pubs {
                mapView.addMark(place: key)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tabBar = tabBarController as? TabController {
            if !tabBar.showAll {
                mapView.clearMark()
            }
            
            if let i = tabBar.index {
                let place = tabBar.dataModel.pubs[i]
                tabBar.dataModel.pubs[i].show = true
                mapView.addMark(place: tabBar.dataModel.pubs[i])
                mapView.moveToLocation(with: place.coordinate)
            }
        }
    }
    
    //MARK: Actions
    
    @IBAction func moveToDeviceLocation(_ sender: Any) {
        if let tabBar = tabBarController as? TabController {
            tabBar.showAll = true
            
            for key in tabBar.dataModel.pubs {
                mapView.addMark(place: key)
            }
            mapView.moveToDeviceLocation()
        }
    }
    
    @IBAction func segmetedControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.chaneMapType(mapeType: .standart)
        case 1:
            mapView.chaneMapType(mapeType: .satellite)
        case 2:
            mapView.chaneMapType(mapeType: .hybrid)
        default:
            break
        }
    }
}
