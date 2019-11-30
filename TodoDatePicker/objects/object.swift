//
//  object.swift
//  TodoDatePicker
//
//  Created by 原田茂大 on 2019/11/30.
//  Copyright © 2019 geshi. All rights reserved.
//

import RealmSwift

class Todo: Object{
    
    //ID
    @objc dynamic var id: Int = 0
    
    //タイトル
    @objc dynamic var title: String = ""
    
    //本文
    @objc dynamic var body: String = ""
    
    //作成日
    @objc dynamic var createdAt: Date = Date()
    
    //デートピッカー
    @objc dynamic var datePicker: Date = Date()
    
}
