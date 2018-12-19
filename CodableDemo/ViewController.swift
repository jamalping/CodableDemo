//
//  ViewController.swift
//  CodableDemo
//
//  Created by Apple on 2018/12/19.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let dic: [String: Any] = ["class_id": 2, "title": "title", "type": 2, "sub_classes": [["class_id": 1, "title": "subTitle"]]]

        let a = try? JSONSerialization.data(withJSONObject: dic, options: [])
        guard let json = try? JSONSerialization.jsonObject(with: a!, options: []) else {
            return
        }
        let r = String.init(describing: json)

        print(a,r)

        guard let path = Bundle.main.path(forResource: "json", ofType: ".strings") else {
            return
        }
        try? r.write(toFile: path, atomically: false, encoding: .utf8)
//
        let jsonString = try? String.init(contentsOfFile: path)
        print(jsonString)
        
        // 使用
        let jsonDecoder = JSONDecoder()
        let jsonData = try? JSONSerialization.data(withJSONObject: dic, options: [])
        let model: GoodsModel = try! jsonDecoder.decode(GoodsModel.self, from: jsonData!)
         print(model)
        
    }
}

struct GoodsModel: Codable {
    
    var class_id  : Int?
    var type      : Int?
    var title     : String?
    
    var price : String?
    var list_img : String?
    var wenchuang_id : Int?
    var sub_classes  : [Sub_classes]?
    
}

struct Sub_classes: Codable {
    var class_id  : Int?
    var title     : String?
}


