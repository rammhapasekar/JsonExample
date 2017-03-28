//
//  EmployeeDetailsTableCell.swift
//  JSON_Demo
//
//  Created by Ram Mhapasekar on 27/03/17.
//  Copyright © 2017 rammhapasekar. All rights reserved.
//

import UIKit

class EmployeeDetailsTableCell: UITableViewCell
{

    @IBOutlet weak var employeeImg: UIImageView!
    
    @IBOutlet weak var employeeName: UILabel!
    
    @IBOutlet weak var employeeJobDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
