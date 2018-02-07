//
//  HomeFeedViewController.swift
//  Instagram2
//
//  Created by Scott Guidoboni on 2/5/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import UIKit
import Parse

class HomeFeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    
    @IBOutlet weak var feedTableViewCell: UITableViewCell!
    
    @IBOutlet weak var feedImageView: UIImageView!
    
    @IBOutlet weak var captionField: UITextView!
    
    @IBAction func compooseBut(_ sender: Any) {
        print("eek")
    }
    
    

    @IBAction func LoggerOutNOw(_ sender: Any) {
        print("hey good dude 22")
        func logOut() {
            // Logout the current user
            PFUser.logOutInBackground(block: { (error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Successful loggout")
                    self.performSegue(withIdentifier: "logoutSegue", sender: nil)
                    
                }
            })
        }
        logOut()
    }
    

    
//   PFUSer.logout()
//    let Login = storyboard.instantiateViewControllerWithIdentifier("someViewController") as! UIViewController
//    self.presentViewController(Login, animated: true, completion: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
