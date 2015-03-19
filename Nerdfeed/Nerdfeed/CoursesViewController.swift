//
//  CoursesViewController.swift
//  Nerdfeed
//
//  Created by Johanna Lichtman on 2/19/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import UIKit

class CoursesViewController: UITableViewController, NSURLSessionDataDelegate {
    
    var session: NSURLSession!
    var courses = [[NSObject:AnyObject]]() // new property
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: config, delegate: self, delegateQueue: nil)
        
        fetchFeed()
    }

    func URLSession(session: NSURLSession, task: NSURLSessionTask, didReceiveChallenge challenge: NSURLAuthenticationChallenge, completionHandler: (NSURLSessionAuthChallengeDisposition, NSURLCredential!) -> Void) {
        
        let cred = NSURLCredential(user: "BigNerdRanch", password: "AchieveNerdvana", persistence: .ForSession)
        completionHandler(.UseCredential, cred)
        
    }
    
    func fetchFeed(){
        let requestString = "https://bookapi.bignerdranch.com/courses.json"
        
        if let url = NSURL(string: requestString){
            
            let req = NSURLRequest(URL: url)
            
            let dataTask = session.dataTaskWithRequest(req){
                (data, response, error) in
                if data != nil {
                    var error: NSError?
                    if let jsonObject = NSJSONSerialization.JSONObjectWithData(data , options: nil, error: &error) as? [NSObject: AnyObject] {
                        if let courseArray: AnyObject = jsonObject["courses"] {
                            if let cs = courseArray as? [[NSObject: AnyObject]]{
                                self.courses = cs
                                //println("\(self.courses)")
                                
                                NSOperationQueue.mainQueue().addOperationWithBlock() {
                                    self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Automatic)
                                
                                }
                            }
                        }
                    }
                    else {
                        if let error = error {
                            println("Error parsing JSON: \(error)")
                        }
                    }
                }
                else {
                    println("Error fetching courses: \(error.localizedDescription)")
                }
            }
            dataTask.resume()
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell
        let course = courses[indexPath.row]
        
        if let title: AnyObject = course["title"] {
            if let titleString = title as? String{
                cell.textLabel?.text = titleString
            }
        }
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let nc = segue.destinationViewController as? UINavigationController {
                if let wvc = nc.topViewController as? WebViewController {
                    // Get the selected index path
                    if let indexPath = tableView.indexPathForSelectedRow() {
                        let course = courses[indexPath.row]
                        if let url: AnyObject = course["url"] {
                            if let urlString = url as? String {
                                wvc.URL = NSURL(string: urlString)
                            }
                        }
                        if let title: AnyObject = course["title"] {
                            if let titleString = title as? String {
                                wvc.navigationItem.title = titleString
                                
                                wvc.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
                                wvc.navigationItem.leftItemsSupplementBackButton = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    
}