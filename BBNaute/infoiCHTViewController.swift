//
//  infoiCHTViewController.swift
//  BBNaute
//
//  Created by barkaouimalek on 06/04/2016.
//  Copyright © 2016 Malek Barkaoui. All rights reserved.
//

import UIKit

class infoiCHTViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

     var infoData: [String] = ["Nom", "Prénom", "Date de naissance", "Distance","Batterie", "Temps restant","Fréquence d'envoie"]
    
     var valueData: [String] = ["Julien", "Julien", "09/10/2016", "3m","60%", "30min","1m"]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ConfigNavBar()
        self.ConfigView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func BackButton(sender: AnyObject) {
        
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
        return infoData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:infoiCHTiBeaconTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("infoiCHTiBeaconTableViewCell")! as! infoiCHTiBeaconTableViewCell
        
        
        cell.infolbl.text = self.infoData[indexPath.row]
        cell.valuelbl.text = self.valueData[indexPath.row]

        
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
