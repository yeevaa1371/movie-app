
import Foundation

struct AlertModel: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButtonTitle: String
}
