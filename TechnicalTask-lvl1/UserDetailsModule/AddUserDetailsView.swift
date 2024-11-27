import UIKit

//TODO: - Update base components usage.

final class AddUserDetailsView: UIView {

    // MARK: - Properties

    private let textFieldsStackViewInsets: UIEdgeInsets = .init(top: 16.0, left: .zero, bottom: 32.0, right: .zero)
    private let buttonSize: CGSize = .init(width: 128.0, height: 64.0)

    // MARK: - Subviews

    private let titleLabel: Label = .init()

    private lazy var textFieldsStackView: UIStackView = {
        let view: UIStackView = .init(arrangedSubviews: [
            userNameTextField,
            userEmailTextField,
            cityNameTextField,
            streetNameTextField
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 16.0
        view.distribution = .fillEqually
        view.axis = .vertical
        return view
    }()

    private let userNameTextField: TextFieldWithTitlePlaceholder = .init(placeholder: "User name")
    private let userEmailTextField: TextFieldWithTitlePlaceholder = .init(placeholder: "User email")
    private let cityNameTextField: TextFieldWithTitlePlaceholder = .init(placeholder: "City name")
    private let streetNameTextField: TextFieldWithTitlePlaceholder = .init(placeholder: "Street name")
    private let saveButton: Button = .init(title: "Save", primaryColor: .primary, disabledColor: .secondary)

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    private func initView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(textFieldsStackView)
        addSubview(saveButton)
    }

    // MARK: - Constraints

    override func updateConstraints() {
        super.updateConstraints()
        titleLabel.snp.updateConstraints { make in
            make.top.left.right.equalToSuperview()
        }

        textFieldsStackView.snp.updateConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(textFieldsStackViewInsets.top)
            make.left.right.equalToSuperview()
        }

        saveButton.snp.updateConstraints { make in
            make.top.greaterThanOrEqualTo(textFieldsStackView.snp.bottom).offset(textFieldsStackViewInsets.bottom)
            make.size.equalTo(buttonSize)
            make.centerX.bottom.equalToSuperview()
        }
    }
}
