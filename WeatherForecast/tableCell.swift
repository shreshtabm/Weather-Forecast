//
//  tableCell.swift
//  WeatherForecast
//
//  Created by Shreshta Manu on 17/11/15.
//  Copyright © 2015 Shreshta Manu. All rights reserved.
//

import UIKit

class tableCell: UITableViewCell {

   
    @IBOutlet weak var hourlyTime: UILabel!
    @IBOutlet weak var hourlyImage: UIImageView!
    
    @IBOutlet weak var hourlyTemp: UILabel!
    
    @IBOutlet weak var addMore: UIButton!
    @IBOutlet weak var summary: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setTableCells(hourlyTime: String, hourlyImage: String, hourlyTemp: String, addMore : Int){
        
        if(addMore == 1)
        {
            self.addMore.hidden = false
            
            self.hourlyTime.hidden = true
            
            
            self.hourlyImage.image = UIImage(named: "plus_add")
            
           self.hourlyTemp.hidden = true
            summary.hidden = true
        }
            
        
        if(addMore == 2)
        {
             self.hourlyTime.hidden = false
            summary.hidden = true
            
            self.hourlyImage.hidden = false
            
             self.hourlyTemp.hidden = false
        self.addMore.hidden = true
        self.hourlyTime.text = hourlyTime
        
        let url = NSURL(string: hourlyImage)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        
        self.hourlyImage.image = UIImage(data: data!)
        
        self.hourlyTemp.text = hourlyTemp
        }
        if(addMore == 0)
        {
            self.addMore.hidden = true
            
            self.hourlyTime.text = "Time"
            
            self.hourlyTemp.font = UIFont.boldSystemFontOfSize(15)
            
            self.hourlyImage.hidden = true
            
            self.summary.text = "Summary"
            
            self.summary.font = UIFont.boldSystemFontOfSize(15)
            
            if(degree=="Fahrenheit"){
                self.hourlyTemp.text = "Temp(\u{00B0}F)"
            }else{
                self.hourlyTemp.text = "Temp(\u{00B0}C)"
            }
            
        self.summary.hidden = false
        }
        
    }
  
}
