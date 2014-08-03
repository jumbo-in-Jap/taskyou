//
//  FriendViewController.swift
//  taskyou
//
//  Created by 羽田 健太郎 on 2014/08/03.
//  Copyright (c) 2014年 me.jumbeeee.ken. All rights reserved.
//

import UIKit

let CELL_IDENTIFER = "identifer"

class FriendViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView : UITableView
    var friendList:[Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Friend.makeDummy()
        self.friendList = Friend.getAllFrined() as [Friend]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - TableView Delegate
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int  {
        return self.friendList.count
    }
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        
        //let cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(CELL_IDENTIFER) as UITableViewCell
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CELL_IDENTIFER)
        cell.textLabel.text = (self.friendList[indexPath.row] as Friend).name
        return cell
    }
    
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!)
    {
        (self.friendList[indexPath.row] as Friend).updateSelf()
        self.friendList = Friend.getAllFrined() as [Friend]        
        self.tableView.reloadData()
    }

}
