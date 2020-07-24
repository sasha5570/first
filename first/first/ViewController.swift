//
//  ViewController.swift
//  first
//
//  Created by 1111 on 24.07.2020.
//  Copyright © 2020 1111. All rights reserved.
//

import UIKit

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data: [String:[String]] = ["Students": ["Jason","Aex","Bob"], "Experts": ["Kevin","Simranjeet","Steve","Ali"], "Intermediate":["Ashley","Jacob","Kyle","Aziz","Peter"]]
    
    var myTaleView = UITableView()
    let identifire = "myCell"
    
    
    struct Objects {
           
            var sectionName : String
        var sectionObjects : [String]!
              
          }
        var objectArray = [Objects]()
        var sortNames:[String] = []
  
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayFromDict()
        createTV()
        
        
        sortNames.sort()
        
        print("hello world")
        
    }
    
        
    func arrayFromDict(){
    
        
        for (key, value) in data {
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
            sortNames.append(key)
        }
    }
            
            
        
        
        
        

    func createTV() {
        
        self.myTaleView = UITableView(frame: view.bounds, style: .plain)
              
               myTaleView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
               
               self.myTaleView.delegate = self
               self.myTaleView.dataSource = self
               
               view.addSubview(myTaleView)
        
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortNames.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortNames[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objectArray[section].sectionObjects.sort()
        return objectArray[section].sectionObjects.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        
        cell.textLabel?.text = objectArray[indexPath.section].sectionObjects[indexPath.row]
        return cell
       }
    
}

