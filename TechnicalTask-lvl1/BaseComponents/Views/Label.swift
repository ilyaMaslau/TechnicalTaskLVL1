import UIKit

final class Label: UILabel {

    // MARK: - Initialization

    init(
        title: String? = nil,
        font: FontType? = nil,
        textColor: ColorType? = nil,
        textAlignment: NSTextAlignment = .left,
        numberOfLines: Int = 0
    ) {
        super.init(frame: .zero)
        self.text = title
        self.font = font?.font
        self.textColor = textColor?.color
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
