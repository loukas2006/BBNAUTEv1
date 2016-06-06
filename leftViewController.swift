//
//  leftViewController.swift
//  BBNaute
//
//  Created by barkaouimalek on 30/03/2016.
//  Copyright © 2016 Malek Barkaoui. All rights reserved.
//

import UIKit

class leftViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var profilView: UIView!
    @IBOutlet weak var tableview: UITableView!
    
    
    
    var tableData: [String] = ["Accueil", "Configurer iCHT", "Localiser iCHT","Connexion serveur","Session à distance","Se déconnecter"]

    @IBOutlet weak var ProfileImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
      

        
        self.initInterface()
        
        
        
        
       
        
     
        // Do any additional setup after loading the view.
    }
    
    func initInterface(){
        
        self.profilView.backgroundColor = UIColor(hue: 0.4833, saturation: 0.52, brightness: 0.82, alpha: 1.0)
        
        self.tableview.backgroundColor = UIColor(hue: 0.4833, saturation: 0.52, brightness: 0.82, alpha: 1.0) /* #64d1c6 */
        
        
        let radius: CGFloat = self.ProfileImageView.frame.size.width / 2, offset = 3
        let rect = CGRect(x:0, y: 0, width: self.ProfileImageView.bounds.width, height: ProfileImageView.bounds.height)
        
        // roundedView
        let roundedView = UIView()
        view.addSubview(roundedView)
        
        // shadow layer
        let shadowLayer = CAShapeLayer()
        shadowLayer.shadowColor = UIColor.darkGrayColor().CGColor
        shadowLayer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: radius).CGPath
        shadowLayer.shadowOffset = CGSize(width: offset, height: offset)
        shadowLayer.shadowOpacity = 0.5
        shadowLayer.shadowRadius = 2
        roundedView.layer.addSublayer(shadowLayer)
        
        // mask layer
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: radius).CGPath
        
        // image layer
        let imageLayer = CALayer()
        imageLayer.mask = maskLayer
        imageLayer.frame = rect
        //        imageLayer.backgroundColor = UIColor.redColor().CGColor
        imageLayer.contentsGravity = kCAGravityResizeAspectFill
        imageLayer.contents = UIImage(named: "profile_picture.png")?.CGImage
        roundedView.layer.addSublayer(imageLayer)
        
        // auto layout
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.widthAnchor.constraintEqualToAnchor(nil, constant: rect.width).active = true
        roundedView.heightAnchor.constraintEqualToAnchor(nil, constant: rect.height).active = true
        roundedView.centerXAnchor.constraintEqualToAnchor(self.ProfileImageView.centerXAnchor).active = true
        roundedView.centerYAnchor.constraintEqualToAnchor(self.ProfileImageView.centerYAnchor).active = true
        
        
        
        self.ProfileImageView.layer.cornerRadius = self.ProfileImageView.frame.size.width / 2
        
        self.ProfileImageView.clipsToBounds = true

    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        if(indexPath.row == 0){
            self.performSegueWithIdentifier("Accueil", sender: self)

            self.tableview.deselectRowAtIndexPath(indexPath, animated: true)
            
        }
        if(indexPath.row == 1){
            self.performSegueWithIdentifier("ConfigiCHT", sender: self)
            
            self.tableview.deselectRowAtIndexPath(indexPath, animated: true)
            
        }
        
        if(indexPath.row == 2){
            self.performSegueWithIdentifier("LocaliseriCHT", sender: self)
            
            self.tableview.deselectRowAtIndexPath(indexPath, animated: true)
            
        }
        
        if(indexPath.row == 3){
            self.performSegueWithIdentifier("ConnexionServeur", sender: self)
            
            self.tableview.deselectRowAtIndexPath(indexPath, animated: true)
            
        }
        if(indexPath.row == 4){
            self.performSegueWithIdentifier("SessionaDistance", sender: self)
            
            self.tableview.deselectRowAtIndexPath(indexPath, animated: true)
            
        }
        if(indexPath.row == 5){
            
            self.dismissViewControllerAnimated(true, completion: nil)
            self.tableview.deselectRowAtIndexPath(indexPath, animated: true)
            
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell:leftTableViewCell = self.tableview.dequeueReusableCellWithIdentifier("leftTableViewCell")! as! leftTableViewCell
        
        
        cell.leftCategoryLabel.text = self.tableData[indexPath.row]
        
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
