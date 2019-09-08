//
//  NewsTableViewController.swift
//  vk standalone app
//
//  Created by Sergey Kosov on 25/08/2019.
//  Copyright © 2019 Kosov Sergey. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    
    @IBOutlet var tableViewNews: UITableView!
    
    var news: [News] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        
        self.tableView.rowHeight = 400
        
        news.append(News(title: "Mercedes can fight Ferrari", imageName: "mer", newsName: "Monza win, says Hamilton", contentDesc: "Lewis Hamilton found himself in the melee of drivers who failed to make it over the line in time to start his final qualifying effort in Monza."))
        
        news.append(News(title: "Has Verstappen held", imageName: "wil", newsName: "HOW IT WORKS", contentDesc: "Charles Leclerc secured is maiden Formula 1 victory in tragic circumstances at the Belgian Grand Prix, putting in a mesmeric performance"))
        
        news.append(News(title: "Ferrari wary of Mercedes", imageName: "fer", newsName: "The qualifying simulation runs", contentDesc: "A disrupted Friday’s running at Monza nonetheless saw Ferrari delight the umbrella-sporting tifosi, as Charles Leclerc"))
        
        news.append(News(title: "Verstappen confident Honda", imageName: "red", newsName: "Monza when he starts", contentDesc: "Max Verstappen was the only driver not to set a time in qualifying for the Italian Grand Prix, after his ‘Spec 4’ Honda engine developed problems"))
        
        self.tableView.dataSource = self
        
        
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
