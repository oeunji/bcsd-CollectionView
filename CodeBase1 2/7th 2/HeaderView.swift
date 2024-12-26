import UIKit

final class HeaderView: UITableViewHeaderFooterView {

    // identifider 로 참조하고 있으면 더 좋을 것 같습니다.
    // 혹시 헷갈린다면 static 의 특징 알아보기!
    static let identifier = "HeaderView"
    private let titleLabel = UILabel()
    private let addButton = UIButton(type: .system)
    var addButtonAction: ((Int) -> Void)?
    
    // section이 기본값이 0이 아니라 옵셔널 타입이라면 더 좋을 것 같습니다.
    private var section: Int = 0

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        // 라벨, 버튼 등 init 부분에 놓았던 것은 예시라서 선언하면서 같이 처리하고 있다면 좋을 것 같습니다.
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        contentView.addSubview(addButton)
        addButton.setTitle("+", for: .normal)
        contentView.backgroundColor = .systemGray5
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        // 오토레이아웃 지정하는 부분은 init이 아니라 함수화 하면 좋을 것 같습니다.
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            addButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

        addButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTapButton() {
        addButtonAction?(section)
    }

    // 함수의 네이밍을 더 신경 쓰면 좋을 것 같습니다.
    // https://jinnify.tistory.com/57 같은 Swift Style Guide 참고해보세요
    
    func sectionLabel(section: Int) {
        self.section = section
        
        // 요 부분에서 폰트 지정하던 것 위치 다른 곳으로 옮겼으면 더 좋을 것 같습니다.
        titleLabel.text = "Section \(section)"
    }
}
