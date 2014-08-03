//
//  AddTaskViewController.swift
//  taskyou
//
//

import UIKit

class AddTaskViewController: UIViewController, UITextViewDelegate{

    @IBOutlet var contentTextView:UITextView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func close()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func finish()
    {
        let task: Task = Task.MR_createEntity() as Task
        task.clientName = "Me"
        task.content = self.contentTextView.text
        task.date = NSDate()
        task.managedObjectContext.MR_saveWithOptions(MRSaveContextOptions(1),
            completion:
            {(success:Bool, error:NSError!) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
        if(segue.identifier == "add_push_friend")
        {
            
        }
    }

}
