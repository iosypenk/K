//
//  ListViewCell.swift
//  Kanto
//
//  Created by Ivan OSYPENKO on 08.10.2018.
//  Copyright © 2018 Ivan OSYPENKO. All rights reserved.
//

import UIKit

    class ListViewCell: UITableViewCell {
        
        @IBOutlet weak var cellView: UIView!
        @IBOutlet weak var placeName: UILabel!
        
        func initCell(place: Place) {
            placeName.text = place.title
            cellView.layer.cornerRadius = 10
        }
        
    }

