//
//  ViewController.swift
//  TableViewCellSelection
//
//  Created by apple on 22/01/20.
//  Copyright © 2020 apple. All rights reserved.
//  TableViewCellSelection and Deselection

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var arrData=[String]()
    var selectedArr=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        arrData=["user1","user2","user3","user4","user5","user6"]
       tblView.isEditing=true
        tblView.allowsMultipleSelectionDuringEditing=true
        self.tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    }

    @IBAction func nextBtn(_ sender: Any) {
        
        print(selectedArr)
    }
    
    
    @IBAction func selectAndDeselect(_ sender: UIButton) {
        self.selectedArr.removeAll()
        
        if sender.isSelected{
            for row in 0..<arrData.count{
                self.tblView.selectRow(at: IndexPath(row:row, section:0), animated: false, scrollPosition: UITableViewScrollPosition.none)
            }
            sender.isSelected=false
            sender.setImage(UIImage(named:"select"), for: .normal)
            selectedArr=arrData
        }else{
            for row in 0..<arrData.count{
                self.tblView.deselectRow(at: IndexPath(row:row, section:0), animated: false)
            }
            sender.isSelected=true
            sender.setImage(UIImage(named:"deselect"), for: .normal)
            self.selectedArr.removeAll()
        }
        
        
       
        
    }
    
}
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=arrData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectDesect(tableView: tableView, indextpath: indexPath)
//        print("Selected")
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.selectDesect(tableView: tableView, indextpath: indexPath)
//        print("Deselected")
    }
    
}
extension ViewController{
    func selectDesect(tableView:UITableView, indextpath:IndexPath){
        self.selectedArr.removeAll()
        if let arr=tableView.indexPathsForSelectedRows{
            for index in arr{
                selectedArr.append(arrData[index.row])
            }
        }
//        print(selectedArr)
    }
}
