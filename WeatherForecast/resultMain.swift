//
//  resultMain.swift
//  WeatherForecast
//
//  Created by Shreshta Manu on 16/11/15.
//  Copyright © 2015 Shreshta Manu. All rights reserved.
//

import UIKit



class resultMain: UIViewController {
    
  
    
    @IBOutlet weak var mainTemp: UILabel!
    
    @IBOutlet weak var lowHighTemp: UILabel!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var windSpeed: UILabel!
    
    @IBOutlet weak var precipProb: UILabel!
    
    @IBOutlet weak var dew: UILabel!
    
    @IBOutlet weak var precip: UILabel!
  
    @IBOutlet weak var humidity: UILabel!
    
    @IBOutlet weak var visibility: UILabel!
    
    @IBOutlet weak var sunRise: UILabel!
  
    @IBOutlet weak var sunSet: UILabel!
    
    @IBOutlet weak var degSymbol: UILabel!
    
    @IBOutlet weak var mainTitle: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.contentSize.height = 763
       sleep(1)
        
        let url = NSURL(string: currentDetails.iconurl)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        
        mainImage.image = UIImage(data: data!)
        
      /*  print(currentDetails)*/
        
        mainTemp.text =  currentDetails.temp
        
        mainTitle.text = currentDetails.summary
        
        degSymbol.text = currentDetails.tempIndicator
        
        lowHighTemp.text = currentDetails.lowHighTemp
        
        precip.text = currentDetails.precipIntensity
        
        precipProb.text = currentDetails.precipProb
        
        dew.text = currentDetails.dew
        
        humidity.text = currentDetails.humidity
        
        visibility.text = currentDetails.visibility
        
        windSpeed.text = currentDetails.windSpeed
        
        sunRise.text = currentDetails.sunRiseTime
        
        sunSet.text = currentDetails.sunSetTime
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
