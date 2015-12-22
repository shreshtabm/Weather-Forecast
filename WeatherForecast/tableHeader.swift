//
//  tableHeader.swift
//  WeatherForecast
//
//  Created by Shreshta Manu on 20/11/15.
//  Copyright © 2015 Shreshta Manu. All rights reserved.
//

import UIKit

class tableHeader: UITableViewCell {

    @IBOutlet weak var headerActivity1: UILabel!
    
    @IBOutlet weak var headerActivity2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setHeader1(header: String){
        self.headerActivity1.text=header
    }
    func setHeader2(header: String){
        self.headerActivity2.text=header
    }
}
