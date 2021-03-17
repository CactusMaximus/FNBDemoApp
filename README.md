# FNBDemoApp


This is a simple change calculation app built in Swift that does the following:
1) Calculates change in both notes and coins, returned in an Array of Tuples.
2) Checks if amount input is greater than the required amount.
3) Will not return any change if there isn't any.
4) Will tell the user how much more to put in if the input amount is not sufficient.


Method:

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
    
    
** Sample Request:**
 
     calculateCustomerChange(from: 50, deductionAmount: 11)
 
** Sample Response:**
   
     [("R20 note:", 1), ("R10 note:", 1), ("R5 coin:", 1), ("R2 coin:", 2)]
   
