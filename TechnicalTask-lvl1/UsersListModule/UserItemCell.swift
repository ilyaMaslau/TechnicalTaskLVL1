import UIKit

final class UserItemCell: UITableViewCell {

    // MARK: - Properties

    private let userNameLabelInstets: UIEdgeInsets = .init(top: 8.0, left: 24.0, bottom: 4.0, right: 32.0)
    private let baseOffset: CGFloat = 4.0

    // MARK: - Subviews

    private let userNameLabel: Label = .init(font: .titleLargeBold)
    private let userEmailLabel: Label = .init(font: .titleRegular)
    private let addressTitleLabel: Label = .init(title: "Address:", font: .titleRegularBold)
    private let addressValueLabel: Label = .init(font: .titleRegular)

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

    private func initView() {
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userEmailLabel)
        contentView.addSubview(addressTitleLabel)
        contentView.addSubview(addressValueLabel)
    }

    // MARK: - Constraints

    override func updateConstraints() {
        super.updateConstraints()
        userNameLabel.snp.updateConstraints { make in
            make.top.left.equalToSuperview().inset(userNameLabelInstets)
        }

        userEmailLabel.snp.updateConstraints { make in
            make.top.greaterThanOrEqualTo(userNameLabel.snp.bottom).offset(userNameLabelInstets.bottom)
            make.left.equalTo(userNameLabel.snp.left)
            make.bottom.equalToSuperview().inset(baseOffset)
            make.right.greaterThanOrEqualTo(addressValueLabel.snp.left).offset(baseOffset)
        }

        addressTitleLabel.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(userNameLabel.snp.right).offset(userNameLabelInstets.right)
        }

        addressValueLabel.snp.updateConstraints { make in
            make.top.equalTo(addressTitleLabel.snp.bottom).offset(baseOffset)
            make.left.equalTo(userNameLabel.snp.right).offset(userNameLabelInstets.right)
            make.bottom.equalToSuperview().inset(baseOffset)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        userNameLabel.text = nil
        userEmailLabel.text = nil
        addressValueLabel.text = nil
    }

    // MARK: - Configuration

    func configure(model: UserItemCellModel) {
        userNameLabel.text = model.userName
        userEmailLabel.text = model.userEmail
        addressValueLabel.text = "\(model.cityName),\n\(model.streetName)"
        setNeedsUpdateConstraints()
    }
}
