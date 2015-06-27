//
//  ViewController.swift
//  WhyWait
//
//  Created by Marty Kausas on 6/26/15.
//  Copyright (c) 2015 Marty Kausas. All rights reserved.
//

import UIKit

var alarms : [[AnyObject]] = []
var currentAlarm = ["",1,1,0,0,0]
var selectAlarm = [String]()
var components = [String]()
var length = 0
var first = 0
var selected : Int?
var enabled : Int?

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cellitemcontent:[[AnyObject]] = []

        // append to the list
        cellitemcontent.append(["Work Alarm", "3 30 0 0 0"])
        cellitemcontent.append(["Weekend Alarm", "4 50 0 0 0"])
        cellitemcontent.append(["Yoga Alarm", "4 50 0 0 0"])
        NSUserDefaults().setObject(cellitemcontent, forKey: "myArray")
        
//        alarms = []
//        NSUserDefaults().setObject(alarms, forKey: "myArray")
        
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
    
        
        
        
        // Create a reference to a Firebase location
        var ref = Firebase(url:"https://whysleephackmobile.firebaseio.com")
        
//        var data =
//                    [
//                        "name": "alarmName",
//                        "hour": 8,
//                        "minutes": 30,
//                        "timeofday": 0,
//                        "longcycle": 0,
//                        "birdsounds": 0,
//                        "repetition": 0
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
//                    ]
        
        var x = [
                                    "name": currentAlarm[0],
                                    "hour": currentAlarm[1],
                                    "minutes": currentAlarm[2],
                                    "timeofday": currentAlarm[3],
                                    "longcycle": currentAlarm[4],
                                    "birdsounds": currentAlarm[5]   ]
        println("setting new fb value: \(x)")

        ref.setValue(x)
        
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

    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        println("Index path: \(indexPath.row)")
        selectAlarm = [alarms[indexPath.row][0] as! String, alarms[indexPath.row][1] as! String]
        println("selected \(selectAlarm)")
        
        performSegueWithIdentifier("toInfoView", sender: nil)
        return nil
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

