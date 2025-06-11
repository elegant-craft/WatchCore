import SwiftUI

public extension Color {
    init(r: Double, g: Double, b: Double) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0)
    }

    init(r: Double, g: Double, b: Double, a: Double) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, opacity: a / 1.0)
    }
    
    init(hex: UInt, alpha: Double = 1.0) {
        let r = Double((hex >> 16) & 0xFF)
        let g = Double((hex >> 8) & 0xFF)
        let b = Double(hex & 0xFF)
        self.init(r: r, g: g, b: b, a: alpha)
    }

    init?(hexString: String) {
        var hexFormatted = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted.remove(at: hexFormatted.startIndex)
        }

        guard let hexValue = UInt64(hexFormatted, radix: 16) else {
            return nil
        }

        switch hexFormatted.count {
        case 6:
            let r = Double((hexValue >> 16) & 0xFF)
            let g = Double((hexValue >> 8) & 0xFF)
            let b = Double(hexValue & 0xFF)
            self.init(r: r, g: g, b: b)
        case 8:
            let r = Double((hexValue >> 24) & 0xFF)
            let g = Double((hexValue >> 16) & 0xFF)
            let b = Double((hexValue >> 8) & 0xFF)
            let a = Double(hexValue & 0xFF) / 255.0
            self.init(r: r, g: g, b: b, a: a)
        default:
            return nil
        }
    }
}
