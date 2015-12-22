//
//  weeklyTableCell.swift
//  WeatherForecast
//
//  Created by Shreshta Manu on 20/11/15.
//  Copyright © 2015 Shreshta Manu. All rights reserved.
//

import UIKit

class weeklyTableCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var weeklyImage: UIImageView!
    
    @IBOutlet weak var weeklyLowHigh: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setWeeklyTableCell(date: String, weeklyImage: String, weeklyTemp: String){
        self.date.text=date
        
        let url = NSURL(string: weeklyImage)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        
        self.weeklyImage.image = UIImage(data: data!)
        
        self.weeklyLowHigh.text=weeklyTemp

        
    }
}
