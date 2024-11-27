import UIKit

/// Custom font styles
enum FontType {

    /// Title
    case titleLarge
    case titleLargeBold
    case titleRegular
    case titleRegularBold

    /// Buttons
    case buttonLabel

    /// Custom
    case custom(size: CGFloat)
    case customBold(size: CGFloat)

    // TODO: -
    var font: UIFont {
        switch self {
        case .titleLarge:
            return UIFont.systemFont(ofSize: 24.0)
        case .titleLargeBold:
            return UIFont.systemFont(ofSize: 24.0, weight: .bold)
        case .titleRegular:
            return UIFont.systemFont(ofSize: 14.0)
        case .titleRegularBold:
            return UIFont.systemFont(ofSize: 14.0, weight: .bold)
        case .buttonLabel:
            return UIFont.systemFont(ofSize: 16.0)
        case .custom(let size):
            return UIFont.systemFont(ofSize: size)
        case .customBold(let size):
            return UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
}
