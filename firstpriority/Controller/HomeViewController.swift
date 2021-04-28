//
//  HomeViewController.swift
//  firstpriority
//
//  Created by Mark Tenney on 4/26/21.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDataSource {
    
    var fetchData = FetchData()
    var eventDataFetch = [EventsData]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of row
        return eventDataFetch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellId")
        cell.textLabel?.text = self.eventDataFetch[indexPath.row].title
        return cell
    }
    
    // Setup @IBOutlets here
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateNow: UILabel!
    
    override func viewDidLoad() {
        
        fetchData.fetchData{ eventDataArray in
            self.eventDataFetch = eventDataArray
        }
        
        
        
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        // Change the date label to match user current date
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        todayText.text = formatter.string(from: today).localizedUppercase
        
    }

    
    
    // var fetchData = FetchData()
    
    
    
    
    
    
    
    

    // @IBActions?
    @IBOutlet weak var todayText: UILabel!
    
}

