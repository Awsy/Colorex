
import UIKit


class Color {
	
	private var red: CGFloat
	private var blue: CGFloat
	private var green: CGFloat
	
	func setRed(red: Float) {
		self.red = CGFloat(red)
	}
	
	func setBlue(blue: Float) {
		self.blue = CGFloat(blue)
	}
	
	func setGreen(green: Float) {
		self.green = CGFloat(green)
	}
	
	func initColor() -> UIColor {
		let color = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
		return color
	}
	
	func swapText(str: CGFloat) -> String {
		switch str {
			case red:
				return "\(String(format: "%.6f", red))"
			case green:
				return "\(String(format: "%.6f", green))"
			case blue:
				return "\(String(format: "%.6f", blue))"
			default:
				fatalError("Unsupported")
		}
	}
	
	init(red: Float, blue: Float, green: Float) {
		self.red = CGFloat(red)
		self.blue = CGFloat(blue)
		self.green = CGFloat(green)
	}
}


extension CGFloat {
	static func random() -> CGFloat {
		return CGFloat(arc4random()) / CGFloat(UInt32.max)
	}
}

extension UIColor {
	static func random() -> UIColor {
		return UIColor(
			red:   .random(),
			green: .random(),
			blue:  .random(),
			alpha: 1.0
		)
	}
}
