//
//  currently.swift
//  WeatherForecast
//
//  Created by Shreshta Manu on 18/11/15.
//  Copyright © 2015 Shreshta Manu. All rights reserved.
//

import Foundation

class currently {
    
    var iconurl:String
    
    var summary:String
    
    var temp:String
    
    var tempIndicator:String
    
    var lowHighTemp:String
    
    var precipIntensity:String
    
    var precipProb:String
    
    var windSpeed:String
    
    var dew:String
    
    var humidity:String
    
    var visibility:String
    
    var sunRiseTime:String
    
    var sunSetTime:String
    
    init(iconurl:String,summary:String,temp:String,tempIndicator:String,lowHighTemp:String,precipIntensity:String,precipProb:String,windSpeed:String,dew:String,humidity:String,visibility:String,sunRiseTime:String,sunSetTime:String){
        
        self.iconurl=iconurl
        self.summary=summary
        self.temp=temp
        self.tempIndicator=tempIndicator
        self.lowHighTemp=lowHighTemp
        self.precipIntensity=precipIntensity
        self.precipProb=precipProb
        self.windSpeed=windSpeed
        self.dew=dew
        self.humidity=humidity
        self.visibility=visibility
        self.sunRiseTime=sunRiseTime
        self.sunSetTime=sunSetTime
    }
    
}