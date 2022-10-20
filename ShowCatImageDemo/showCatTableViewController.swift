//
//  showCatTableViewController.swift
//  ShowCatImageDemo
//
//  Created by Tai on 2022/10/20.
//

import UIKit
import Kingfisher

class showCatTableViewController: UITableViewController {
    var items = [CatItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchItems()
    }
    
    func fetchItems() {
        let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=10")!
            var request = URLRequest(url: url)
            request.setValue("live_P5MPPFb5o2kxvhFDdKFKdgbjWiWtq1JOcr0ufiB7aRg6QZISEUljhmlvXCKZtk8I", forHTTPHeaderField: "x-api-key")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data {
                    let decoder = JSONDecoder()
                    do {
                        let catImage = try decoder.decode([CatItem].self, from: data)
                        self.items = catImage
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ShowCatTableViewCell.self)", for: indexPath) as! ShowCatTableViewCell

        // Configure the cell...
        let item = items[indexPath.row]
        
        cell.showImage.kf.setImage(with: item)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
