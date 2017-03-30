//
//  EmployeeListVC.swift
//  JSON_Demo
//
//  Created by Ram Mhapasekar on 27/03/17.
//  Copyright © 2017 rammhapasekar. All rights reserved.
//

import UIKit

class EmployeeListVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var employeeListTableView: UITableView!
    
    var empDetailsArray: [EmployeeDetailsPOJO] = [EmployeeDetailsPOJO]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadFromFile()
        
        loadFromURL()
        
        self.employeeListTableView.tableFooterView = nil
    }
    
    //MARK:
    //MARK:- Load json from the url
    
    func loadFromURL(){
        
        let requestURL: NSURL = NSURL(string: "http://www.learnswiftonline.com/Samples/subway.json")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                    if let json:NSDictionary = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    {
                        print("json dictionary :: \(json)")
                        
                        if let stations = json["stations"] as? [[String: Any]] {
                    
                        for station in stations {
                            
                            if let name = station["stationName"] as? String {
                                
                                if let year = station["buildYear"] as? String {
                                    print(name,year)
                                }
                            }
                        }
                    }
                }
            }
        }
        
        task.resume() 
    }
   
    //MARK:
    //MARK:- Load from local file
    
    func loadFromFile(){
        
        var empName = ""
        var empJob = ""
        var empAge = 0
        
        if let path = Bundle.main.path(forResource: "Data", ofType: "json")
        {
            if let jsonData = NSData(contentsOfFile: path)
            {
                if let jsonResult: NSDictionary = try! JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                {
                    
                    if let empDetails = jsonResult["employee_details"] as? [[String: Any]] {
                        
                        for empDetail in empDetails {
                            if let name = empDetail["name"] as? String {
                                
                                empName = name
                            }
                            else{
                                empName = "NA"
                            }
                            if let job = empDetail["job"] as? String {
                                
                                empJob = job
                            }
                            else{
                                empJob = "NA"
                            }
                            if let age = empDetail["age"] as? Int {
                                
                                empAge = age
                            }
                            else{
                                empAge = 0
                            }
                            
                            let empDetailPOJO:EmployeeDetailsPOJO = EmployeeDetailsPOJO(empName: empName, empJobDescription: empJob, empAge: empAge)
                            
                            empDetailsArray.append(empDetailPOJO)
                        }
                        empDetailsArray.sort(by: { $0.empName < $1.empName })
                        self.employeeListTableView.reloadData()
                    }
                    else{
                        empName = "NA"
                        empJob = "NA"
                        empAge = 0
                    }
                }
            }
        }
    }

    //MARK:
    //MARK: Table Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if empDetailsArray.count == 0 {
           
            //TODO: Display alert to the user "No data available"
            print("No data available")
        }
        return empDetailsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: EmployeeDetailsTableCell = employeeListTableView.dequeueReusableCell(withIdentifier: "EmployeeDetailsTableCell") as! EmployeeDetailsTableCell
        
        cell.employeeImg.image =  #imageLiteral(resourceName: "default")
        cell.employeeName.text = empDetailsArray[indexPath.row].empName
        cell.employeeJobDescription.text = empDetailsArray[indexPath.row].empJobDescription
        
        if empDetailsArray[indexPath.row].empJobDescription == "Developer"{
            
            cell.backgroundColor = UIColor.lightGray
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        EmployeeDetailVC.name = empDetailsArray[indexPath.row].empName
        
        EmployeeDetailVC.job = empDetailsArray[indexPath.row].empJobDescription
        
        self.employeeListTableView.deselectRow(at: indexPath, animated: false)
        
        self.employeeListTableView.deselectRow(at: indexPath, animated: false)
        
    }
}
