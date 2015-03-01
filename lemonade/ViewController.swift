//
//  ViewController.swift
//  lemonade
//
//  Created by ankurchdry on 2/23/15.
//  Copyright (c) 2015 ankurchdry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var moneySupplyCount: UILabel!
    @IBOutlet weak var lemonSupplyCount: UILabel!
    @IBOutlet weak var icecubeSupplyCount: UILabel!
    @IBOutlet weak var lemonPurchaseCount: UILabel!
    @IBOutlet weak var icecubePurchaseCount: UILabel!
    @IBOutlet weak var lemonMixCount: UILabel!
    @IBOutlet weak var icecubeMixCount: UILabel!
    
    var supplies = Supplies(amoney: 10, alemon: 1, aiceCubes: 1)
    let price = Price()
    
    //Properties to understand how many supplies are added or Mixed
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    var lemonsToMix = 0
    var iceCubesToMix = 0
    
    // Lets randomize the customers based on Weather Input
    var weatherArray: [[Int]] = [[-10,-9,-5,-1],[2,5,6,9],[10, 13, 15, 20], [21,23,24,30],[31,45,55,65]]
    var weatherToday: [Int] = []
    
    var weatherImageView: UIImageView = UIImageView(frame: CGRectMake(20, 50, 50, 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(weatherImageView)
        updateMainView()
    }

    @IBAction func purchaseLemonButtonPressed(sender: UIButton) {
        
        if supplies.money >= price.lemon {
            lemonsToPurchase += 1
            supplies.money -= price.lemon
            supplies.lemon += 1
            updateMainView()
         }
        else {
            showAlertWithText(message: "You Dont have Enough Money")
        }
    }

    @IBAction func unpurchaseLemonButtonPressed(sender: UIButton) {
        
        if lemonsToPurchase > 0 {
            
            lemonsToPurchase -= 1
            supplies.money += price.lemon
            supplies.lemon -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You Dont have anything to return")
        }
    }
    @IBAction func purchaseIcecubeButtonPressed(sender: UIButton) {
        if supplies.money >= price.iceCubes {
            iceCubesToPurchase += 1
            supplies.money -= price.iceCubes
            supplies.iceCubes += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You Dont have Enough Money")
        }
    }
    @IBAction func unpurchaseIcecubeButtonPressed(sender: UIButton) {
        if iceCubesToPurchase > 0 {
            
            iceCubesToPurchase -= 1
            supplies.money += price.iceCubes
            supplies.iceCubes -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You Dont have anything to return")
        }

    }
   
    @IBAction func mixLemonButtonPressed(sender: UIButton) {
        
        if supplies.lemon > 0 {
            supplies.lemon -= 1
            lemonsToMix += 1
            updateMainView()
            
        }
        else{
            showAlertWithText(message: "You Dont have enough lemon to mix")
        }
        
    }
    @IBAction func unmixLemonButtonPressed(sender: UIButton) {
        
        if lemonsToMix > 0 {
            supplies.lemon += 1
            lemonsToMix -= 1
            updateMainView()
        }
        else{
            showAlertWithText(message: "You Dont have enough lemon to unmix")
        }
    }
  
    @IBAction func mixIcecubeButtonPressed(sender: UIButton) {
        
        if supplies.iceCubes > 0 {
            supplies.iceCubes -= 1
            iceCubesToMix += 1
            updateMainView()
            
        }
        else{
            showAlertWithText(message: "You Dont have enough lemon to mix")
        }
    }
    @IBAction func unmixIcecubeButtonPressed(sender: UIButton) {
        
        if iceCubesToMix > 0 {
            supplies.iceCubes += 1
            iceCubesToMix -= 1
            updateMainView()
        }
        else{
            showAlertWithText(message: "You Dont have enough Icecubes to unmix")
        }

    }
    
    @IBAction func startdayButtonPressed(sender: UIButton) {
        
        simulateWeather()

      let average = findAverage(weatherToday)
        
        let customers = Int(arc4random_uniform(UInt32(abs(average))))
        
        println("lets print number of customer \(customers)")
        
        if lemonsToMix == 0 && iceCubesToMix == 0 {
            
            showAlertWithText(message : "You need add atleast 1 lemon and 1 Ice-Cubes")
        }
        
        let lemonadeRatio = Double(lemonsToMix)/Double(iceCubesToMix)
        
        for x in 0...customers {
            
            let preference = Double(arc4random_uniform(UInt32(101))) / 100
            
            if preference < 0.4 && lemonadeRatio > 1 {
                supplies.money += 1
                println("Paid for loop 1")
            }
            else if preference > 0.6 && lemonadeRatio < 1 {
                supplies.money += 1
                println("Paid for loop 2")
            }
            else if preference <= 0.4 && preference >= 0.6 && lemonadeRatio == 1 {
                supplies.money += 1
                println("Paid for loop 3")
            }
            else {
                println("Evaluating Else")
            }
            
        }
        resetEndOfEachDay()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func updateMainView() {
        moneySupplyCount.text = "$\(supplies.money)"
        lemonSupplyCount.text = "\(supplies.lemon) lemons "
        icecubeSupplyCount.text = "\(supplies.iceCubes) IceCubes "
        
        lemonPurchaseCount.text = "\(lemonsToPurchase)"
        icecubePurchaseCount.text = "\(iceCubesToPurchase)"
        
        lemonMixCount.text = "\(lemonsToMix)"
        icecubeMixCount.text = "\(iceCubesToMix)"
    }
    
    func resetEndOfEachDay() {
        lemonsToPurchase = 0
        iceCubesToPurchase = 0
        lemonsToMix = 0
        iceCubesToMix = 0
        updateMainView()
    }
    
    func simulateWeather() {
        
       let index = Int(arc4random_uniform(UInt32(weatherArray.count)))
        
        print ("Lets print \(index)")
        weatherToday = weatherArray[index]
        
        switch index {
        case 0: weatherImageView.image = UIImage(named: "Cold")
          case 1: weatherImageView.image = UIImage(named: "Mild")
            case 2: weatherImageView.image = UIImage(named: "Warm")
            default: weatherImageView.image = UIImage(named: "Warm")
        }
        
    }
    
    func findAverage(data:[Int]) -> Int {
        
        var sum = 0
        
        for x in data {
            
            sum += x
        }
        
      var  average:Double = Double(sum) / Double(data.count)
      println("Lets Print Average \(average)")
        var rounded:Int = Int(ceil(average))
      return rounded
        
    }
    
    func showAlertWithText(header : String = "Warning", message : String) {
        
        var alert = UIAlertController(title: header, message: message
            , preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

