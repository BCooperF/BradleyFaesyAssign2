//
//  ViewController.swift
//  BradleyFaesyAssign2
//
//  Created by Faesy, Bradley C. on 2/17/26.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var caloriesView: UIView!
	@IBOutlet weak var stepsView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		caloriesView.layer.cornerRadius = 12
		stepsView.layer.cornerRadius = 12
	}
}

class MealPlannerViewController: UIViewController {
	
	@IBOutlet weak var food1Field: UITextField!
	@IBOutlet weak var food2Field: UITextField!
	@IBOutlet weak var stepsField: UITextField!
	@IBOutlet weak var activityField: UITextField!
	
	@IBOutlet weak var balanceLabel: UILabel!
	@IBOutlet weak var statusLabel: UILabel!
	@IBOutlet weak var extraStepsLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func simulateDay(_ sender: Any) {
		
		var food1 = 0.0
		if let text = food1Field.text, let value = Double(text) {
			food1 = value
		}
		var food2 = 0.0
		if let text = food2Field.text, let value = Double(text) {
			food2 = value
		}
		var steps = 0.0
		if let text = stepsField.text, let value = Double(text) {
			steps = value
		}
		var minutes = 0.0
		if let text = activityField.text, let value = Double(text) {
			minutes = value
		}
		
		let totalIntake = food1 + food2
		let totalBurn = 1800 + (steps * 0.05) + (minutes * 8)
		let differentCal = totalIntake - totalBurn
		let lbs = differentCal / 3500.0
		
		if differentCal > 0 {
			balanceLabel.text = "Your eating is more than your activity"
			statusLabel.text = "You will gain \(String(format: "%.2f",lbs)) lbs today"
		} else {
			balanceLabel.text = "Your eating is less than your activity"
			statusLabel.text = "You will lose \(String(format: "%.2f",lbs)) lbs today"
		}
		
		var extraSteps = 0
		var balance = differentCal
		
		while balance > 0 {
			balance -= 0.05
			extraSteps += 1
		}
		
		let miles = Double(extraSteps)/2
		extraStepsLabel.text = "Extra steps to balance: \(extraSteps) (~\(String(format: "%.2f", miles)) miles)"
	}
	
}

