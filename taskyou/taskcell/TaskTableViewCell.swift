//
//  taskTableViewCell.swift
//  taskyou
//

import UIKit

let TASK_TB_CELL_IDEN = "task_identifer"

class TaskTableViewCell: UITableViewCell {

    @IBOutlet var content : UILabel
    @IBOutlet var cliantName : UILabel
    @IBOutlet var date : UILabel
    
    
    func configureCellWithTask(t:Task)
    {
        self.configureCell(t.content, n: t.clientName, d: t.date)
    }
    
    func configureCell(c:String, n:String, d:NSDate)
    {
        self.content.text = c;
        self.cliantName.text = n;
        
        let format:NSDateFormatter = NSDateFormatter()
        format.locale = NSLocale.currentLocale()
        format.timeStyle = .NoStyle
        format.dateStyle = .NoStyle
        format.timeStyle = .ShortStyle
        format.dateStyle = .ShortStyle
        var dateStr:String = format.stringFromDate(d)
        self.date.text = dateStr
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
