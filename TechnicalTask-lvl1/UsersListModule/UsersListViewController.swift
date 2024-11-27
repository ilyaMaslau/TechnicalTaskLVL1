import UIKit
import SnapKit

// TODO: - ADD view model
final class UsersListViewController: UIViewController {

    // MARK: - Properties
    private let warningLabelEdgeInsets: UIEdgeInsets = .init(top: .zero, left: 32.0, bottom: .zero, right: 32.0)

    // MARK: - GUI variables

    private lazy var usersListTableView: UITableView = {
        let view: UITableView = .init()
        view.register(UserItemCell.self, forCellReuseIdentifier: UserItemCell.identifier)
        view.dataSource = self
        view.delegate = self
        view.estimatedSectionHeaderHeight = .leastNonzeroMagnitude
        return view
    }()

    private let refreshControl: UIRefreshControl = .init()

    private let networkWarningLabel: Label = .init(
        title: "No Network connection",
        font: .titleLargeBold,
        textColor: .primary,
        textAlignment: .center
    )

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorType.background.color
        networkWarningLabel.isHidden = true
        refreshControl.addTarget(self, action: #selector(pullToRefreshAction), for: .valueChanged)
        view.addSubview(usersListTableView)
        view.addSubview(networkWarningLabel)
        usersListTableView.addSubview(refreshControl)
        makeConstraints()
    }

    // MARK: - Constraints

    private func makeConstraints() {
        usersListTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        networkWarningLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.greaterThanOrEqualToSuperview().inset(warningLabelEdgeInsets)
        }
    }

    // MARK: - Actions

    private func reloadData() {
    }

    private func showError(title: String, message: String) {
    }

    @objc private func pullToRefreshAction() {
        // TODO: -
    }
}

// MARK: - UITableViewDataSource
extension UsersListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: - add real values
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: - add real model
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: UserItemCell.identifier,
            for: indexPath
        ) as? UserItemCell else { return UITableViewCell() }
        cell.configure(model: UserItemCellModel.mockModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension UsersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return Label(title: "Users Table View Title", font: .titleRegularBold)
    }
}
