//
//  ViewController.swift
//  FNBParkingApp
//
//  Created by Shamith Ramdhani on 2021/03/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(calculateCustomerChange(from: 50, deductionAmount: 11))
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
            print("No change needed - Thank you, have a nice day!")
            return arrayOfChange
        } else {
            let amountOutstanding = deductionAmount - inputAmount
            print("Please enter an outstanding amount of R\(amountOutstanding) to pay your bill")
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
}

