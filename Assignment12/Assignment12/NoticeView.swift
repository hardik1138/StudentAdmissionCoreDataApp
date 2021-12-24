

import UIKit

class NoticeView: UIViewController {
    var temp = true
    var strclass : String?
    private let TopView = UIView()
    private let backBtn:UIButton = {
        let button=UIButton()
        button.setImage(UIImage(named: "backbtn"), for: .normal)
        button.addTarget(self, action: #selector(backbtnHandle), for: .touchUpInside)
        return button
    }()
    @objc func backbtnHandle (){
        navigationController?.popViewController(animated: true)
    }
    private let peopleBtn:UIButton = {
        let button=UIButton()
        button.setImage(UIImage(named: "people"), for: .normal)
        button.addTarget(self, action: #selector(peopleTapHandle), for: .touchUpInside)
        return button
    }()
    private let peopleView : UIView = {
        let pv = UIView()
        pv.backgroundColor = .black
        pv.layer.opacity = 0.5
        return pv
    }()
    private let peopleSubView : UIView = {
        let pv = UIView()
        pv.backgroundColor = .white
        return pv
    }()
    @objc func peopleTapHandle (){
        if temp{
            UIView.animate(withDuration: 0.3,animations:{
                self.view.addSubview(self.peopleView)
                self.view.addSubview(self.peopleSubView)
                self.peopleSubView.frame = CGRect(x: -900, y: self.TopView.bottom, width: self.view.width, height: self.view.height)
            },completion: {(_ finished: Bool) -> Void in
                self.peopleSubView.frame = CGRect(x: 100, y: self.TopView.bottom, width: self.view.width, height: self.view.height)
            })
            temp = false
        }else{
            UIView.animate(withDuration: 0.3,animations:{
                
                self.peopleSubView.frame = CGRect(x: 100, y: self.TopView.bottom, width: self.view.width, height: self.view.height)
            },completion: {(_ finished: Bool) -> Void in
                self.peopleSubView.frame = CGRect(x: -900, y: self.TopView.bottom, width: self.view.width, height: self.view.height)
                self.peopleView.removeFromSuperview()
                self.peopleSubView.removeFromSuperview()
            })
            temp = true
        }
    }
    private let Classview = UIView()
    private let ClassItemName:UILabel = {
        let label = UILabel()
      
        label.textColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private let ClassItemSubName:UILabel = {
        let label = UILabel()
      
        label.textColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let classTable = UITableView()
    private var noticeArray = [Notice]()
    
    private let peopleTable = UITableView()
    private var studArray = [Student]()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("in notice view \(strclass!)")
        studArray = coreDataHandler.shared.fetchClassWise(cls: strclass!)
        peopleTable.reloadData()
        noticeArray = coreDataHandler.shared.fetchNoticeClassWise(cls: strclass!)
        classTable.reloadData()
    }
    override func viewDidLoad() {
        print("in notice view \(strclass!)")
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        TopView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(TopView)
        TopView.addSubview(backBtn)
        TopView.addSubview(peopleBtn)
        view.addSubview(Classview)
        ClassItemName.text = strclass!
        if strclass! == "FYMCA"{
            ClassItemSubName.text = "2021-23"
            Classview.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.5921568627, alpha: 1) }
        else if strclass! == "SYMCA"{
            ClassItemSubName.text = "2020-22"
            Classview.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.6, blue: 0.2901960784, alpha: 1)
        }else{
            ClassItemSubName.text = "2019-21"
            Classview.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.5019607843, blue: 0.9294117647, alpha: 1)
        }
        Classview.addSubview(ClassItemName)
        Classview.addSubview(ClassItemSubName)
        Classview.layer.cornerRadius = 15
        classTable.backgroundColor = .clear
        view.addSubview(classTable)
        peopleSubView.addSubview(peopleTable)
        setupClassTableView()
        setupPeopleTableView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TopView.frame = CGRect(x: 0, y: 0, width: view.width, height: 100)
        backBtn.frame = CGRect(x: 20, y: 58, width: 24, height: 24)
        peopleBtn.frame = CGRect(x: (TopView.width - 30 ) - 20 , y: 58, width: 30, height: 21)
        Classview.frame = CGRect(x: 20, y: TopView.bottom + 15 , width: view.width - 40, height: 100)
        
        ClassItemName.frame = CGRect(x: 20, y: 10, width: Classview.width, height: 50)
        ClassItemSubName.frame = CGRect(x: 20, y: ClassItemName.bottom - 20, width: Classview.width, height: 50)
        classTable.frame = CGRect(x: 0, y: Classview.bottom + 10, width: view.width, height: view.height - Classview.bottom)
        peopleView.frame = CGRect(x: 0, y: TopView.bottom, width: view.width, height: view.height)
        peopleSubView.frame = CGRect(x: 100, y: TopView.bottom, width: view.width, height: view.height)
        peopleTable.frame = CGRect(x: 0, y:0, width: view.width, height: view.height)
        
    }
}
extension NoticeView : UITableViewDelegate,UITableViewDataSource{
    private func setupClassTableView() {
        classTable.separatorColor = .clear
        classTable.dataSource = self
        classTable.delegate = self
        classTable.register(TableViewCell.self, forCellReuseIdentifier: "NoticeItemCell")
    }
    private func setupPeopleTableView() {
        peopleTable.separatorColor = .clear
        peopleTable.dataSource = self
        peopleTable.delegate = self
        peopleTable.register(TableViewCell.self, forCellReuseIdentifier: "PeopleItemCell")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == classTable {
            return noticeArray.count
        }else {
            return studArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == classTable{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeItemCell", for: indexPath) as! TableViewCell
            let n1 = noticeArray[indexPath.row]
            cell.setupNoticeCellWith(itemname: n1)
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleItemCell", for: indexPath) as! TableViewCell
            let stud = studArray[indexPath.row]
            cell.setupPeopleCellWith(title: stud)
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == classTable{
            return 100
        }else{
            return 50
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == classTable{
            let vc = ViewNotice()
            vc.note = noticeArray[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == peopleTable
        {
            return "Classmates"
        }
        else
        {
            return ""
        }
    }
}
