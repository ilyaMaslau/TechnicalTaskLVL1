import UIKit

/// Custom font styles
enum ColorType {

    case primary
    case secondary
    case placeholder
    case background

    /// Custom
    case custom(color: UIColor)

    // TODO: -
    var color: UIColor {
        return switch self {
        case .primary: .label
        case .secondary: .secondaryLabel
        case .placeholder: .placeholderText
        case .background: .systemBackground
        case .custom(color: let color): color
        }
    }
}
