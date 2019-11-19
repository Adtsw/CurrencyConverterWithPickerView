//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by AASHISH on 13/11/19.
//  Copyright © 2019 Aashish. All rights reserved.
//

import UIKit

var exchangeRateDictionary: [String: String] = ["US Dollar:US Dollar": "1.00","US Dollar:CAD": "1.32","US Dollar:INR": "71.70", "CAD:CAD": "1.00", "CAD:US Dollar": "0.76", "CAD:INR": "54.22", "INR:INR": "1.00", "INR:US Dollar": "0.014", "INR:CAD": "0.018"]

class ViewController: UIViewController {

    var currencyValue:Double = 0.0
    var whichCurrency:Int = 0;  // to check which 'change' button is called - from or to
    var result:Double = 0.0
    var fromCurrencyName:String = "US Dollar"
    var toCurrencyName:String = "CAD"
    var exchangeSet:String = ""
    
    var flagDictionary: [String:String] = ["US Dollar": "usa", "CAD": "canada", "INR": "india"]                    // used to provide image name
    
    
    @IBOutlet weak var currencyAmount: UITextField!
    
    @IBOutlet weak var fromLabelValue: UILabel!
    
    @IBOutlet weak var toLabelValue: UILabel!
    
    @IBOutlet weak var rateField: UITextField!
    
    @IBOutlet weak var fromImage: UIImageView!
    
    @IBOutlet weak var toImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Setting 'From' and 'To' Label Values
        fromLabelValue.text = fromCurrencyName
        toLabelValue.text = toCurrencyName
        
        exchangeSet = fromCurrencyName+":"+toCurrencyName
        print("Exchange set Value : \(exchangeSet)")
        
        refreshRate(exchangeSetValue: exchangeSet)
        refreshImage(exchangeSetValue: exchangeSet)
        
    }
    
    func refreshImage (exchangeSetValue: String){
        let flagArray = exchangeSetValue.components(separatedBy: ":")
        fromImage.image = UIImage(named: flagDictionary[flagArray[0]]!)
        toImage.image = UIImage(named: flagDictionary[flagArray[1]]!)
    }
    
    func refreshRate(exchangeSetValue: String){                     // To refresh default value t.Field	
        rateField.text = exchangeRateDictionary[exchangeSetValue]!
    }
    
    @IBAction func changeCurrency(_ sender: UIButton) {         // On click of change button
        
        whichCurrency = sender.tag
        performSegue(withIdentifier: "toSelectCurrency", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SelectCurrencyViewController
        
        if(whichCurrency == 1){
            //vc.fromCurrency = self.currencyValue
            vc.fromCurrency = true
            vc.toCurrency = false
            vc.toCurrencyName1 = self.toCurrencyName
        }else{
            vc.fromCurrency = false
            vc.toCurrency = true
            vc.fromCurrencyName = self.fromCurrencyName
        }
        
    }
    

    @IBAction func showResult(_ sender: Any) {
        self.currencyValue = Double(currencyAmount.text!) ?? 1.0
        result = currencyValue * Double(exchangeRateDictionary[exchangeSet]!)!
        let roundedResult = String(format: "%.2f", result)
        let resultInfo = UIAlertController(title: "Conversion Result", message: "Converted amount is : \(roundedResult)", preferredStyle: .alert)
        resultInfo.addAction(UIAlertAction(title: "Ok",style: .default))
        
        self.present(resultInfo, animated: true, completion: nil)
        
    }
    
    
    @IBAction func updateCurrencyRate(_ sender: Any) {
        var rateChange : String!
        rateChange = rateField.text!
        exchangeRateDictionary[exchangeSet] = rateChange
    }
    
}

