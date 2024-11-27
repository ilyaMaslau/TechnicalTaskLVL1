import UIKit
import SnapKit

final class AddUserDetailsViewController: UIViewController {

    // MARK: - GUI variables
    private let contentInsets: UIEdgeInsets = .init(top: 32.0, left: 16.0, bottom: 32.0, right: 16.0)
    private let detailsView: AddUserDetailsView = .init()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(detailsView)
        detailsView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(contentInsets)
        }
    }
}
