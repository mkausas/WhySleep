//
//  ViewController.swift
//  WhyWait
//
//  Created by Marty Kausas on 6/26/15.
//  Copyright (c) 2015 Marty Kausas. All rights reserved.
//

import UIKit

var alarms : [[AnyObject]] = []
var currentAlarm = [String]()
var data = [AnyObject]()
var length = 0
var first = 0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var cellitemcontent:[[AnyObject]] = []
//
//        // append to the list
//        cellitemcontent.append(["Work Alarm", "3 30 0 0 0"])
//        cellitemcontent.append(["Weekend Alarm", "4 50 0 0 0"])
//        cellitemcontent.append(["Yoga Alarm", "4 50 0 0 0"])
//
//        alarms = []
//        NSUserDefaults().setObject(cellitemcontent, forKey: "myArray")
        
        
        if first == 0 {
            let myLoadedArray = NSUserDefaults().arrayForKey("myArray") as? [[AnyObject]] ?? []
            
//            println("this is good: \(myLoadedArray[0][0] as! String)")
//            println("this is also good: \(myLoadedArray[0][1] as! String)")
//            println("length: \(myLoadedArray.count)")
//            var splitInto = myLoadedArray[0][1].componentsSeparatedByString(" ")
//            println("first item \(splitInto[4])")
            
            for item in myLoadedArray {
                alarms.append(item)
            }
            
            println(myLoadedArray)
            first = 1
        }
        
        
        var components = [
            "hour": 5,
            "minute": 40,
            "timeofday": 0, // 0 = AM 1 = PM
            "longcycle": 0,
            "birdsounds": 0]
        
        
        
        // Create a reference to a Firebase location
        var ref = Firebase(url:"https://whysleephackmobile.firebaseio.com")
        var alarmRef = ref.childByAppendingPath("alarms")
        
        var data =
                    [
                        "name": "alarmName",
                        "hour": 8,
                        "minutes": 30,
                        "timeofday": "AM",
                        "longcycle": 0,
                        "birdsounds": 0,
                        "repetition": 0
//                        "alarms": [
//                            "alarm1": [
//                                "timeofday": "3:00",
//                                "repetitions": [
//                                    "days": [
//                                        "monday": false,
//                                        "tuesday": false,
//                                        "wednesday": false,
//                                        "thursday": false,
//                                        "friday": false,
//                                        "saturday": false,
//                                        "sunday": false
//                                    ],
//                                    "weekly": true
//                                ]
//                            ],
//                            "alarm2": [
//                                "timeofday": "3:00",
//                                "repetitions": [
//                                    "days": [
//                                        "monday": false,
//                                        "tuesday": false,
//                                        "wednesday": false,
//                                        "thursday": false,
//                                        "friday": false,
//                                        "saturday": false,
//                                        "sunday": false
//                                    ],
//                                    "weekly": true
//                                ]
//                            ]
//                        ],
//                        
//                        "settings": [
//                            "flux": false
//                        ]
                    ]
        
        ref.setValue(data)
        
//        length = 0
//        table.reloadData()
//        length = alarms.count
//        table.reloadData()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
        var cell : UITableViewCell = UITableViewCell(style: .Default, reuseIdentifier: "alarmCell")
        cell.textLabel?.text = alarms[indexPath.row][0] as? String
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toInfoView", sender: nil)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

