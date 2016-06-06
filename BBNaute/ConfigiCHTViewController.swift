//
//  ConfigiCHTViewController.swift
//  BBNaute
//
//  Created by barkaouimalek on 04/04/2016.
//  Copyright © 2016 Malek Barkaoui. All rights reserved.
//

import UIKit
import JGProgressHUD

class ConfigiCHTViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var tableData: [String] = ["iCHT1", "iCHT2", "iCHT3","iCHT4","iCHT5","iCHT6","iCHT7","iCHT8","iCHT9","iCHT10","iCHT11","iCHT12","iCHT13","iCHT14","iCHT15","iCHT16","iCHT17","iCHT18","iCHT19"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.automaticallyAdjustsScrollViewInsets = false

        
        
        self.ConfigNavBar()
        
        
       
        // Do any additional setup after loading the view.
        
       
        if self.revealViewController() != nil {
            
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return self.tableData.count
    
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let optionMenu = UIAlertController(title: nil, message: "Configuration iCHT", preferredStyle: .ActionSheet)
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: false)

        
        // 2
        let deconnectAction = UIAlertAction(title: "Se deconnecter", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("deconnecter iCHT")
        })
        let modifAction = UIAlertAction(title: "Modifier infos iCHT", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Modifier infos iCHT")
        })
        
        
        let connectAction = UIAlertAction(title: "Se connecter", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
           let HUD:JGProgressHUD   = JGProgressHUD(style: JGProgressHUDStyle.Dark)
            HUD.textLabel.text = "Connexion à  \n un iCHT en cours ...";

            HUD.showInView(self.view)

            HUD.dismissAfterDelay(3.0)


            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {

                sleep(3)

                dispatch_async(dispatch_get_main_queue(), {
                    self.performSegueWithIdentifier("ConfigiCHT1", sender: self)
                    });
                });
            
            
            
            print("connecter iCHT")
        })
        
        //
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        
        // 4
        
        optionMenu.addAction(connectAction)
        optionMenu.addAction(modifAction)
        optionMenu.addAction(deconnectAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.presentViewController(optionMenu, animated: true, completion: nil)

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:ConfiCHTTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("ConfiCHTTableViewCell")! as! ConfiCHTTableViewCell
        
        
        cell.iCHTLabel.text = self.tableData[indexPath.row]
        
        if(indexPath.row % 2 == 0)
        {
            
            cell.contentView.backgroundColor = UIColor(hue: 0.4806, saturation: 0.51, brightness: 0.89, alpha: 1.0) 
            
        }
            
        else {
            
            cell.contentView.backgroundColor = UIColor(hue: 0.4833, saturation: 0.52, brightness: 0.82, alpha: 1.0) /* #64d1c6 */
            
        }
        
        
        
        
        
        return cell

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
