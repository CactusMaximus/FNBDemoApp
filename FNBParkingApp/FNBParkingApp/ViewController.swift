//
//  ViewController.swift
//  FNBParkingApp
//
//  Created by Shamith Ramdhani on 2021/03/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputAmountView: UITextField!
    @IBOutlet var deductionAmountView: UITextField!
    @IBOutlet var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputAmountView.delegate = self
        deductionAmountView.delegate = self
        self.view.alpha = 1
        UIView.animate(withDuration: 0.5) { [weak self] in
          self?.view.layoutIfNeeded()
        }
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        let inputAmount = Int(inputAmountView.text ?? "0")
        let deductionAmount = Int(deductionAmountView.text ?? "0")
        outputLabel.text = ""
        outputLabel.text = calculateCustomerChange(from: inputAmount ?? 0, deductionAmount: deductionAmount ?? 0).description
    }
    
    func calculateCustomerChange(from inputAmount: Int,
                                 deductionAmount: Int) -> [(String, Int)] {
        
        var arrayOfChange = [(String, Int)]()
        let noteDenominations = [200, 100, 50, 20, 10]
        let coinDenominations = [5, 2, 1]
        var noteCounter = [0, 0, 0, 0, 0]
        var coinCounter = [0, 0, 0]
        var changeAmount = 0
        
        //Amount validation checks
        if inputAmount > deductionAmount {
            changeAmount = inputAmount - deductionAmount
        } else if inputAmount == deductionAmount {
            showAlert(title: "No change needed", message: "Thank you, have a nice day!")
            return arrayOfChange
        } else {
            let amountOutstanding = deductionAmount - inputAmount
            showAlert(title: "Amount outstanding:", message: "Please enter an outstanding amount of R\(amountOutstanding) to pay your bill")
            return arrayOfChange
        }
        
        //Proceed with note calculation
        for i in 0..<noteDenominations.count {
            if changeAmount >= noteDenominations[i] {
                noteCounter[i] = (changeAmount / noteDenominations[i])
                changeAmount = changeAmount - noteCounter[i] * noteDenominations[i]
                if noteCounter[i] != 0 {
                    arrayOfChange.append(("R\(noteDenominations[i]) note:", noteCounter[i]))
                }
            }
        }
        
        //Proceed with coin calculation
        for i in 0..<coinDenominations.count {
            if changeAmount >= coinDenominations[i] {
                coinCounter[i] = (changeAmount / coinDenominations[i])
                changeAmount = changeAmount - coinCounter[i] * coinDenominations[i]
                if coinCounter[i] != 0 {
                    arrayOfChange.append(("R\(coinDenominations[i]) coin:", coinCounter[i]))
                }
            }
        }
        
        return arrayOfChange
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == inputAmountView
            || textField == deductionAmountView {
            textField.resignFirstResponder()
        }
        return true
    }
}
