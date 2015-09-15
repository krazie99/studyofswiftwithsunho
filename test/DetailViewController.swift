//
//  DetailViewController.swift
//  test
//
//  Created by CHOISUNHO on 2015. 9. 15..
//  Copyright © 2015년 CHOISUNHO. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var str : String?
    @IBOutlet weak var label: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        
        self.title = str;
        label.text = "Selected \(str!)";
        
        let v = UIView(frame: CGRectMake(self.view.frame.size.width-100, self.view.frame.size.height-100, 100, 100));
        v.backgroundColor = UIColor.redColor();
        v.layer.cornerRadius = 5;
        v.layer.masksToBounds = true;
        v.autoresizingMask =  [.FlexibleLeftMargin, .FlexibleTopMargin];
    
        self.view.addSubview(v);
        
        let right = UIBarButtonItem(title: "꺼져", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("homeButtonPressed"));
        self.navigationItem .setRightBarButtonItem(right, animated: true);
    }
    
    func homeButtonPressed() {
        
        self.navigationController?.popToRootViewControllerAnimated(true);
    }

}
