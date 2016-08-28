//
//  OffersViewController.swift
//  Hungry
//
//  Created by Binwei Yang on 8/18/16.
//  Copyright © 2016 Binwei Yang. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var searchBar: UISearchBar!
    var offers: [Offer]!
    var allOffers: [Offer]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
        
        // Initialize the UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self
        
        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        ParseClient.queryOffers(20, orderDescendingByKey: "createdAt") { (offers, error) in
            if nil != offers {
                print("Got \(offers.count) offers from server")
                print("First offer is \(offers[0].foodDescription) at \(offers[0].price) for \(offers[0].foodType)")
                
                self.offers = offers
                self.tableView.reloadData()
                self.allOffers = offers
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = offers?.count {
            return count
        }
        else {
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("OfferCell", forIndexPath: indexPath) as! OfferCell
        
        cell.offer = self.offers[indexPath.row]
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if ("offerDetailSegue" == segue.identifier) {
            let detailViewController = segue.destinationViewController as! OfferDetailViewController
            let cell = sender as! OfferCell
            let idxPath = tableView.indexPathForCell(cell)
            
            let offer = offers[(idxPath?.row)!]
            
            detailViewController.offer = offer
        }
    }
    
    func doSearch() {
        let searchText = searchBar.text!
        offers = allOffers.filter({ (offer) -> Bool in
            return nil != offer.foodDescription.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
        })
        
        tableView.reloadData()
    }
}

extension OffersViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true;
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        offers = allOffers
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        doSearch()
    }
}
