//
//  SpendingComposeViewController.swift
//  Final Final
//
//  Created by Lenora Duong on 11/12/23.
//

import UIKit

class SpendingComposeViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var spendingToEdit: Spending?
    
    var onComposeSpending: ((Spending) -> Void)? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        if let spending = spendingToEdit {
            titleField.text = spending.title
            amountField.text = String(spending.amount)
            datePicker.date = spending.date

            self.title = "Edit Spending"
        }
    }
    
    @IBAction func didTapDoneButton(_ sender: Any) {
        // 1.
        guard let title = titleField.text,
              !title.isEmpty
        else {
            // i.
            presentAlert(title: "Oops...", message: "Make sure to add a title!")
            // ii.
            return
        }
        // 2.
        var spending: Spending
        spending = Spending(title: "", date: Date(), amount: 0)
        
//        if let amountText = amountField.text, let amountValue = Int(amountText) {
//            if let editSpending = spendingToEdit {
//                spending = editSpending
//                
//                spending.title = title
//                spending.date = datePicker.date
//                spending.amount = amountValue
//                
//            } else {
//                spending = Spending(title: title, date: datePicker.date, amount: amountValue)
//            }
//            
//        } else {
//            presentAlert(title: "Oops...", message: "The amount type is wrong.")
//        }
//    
            
        
        if let editSpending = spendingToEdit {
            // i.
            spending = editSpending
            // ii.
            spending.title = title
            spending.date = datePicker.date
            
            if let amountText = amountField.text, let amountValue = Int(amountText) {
                spending.amount = amountValue
            } else {
                presentAlert(title: "Oops...", message: "The amount type is wrong.")
            }
            
        } else {
            if let amountText = amountField.text, let amountValue = Int(amountText) {
                spending = Spending(title: title, date: datePicker.date, amount: amountValue)
            } else {
                presentAlert(title: "Oops...", message: "The amount type is wrong.")
            }
        }
        // 5.
        onComposeSpending?(spending)
        // 6.
        dismiss(animated: true)
    }

    // The cancel button was tapped.
    @IBAction func didTapCancelButton(_ sender: Any) {
        // Dismiss the TaskComposeViewController.
        dismiss(animated: true)
    }

    private func presentAlert(title: String, message: String) {
        // 1.
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        // 2.
        let okAction = UIAlertAction(title: "OK", style: .default)
        // 3.
        alertController.addAction(okAction)
        // 4.
        present(alertController, animated: true)
    }

}
