  
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
    
    let apiKey = "e846088f82debcd7f279c5792dceb51b"
    var lat = 34.45
    var lon = 132.47
    var argString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric").responseJSON {
        
        response in
        
         if let responseStr = response.result.value {
            let jsonResponse = JSON(responseStr)
            let jsonWeather = jsonResponse["weather"].array![0]
            
            self.label.text = jsonWeather["main"].stringValue
         }
         }
        
        kenlabel.text = argString
    }
}
