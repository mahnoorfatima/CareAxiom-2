//
//  PhotoDescriptionViewController.swift
//  CareAxiom
//
//  Created by Mahnoor Fatima on 19/08/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//

import UIKit

class PhotoDescriptionViewController: UITableViewController {
    var presenter: PhotosPresenter?
    var appServerClient: AppServerClient = AppServerClient()
    private var photosArray = [PhotosCellViewModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        appServerClient = AppServerClient()
        presenter = PhotosPresenterImplementation(self , PhotoRepository(CoreDataConteiner.default), appServerClient: appServerClient)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.fetchAll()
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PhotoDescriptionViewController: PhotosView {
    
    func show(error: String) {
        let alertController = UIAlertController(title: "Error",
                                                message: error,
                                                preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: UIAlertAction.Style.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func display(movies photos: [PhotosCellViewModel]) {
        photosArray = photos
        print(photosArray.count)
        tableView.reloadData()
    }
    
}

extension PhotoDescriptionViewController {
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = photosArray[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
        
        if let cell = cell as? ConfigurableCell {
            cell.configure(with: item)
        }
        
        return cell
    }
    
}

