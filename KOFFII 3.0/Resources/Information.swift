import AirtableKit
import Foundation
import SwiftUI

struct Information: Codable, Comparable {
    
    static func < (lhs: Information, rhs: Information) -> Bool {
        lhs.title < rhs.title
    }
    
    static func == (lhs: Information, rhs: Information) -> Bool {
        lhs.title == rhs.title
    }
    
    let title: String
    var imageURL: URL?

    let quan: String?
    let temp: String?
    let time: String?
    var steps: [String] = []

    var isEspresso: Bool = false
    var isPreparation: Bool = false

    var isMethod: Bool { quan != nil && temp != nil && time != nil }

    init(record: Record) {
        title = record.title ?? "title"
        quan = record.fields["quan"] as? String
        temp = record.fields["temp"] as? String
        time = record.fields["time"] as? String
        imageURL = record.attachments["image"]?.first?.url as? URL ?? nil
        isEspresso = record.fields["isEspresso"] as? Int == 1
        isPreparation = record.fields["isPreparation"] as? Int == 1

        // MARK: Refactoring needed when time
        let stepsLongString = record.fields["steps"] as? String ?? ""
        var stepsArray = stepsLongString.components(separatedBy: "\n")
        stepsArray = stepsArray.filter { !$0.isEmpty }
        for index in stepsArray.indices {
            stepsArray[index].removeFirst()
            stepsArray[index].removeFirst()
            stepsArray[index].removeFirst()
        }
        steps = stepsArray
    }
    
}
