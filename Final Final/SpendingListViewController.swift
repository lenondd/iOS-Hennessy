//
//  SpendingListViewController.swift
//  Final Final
//
//  Created by Lenora Duong on 11/12/23.
//

import UIKit

class SpendingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var spendings = [Spending]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    
    @IBAction func didTapNewSpendingButton(_sender: Any) {
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ComposeSegue" {

            if let composeNavController = segue.destination as? UINavigationController,
               let composeViewController = composeNavController.topViewController as? SpendingComposeViewController {

                composeViewController.spendingToEdit = sender as? Spending
                composeViewController.onComposeSpending = { [weak self] spending in
                    spending.save()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spendings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpendingCell", for: indexPath) as! SpendingCell

        let spending = spendings[indexPath.row]
        
        cell.configure(with: spending)
        
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            spendings.remove(at: indexPath.row)
            // 3.
            Spending.save(spendings)
            // 4.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}

// An extension to group all table view delegate related methods
extension SpendingListViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selectedSpending = spendings[indexPath.row]
        performSegue(withIdentifier: "ComposeSegue", sender: selectedSpending)
    }
}
