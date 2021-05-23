
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
	
	let RedSliderTag = 4
	let GreenSliderTag = 5
	let BlueSliderTag = 6
	
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

		redSlider.value = 0
		greenSlider.value = 0
		blueSlider.value = 0
		
		updateColor(redSlider)
		updateColor(greenSlider)
		updateColor(blueSlider)
		
	}
	
	
	@IBAction func randomizeValues(_ sender: UIButton) {
		
		redSlider.value = Float.random(in: 0..<256)
		greenSlider.value = Float.random(in: 0..<256)
		blueSlider.value = Float.random(in: 0..<256)
		
		updateColor(redSlider)
		updateColor(greenSlider)
		updateColor(blueSlider)
	}
	
	
	@IBAction func textFieldValueChanged(_ sender: UITextField) {
		
		let value: Float
		guard let text = sender.text else { return }
		value = Float(text) ?? 0

			switch sender.tag {
				case RedSliderTag: redSlider.value = value
					updateColor(redSlider)
				case GreenSliderTag: greenSlider.value = value
					updateColor(greenSlider)
				case BlueSliderTag: blueSlider.value = value
					updateColor(blueSlider)
				default: break
			}
	}
	
	
	@IBAction func changeColor(_ sender: UISlider) {
		updateColor(sender)
	}
		
	func updateColor(_ sender: UISlider) {
		let newValue = sender.value
		if (sender.tag == 1) {
			color.setRed(red: newValue)
			redTextField.text = "\(String(format: "%.0f", redSlider.value))"
		} else if (sender.tag == 2) {
			color.setGreen(green: newValue)
			greenTextField.text = "\(String(format: "%.0f", greenSlider.value))"
		} else if (sender.tag == 3) {
			color.setBlue(blue: newValue)
			blueTextField.text = "\(String(format: "%.0f", blueSlider.value))"
		}
		
		displayView.backgroundColor = color.initColor()
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

// MARK: - По UI:

/*
1. Форматирование числа, много знаков после запятой (у меня также, но давай попробуем укоротить, так чтобы всегда было целое число) --- done
2. Выровнять верстку, справа отступ на 12 pro max. На 12 справа обрезается часть UI
3. Когда нажимаем крестик справа от текстфилда и нажимаем на другой текст филд - показывается алерт "введите корректрное значение" но по умолчанию не присваивается 0.
*/
