//
//  EmployeeDetailVC.swift
//  JSON_Demo
//
//  Created by Ram Mhapasekar on 28/03/17.
//  Copyright © 2017 rammhapasekar. All rights reserved.
//

import UIKit

class EmployeeDetailVC: UIViewController {

    @IBOutlet weak var employeeImgView: UIImageView!
    
    @IBOutlet weak var employeeName: UILabel!
    
    @IBOutlet weak var employeeJobRole: UILabel!
    
    static var name:String = String()
    
    static var job:String = String()
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewDidAppear(false)
        
        self.employeeName.text =  EmployeeDetailVC.name
        
        self.employeeJobRole.text = EmployeeDetailVC.job
    }
}
