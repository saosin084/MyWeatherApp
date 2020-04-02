  
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
    var lat1 = 34.45
    var lon1 = 132.47
    var lat2 = 35.69
    var lon2 = 139.69
    var lat3 = 34.69
    var lon3 = 135.5
    var argString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if argString == "広島"{
            wheather(lat: Float(lat1),lon: Float(lon1))
        }
        else if argString == "東京"{
            wheather(lat: Float(lat2),lon: Float(lon2))
        }
        else if argString == "大阪"{
            wheather(lat: Float(lat3),lon: Float(lon3))
        }
        kenlabel.text = argString
    }
    
    func wheather(lat: Float,lon: Float){ Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric").responseJSON {
    
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
  }
