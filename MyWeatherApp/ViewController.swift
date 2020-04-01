  
//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by higuchiryunosuke on 2020/01/07.
//  Copyright © 2020年 higuchiryunosuke. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController{
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var kenlabel: UILabel!
    @IBOutlet weak var templabel: UILabel!
    
    let apiKey = "e846088f82debcd7f279c5792dceb51b"
    var lat = 34.45
    var lon = 132.47
    var lat1 = 35.69
    var lon1 = 139.69
    var lat2 = 34.69
    var lon2 = 135.5
    var argString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if argString == "広島"{
            Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric").responseJSON {
        
                response in
        
                if let responseStr = response.result.value {
                    let jsonResponse = JSON(responseStr)
                    let jsonWeather = jsonResponse["weather"].array![0]
                    let jsonTemp = jsonResponse["main"]
                    
                    self.label.text = jsonWeather["main"].stringValue
                    self.templabel.text = "\(Int(round(jsonTemp["temp"].doubleValue)))"
                }
            }
        }
        else if argString == "東京"{
            Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(lat1)&lon=\(lon1)&appid=\(apiKey)&units=metric").responseJSON {
        
                response in
        
                if let responseStr = response.result.value {
                    let jsonResponse = JSON(responseStr)
                    let jsonWeather = jsonResponse["weather"].array![0]
                    let jsonTemp = jsonResponse["main"]
                    self.label.text = jsonWeather["main"].stringValue
                    self.templabel.text = "\(Int(round(jsonTemp["temp"].doubleValue)))"
                }
            }
        }
        else if argString == "大阪"{
            Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(lat2)&lon=\(lon2)&appid=\(apiKey)&units=metric").responseJSON {
        
                response in
        
                if let responseStr = response.result.value {
                    let jsonResponse = JSON(responseStr)
                    let jsonWeather = jsonResponse["weather"].array![0]
                    let jsonTemp = jsonResponse["main"]
            
                    self.label.text = jsonWeather["main"].stringValue
                    self.templabel.text = "\(Int(round(jsonTemp["temp"].doubleValue)))"
                }
            }
        }
        kenlabel.text = argString
    }
}
