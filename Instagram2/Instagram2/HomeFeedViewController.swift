//
//  HomeFeedViewController.swift
//  Instagram2
//
//  Created by Scott Guidoboni on 2/5/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import UIKit
import Parse
//import ParseUI

class HomeFeedViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var feedTableView: UITableView!

    var posts: [Post] = []
    let refreshControl = UIRefreshControl()
    var isLoadingData = false
    var loadDataAmount = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTableView.dataSource = self
    
        let query = Post.query()
        query?.order(byDescending: "createdAt")
        query?.includeKey("author")
        query?.limit = 20
        
        // fetch data asynchronously
        query?.findObjectsInBackground { (posts, error) -> Void in
            if let posts = posts {
                self.posts = posts as! [Post]
                self.feedTableView.reloadData()
            } else {
                print("error!!!!")
            }
        }
        refreshControl.addTarget(self, action: #selector(getPosts), for: UIControlEvents.valueChanged)
        self.feedTableView.insertSubview(refreshControl, at: 0)
    }
    @objc func getPosts() {
        isLoadingData = true
        let query = Post.query()!
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = loadDataAmount
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts {
                self.posts = posts as! [Post]
            }
            self.isLoadingData = false
            self.refreshControl.endRefreshing()
            self.feedTableView.reloadData()
        }
    }
    
    @IBAction func composeButton(_ sender: Any) {
        self.performSegue(withIdentifier: "letsCompoo", sender: nil)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPosts()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("new Cell!")
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCell
        
        let post = posts[indexPath.row]
        
        cell.captionView.text = post.caption
        cell.postImageView.file = post.media
        cell.postImageView.loadInBackground()
        
        return cell
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
