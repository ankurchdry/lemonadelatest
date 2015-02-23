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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateMainView()
    }

    @IBAction func purchaseLemonButtonPressed(sender: UIButton) {
    }

    @IBAction func unpurchaseLemonButtonPressed(sender: UIButton) {
    }
    @IBAction func purchaseIcecubeButtonPressed(sender: UIButton) {
    }
    @IBAction func unpurchaseIcecubeButtonPressed(sender: UIButton) {
    }
   
    @IBAction func mixLemonButtonPressed(sender: UIButton) {
    }
    @IBAction func unmixLemonButtonPressed(sender: UIButton) {
    }
  
    @IBAction func mixIcecubeButtonPressed(sender: UIButton) {
    }
    @IBAction func unmixIcecubeButtonPressed(sender: UIButton) {
    }
    
    @IBAction func startdayButtonPressed(sender: UIButton) {
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
    
    func showAlertWithText(header : String = "Warning", message : String) {
        
        var alert = UIAlertController(title: header, message: message
            , preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

