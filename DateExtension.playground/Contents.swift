import UIKit

enum EnumDate: String {
    case day = "dd"
    case month = "MM"
    case year = "yyyy"
    case dateAsPrettyString = "dd<>MM<>yyyy"
}

extension Date {
    /// Function that returns value in desired EnumDate format
    /// - Parameters:
    /// - format: String Enum with formats
    func get(_ format: EnumDate) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}

let date = Date()
print(date.get(.day))
print(date.get(.month))
print(date.get(.year))
print(date.get(.dateAsPrettyString))
