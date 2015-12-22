//
//  FirstScreen.swift
//  WeatherForecast
//
//  Created by Shreshta Manu on 14/11/15.
//  Copyright © 2015 Shreshta Manu. All rights reserved.
//

import UIKit
import Foundation

var currentDetails : currently!

var hourlyDetails : [hourlyData] = [hourlyData]()

var dailyDetails : [weeklyData] = [weeklyData]()

var cellHeading:String = ""

var degree : String = ""

var latitude : Double!

var longitude : Double!

class FirstScreen: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var selectedState : String = "Select"
    
    var path : String = "http://kbasavaraj-app1-env.elasticbeanstalk.com/?"
    
    var flag : Bool = false
    
    var flag1 : Bool = false
    
    var degSymbol : String = ""

    @IBOutlet weak var streetAddress: UITextField!
    
    
    @IBOutlet weak var city: UITextField!
    
    
    @IBOutlet weak var radio1: UIImageView!
    
    
    @IBOutlet weak var radio2: UIImageView!
    
    
    @IBOutlet weak var error: UILabel!
    
   
    @IBOutlet weak var state: UIPickerView!
    
    var statesName : [String] = ["Select","Alabama","Arkansas","California","Colorado","New York","Texas"]
    var statesValue : [String] = ["Select","AL","AK","CA","CO","NY","TX"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radio1.image = UIImage(named : "radio_checked")
        
        radio2.image = UIImage(named : "radio_unchecked")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return statesName.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return statesName[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedState = statesValue[row]
    }
    
    @IBAction func Fahrenheit(sender: AnyObject) {
        
        radio1.image = UIImage(named : "radio_checked")
        
        radio2.image = UIImage(named : "radio_unchecked")
        
    }
    @IBAction func Celsius(sender: AnyObject) {
        
        radio1.image = UIImage(named: "radio_unchecked")
        
        radio2.image = UIImage(named: "radio_checked")
        
    }

    @IBAction func Search(sender: AnyObject) {
        
        if(streetAddress.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) == ""){
            error.text = "Please enter a Street Address."
        }
        
        else if(city.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) == ""){
            error.text = "Please enter a City."
        }
        
        else if(selectedState == "Select"){
            error.text = "Please select a state"
        }
        
        else{
            flag = true
            error.text = ""
            cellHeading = "More Details for "+self.city.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())+", "+self.selectedState
        }
        
        if(radio1.image == UIImage(named : "radio_checked")){
            degree = "Fahrenheit"
            degSymbol="\u{00B0}F"
        }
        else{
            degree = "Celsius"
            degSymbol="\u{00B0}C"
        }
  
        let streetString = String(streetAddress.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).characters.map {
            $0 == " " ? "+" : $0
            })
        let cityString = String(city.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).characters.map {
            $0 == " " ? "+" : $0
            })
        if(flag){
            path+="StreetAddress="+streetString
            path+="&City="+cityString
            path+="&State="+selectedState
            path+="&Degree="+degree
            
            print(path)
            
            
            hourlyDetails.removeAll()
            dailyDetails.removeAll()
            let session = NSURLSession.sharedSession()
            let url = NSURL(string: path)!
            
            // Make the POST call and handle it in a completion handler
            session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                
                // Read the JSON
                do {
                    
                    // Parse the JSON to get the IP
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    let daily = json["daily"]!["data"] as! NSArray
                    let hourly = json["hourly"]!["data"] as! NSArray
                    
                    latitude = json["latitude"] as! Double
                    longitude = json["longitude"] as! Double
                    
                    let summary = json["currently"]!["summary"] as! String
                    
                    let currentTemp = String(json["currently"]!["temperature"] as! Int)
                    
                    let summaryDetails: String = summary+" in "+self.city.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())+", "+self.selectedState
                    
                    var icon = json["currently"]!["icon"] as! String
                    if(icon=="clear-day"){
                        icon="clear";
                    }
                    if(icon=="clear-night"){
                        icon="clear_night";
                    }
                    if(icon=="partly-cloudy-day"){
                        icon="cloud_day";
                    }
                    if(icon=="partly-cloudy-night"){
                        icon="cloud_night";
                    }
                    var iconurl : String = ""
                    iconurl="http://cs-server.usc.edu:45678/hw/hw8/images/"+icon+".png"
                    
                    print(iconurl)
                    
                    let precipIntensity=json["currently"]!["precipIntensity"] as! Float
                    var precipitation : String = ""
                    if(degree == "Fahrenheit"){
                        if(precipIntensity>=0&&precipIntensity<0.002){
                            precipitation="None";
                        }
                        if(precipIntensity>=0.002&&precipIntensity<0.017){
                            precipitation="Very Light";
                        }
                        if(precipIntensity>=0.017&&precipIntensity<0.1){
                            precipitation="Light";
                        }
                        if(precipIntensity>=0.1&&precipIntensity<0.4){
                            precipitation="Moderate";
                        }
                        if(precipIntensity>=0.4){
                            precipitation="Heavy";
                        }
                    }
                    else{
                        if(precipIntensity>=0&&precipIntensity<0.0508){
                            precipitation="None";
                        }
                        if(precipIntensity>=0.0508&&precipIntensity<0.4318){
                            precipitation="Very Light";
                        }
                        if(precipIntensity>=0.4318&&precipIntensity<2.54){
                            precipitation="Light";
                        }
                        if(precipIntensity>=2.54&&precipIntensity<10.16){
                            precipitation="Moderate";
                        }
                        if(precipIntensity>=10.16){
                            precipitation="Heavy";
                        }
                    }
                    print(precipitation)
                    var rain = String(floor(json["currently"]!["precipProbability"] as! Float*100))
                    rain=rain+"%"
                    print(rain)
                    var wind = String(json["currently"]!["windSpeed"] as! Float)
                    if(degree == "Fahrenheit"){
                        wind+=" mph"
                        }
                    else{
                        wind+=" m/s"
                        }
                        print(wind)
                    var dewPoint = String(json["currently"]!["dewPoint"] as! Int)
                    if(degree == "Fahrenheit"){
                            dewPoint+=" \u{00B0}F"
                        }
                    else{
                            dewPoint+=" \u{00B0}C"
                        }
                    print(dewPoint)
                    var humidity = String(floor(json["currently"]!["humidity"] as! Float*100))
                    humidity+="%"
                    print(humidity)
                    var visibility : String
                    if let visibile = json["currently"]!["visibility"] as? Float{
                        visibility = String(visibile)
                        if(degree == "Fahrenheit"){
                            visibility+=" mi"
                        }
                        else{
                            visibility+=" km"
                        }
                    }
                    else{
                        visibility = "N/A"
                    }
                    print("visibility:"+visibility)
                    let timeZone = json["timezone"] as! String
                    let sunRiseTimeStamp = daily[0]["sunriseTime"] as! Double
                    let sunSetTimeStamp = daily[0]["sunsetTime"] as! Double
                    
                    let dateSunRise = NSDate(timeIntervalSince1970: sunRiseTimeStamp)
                    let dateSunSet = NSDate(timeIntervalSince1970: sunSetTimeStamp)
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "hh:mm a"
                    dateFormatter.timeZone = NSTimeZone(name: timeZone)
                    let sunRiseTime = dateFormatter.stringFromDate(dateSunRise)
                    let sunSetTime = dateFormatter.stringFromDate(dateSunSet)
                    print("sunRise:"+sunRiseTime)
                    print("sunSet:"+sunSetTime)
                    
                    let minTemp = String(daily[0]["temperatureMin"] as! Int)
                    let maxTemp = String(daily[0]["temperatureMax"] as! Int)
                    
                    let lowHighTemp = "L:"+minTemp+"\u{00B0} | H:"+maxTemp+"\u{00B0}"
                    print(lowHighTemp)
                    
                    currentDetails = currently(iconurl: iconurl, summary: summaryDetails, temp: currentTemp, tempIndicator: self.degSymbol, lowHighTemp: lowHighTemp, precipIntensity: precipitation, precipProb: rain, windSpeed: wind, dew: dewPoint, humidity: humidity, visibility: visibility, sunRiseTime: sunRiseTime, sunSetTime: sunSetTime)
                    
                    
                    for(var i = 0 ; i<hourly.count;i++){
                    
                       // let i = 0
                    
                        let timeStamp=hourly[i]["time"] as! Double
                        let hourlyTimeStamp = NSDate(timeIntervalSince1970: timeStamp)
                        let hourlyTime = dateFormatter.stringFromDate(hourlyTimeStamp)
                       // print(hourlyTime)
                        
                        var hourlyIcon=hourly[i]["icon"] as! String
                        if(hourlyIcon=="clear-day"){
                            hourlyIcon="clear";
                        }
                        if(hourlyIcon=="clear-night"){
                            hourlyIcon="clear_night";
                        }
                        if(hourlyIcon=="partly-cloudy-day"){
                            hourlyIcon="cloud_day";
                        }
                        if(hourlyIcon=="partly-cloudy-night"){
                            hourlyIcon="cloud_night";
                        }
                       // print(hourlyIcon)
                        var hourlyIconUrl : String = ""
                        hourlyIconUrl="http://cs-server.usc.edu:45678/hw/hw8/images/"+hourlyIcon+".png"
                        //print(hourlyIconUrl)
                        
                        var tempHourly:String
                        
                        if let hourlyTemp = hourly[i]["temperature"] as? Int{
                           // print(hourlyTemp)
                            tempHourly=String(hourlyTemp)
                        }else{
                            tempHourly="N/A"
                        }
                        
                       // print(tempHourly)
                        //let tempHourly = String(hourly[i]["temperature"] as! Int)
                    
                    var newHourlyDetails:hourlyData!
                    
                    newHourlyDetails = hourlyData(time: hourlyTime, iconurl: hourlyIconUrl, temp: tempHourly)
                    hourlyDetails.append(newHourlyDetails)
                        
                  //  print("Time:"+hourlyDetails[i].time+"\nurl:"+hourlyDetails[i].iconurl+"\nhourlyTemp:"+hourlyDetails[i].temp)
                        
                    }
                   
                   /* for data:hourlyData in hourlyDetails{
                        print(data.time)
                        print(data.iconurl)
                        print(data.temp)
                    }*/
                    
                    for(var i=1;i<daily.count;i++){
                        
                        let timeStamp=daily[i]["time"] as! Double
                        let weeklyTimeStamp=NSDate(timeIntervalSince1970: timeStamp)
                        let day=NSDateFormatter()
                        let date=NSDateFormatter()
                        day.dateFormat="cccc"
                        day.timeZone=NSTimeZone(name: timeZone)
                        date.dateFormat="MMM dd"
                        date.timeZone=NSTimeZone(name: timeZone)
                        
                        let weekDay=day.stringFromDate(weeklyTimeStamp)
                        let weekDate=date.stringFromDate(weeklyTimeStamp)
                        
                        let weeklyDate:String = weekDay+", "+weekDate
                        //print(weeklyDate)
                        
                        var weeklyIcon=daily[i]["icon"] as! String
                        if(weeklyIcon=="clear-day"){
                            weeklyIcon="clear";
                        }
                        if(weeklyIcon=="clear-night"){
                            weeklyIcon="clear_night";
                        }
                        if(weeklyIcon=="partly-cloudy-day"){
                            weeklyIcon="cloud_day";
                        }
                        if(weeklyIcon=="partly-cloudy-night"){
                            weeklyIcon="cloud_night";
                        }
                        var weeklyIconUrl : String = ""
                        weeklyIconUrl="http://cs-server.usc.edu:45678/hw/hw8/images/"+weeklyIcon+".png"
                        //print(weeklyIconUrl)
                        
                        let lowTemp = String(daily[i]["temperatureMin"] as! Int)
                        let highTemp = String(daily[i]["temperatureMax"] as! Int)
                        
                        var lowHighTemp : String = ""
                        if(degree=="Fahrenheit"){
                            lowHighTemp = "Min: "+lowTemp+"\u{00B0}F | Max: "+highTemp+"\u{00B0}F"
                        }else{
                            lowHighTemp = "Min: "+lowTemp+"\u{00B0}C | Max: "+highTemp+"\u{00B0}C"
                        }
                        //print(lowHighTemp)
                        var dailyData:weeklyData!
                        
                        dailyData=weeklyData(date: weeklyDate, iconurl: weeklyIconUrl, lowHighTemp: lowHighTemp)
                        
                        
                        dailyDetails.append(dailyData)
                        
                    }
                    
                   /* for data in dailyDetails{
                        print(data.date)
                        print(data.iconurl)
                        print(data.lowHighTemp)
                    }*/
                    
                    
                } catch {
                    print("bad things happened")
                    self.flag = false
                    self.error.text = "Please enter a valid address!"
                }
            }).resume()
            
            
            }
       
        if(flag){
            sleep(3)
            
        performSegueWithIdentifier("mysegue", sender: nil)
            
        }
       
    
    }

    @IBAction func Clear(sender: AnyObject) {
        
        streetAddress.text = nil
        
        city.text = nil
        
        radio1.image = UIImage(named : "radio_checked")
        
        radio2.image = UIImage(named : "radio_unchecked")
        
        state.selectRow(0, inComponent: 0, animated: false)
        
        error.text = ""
        
    }
    
   
}
