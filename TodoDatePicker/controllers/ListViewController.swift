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
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        todos = realm.objects(Todo.self).reversed()
        tableView.reloadData()
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
        //セルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         let todo = todos[indexPath.row]

        performSegue(withIdentifier: "toInput", sender: todo)

    }
    
    //画面遷移するときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //矢印の名前がtoInputの場合
        if segue.identifier == "toInput" {
            
            //InputViewControllerを取得
            let inputVC = segue.destination as! InputViewController
            
            //InputViewControllerに編集するタスクを設定
            inputVC.todo = sender as? Todo
        }
    }
    
    
}

