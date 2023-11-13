import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool  // Corrected typo here
    var timestamp: Date
}
