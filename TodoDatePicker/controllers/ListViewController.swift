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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
