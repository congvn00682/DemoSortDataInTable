//
//  ViewController.swift
//  DemoSortDate
//
//  Created by nws on 8/28/18.
//  Copyright © 2018 nws. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var red: UIView!
    @IBOutlet weak var blue: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnReview: UIButton!
    
    var arr = Array(10...19)
    var newArr: Array = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        blue.isHidden = false
//        red.isHidden = true
        newArr = arr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnShow(_ sender: UIButton) {
        if btnReview.isSelected == false {
//            blue.isHidden = true
//            red.isHidden = false
            newArr = arr.sorted(by: >)
            
            btnReview.isSelected = true
        } else if btnReview.isSelected == true {
//            blue.isHidden = false
//            red.isHidden = true
            newArr = arr.sorted()
            
            btnReview.isSelected = false
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(newArr[indexPath.row])
        return cell
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getData" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as? DetailViewController
                detailVC?.number = newArr[indexPath.row]
                
            }
        }
    }
    
}

