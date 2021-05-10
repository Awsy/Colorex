
import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var redSlider: UISlider!
	@IBOutlet weak var greenSlider: UISlider!
	@IBOutlet weak var blueSlider: UISlider!
	
	@IBOutlet weak var redTextField: UITextField!
	@IBOutlet weak var greenTextField: UITextField!
	@IBOutlet weak var blueTextField: UITextField!
	
	@IBOutlet weak var displayView: UIView!
	
	var color: Color!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		displayView.layer.cornerRadius = 10
		color = Color(red: redSlider.value, blue: blueSlider.value, green: greenSlider.value)
		displayView.backgroundColor = color.initColor()
		[redTextField, greenTextField, blueTextField].forEach {
			$0.addDoneButtonOnKeyboard()
		}
	}
	
	
	@IBAction func clearTextButton(_ sender: UIButton) {
		
		redTextField.text = ""
		redTextField.text = String(0.0)
		redSlider.value = 0
		
		greenTextField.text = ""
		greenTextField.text = String(0.0)
		greenSlider.value = 0
		
		blueTextField.text = ""
		blueTextField.text = String(0.0)
		blueSlider.value = 0
	}
	
	
	@IBAction func randomizeValues(_ sender: UIButton) {
		
		redSlider.value = Float.random(in: 0..<256)
		redTextField.text = String(Float.random(in: 0..<256))
		// TODO: Make the display view change color

		greenSlider.value = Float.random(in: 0..<256)
		greenTextField.text = String(Float.random(in: 0..<256))
		
		blueSlider.value = Float.random(in: 0..<256)
		blueTextField.text = String(Float.random(in: 0..<256))
		
//		setValueForLabel()
	}
	
	
	
	@IBAction func textFieldValueChanged(_ sender: UITextField) {
		guard let text = sender.text else { return }
		
		if let currentValue = Float(text) {
			
			switch sender.tag {
				case 4: redSlider.value = currentValue
					// TODO: Make the textField input change display view
				case 5: greenSlider.value = currentValue
				case 6: blueSlider.value = currentValue
				default: break
			}
			setValueForLabel()
		} else {
			showAlert(title: "Wrong format!", message: "Please enter correct value")
		}
		
		var value: Float
		value = Float(text) ?? 0
		
		if value < 0 {
			value = 0
		} else if value > 255 {
			value = 255
		}
		
//		sender.text = String(value)
	}
	
		private func setValueForLabel() {
			redTextField.text = String(redSlider.value)
			greenTextField.text = String(greenSlider.value)
			blueTextField.text = String(blueSlider.value)
		}
	
	
	@IBAction func changeColor(_ sender: UISlider) {
		if (sender.tag == 1) {
			color.setRed(red: sender.value)
			redTextField.text = color.swapText(str: CGFloat(redSlider.value))
			displayView.backgroundColor = color.initColor()
		} else if (sender.tag == 2) {
			color.setGreen(green: sender.value)
			greenTextField.text = color.swapText(str: CGFloat(greenSlider.value))
			displayView.backgroundColor = color.initColor()
		} else if (sender.tag == 3) {
			color.setBlue(blue: sender.value)
			blueTextField.text = color.swapText(str: CGFloat(blueSlider.value))
			displayView.backgroundColor = color.initColor()
		}
	}
	
}

// MARK: - UITextField

extension UITextField {
	func addDoneButtonOnKeyboard() {
		let keyboardToolbar = UIToolbar()
		keyboardToolbar.sizeToFit()
		let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(resignFirstResponder))
		keyboardToolbar.items = [flexibleSpace, doneButton]
		self.inputAccessoryView = keyboardToolbar
	}
}

// MARK: - Wrong Input Format

extension ViewController {
	private func showAlert(title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default)
		alert.addAction(okAction)
		present(alert, animated: true)
	}
	
}



