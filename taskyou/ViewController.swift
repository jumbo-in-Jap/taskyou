//
//  ViewController.swift
//  taskyou
//
//

import UIKit

let CELL_IDENTIFER = "identifer"

//class Task
//{
//    var clientName:String
//    var content:String
//    var date:NSDate
//    
//    init(n:String, c:String, d:NSDate)
//    {
//        self.clientName = n
//        self.content = c
//        self.date = d
//    }
//}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView : UITableView
    var taskList:[Task] = []
    //var stubCell: taskTableViewCell

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: TASK_TB_CELL_IDEN)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.taskList = Task.MR_findAll() as [Task]
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - TableView Delegate
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int  {
        return self.taskList.count
    }
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        
        let cell: TaskTableViewCell = self.tableView.dequeueReusableCellWithIdentifier(TASK_TB_CELL_IDEN) as TaskTableViewCell
        cell.configureCellWithTask(self.taskList[indexPath.row] as Task)
        return cell
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat
    {
        var cell: TaskTableViewCell = self.tableView.dequeueReusableCellWithIdentifier(TASK_TB_CELL_IDEN) as TaskTableViewCell
        cell.configureCellWithTask(self.taskList[indexPath.row] as Task)
        cell.layoutSubviews()
        var height:CGFloat = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height + 20;
        return height
    }
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        var task:Task = self.taskList[indexPath.row] as Task
//        self.performSegueWithIdentifier(text, sender: self)
    }
    
    func tableView(tableView: UITableView!, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath!, withSender sender: AnyObject!) -> Bool
    {
        return true;
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
    {
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            self.taskList.removeAtIndex(indexPath.row)
            (self.taskList[indexPath.row] as Task).MR_deleteEntity()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
        if(segue.identifier == "list_to_add")
        {
            let vc:AddTaskViewController = segue!.destinationViewController as AddTaskViewController
            //vc.backgroundColor = !UIColor.blackColor()
            //self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    
    //MARK: Action
    @IBAction func tapAddTask(sender:AnyObject)
    {
        
    }
    
    @IBAction func tapSendTask(sender:AnyObject)
    {
        
    }

}

