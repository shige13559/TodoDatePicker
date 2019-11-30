//
//  InputViewController.swift
//  TodoDatePicker
//
//  Created by 原田茂大 on 2019/11/30.
//  Copyright © 2019 geshi. All rights reserved.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    var todo: Todo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let t = todo{
            textField.text = t.title
        }
    }
    
    fileprivate func addNewTask(title: String, body: String){
        //Realmに接続
        let realm = try! Realm()
        
        
        let todo = Todo()
        todo.title = title
        todo.body = body
        todo.id = 1
        todo.createdAt = Date()
        todo.datePicker = Date()
        
        //現在あるIDの最大値 + 1 の値を取得する
        let id = (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1
        todo.id = id
        
        //Realmに新規タスクを埋め込む
        try! realm.write {
            realm.add(todo)
        }
        
        navigationController?.popViewController(animated: true)
    
    
    }
    @IBAction func didClickButton(_ sender: UIButton) {
        
        //入力チェック
        guard let inputTitle = textView.text else{
            return
        }

        if inputTitle == ""{
            return
        }
        
        let realm = try! Realm()
        if let t = todo{
            try! realm.write {
                t.title = inputTitle
            }
        }else{
            todo = Todo()
            let id = (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1
            todo?.id = id
            todo?.title = inputTitle
            todo?.createdAt = Date()
            try! realm.write {
                realm.add(todo!)
            }
        }
        
    }
    
    
    
    
    

}
