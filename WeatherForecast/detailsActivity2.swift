//
//  detailsActivity2.swift
//  WeatherForecast
//
//  Created by Shreshta Manuon 20/11/15.
//  Copyright © 2015 Shreshta Manu. All rights reserved.
//

import UIKit

class detailsActivity2: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var weeklyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyDetails.count+1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row==0){
            return 200.0
        }
        else{
            return 120.0
        }
    }
        
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if(indexPath.row==0){
            let cell:tableHeader = tableView.dequeueReusableCellWithIdentifier("dailyFixedCell") as! tableHeader
            cell.setHeader2(cellHeading)
            
            return cell
            
        }
        let cell:weeklyTableCell = tableView.dequeueReusableCellWithIdentifier("dailyCell", forIndexPath: indexPath) as! weeklyTableCell
        if(indexPath.row==1){
            cell.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 219/255, blue: 106/255, alpha: 1)

        }
        if(indexPath.row==2){
            cell.backgroundColor = UIColor(colorLiteralRed: 160/255, green: 213/255, blue: 255/255, alpha: 1)
            
        }
        if(indexPath.row==3){
            cell.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 196/255, blue: 234/255, alpha: 1)
            
        }
        if(indexPath.row==4){
            cell.backgroundColor = UIColor(colorLiteralRed: 196/255, green: 255/255, blue: 165/255, alpha: 1)
            
        }
        if(indexPath.row==5){
            cell.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 189/255, blue: 183/255, alpha: 1)
            
        }
        if(indexPath.row==6){
            cell.backgroundColor = UIColor(colorLiteralRed: 239/255, green: 255/255, blue: 181/255, alpha: 1)
            
        }
        if(indexPath.row==7){
            cell.backgroundColor = UIColor(colorLiteralRed: 188/255, green: 190/255, blue: 106/255, alpha: 1)
            
        }
        
        cell.setWeeklyTableCell(dailyDetails[indexPath.row-1].date, weeklyImage: dailyDetails[indexPath.row-1].iconurl, weeklyTemp: dailyDetails[indexPath.row-1].lowHighTemp)
        
        return cell
        
    }
    

}
