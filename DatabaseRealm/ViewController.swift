//
//  ViewController.swift
//  DatabaseRealm
//
//  Created by K I on 2022/08/20.
//

import UIKit
import RealmSwift

class ViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextField: UITextField!
    
    let realm=try!Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate=self
        contentTextField.delegate=self
        
        let memo:Memo?=read()
        
        titleTextField.text=memo?.title
        contentTextField.text=memo?.content
        // Do any additional setup after loading the view.
    }
    
    func read()->Memo?{
        return realm.objects(Memo.self).first
    }
    
    @IBAction func save(){
        let title:String=titleTextField.text!
        let content:String=contentTextField.text!
        
        let memo:Memo?=read()
        if memo != nil{
            try!realm.write{
                memo!.title=title
                memo!.content=content
            }
        }
        else{
            let newMemo=Memo()
            newMemo.title=title
            newMemo.content=content
            
            try!realm.write{
                realm.add(newMemo)
            }
        }
        let alert:UIAlertController=UIAlertController(title:"成功",message: "保存しました",preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title:"OK",style: .default,handler: nil))
        
        present(alert,animated: true,completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }


}

