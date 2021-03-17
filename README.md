# FNBDemoApp


This is a simple change calculation app that does the following:
1) Calculates change in both notes and coins
2) Checks if amount input is greater than the required amount
3) Will not return any change if there isn't any
4) Will tell the user how much more to put in if the input amount is not sufficient


Method:

 func calculateCustomerChange(from inputAmount: Int,
                              deductionAmount: Int) -> [(String, Int)] {
        
        var arrayOfChange = [(String, Int)]()
        let notes = [200, 100, 50, 20, 10]
        let coins = [5, 2, 1]
        var noteCounter = [0, 0, 0, 0, 0]
        var coinCounter = [0, 0, 0]
        var amount = 0
        
        //Amount validation checks
        if inputAmount > deductionAmount {
            amount = inputAmount - deductionAmount
        } else if inputAmount == deductionAmount {
            print("No change needed - Thank you, have a nice day!")
            return arrayOfChange
        } else {
            let amountOutstanding = deductionAmount - inputAmount
            print("Please enter an outstanding amount of R\(amountOutstanding) to pay your bill")
            return arrayOfChange
        }
        
        //Proceed with note calculation
        for i in 0..<notes.count {
            if amount >= notes[i] {
                noteCounter[i] = (amount / notes[i])
                amount = amount - noteCounter[i] * notes[i]
                if noteCounter[i] != 0 {
                    arrayOfChange.append(("R\(notes[i]) note:", noteCounter[i]))
                }
            }
        }
        
        //Proceed with coin calculation
        for i in 0..<coins.count {
            if amount >= coins[i] {
                coinCounter[i] = (amount / coins[i])
                amount = amount - coinCounter[i] * coins[i]
                if coinCounter[i] != 0 {
                    arrayOfChange.append(("R\(coins[i]) coin:", coinCounter[i]))
                }
            }
        }
        
        return arrayOfChange
    }
