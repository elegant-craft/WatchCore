import Foundation

public struct LogManager {
    
    private static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        return df
    }()
    
    private static func padString(_ input: String, toLength length: Int) -> String {
        guard input.count < length else { return input }
        let paddedString = input.padding(toLength: length, withPad: " ", startingAt: 0)
        return paddedString
    }
    
    public static func info(_ message: Any, file: String = #file, line: Int = #line) {
        #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        let formattedDate = dateFormatter.string(from: Date())
        print("🟩 INFO      \(padString(fileName, toLength: 30)):\(padString(String(line), toLength: 4)) \(formattedDate) ► \(message)")
        #endif
    }
    
    static func lifecyle(_ message: Any, file: String = #file, line: Int = #line) {
        #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        let formattedDate = dateFormatter.string(from: Date())
        print("♻️ LIFECYCLE =================================   \(formattedDate) ► \(message)")
        #endif
    }
}
