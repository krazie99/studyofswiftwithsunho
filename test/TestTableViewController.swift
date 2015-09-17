//
//  TestTableViewController.swift
//  test
//
//  Created by CHOISUNHO on 2015. 9. 10..
//  Copyright (c) 2015년 CHOISUNHO. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {
    
    var dic = ["key1":["1","2","3","4"],"key2":["111","2222","3333","4444"]];

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "테이블"
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SUNHO");
        
        let arTmp = dic["key1"];
        print(arTmp);
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return dic.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if(section == 1){
            let arTmp = dic["key2"];
            return (arTmp?.count)!;
        }
        
        let arTmp = dic["key1"];
        return (arTmp?.count)!;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SUNHO", forIndexPath: indexPath)

        if(indexPath.section == 1){
            let arTmp : [String] = dic["key2"]!;
            cell.textLabel?.text = arTmp[indexPath.row]
        }else {
            let arTmp : [String] = dic["key1"]!;
            cell.textLabel?.text = arTmp[indexPath.row]
        }
            
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
    }


    //erride to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        
        if(indexPath.section == 0)
        {
            return false;
        }
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        
        
        if(indexPath.section == 1){
        
            //모달 modal
            //var arTmp : [String] = dic["key2"]!;
            let story = UIStoryboard(name: "Main", bundle: nil);
            
            let testNavViewController = story.instantiateViewControllerWithIdentifier("DetailModalNavViewController") as! UINavigationController;
            //testNavViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl;
            self.presentViewController(testNavViewController, animated: true, completion: { () -> Void in
            })
            
        }else {
            
            //상세페이지로 이동
            let story = UIStoryboard(name: "Main", bundle: nil);
            let detailViewController = story.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController;
            //detailViewController.title = ar[indexPath.row] as? String;
            
            var arTmp : [String] = dic["key1"]!;
            detailViewController.str =  arTmp[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true);

        }
        
    }

}
