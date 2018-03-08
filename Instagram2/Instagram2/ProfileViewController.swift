////
////  ProfileViewController.swift
////  Instagram2
////
////  Created by Scott Guidoboni on 2/5/18.
////  Copyright © 2018 doordontLLC. All rights reserved.
////
//import UIKit
//
//class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    
//    @IBOutlet weak var tableView: UITableView!
//
//    let refreshControl = UIRefreshControl()
//    var posts: [Post] = []
//    var isLoadingData = false
//    var loadDataAmount = 20
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//        refreshControl.addTarget(self, action: #selector(getPosts), for: UIControlEvents.valueChanged)
//        tableView.insertSubview(refreshControl, at: 0)
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        getPosts()
//    }
//    @objc func getPosts() {
//        isLoadingData = true
//        let query = Post.query()!
//        query.order(byDescending: "createdAt")
//        query.includeKey("author")
//        query.whereKey("author", equalTo: PFUser.current()!)
//        query.limit = loadDataAmount
//        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
//            self.isLoadingData = false
//            if let posts = posts {
//                self.posts = posts as! [Post]
//            }
//            self.refreshControl.endRefreshing()
//            self.tableView.reloadData()
//        }
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return posts.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PostView", for: indexPath) as! PostTableViewCell
//
//        cell.instagramPost = posts[indexPath.row]
//
//        return cell
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toDetailView"  {
//            let cell = sender as! UITableViewCell
//            if let indexPath = tableView.indexPath(for: cell) {
//                let post = posts[indexPath.row]
//                print(post["caption"])
//                let detailController = segue.destination as! PostDetailViewController
//                detailController.instagramPost = post
//            }
//        }
//
//    }
//    @IBAction func LogUserOut(_ sender: Any) {
//        logOutFunction()
//    }
//    func logOutFunction() {
//        print("logout function called")
//        PFUser.logOutInBackground { (error: Error? ) in
//        }
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        appDelegate.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "UnauthorizedView")
//    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if !isLoadingData {
//            loadDataAmount += 20
//            let scrollViewContentHeight = tableView.contentSize.height
//            let scrollOffsetThreshold = scrollViewContentHeight  - tableView.bounds.size.height
//            if scrollView.contentOffset.y > scrollOffsetThreshold && tableView.isDragging {
//                getPosts()
//            }
//        }
//    }
//
//
