//
//  ReminderViewController.swift
//  Hypnosystem
//
//  Created by Johanna Lichtman on 2/17/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController {
   
    // @IBOutlet makes connection to interface builder
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // @IBAction makes connection to interface builder
    @IBAction func addReminder(Sender: AnyObject){
        let date = datePicker.date
        println("Setting a reminder for \(date)")
        
        let note = UILocalNotification()
        note.alertBody = "Hypnotize me!"
        note.fireDate = date
        UIApplication.sharedApplication().scheduleLocalNotification(note)
        
    }
 
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        // Set the tab bar item's title
        tabBarItem.title = "Reminder"
        
        tabBarItem.image = UIImage(named:"Time.png")
    }
    
    convenience override init(){
        self.init(nibName: "ReminderViewController", bundle: nil)
    }
    
    // ensures that default behavior still works
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        println("ReminderViewController loaded its view.")
    }
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        datePicker.minimumDate = NSDate(timeIntervalSinceNow: 60)
    }
    
}
