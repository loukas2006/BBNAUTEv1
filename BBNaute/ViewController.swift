//
//  ViewController.swift
//  BBNaute
//
//  Created by barkaouimalek on 28/03/2016.
//  Copyright © 2016 Malek Barkaoui. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var logintxtfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
       
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

