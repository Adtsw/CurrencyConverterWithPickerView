//
//  SelectCurrencyViewController.swift
//  CurrencyConverter
//
//  Created by AASHISH on 13/11/19.
//  Copyright © 2019 Aashish. All rights reserved.
//

import UIKit

class SelectCurrencyViewController: UIViewController {

    let currencySource = ["US Dollar","CAD","INR"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var currencyAmount = ""
    var fromCurrency:Bool = false
    var toCurrency:Bool = false
    var fromCurrencyName:String = ""
    var toCurrencyName1:String = ""
    var pickerValue:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       
        
        pickerView.dataSource = self
        pickerView.delegate = self
    
        
        
    }
    
    
    @IBAction func done(_ sender: Any) {
        
        performSegue(withIdentifier: "toHome", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pc = segue.destination as! ViewController
        
        if(fromCurrency == true){               // If value of From is to be changed
            if(pickerValue == ""){              //  If picker view returns blank on no selection
                pc.fromCurrencyName = "US Dollar"
                pc.toCurrencyName = "CAD"
            }else{
                pc.fromCurrencyName = pickerValue
                pc.toCurrencyName = toCurrencyName1
            }
            
        }else{                                     // If value of To is to be changed
            if(pickerValue == ""){                 //  If picker view returns blank on no selection
                pc.toCurrencyName = "CAD"
                pc.fromCurrencyName = "US Dollar"
            }else{
                pc.toCurrencyName = pickerValue
                pc.fromCurrencyName = fromCurrencyName
            }
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension SelectCurrencyViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {       // Shows the number of Components
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencySource.count         // Called ny pciker view when number of rows is needed
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        pickerValue = currencySource[row]
       
        //selectCurrencyLabel.text = currencySource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {                 // Used to provide title for each component row
        return currencySource[row]
    }
}
