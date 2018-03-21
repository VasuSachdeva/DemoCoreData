//
//  ViewController.swift
//  DemoCoreData
//
//  Created by MAC on 06/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit
import CoreData
var currentindex:Int=0
class ViewController: UIViewController {

	@IBOutlet weak var userTableView: UITableView!
	@IBOutlet weak var name: UITextField!
	@IBOutlet weak var mobileNumber: UITextField!
	@IBOutlet weak var password: UITextField!
	 var userInfo = [User]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.userTableView.dataSource = self
		self.userTableView.delegate = self
	}

	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	@IBAction func saveButton(_ sender: UIButton) {
		
		let entity = NSEntityDescription.entity(forEntityName: "User",
										in: managedContext)!
		let user = NSManagedObject(entity: entity,
							  insertInto: managedContext) as! User
		
		user.setValue(self.name?.text, forKey: "name")
		user.setValue(self.mobileNumber?.text, forKey: "mobilenumber")
		user.setValue(self.password?.text, forKey: "password")
		userInfo.append(user)
		do {
			try managedContext.save()
		} catch let error as NSError {
			print("Could not save. \(error), \(error.userInfo)")
		}

	}
	
	@IBAction func deleteButton(_ sender: UIButton) {
		let users = self.userInfo[currentindex]
		userInfo.remove(at: currentindex)
		managedContext.delete(users)
		userTableView.reloadData()
	}
	
	@IBAction func updateButton(_ sender: UIButton) {
		let user = self.userInfo[currentindex]
		user.name = self.name.text
		user.mobilenumber = self.mobileNumber.text
		user.password = self.password.text
		userTableView.reloadData()
		
		
		}
	
	
	@IBAction func fetchButton(_ sender: UIButton) {
		
		let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
		
		do {
			self.userInfo = try managedContext.fetch(fetchRequest) as! [User]
		} catch let error as NSError {
			print("Could not fetch. \(error), \(error.userInfo)")
		}
		
		self.userTableView.reloadData()
		
	}
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return self.userInfo.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = userTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
		let user = self.userInfo[indexPath.row]
		cell.nameInfo.text = user.name
		cell.mobilenumberInfo.text = user.mobilenumber
		cell.passwordInfo.text = user.password
		return cell
		}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		return 80
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		currentindex = indexPath.row
	}
}

