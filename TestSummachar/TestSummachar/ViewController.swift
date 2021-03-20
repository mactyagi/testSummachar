//
//  ViewController.swift
//  TestSummachar
//
//  Created by manukant Tyagi on 19/03/21.
//

import UIKit

class ViewController: UIViewController {
    let imageData = ImageData()
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "appIcon"))
    }

    
    @IBAction func shareButtonPressed(_ sender: Any) {
        if let image = ImageData.arr{
            let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            present(activityController, animated: true,         completion: nil)
        }
    }
}


//MARK: - UITableViewDataSource


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageData.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? TableViewCell
        print("TableView CellForRowAt   \(indexPath.row)")
        ImageData.section = indexPath.row
        
        return tableCell!
    }
    
    
}

