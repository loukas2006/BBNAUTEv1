//
//  SessionaDistanceViewController.swift
//  BBNaute
//
//  Created by barkaouimalek on 04/04/2016.
//  Copyright © 2016 Malek Barkaoui. All rights reserved.
//

import UIKit

class SessionaDistanceViewController: UIViewController,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate {

    var picker:String = ""
    var IDSession:String = ""
    var degrealarme:String = ""

    @IBOutlet weak var PickerSessiondegre: UIPickerView!
    
    var SessionPickerDataSource = ["Session1.1", "Session1.2", "Session1.3","Session1.4", "Session2.1", "Session2.2", "Session2.3","Session2.4","Session3", "Session3.1", "Session3.2","Session3.3",];
    
    var degrealarmeDataSource = ["A", "B", "C","D", "A1", "B1", "C1","D1","A2", "B2", "C2","D2",];

    
    @IBOutlet weak var IDSessionPickerView: UIView!
    
    
    
    @IBOutlet weak var IDSessiontxtfield: UITextField!
    @IBOutlet weak var Degrealarmetxtfield: UITextField!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.ConfigureView()
        
        self.ConfigNavBar()
        
      


        
        // Do any additional setup after loading the view.
    }
    
    func ConfigureView(){
        
        if self.revealViewController() != nil {
            
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        
        let myColor : UIColor = UIColor(hue: 0.4833, saturation: 0.52, brightness: 0.82, alpha: 1.0)
        
        IDSessiontxtfield.layer.borderColor = myColor.CGColor
        self.IDSessiontxtfield.layer.borderWidth = CGFloat(Float(1.0))
        
        Degrealarmetxtfield.layer.borderColor = myColor.CGColor
        self.Degrealarmetxtfield.layer.borderWidth = CGFloat(Float(1.0))
        
        let DynamicView1=UIView(frame: CGRectMake(0, 0, 30, IDSessiontxtfield.layer.bounds.height))
        let DynamicView2=UIView(frame: CGRectMake(0, 0, 30, IDSessiontxtfield.layer.bounds.height))

        let imageName = "accespointPicker.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: DynamicView1.layer.bounds.height/3, width: 22, height: 12)
        
        
        let imageName2 = "accespointPicker.png"
        let image2 = UIImage(named: imageName2)
        let imageView2 = UIImageView(image: image2!)
        imageView2.frame = CGRect(x: 0, y: DynamicView2.layer.bounds.height/3, width: 22, height: 12)
        
        self.IDSessiontxtfield.rightViewMode = .Always
        self.IDSessiontxtfield.leftViewMode = .Always
        
        self.Degrealarmetxtfield.rightViewMode = .Always
        self.Degrealarmetxtfield.leftViewMode = .Always
        
        
        DynamicView1.backgroundColor=UIColor.clearColor()
        DynamicView2.backgroundColor=UIColor.clearColor()


        IDSessiontxtfield.leftView  = DynamicView1
        Degrealarmetxtfield.leftView  = DynamicView2

        
        DynamicView1.addSubview(imageView)
        DynamicView2.addSubview(imageView2)
        
        
        IDSessiontxtfield.rightView  = DynamicView1
        Degrealarmetxtfield.rightView = DynamicView2
        
        
        
        
    }

    
    func ConfigNavBar(){
        
        self.navigationController!.navigationBar.barTintColor = UIColor(hue: 0.4861, saturation: 0.52, brightness: 0.8, alpha: 1.0) /* #62cdc5 */
        let navigationBar = self.navigationController!.navigationBar
        let navigationSeparator = UIView(frame: CGRectMake(0, navigationBar.frame.size.height - 1, navigationBar.frame.size.width, 0.5))
        navigationSeparator.backgroundColor = UIColor.clearColor() // Here your custom color
        navigationSeparator.opaque = true
        self.navigationController?.navigationBar.addSubview(navigationSeparator)
        self.navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "Avenir Next Condensed", size: 20)!,
                NSForegroundColorAttributeName: UIColor.whiteColor()])
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        print("begin")
        
        if(textField.restorationIdentifier == "IDSession")
        {
            picker = "Session"
            textField.resignFirstResponder()
            self.IDSessionPickerView.hidden = false
            PickerSessiondegre.reloadAllComponents()

            
        }
        else{
            
            picker = "degréAlarme"
            textField.resignFirstResponder()
            self.IDSessionPickerView.hidden = false
            PickerSessiondegre.reloadAllComponents()


        
        }
        
        
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(picker == "Session"){
            return SessionPickerDataSource.count}
        else{
            return degrealarmeDataSource.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(picker == "Session"){

            return SessionPickerDataSource[row]}
        else{
            
            return degrealarmeDataSource[row]

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(
        pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int)
    {
        if(picker == "Session"){
            IDSession = SessionPickerDataSource[row]}
        
        else {
            degrealarme = degrealarmeDataSource[row]
        }
        
        
        
    }

    @IBAction func Done(sender: AnyObject) {
        
        self.IDSessionPickerView.hidden = true
        if(picker == "Session"){
        self.IDSessiontxtfield.text = IDSession
        }
        else{
            self.Degrealarmetxtfield.text = degrealarme
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
