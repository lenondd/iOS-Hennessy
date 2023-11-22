//
//  AccountViewController.swift
//  Final Final
//
//  Created by Lenora Duong on 11/21/23.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var idNumber: UILabel!
    @IBOutlet weak var accNumber: UILabel!
    @IBOutlet weak var accName: UILabel!
    @IBOutlet weak var accountAvatar: UIImageView!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func editProfile(_ sender: Any) {
        performSegue(withIdentifier: "EditAvatar", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditAvatar" {

            if let composeNavController = segue.destination as? UINavigationController,
               let composeViewController = composeNavController.topViewController as? EditAvatarViewController {
                
                //composeViewController.spendingToEdit = sender as? Spending
                //}
            }
        }
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditAvatar" {

            if let editNavController = segue.destination as? UINavigationController,
               let editViewController = editNavController.topViewController as? EditAvatarViewController {

                //editViewController.phoneNum =
                //editViewController.spendingToEdit = sender as? Spending
                //editViewController.onComposeSpending = { [weak self] spending in
                 //   spending.save()
                //}
            }
        }
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
