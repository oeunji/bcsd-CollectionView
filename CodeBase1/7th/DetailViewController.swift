import UIKit

final class DetailViewController: UIViewController {

    private let indexPathLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(indexPathLabel)
        
        NSLayoutConstraint.activate([
            indexPathLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indexPathLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setIndexPathLabelText(text: String) {
        indexPathLabel.text = text
    }
}
