//
//  ViewController.swift
//  WhyWait
//
//  Created by Marty Kausas on 6/26/15.
//  Copyright (c) 2015 Marty Kausas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a reference to a Firebase location
        var myRootRef = Firebase(url:"https://whysleephackmobile.firebaseio.com")
        
        // Write data to Firebase
        myRootRef.setValue("Do you have data? You'll love Firebase.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

