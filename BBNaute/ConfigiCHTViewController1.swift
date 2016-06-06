//
//  ConfigiCHTViewController1.swift
//  BBNaute
//
//  Created by barkaouimalek on 04/04/2016.
//  Copyright © 2016 Malek Barkaoui. All rights reserved.
//

import UIKit

class ConfigiCHTViewController1: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate {
    
    var pointdacceschoix:String = ""
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var pointdaccesPicker: UIPickerView!
    @IBOutlet weak var pointdaccesPickerview: UIView!
    
    @IBOutlet weak var nombebetxtfield: UITextField!
    @IBOutlet weak var datenassiancetxtfield: UITextField!
    @IBOutlet weak var prenombebetxtfield: UITextField!
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var connexionview: UIView!
    @IBOutlet weak var bebeview: UIView!
    
    @IBOutlet weak var serveurCloudadrtxtfield: UITextField!
    @IBOutlet weak var motdepassetxtfield: UITextField!
    @IBOutlet weak var pointdaccestxtfield: UITextField!
    
    var pickerDataSource = ["Gnet2016", "Orange06B50", "BMA", "OPCMA","Planet","HexaByte01"];

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ConfigNavBar()
        self.ConfigView()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func BackAction(sender: AnyObject) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        print("begin")
        
        if(textField.restorationIdentifier == "poindaccesID")
        {
        textField.resignFirstResponder()
        self.pointdaccesPickerview.hidden = false
        }
        
       else if(textField.restorationIdentifier == "datenaissanceID")
        {
            textField.resignFirstResponder()
            self.datePickerView.hidden = false
        }
        else{
            self.pointdaccesPickerview.hidden = true
        }

    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    func ConfigView(){
        
        
        
        self.pointdaccesPicker.delegate = self
        self.pointdaccesPicker.dataSource = self
        self.pointdaccestxtfield.delegate = self
        
        
        
        
        let DynamicView1=UIView(frame: CGRectMake(0, 0, 30, pointdaccestxtfield.layer.bounds.height))
          let DynamicView2=UIView(frame: CGRectMake(0, 0, 30, pointdaccestxtfield.layer.bounds.height))
        
        let DynamicView3=UIView(frame: CGRectMake(0, 0, 30, pointdaccestxtfield.layer.bounds.height))
        
        let DynamicView4=UIView(frame: CGRectMake(0, 0, 30, pointdaccestxtfield.layer.bounds.height))
        
        let DynamicView5=UIView(frame: CGRectMake(0, 0, 30, pointdaccestxtfield.layer.bounds.height))
        
        let DynamicView6=UIView(frame: CGRectMake(0, 0, 30, pointdaccestxtfield.layer.bounds.height))
        
        let imageName1 = "CalendarIcon.png"
        let image1 = UIImage(named: imageName1)
        let imageView1 = UIImageView(image: image1!)
        imageView1.frame = CGRect(x: 0, y: DynamicView1.layer.bounds.height/4.5, width: 25, height: 25)
        
        let imageName = "accespointPicker.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: DynamicView1.layer.bounds.height/3, width: 25, height: 15)
        
        let calendarIconView=UIView(frame: CGRectMake(0, 0, 40, datenassiancetxtfield.layer.bounds.height))
        calendarIconView.backgroundColor=UIColor.clearColor()
        let DynamicView=UIView(frame: CGRectMake(0, 0, 40, pointdaccestxtfield.layer.bounds.height))
        DynamicView.backgroundColor=UIColor.clearColor()
        
        
        DynamicView.addSubview(imageView)
        calendarIconView.addSubview(imageView1)
        
      self.pointdaccestxtfield.rightViewMode = .Always
        self.pointdaccestxtfield.leftViewMode = .Always
        
        
        self.motdepassetxtfield.leftViewMode = .Always
        self.serveurCloudadrtxtfield.leftViewMode = .Always


        self.datenassiancetxtfield.rightViewMode = .Always
        self.datenassiancetxtfield.leftViewMode = .Always
        
        self.nombebetxtfield.leftViewMode = .Always
        
        self.prenombebetxtfield.leftViewMode = .Always

        
      
       motdepassetxtfield.leftView = DynamicView1
       pointdaccestxtfield.leftView = DynamicView2
       serveurCloudadrtxtfield.leftView = DynamicView3
       nombebetxtfield.leftView = DynamicView4
       prenombebetxtfield.leftView = DynamicView5
       datenassiancetxtfield.leftView = DynamicView6


        pointdaccestxtfield.rightView = DynamicView
        datenassiancetxtfield.rightView = calendarIconView

        


    
        let myColor : UIColor = UIColor(hue: 0.4833, saturation: 0.52, brightness: 0.82, alpha: 1.0)
        
        nombebetxtfield.layer.borderColor = myColor.CGColor
        self.nombebetxtfield.layer.borderWidth = CGFloat(Float(1.0))
        
        prenombebetxtfield.layer.borderColor = myColor.CGColor
        self.prenombebetxtfield.layer.borderWidth = CGFloat(Float(1.0))
        
        
        datenassiancetxtfield.layer.borderColor = myColor.CGColor
        self.datenassiancetxtfield.layer.borderWidth = CGFloat(Float(1.0))
        
        pointdaccestxtfield.layer.borderColor = myColor.CGColor
        self.pointdaccestxtfield.layer.borderWidth = CGFloat(Float(1.0))
        
        motdepassetxtfield.layer.borderColor = myColor.CGColor
        self.motdepassetxtfield.layer.borderWidth = CGFloat(Float(1.0))
        
        
        serveurCloudadrtxtfield.layer.borderColor = myColor.CGColor
        self.serveurCloudadrtxtfield.layer.borderWidth = CGFloat(Float(1.0))
    
    
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
    
    
    
    
    @IBAction func SegemntedControlSwith(sender: AnyObject) {
        
        if (segmentedControl.selectedSegmentIndex == 0) {
            
            self.connexionview.hidden = false
            self.bebeview.hidden = true
            
        } else {
            
            self.connexionview.hidden = true
            self.bebeview.hidden = false
    }
    }
    
    
    @IBAction func DonePicker(sender: AnyObject) {
        
        self.pointdaccesPickerview.hidden = true
        self.pointdaccestxtfield.text = pointdacceschoix
    }
    
    @IBAction func DonedatePicker(sender: AnyObject) {
        
        self.datePickerView.hidden = true
       self.datenassiancetxtfield.text = datePicker.date.description

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
        pointdacceschoix = pickerDataSource[row]
        

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
