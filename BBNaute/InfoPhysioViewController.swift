
//
//  InfoPhysioViewController.swift
//  BBNaute
//
//  Created by barkaouimalek on 11/04/2016.
//  Copyright © 2016 Malek Barkaoui. All rights reserved.
//

import UIKit

class InfoPhysioViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let cellSpacingHeight: CGFloat = 10

    var indexPath1 = NSIndexPath(forRow: 0, inSection: 0)
    var indexPath2 = NSIndexPath(forRow: 0, inSection: 1)
    var indexPath3 = NSIndexPath(forRow: 0, inSection: 2)
    let offset = 3
    @IBOutlet var Containerview: UIView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ConfigView()
        self.ConfigNavBar()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
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
    
    func ConfigView(){
        
        
        Containerview.backgroundColor = UIColor(red: 0.6667, green: 0.8706, blue: 0.8863, alpha: 1.0) /* #aadee2 */

    
        tableView.backgroundColor = UIColor(red: 0.6667, green: 0.8706, blue: 0.8863, alpha: 1.0) /* #aadee2 */

    
    }
    

    @IBAction func BackAction(sender: AnyObject) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
 
        
        let cell:InfoPhysioTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("InfoPhysioTableViewCell")! as! InfoPhysioTableViewCell
        
        cell.layer.backgroundColor = UIColor.clearColor().CGColor
        cell.contentView.layer.cornerRadius = 5
        cell.contentView.layer.masksToBounds = true
       
        cell.layer.shadowOffset = CGSizeMake(-1, 4)
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.4
        
//        cell.PhysiovalueLbl.layer.shadowColor = UIColor.blackColor().CGColor
//        cell.PhysiovalueLbl.layer.shadowOffset = CGSizeMake(2,1)
//        cell.PhysiovalueLbl.layer.shadowOpacity = 0.8
//        cell.PhysiovalueLbl.layer.masksToBounds = false
        
       
        
        
        
       
        // Maybe just me, but I had to add it to work:
        cell.clipsToBounds = false
        
        let shadowFrame: CGRect = CGRectMake(0, 0, self.tableView.frame.width, cell.contentView.frame.height)
        let shadowPath: CGPathRef = UIBezierPath(rect: shadowFrame).CGPath
        cell.layer.shadowPath = shadowPath
        
        
