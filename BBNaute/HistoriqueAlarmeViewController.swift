//
//  HistoriqueAlarmeViewController.swift
//  BBNaute
//
//  Created by barkaouimalek on 06/04/2016.
//  Copyright © 2016 Malek Barkaoui. All rights reserved.
//

import UIKit

class HistoriqueAlarmeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    let messagesData:[Alarme] = [Alarme(message: "le rythme cardique n'est pas stable",type: "c"),Alarme(message: "le bébé manque d'oxygéne",type: "s"),Alarme(message: "la température est stable",type: "t"),Alarme(message: "le taux d'oxygéne est stable",type: "s"),Alarme(message: "le rythme cardiaque a diminué",type: "c"),Alarme(message: "le rythme cardique a augmenté",type: "c"),Alarme(message: "la température a baissé soudainement",type: "t")]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ConfigNavBar()
        self.ConfigView()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    
    @IBAction func Backbutton(sender: AnyObject) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    func ConfigView(){
        
        self.tableView.backgroundColor = UIColor(hue: 0.4806, saturation: 0.51, brightness: 0.89, alpha: 1.0)
        
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

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesData.count
    }
    
    
  
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:historiquealarmeTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("historiquealarmeTableViewCell")! as! historiquealarmeTableViewCell
        
        cell.alarmeMessage.backgroundColor = UIColor.clearColor() 
        
        cell.alarmeMessage.text = messagesData[indexPath.row].message
        if(messagesData[indexPath.row].type == "c")
        {
            cell.alarmeTypeIcon?.image =
                
                UIImage(named: "Coeur.png")
        }
        else if(messagesData[indexPath.row].type == "t")
        {
            cell.alarmeTypeIcon?.image =
                
                UIImage(named: "Thermométre.png")
        }
        else{
            
            cell.alarmeTypeIcon?.image =
                
                UIImage(named: "SpO2.png")
        }
        
        
        if(indexPath.row % 2 == 0)
        {
            
            cell.contentView.backgroundColor = UIColor(hue: 0.4806, saturation: 0.51, brightness: 0.89, alpha: 1.0)
            
        }
            
        else {
            
            cell.contentView.backgroundColor = UIColor(hue: 0.4833, saturation: 0.52, brightness: 0.82, alpha: 1.0) /* #64d1c6 */
            
        }
        
        
        return cell
        
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
