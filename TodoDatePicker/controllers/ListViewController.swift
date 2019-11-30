//
//  ListViewController.swift
//  TodoDatePicker
//
//  Created by 原田茂大 on 2019/11/30.
//  Copyright © 2019 geshi. All rights reserved.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var todos: [Todo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    @IBAction func didClickAddButton(_ sender: UIButton) {
        
        //追加ボタン・遷移
        performSegue(withIdentifier: "toInput", sender: nil)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title:  "追加",
            style:  .plain,
            target: nil,
            action: nil
        )
        
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         let value = todos[indexPath.row]
        
        performSegue(withIdentifier: "toInput", sender: value)
        
    }
    
    
}

