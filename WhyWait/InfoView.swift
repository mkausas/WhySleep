//
//  InfoView.swift
//  WhyWait
//
//  Created by Marty Kausas on 6/27/15.
//  Copyright (c) 2015 Marty Kausas. All rights reserved.
//

import Foundation
import UIKit

class InfoView: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var switchOne: UISwitch!
    @IBOutlet weak var switchTwo: UISwitch!
    @IBOutlet weak var switchThree: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }

    @IBAction func finishHandler(sender: AnyObject) {
        var timeFormatter = NSDateFormatter()
        timeFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        var strDate = timeFormatter.stringFromDate(timePicker.date)

        var firstHalf = strDate.componentsSeparatedByString(":")
        var hour = firstHalf[0]
        var secondHalf = firstHalf[1]
        var seperatedSecondHalf = secondHalf.componentsSeparatedByString(" ")
        var minutes = seperatedSecondHalf[0]
        var partOfDay = seperatedSecondHalf[1]
        var name = textField.text
        
        
        println("Hour: \(hour) Minutes: \(minutes) PartOfDay: \(partOfDay)")
        
        println("switch one on = \(switchOne.on)")
        println("switch two on = \(switchTwo.on)")
        println("switch three on = \(switchThree.on)")
        
        var switchOneVal = switchOne.on ? 0 : 1
        var switchTwoVal = switchTwo.on ? 0 : 1
        var switchThreeVal = switchThree.on ? 0 : 1
        println("\(name) \(hour) \(minutes) \(switchOneVal) \(switchTwoVal) \(switchThreeVal)")
        alarms.append(["\(name)", "\(hour) \(minutes) \(switchOneVal) \(switchTwoVal) \(switchThreeVal)"])

        NSUserDefaults().setObject(alarms, forKey: "myArray")
        
        performSegueWithIdentifier("toMainView", sender: nil)

        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}