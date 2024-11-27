import UIKit

final class TextFieldWithTitlePlaceholder: UIView {

    // MARK: - Properties

    var text: String? {
        get { textField.text }
        set { textField.text = newValue }
    }

    var onTextChange: ((String?) -> Void)?

    // MARK: - GUI variables

    private let placeholderInsets: UIEdgeInsets = .init(top: 4.0, left: 8.0, bottom: 8.0, right: 8.0)
    private let textFieldInsets: UIEdgeInsets = .init(top: 4.0, left: 8.0, bottom: 8.0, right: 8.0)
    private let placeholderLabel: Label
    private let textField = UITextField()

    // MARK: - Initialization

    init(
        placeholder: String,
        font: FontType? = nil,
        placeholderColor: ColorType? = nil,
        textColor: ColorType? = nil
    ) {
        placeholderLabel = Label(
            title: placeholder,
            font: font,
            textColor: placeholderColor
        )

        super.init(frame: .zero)
        setupView()
        setupTextField(font: font, textColor: textColor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(placeholderLabel)
        addSubview(textField)
    }

    private func setupTextField(font: FontType?, textColor: ColorType?) {
        textField.font = font?.font
        textField.textColor = textColor?.color
        textField.borderStyle = .roundedRect

        textField.addAction(
            .init(handler: { [weak self] _ in
                self?.onTextChange?(self?.textField.text)
            }),
            for: .editingChanged
        )
    }

    // MARK: - Constraints

    override func updateConstraints() {
        super.updateConstraints()
        placeholderLabel.snp.updateConstraints { make in
            make.top.left.right.equalTo(placeholderInsets)
        }

        textField.snp.updateConstraints { make in
            make.top.equalTo(placeholderLabel.snp.bottom).offset(textFieldInsets.top)
            make.left.right.bottom.equalToSuperview().inset(textFieldInsets)
        }
    }
}
