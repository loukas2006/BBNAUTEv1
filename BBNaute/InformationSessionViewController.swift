//
//  InformationSessionViewController.swift
//  BBNaute
//
//  Created by barkaouimalek on 06/04/2016.
//  Copyright © 2016 Malek Barkaoui. All rights reserved.
//

import UIKit

class InformationSessionViewController: UIViewController, UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate {

    
    var degrealarmechoix:String = ""

    var pickerDataSource = ["A", "B", "C","D", "A1", "B1", "C1","D1","A2", "B2", "C2","D2",];
    
    @IBOutlet weak var DegresAlarmePickerView: UIView!
    @IBOutlet weak var Alarmetxtfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ConfigNavBar()
        self.ConfigureView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Backbutton(sender: AnyObject) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func ConfigureView(){
    

        
        let myColor : UIColor = UIColor(hue: 0.4833, saturation: 0.52, brightness: 0.82, alpha: 1.0)
        
        Alarmetxtfield.layer.borderColor = myColor.CGColor
        self.Alarmetxtfield.layer.borderWidth = CGFloat(Float(1.0))
    
        let DynamicView1=UIView(frame: CGRectMake(0, 0, 30, Alarmetxtfield.layer.bounds.height))
        
        let imageName = "accespointPicker.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: DynamicView1.layer.bounds.height/3, width: 25, height: 15)
        
        self.Alarmetxtfield.rightViewMode = .Always
        self.Alarmetxtfield.leftViewMode = .Always
        Alarmetxtfield.leftView  = DynamicView1

        
        DynamicView1.backgroundColor=UIColor.clearColor()

        DynamicView1.addSubview(imageView)
        Alarmetxtfield.rightView  = DynamicView1


    
    }
    
    func ConfigNavBar(){
        
        
        
        self.navigationItem.setHidesBackButton(true, animated:true);
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
        
        if(textField.restorationIdentifier == "DegreAlarme")
        {
            textField.resignFirstResponder()
            self.DegresAlarmePickerView.hidden = false
        }
            
       
        
    }

    @IBAction func DonePicker(sender: AnyObject) {
        
        self.DegresAlarmePickerView.hidden = true
        
        self.Alarmetxtfield.text = degrealarmechoix
    }
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(
        pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int)
    {
        
        degrealarmechoix = pickerDataSource[row]
        
        
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
