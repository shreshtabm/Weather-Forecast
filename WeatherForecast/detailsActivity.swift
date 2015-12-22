//
//  detailsActivity.swift
//  WeatherForecast
//
//  Created by Shreshta Manu on 17/11/15.
//  Copyright © 2015 Shreshta Manu. All rights reserved.
//

import UIKit

var number = 27

var flag = false

class detailsActivity: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var table: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //table.rowHeight=76
       // self.detailsActivity.backgroundColor = UIColor.whiteColor()
        table.backgroundColor = UIColor.whiteColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row==0){
        return 200.0
        }
        else{
           return 76.0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if(indexPath.row==0){
            let cell:tableHeader = table.dequeueReusableCellWithIdentifier("hourlyFixedCell") as! tableHeader
            cell.setHeader1(cellHeading)
            return cell
        }
        
        if(indexPath.row == 1)
        {
            
            let cell:tableCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! tableCell
            cell.setTableCells("", hourlyImage: "", hourlyTemp: "",addMore: 0)
            cell.backgroundColor = UIColor(colorLiteralRed: 132/255, green: 236/255, blue: 230/255, alpha: 1)
            return cell
        }
        
        if(indexPath.row==26){
            if(flag==false)
        {
            let cell:tableCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! tableCell
            cell.setTableCells(hourlyDetails[indexPath.row-2].time, hourlyImage: hourlyDetails[indexPath.row-2].iconurl, hourlyTemp: hourlyDetails[indexPath.row-2].temp,addMore: 1)
            cell.backgroundColor = UIColor.lightGrayColor()
            return cell
            }
           
        }
        
        
        let cell:tableCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! tableCell
        cell.setTableCells(hourlyDetails[indexPath.row-2].time, hourlyImage: hourlyDetails[indexPath.row-2].iconurl, hourlyTemp: hourlyDetails[indexPath.row-2].temp,addMore: 2)
        
        if(indexPath.row % 2 == 1)
        {
            cell.backgroundColor = UIColor.whiteColor()
        }
        else{
        cell.backgroundColor = UIColor.lightGrayColor()
        }
        return cell
        
        
    }

    @IBAction func add(sender: AnyObject) {
        
        number = 50
        flag=true
    
    
        self.table.reloadData()
        
        
        
    }
 

}
