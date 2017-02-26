//
//  TableViewController.swift
//  Test ABA
//
//  Created by Jordi Gamez on 26/2/17.
//  Copyright © 2017 Jordi Gamez. All rights reserved.
//

import UIKit
import Kingfisher

class TableViewController: UITableViewController {
    
    var rows = [Row]()
    var noImage: String = "noimage.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load file
        let pathFile: String = "test_application"
        loadFile(file: pathFile)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Load local file
    func loadFile(file: String) {
        
        // Check if the file is correct
        guard let csvPath = Bundle.main.path(forResource: file, ofType: "csv") else {
            showAlert(title: "The file doesn't exists", message: "Try again with a different file name")
            return
        }
        
        do {
            let csvData = try String(contentsOfFile: csvPath, encoding: String.Encoding.utf8)
            let csv = csvData.csvRows()
            
            var image = ""
            
            // Read every file starting from the 2nd row because the first one is the header
            for row in csv.dropFirst() {
                // If the URL cell has content
                if row.indices.contains(2) {
                    image = row[2]
                } else {
                    // If the cell doesn't have content
                    image = noImage
                }
                // Create Row object
                let rowItem = Row(title: row[0], description: row[1], image: image)
                
                // Add the object to the array
                rows.append(rowItem)
            }
        } catch {
            showAlert(title: "The file couldn't be opened", message: "Try again with a different file name")
        }
    }
    
    // If the file doesn't exists
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let confirmAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) in}
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Numbers of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Row", for: indexPath) as! RowCell
        
        // Title
        cell.cellTitle.text = rows[indexPath.row].title
        
        // Description
        cell.cellDescription.text = rows[indexPath.row].description
        
        // Image
        if (rows[indexPath.row].image != noImage) {
            // Image with cache
            let imageURL = URL(string: rows[indexPath.row].image!)
            cell.cellImage.kf.setImage(with: imageURL)
        } else {
            // Error image in case there is no correct image
            let image = Image(named: noImage)
            cell.cellImage.image = image
        }
        
        // If the image is nil (a website or a wrong url)
        if (cell.cellImage.image == nil) {
            let image = Image(named: noImage)
            cell.cellImage.image = image
        }
        
        return cell
    }
    
    // Segue to ItemViewController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "showItem" {
            if let indexPath = tableView.indexPath(for: sender as! RowCell) {
                let destination = segue.destination as! ItemViewController
                
                // Back button style
                let backItem = UIBarButtonItem()
                backItem.title = " "
                self.navigationController?.navigationBar.tintColor = UIColor.white
                navigationItem.backBarButtonItem = backItem
                
                destination.itemTitle = rows[(indexPath as NSIndexPath).row].title!
                destination.itemDescription = rows[(indexPath as NSIndexPath).row].description!
                destination.itemImage = rows[(indexPath as NSIndexPath).row].image!
            }
        }
    }
}