//        let shadow: NSShadow = NSShadow()
//        shadow.shadowColor = UIColor.blackColor()
//        shadow.shadowOffset =  CGSizeMake (-1.0, 1.0)
//        shadow.shadowBlurRadius = 1
        
        if(indexPath.section == 0){
            cell.contentView.backgroundColor = UIColor(red: 0.3294, green: 0.7922, blue: 0.898, alpha: 1.0) /* #54cae5 */
            
            cell.PhysiovalueLbl.layer.shadowColor = UIColor.blackColor().CGColor
            cell.PhysiovalueLbl.layer.shadowOffset = CGSizeMake(2,1)
            cell.PhysiovalueLbl.layer.shadowOpacity = 0.8
            cell.PhysiovalueLbl.layer.masksToBounds = false
            
            
            cell.PhysioUnite.layer.shadowColor = UIColor.blackColor().CGColor
            cell.PhysioUnite.layer.shadowOffset = CGSizeMake(2,1)
            cell.PhysioUnite.layer.shadowOpacity = 0.3
            cell.PhysioUnite.layer.masksToBounds = false
            
            
            cell.PhysioUnite.adjustsFontSizeToFitWidth = true
            
            
            
            let  attrstring : NSMutableAttributedString = NSMutableAttributedString(string: "110", attributes:
            [
                NSStrokeWidthAttributeName: -3.0,
                NSStrokeColorAttributeName: UIColor(red: 0.3294, green: 0.7922, blue: 0.898, alpha: 1.0),
                //NSShadowAttributeName: shadow
            ]
                
                
            )
            cell.PhysiovalueLbl.attributedText =  attrstring
            
            let  unitstring : NSMutableAttributedString = NSMutableAttributedString(string: "Par minutes", attributes:
                [
                    NSStrokeWidthAttributeName: -3.0,
                    NSStrokeColorAttributeName: UIColor(red: 0.1765, green: 0.6392, blue: 0.7765, alpha: 1.0) /* #2da3c6 */
                    //NSShadowAttributeName: shadow
                ]
                
                
            )
            cell.PhysioUnite.attributedText =  unitstring
            
            
            

            cell.PhysioImgView.image = UIImage(named: "CoeurPhysio.png")}
        else if(indexPath.section == 1){
            
            
            
            cell.contentView.backgroundColor =  UIColor(red: 0.5373, green: 0.898, blue: 0.8275, alpha: 1.0) /* #89e5d3 */
            
            
            cell.PhysiovalueLbl.layer.shadowColor = UIColor.blackColor().CGColor
            cell.PhysiovalueLbl.layer.shadowOffset = CGSizeMake(2,1)
            cell.PhysiovalueLbl.layer.shadowOpacity = 0.8
            cell.PhysiovalueLbl.layer.masksToBounds = false
            
            
            cell.PhysioUnite.layer.shadowColor = UIColor.blackColor().CGColor
            cell.PhysioUnite.layer.shadowOffset = CGSizeMake(2,1)
            cell.PhysioUnite.layer.shadowOpacity = 0.3
            cell.PhysioUnite.layer.masksToBounds = false
            
            cell.PhysioUnite.textColor = UIColor(red: 0, green: 0.6471, blue: 0.5412, alpha: 1.0) /* #00a58a */

            
            
            cell.PhysioUnite.adjustsFontSizeToFitWidth = true
            
            
            
            let  attrstring : NSMutableAttributedString = NSMutableAttributedString(string: "25°", attributes:
                [
                    NSStrokeWidthAttributeName: -3.0,
                    NSStrokeColorAttributeName: UIColor(red: 0, green: 0.7373, blue: 0.7765, alpha: 1.0) /* #00bcc6 */
                    //NSShadowAttributeName: shadow
                ]
                
                
            )
            cell.PhysiovalueLbl.attributedText =  attrstring
            
            let  unitstring : NSMutableAttributedString = NSMutableAttributedString(string: "Celsus", attributes:
                [
                    NSStrokeWidthAttributeName: -3.0,
                    NSStrokeColorAttributeName: UIColor(red: 0, green: 0.7373, blue: 0.7765, alpha: 1.0) /* #00bcc6 */

                    //NSShadowAttributeName: shadow
                ]
                
                
            )
            cell.PhysioUnite.attributedText =  unitstring
            

            
            
            
            cell.PhysioImgView.image = UIImage(named:"ThermométrePhysio.png")
        }
        
        else{
            
            
            
            cell.contentView.backgroundColor = UIColor(red: 0.4078, green: 0.8392, blue: 0.6471, alpha: 1.0) /* #68d6a5 */
            
            cell.PhysiovalueLbl.layer.shadowColor = UIColor.blackColor().CGColor
            cell.PhysiovalueLbl.layer.shadowOffset = CGSizeMake(2,1)
            cell.PhysiovalueLbl.layer.shadowOpacity = 0.8
            cell.PhysiovalueLbl.layer.masksToBounds = false
            
            
            cell.PhysioUnite.layer.shadowColor = UIColor.blackColor().CGColor
            cell.PhysioUnite.layer.shadowOffset = CGSizeMake(2,1)
            cell.PhysioUnite.layer.shadowOpacity = 0.3
            cell.PhysioUnite.layer.masksToBounds = false
            
            
            cell.PhysioUnite.adjustsFontSizeToFitWidth = true
            
            cell.PhysioUnite.textColor = UIColor(red: 0.349, green: 0.7176, blue: 0.6196, alpha: 1.0) /* #59b79e */

            
            
            let  attrstring : NSMutableAttributedString = NSMutableAttributedString(string: "97", attributes:
                [
                    NSStrokeWidthAttributeName: -3.0,
                    NSStrokeColorAttributeName: UIColor(red: 0, green: 0.7373, blue: 0.7765, alpha: 1.0) /* #00bcc6 */
                    //NSShadowAttributeName: shadow
                ]
                
                
            )
            cell.PhysiovalueLbl.attributedText =  attrstring
            
            let  unitstring : NSMutableAttributedString = NSMutableAttributedString(string: "%", attributes:
                [
                    NSStrokeWidthAttributeName: -3.0,
                    NSStrokeColorAttributeName: UIColor(red: 0.3608, green: 0.7373, blue: 0.6549, alpha: 1.0) /* #5cbca7 */
                    
                    
                    //NSShadowAttributeName: shadow
                ]
                
                
            )
            cell.PhysioUnite.attributedText =  unitstring
            
            
            cell.PhysioUnite.font = cell.PhysioUnite.font.fontWithSize(40)

            
            cell.PhysioImgView.image = UIImage(named:"SpO2Physio.png")}

        
        
        return cell
    }

    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clearColor()
        return headerView
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath)
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
