
import UIKit

class AdminDash: UIViewController {
    
    private let TopView = UIView()
    private let MenuView : UIView = {
        let mv = UIView()
        mv.backgroundColor = .black
        mv.layer.opacity = 0.5
        return mv
    }()
    private let MenuPanel : UIView = {
        let mv = UIView()
        mv.backgroundColor = .white
        return mv
    }()
    private let menuBtn:UIButton = {
        let button=UIButton()
        button.setImage(UIImage(named: "menu"), for: .normal)
        button.addTarget(self, action: #selector(didRightSwipeview), for: .touchUpInside)
        return button
    }()
    private let topTitle : UILabel = {
        let lb = UILabel ()
        lb.text = "All Students"
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lb.textAlignment = .center
        return lb
    }()
    private let searchBtn:UIButton = {
        let button=UIButton()
        button.setImage(UIImage(named: "Search"), for: .normal)
        button.addTarget(self, action: #selector(SearchbtnTapHandle), for: .touchUpInside)
        return button
    }()
    @objc func SearchbtnTapHandle()
    {
    }
    private let Selection:UISegmentedControl = {
        let seg = UISegmentedControl()
        seg.insertSegment(withTitle: "Students", at: 0, animated: true)
        seg.insertSegment(withTitle: "Class", at: 1, animated: true)
        seg.selectedSegmentIndex = 0
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let font = UIFont.systemFont(ofSize: 16)
        seg.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        seg.setTitleTextAttributes(titleTextAttributes, for: .selected)
        seg.selectedSegmentTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        seg.addTarget(self, action: #selector(segClick), for: .valueChanged)
        return seg
    }()
    @objc func segClick()
    {
        if Selection.selectedSegmentIndex == 0
        {
            topTitle.text = "All Students"
            view.addSubview(studView)
            classTable.removeFromSuperview()
        }else{
           
            topTitle.text = "All Class"
            view.addSubview(classTable)
            studView.removeFromSuperview()
            
        }
    }
    
    //profile pic
    private let dpView = UIView ()
    
    private let mydp: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        iv.image = UIImage(named: "tempdp")
        iv.frame = CGRect(x: 0, y: 0, width: 85, height: 85)
        return iv
    }()
    private let ImagePicker : UIImagePickerController = {
            let ip = UIImagePickerController()
            ip.allowsEditing = false
            return ip
    }()
    
    //name & username
    private let userFullName:UILabel = {
        let label = UILabel()
        label.text="Kapil Bhalodiya"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let userName:UILabel = {
        let label = UILabel()
        label.text="Admin"
        label.textColor =  #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private let Seprator: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "seprator")
        return iv
    }()
    
    //table view for menu item
    private let menuTable = UITableView()
    private var items = ["Logout"]
    
    //student view
    private let studView = UIView()
    private let addStudBtn:UIButton = {
        let btn = UIButton()
        //btn.setImage(UIImage(named: "addstudent"), for: .normal)
        btn.setTitle("Add New Student", for: .normal)
        btn.setImage(UIImage(named: "plus"), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(btnCllick), for: .touchUpInside)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    @objc func btnCllick(){
        let vc = newStudent()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //collection view for student
    //private var studArray = ["Hardik Prajapati","Hinal Lukhi","Fenil Virani","Jaydeep Chauhan","Tejas Devani"]
    private var studArray = [Student]()
    private let studentList:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
    
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 162, height: 215)
    
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    override func viewWillAppear(_ animated: Bool) {
            super.viewDidAppear(true)
            studArray = coreDataHandler.shared.fetch()
            studentList.reloadData()
    }
    
    
    //class view
    //table view for menu item
    private let classTable = UITableView()
    private var classItems = ["FYMCA","SYMCA","TYMCA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        TopView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        classTable.backgroundColor = .clear
        view.addSubview(TopView)
        TopView.addSubview(menuBtn)
        TopView.addSubview(topTitle)
        TopView.addSubview(searchBtn)
        view.addSubview(Selection)
        view.addSubview(MenuView)
        view.bringSubviewToFront(MenuView)
        MenuView.isHidden = true
        view.addSubview(MenuPanel)
        MenuPanel.isHidden =  true
        MenuPanel.addSubview(dpView)
        dpView.addSubview(mydp)
        MenuPanel.addSubview(userFullName)
        MenuPanel.addSubview(userName)
        MenuPanel.addSubview(Seprator)
        MenuPanel.addSubview(menuTable)
        view.addSubview(studView)
        studView.addSubview(addStudBtn)
        studView.addSubview(studentList)
        
        setupTableView()
        setupCollectionView()
        setupClassTableView()
        ImagePicker.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapview))
               tapGesture.numberOfTapsRequired = 1
               tapGesture.numberOfTouchesRequired = 1
               dpView.addGestureRecognizer(tapGesture)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didLeftSwipeview))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didRightSwipeview))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let tapOnMenuView = UITapGestureRecognizer(target: self, action: #selector(didLeftSwipeview))
        tapOnMenuView.numberOfTouchesRequired = 1
        tapOnMenuView.numberOfTapsRequired = 1
        MenuView.addGestureRecognizer(tapOnMenuView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        TopView.frame = CGRect(x: 0, y: 0, width: view.width, height: 100)
        menuBtn.frame = CGRect(x: 20, y: 58, width: 24, height: 24)
        topTitle.frame = CGRect(x: 0, y: 58, width: view.width, height: 24)
        searchBtn.frame = CGRect(x: (TopView.width - 24 ) - 20 , y: 58, width: 24, height: 24)
        Selection.frame = CGRect(x: 20, y: TopView.bottom + 15, width: view.width - 40, height: 45)
        MenuView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        MenuPanel.frame = CGRect(x: 0, y: 0, width: MenuView.width - 70, height: MenuView.height)
        dpView.frame = CGRect(x: 20, y: 40, width: 85, height: 85)
        userFullName.frame = CGRect(x: dpView.right + 20, y: 65, width: 150, height: 30)
        userName.frame = CGRect(x: dpView.right + 20, y: userFullName.bottom - 5, width: 150, height: 25)
        Seprator.frame =  CGRect(x: 10, y: dpView.bottom + 20, width: MenuPanel.width - 20 , height: 2)
        menuTable.frame = CGRect(x: 20, y: Seprator.bottom + 10, width: MenuPanel.width - 40, height: MenuPanel.height - Seprator.bottom - 10)
        
        studView.frame = CGRect(x: 0, y: Selection.bottom + 10, width: view.width, height: view.height - Selection.bottom)
        classTable.frame = CGRect(x: 0, y: Selection.bottom + 10, width: view.width, height: view.height - Selection.bottom)
        addStudBtn.frame = CGRect(x: view.right - 150, y: 10, width: 130, height: 14.78)
        studentList.frame = CGRect(x: 0, y: addStudBtn.bottom + 10, width: studView.width, height: studView.height - addStudBtn.bottom)
        
        //classTable.frame = CGRect(x: 0, y: 0, width: view.width, height: 200)
    
    }
}
//menu
extension AdminDash {
    
