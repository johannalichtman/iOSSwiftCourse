//
//  HypnosisViewController.swift
//  Hypnosystem
//
//  Created by Johanna Lichtman on 2/17/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import UIKit

class HypnosisViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        tabBarItem.title = "Hypnotize"
        
        tabBarItem.image = UIImage(named: "Hypno.png")
        
    }

    // need this so we can pass no arguments (b/c no file)
    convenience override init() {
        self.init(nibName: nil, bundle: nil)
    }

    // ensures that default behavior still works
    required init(coder aDecoder: NSCoder){
        super.init(coder:aDecoder)
    }
    
    override func loadView(){

        let frame = UIScreen.mainScreen().bounds
        let backgroundView = HypnosisView(frame: frame)
        
        view = backgroundView
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        println("HypnosisViewController loaded its view.")
    }
    
}
