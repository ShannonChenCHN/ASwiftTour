//
//  ViewController.swift
//  ValueTypesInPractice
//
//  Created by ShannonChen on 2019/9/13.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var doc = Diagram()
        doc.addItem(item: Polygon())
        doc.addItem(item: Circle(center: CGPoint(), radius: 10))
        
        var doc2 = doc
        let points = [CGPoint(x: 0, y: 0),
                      CGPoint(x: 10, y: 10),
                      CGPoint(x: 14, y: 3)]
        doc2.items[1] = Polygon(corners: points)
        
        
        doc.addItem(item: Diagram())
    }


}

