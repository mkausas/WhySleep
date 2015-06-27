//
//  ViewController.swift
//  WhyWait
//
//  Created by Marty Kausas on 6/26/15.
//  Copyright (c) 2015 Marty Kausas. All rights reserved.
//

import UIKit

var alarms = [String]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a reference to a Firebase location
        var ref = Firebase(url:"https://whysleephackmobile.firebaseio.com")
        var alarmRef = ref.childByAppendingPath("alarms")
        
        
        // Write data to Firebase
//        ref.setValue("Do you have data? You'll love Firebase.")
        
        var data =
                    [
                        "alarms": [
                            "alarm1": [
                                "timeofday": "3:00",
                                "repetitions": [
                                    "days": [
                                        "monday": false,
                                        "tuesday": false,
                                        "wednesday": false,
                                        "thursday": false,
                                        "friday": false,
                                        "saturday": false,
                                        "sunday": false
                                    ],
                                    "weekly": true
                                ]
                            ],
                            "alarm2": [
                                "timeofday": "3:00",
                                "repetitions": [
                                    "days": [
                                        "monday": false,
                                        "tuesday": false,
                                        "wednesday": false,
                                        "thursday": false,
                                        "friday": false,
                                        "saturday": false,
                                        "sunday": false
                                    ],
                                    "weekly": true
                                ]
                            ]
                        ],
                        
                        "settings": [
                            "flux": false
                        ]
                    ]
        
        ref.setValue(data)
        
        alarmRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
//            println("Number of children \(snapshot.childrenCount)")
            let enumerator = snapshot.children
            
            while let alarm = enumerator.nextObject() as? FDataSnapshot {
//                println("key = \(alarm.key)")
//                println("value = \(alarm.value)")
                
                alarms.append(alarm.key)
            }
            
            self.table.reloadData()
        })
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
        var cell : UITableViewCell = UITableViewCell(style: .Default, reuseIdentifier: "alarmCell")
        cell.textLabel?.text = alarms[indexPath.row]
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        println("selected \(indexPath.row)")
        performSegueWithIdentifier("toInfoView", sender: nil)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