    //menu hide
    @objc private func didLeftSwipeview(gesture:UISwipeGestureRecognizer){
        UIView.animate(withDuration: 0.3,animations: {
            self.MenuPanel.frame = CGRect(x: -200, y: 0, width: self.MenuView.width - 70, height: self.MenuView.height)
                },completion: {(_ finished: Bool) -> Void in
                    self.MenuView.isHidden = true
                    self.MenuPanel.isHidden = true
                })
        
    }
    //menu show
    @objc private func didRightSwipeview(gesture:UISwipeGestureRecognizer){
        UIView.animate(withDuration: 0.3,animations: {
            self.MenuPanel.frame = CGRect(x: 0, y: 0, width: self.MenuView.width - 70, height: self.MenuView.height)
            self.MenuView.isHidden = false
            self.MenuPanel.isHidden = false
                },completion: {(_ finished: Bool) -> Void in
                    
                })
        view.bringSubviewToFront(MenuView)
        view.bringSubviewToFront(MenuPanel)
    }
}
extension AdminDash :UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @objc private func didTapview(gesture:UITapGestureRecognizer){
        ImagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.ImagePicker,animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage{
                mydp.image = selectedImage
            }
            picker.dismiss(animated: true)
        }
}
//tableview
extension AdminDash : UITableViewDelegate,UITableViewDataSource{
    private func setupTableView() {
        menuTable.separatorColor = .clear
        menuTable.dataSource = self
        menuTable.delegate = self
        menuTable.register(TableViewCell.self, forCellReuseIdentifier: "ItemCell")
    }
    private func setupClassTableView() {
        classTable.separatorColor = .clear
        classTable.dataSource = self
        classTable.delegate = self
        classTable.register(TableViewCell.self, forCellReuseIdentifier: "ClassItemCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == menuTable{
            return items.count
        }else{
            return classItems.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView == menuTable{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! TableViewCell
            cell.setupCellWith(title: items[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClassItemCell", for: indexPath) as! TableViewCell
            cell.setupClassCellWith(title: classItems[indexPath.row])
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == menuTable{
            return 50
        }else{
            return 120
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == menuTable{
            navigationController?.popViewController(animated: true)
        }else{
            let vc = Classview()
            vc.strclass = classItems[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
//collection view student list
extension AdminDash: UICollectionViewDataSource , UICollectionViewDelegate {
    
    private func setupCollectionView(){
        studentList.dataSource = self
        studentList.delegate = self
        studentList.register(CollectionViewCell.self, forCellWithReuseIdentifier: "studCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return studArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "studCell", for: indexPath) as! CollectionViewCell
        let stud = studArray[indexPath.row]
        cell.setupCell(with : stud)

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(studArray[indexPath.row])
        let vc = newStudent()
        vc.stud = studArray[indexPath.row]
        vc.temp = 1
        navigationController?.pushViewController(vc, animated: true)
    }
}
