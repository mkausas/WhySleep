//
//  InfoView.swift
//  WhyWait
//
//  Created by Marty Kausas on 6/27/15.
//  Copyright (c) 2015 Marty Kausas. All rights reserved.
//

import Foundation
import UIKit

class InfoView: UIViewController {
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Just loaded")
    }

    @IBAction func finishHandler(sender: AnyObject) {
        var timeFormatter = NSDateFormatter()
        timeFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        var strDate = timeFormatter.stringFromDate(timePicker.date)
        // do what you want to do with the string.
        
        
        println("YOOOOO \(strDate)")
        
        var firstHalf = strDate.componentsSeparatedByString(":")
        var hour = firstHalf[0]
        var secondHalf = firstHalf[1]
        var seperatedSecondHalf = secondHalf.componentsSeparatedByString(" ")
        var minutes = seperatedSecondHalf[0]
        var partOfDay = seperatedSecondHalf[1]
        
        println("Hour: \(hour) Minutes: \(minutes) PartOfDay: \(partOfDay)")
        
        
        
        println("switch one on = \(switchOne.on)")
        println("switch two on = \(switchTwo.on)")
        println("switch three on = \(switchThree.on)")
        
        
        
    performSegueWithIdentifier("toMainView", sender: nil)

        
    }
    
    @IBOutlet weak var switchOne: UISwitch!
    @IBOutlet weak var switchTwo: UISwitch!
    @IBOutlet weak var switchThree: UISwitch!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}