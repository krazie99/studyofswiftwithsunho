//
//  ViewController.swift
//  test
//
//  Created by CHOISUNHO on 2015. 9. 3..
//  Copyright (c) 2015년 CHOISUNHO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnPressed(sender: AnyObject) {
    
        let story = UIStoryboard(name: "Main", bundle: nil);
        
        let testTableViewController = story.instantiateViewControllerWithIdentifier("TestTableViewController") as! TestTableViewController;
        
        self.navigationController?.pushViewController(testTableViewController, animated: true);
        
    }
    
    override func loadView() {
        
        print("loadView")
        
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        
        self.title = "메인"
    }
    
    override func viewWillAppear(animated: Bool){
        
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
        
    }


}

