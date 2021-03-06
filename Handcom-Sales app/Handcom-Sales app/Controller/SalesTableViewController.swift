//
//  SalesTableViewController.swift
//  Handcom-Sales app
//
//  Created by Arthur Valle on 28/02/2018.
//  Copyright © 2018 Arthur Valle. All rights reserved.
//

import UIKit

//enum RequestError {
//    case url
//    case taskError(error: NSError)
//    case noResponse
//    case noData
//    case responseStatusCode(code: Int)
//    case invalidJson
//}

class SalesTableViewController: UITableViewController {
    
    @IBOutlet weak var sbProductFilter: UISearchBar!
    
    var sales: Results!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        REST.get(onComplete: { (sales) in
            self.sales = sales
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (error) in
            print("Error: ", error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if(sales != nil) {
//            let promocoesArray = self.getPromocoesArray(result: sales)
            return sales.results!.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(sales != nil) {
//            var promocoesArray = self.getPromocoesArray(result: sales)
            return sales.results![section].Nome
        }
        return nil
    }
    
//    func getPromocoesArray (result: Results) -> [Promocao] {
//        var promocoes: [Promocao] = []
//        for promocao in result.results! {
//            promocoes.append(promocao)
//        }
//        return result.results!
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(sales != nil) {
            return sales.results![section].Promocoes!.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SalesTableViewCell
        
//        dump(sales)
        
        if(sales != nil) {
//            var promocoesArray = self.getPromocoesArray(result: sales)
            
            let product = sales.results![indexPath.section].Promocoes![indexPath.row]
            cell.prepare(with: product)
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScreen = segue.destination as! SelectedProductViewController
        let selectedProduct = sales.results![tableView.indexPathForSelectedRow!.section].Promocoes![tableView.indexPathForSelectedRow!.row]
        nextScreen.product = selectedProduct
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
