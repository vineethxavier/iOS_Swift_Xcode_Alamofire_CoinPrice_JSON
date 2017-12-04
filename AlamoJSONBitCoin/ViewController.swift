//
//  ViewController.swift
//  AlamoJSONBitCoin
//
//  Created by Vineeth Xavier on 12/3/17.
//  Copyright © 2017 Vineeth Xavier. All rights reserved.
//


//https://cocoapods.org/?q=lang%3Aswift%20on%3Aios%20hud

import UIKit
import Alamofire
import SVProgressHUD
class ViewController: UIViewController {

    @IBOutlet weak var LblCoinVal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        SVProgressHUD.show(withStatus: "Loading..  ")
        LblCoinVal.text = ". . ."
       
         Alamofire.request("https://api.coindesk.com/v1/bpi/currentprice.json").responseJSON{response in  print(response)
            print("------------------")
            if let bitCoinJSON = response.result.value{
                let bitcoinObject: Dictionary = bitCoinJSON as! Dictionary<String, Any>
                //print(bitcoinObject)
                let bpiObject: Dictionary = bitcoinObject["bpi"] as! Dictionary<String,Any>
                let usdObject: Dictionary = bpiObject["USD"] as! Dictionary<String,Any>
                let rate:Float = usdObject["rate_float"] as! Float
                
                let rateFloat:Float = rate
                
                self.LblCoinVal.text = "$\(rateFloat)"
            }
            print("loading....")
        }
        //UIApplication.shared.beginIgnoringInteractionEvents() // start ignoring all activities on screen
        //UIApplication.shared.endIgnoringInteractionEvents()   // end  ignoring
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
        SVProgressHUD.dismiss()
    }
    override func viewWillAppear(_ animated: Bool) {
        
       
    }
    


}

