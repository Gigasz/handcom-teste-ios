//
//  SalesTableViewController.swift
//  Handcom-Sales app
//
//  Created by Arthur Valle on 28/02/2018.
//  Copyright © 2018 Arthur Valle. All rights reserved.
//

import UIKit

class SalesTableViewController: UITableViewController {
    
    var sales: Results!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSales()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadSales() {
        let basepath = "http://homolog.smartretail.com.br/api/encartes/web?empresa=20"
        
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            config.httpAdditionalHeaders = ["Content-Type": "application/json"]
            config.timeoutIntervalForRequest = 30.0
            config.httpMaximumConnectionsPerHost = 5
            return config
        }()
        
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: basepath) else {return}
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                
                guard let response = response as? HTTPURLResponse else {return}
                
                if response.statusCode == 200 {
                    guard let data = data else {return}
                    do {
                        
                        let sales = try JSONDecoder().decode(Results.self, from: data)
                        dump(sales)
                        self.sales = sales
                        
                    } catch {
                        print("1")
                        print(error.localizedDescription)
                    }
                    
                } else {
                    print("Invalid Request")
                }
                
            } else {
                print("2")
                print(error!)
            }
        }
        dataTask.resume()
    }
    
    func renderContent() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sales.results.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
