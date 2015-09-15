//
//  TestTableViewController.swift
//  test
//
//  Created by CHOISUNHO on 2015. 9. 10..
//  Copyright (c) 2015년 CHOISUNHO. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {
    
    var ar : [Any]! = ["1","2","3","4"];
    var ar2 : [Any]! = ["777","777","7777","777"];

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "테이블"
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SUNHO");
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
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if(section == 1){
            return ar2.count;
        }
        
        return ar.count;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SUNHO", forIndexPath: indexPath)

        if(indexPath.section == 1){
            cell.textLabel?.text = ar2[indexPath.row] as? String
        }else {
            cell.textLabel?.text = ar[indexPath.row] as? String
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
        
        //상세페이지로 이동
        let story = UIStoryboard(name: "Main", bundle: nil);
        let detailViewController = story.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController;
        //detailViewController.title = ar[indexPath.row] as? String;
       
        if(indexPath.section == 1){
            detailViewController.str =  ar2[indexPath.row] as? String;
        }else {
            detailViewController.str =  ar[indexPath.row] as? String;
        }
        
        self.navigationController?.pushViewController(detailViewController, animated: true);

        
    }

}
