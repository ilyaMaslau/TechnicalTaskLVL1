import UIKit

final class Button: UIButton {

    // MARK: - Properties

    private var action: (() -> Void)?
    private var primaryColor: ColorType?
    private var disabledColor: ColorType?

    private var _contentColor: UIColor?
    private var contentColor: UIColor? {
        get {
            if _contentColor == nil {
                updateContentColor()
            }
            return _contentColor
        }
        set {
            _contentColor = newValue
            setTitleColor(_contentColor, for: .normal)
            layer.borderColor = _contentColor?.cgColor
        }
    }

    override var isEnabled: Bool {
        didSet {
            updateContentColor()
        }
    }

    // MARK: - Initialization

    init(
        title: String,
        font: FontType? = nil,
        primaryColor: ColorType? = nil,
        disabledColor: ColorType? = nil,
        action: (() -> Void)? = nil
    ) {
        self.primaryColor = primaryColor
        self.disabledColor = disabledColor
        self.action = action
        super.init(frame: .zero)
        setupView(title: title, font: font)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = contentColor?.cgColor
    }

    // MARK: - Setup

    private func setupView(title: String, font: FontType?) {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        titleLabel?.font = font?.font
        titleLabel?.adjustsFontSizeToFitWidth = true
        layer.cornerRadius = 8.0
        layer.borderWidth = 1.0
        layer.masksToBounds = true
        addAction(.init(handler: { [weak self] _ in self?.action?() }), for: .touchUpInside)
        updateContentColor()
    }

    private func updateContentColor() {
        contentColor = isEnabled ? primaryColor?.color : disabledColor?.color
    }
}
