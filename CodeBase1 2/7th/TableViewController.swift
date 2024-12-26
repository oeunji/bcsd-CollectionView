
import Combine
import UIKit

// final class 로 선언하기 (상속 없을 시 )
final class TableViewController: UITableViewController {

    // 이 부분 private 로 바꿔주셨다면 더 좋았을 것 같습니다.
    private var sectionData: [[String]] = [
        ["Item 0 in section 0"],
        ["Item 0 in section 1"],
        ["Item 0 in section 2"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // headerview처럼 요 cell도 static한 identifider 줄수 있었겠죵?
        tableView.register(CustomCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
    }
}

extension TableViewController {

    func confirmAndDeleteRow(at indexPath: IndexPath) {
        let alert = UIAlertController(
            title: "삭제 확인",
            message: "정말 삭제하시겠습니까?",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "삭제", style: .destructive, handler: { [weak self] _ in
            guard let self = self else { return }
            self.sectionData[indexPath.section].remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        sectionData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionData[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.textLabel?.text = sectionData[indexPath.section][indexPath.row]
        cell.delegate = self
        cell.indexPath = indexPath
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 이 부분에서 detailviewcontroller의 indexpathlabel에 직접적으로 접근하지 말고
        // private로 놓으면서 텍스트만 바꿀 수 있는 func 로 수정하는게 더 좋아보입니다!
        let viewController = DetailViewController()
        viewController.setIndexPathLabelText(text: "Section \(indexPath.section), Row \(indexPath.item)")
        
        navigationController?.pushViewController(viewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 이렇게 강제 캐스팅하지 않고 안전하게 캐스팅 하고, 실패시 nil 반환 처리 하기!
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as? HeaderView else {
               return nil
           }
        headerView.sectionLabel(section: section)
        headerView.addButtonAction = { [weak self] section in   // 지피티 참고함!!
            guard let strongSelf = self else { return }
            let newItem = strongSelf.sectionData[section].count
            strongSelf.sectionData[section].append("Item \(newItem) in Section \(section)")
            strongSelf.tableView.reloadSections(IndexSet(integer: section), with: .automatic)
            
        }
        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
