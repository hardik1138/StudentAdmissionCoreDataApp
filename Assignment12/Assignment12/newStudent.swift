
import UIKit

class newStudent: UIViewController {
    
    var stud : Student?
    var did : Int = 0
    private var studArray = [Student]()
    var temp = 0
    private let TopView = UIView()
    private let topTitle : UILabel = {
        let lb = UILabel ()
        lb.text = "Add Student"
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lb.textAlignment = .center
        return lb
    }()
    
    private let backBtn:UIButton = {
        let button=UIButton()
        button.setImage(UIImage(named: "backbtn"), for: .normal)
        button.addTarget(self, action: #selector(backbtnHandle), for: .touchUpInside)
        return button
    }()
    @objc func backbtnHandle (){
        navigationController?.popViewController(animated: true)
    }
    private let deleteBtn:UIButton = {
        let button=UIButton()
        button.setImage(UIImage(named: "delete"), for: .normal)
        button.addTarget(self, action: #selector(deletebtnTapHandle), for: .touchUpInside)
        return button
    }()
    @objc func deletebtnTapHandle (){
        
    }
    //Field
    public let tfSPID:UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Enter spid", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.337254902, green: 0.4039215686, blue: 0.4666666667, alpha: 1)])
        textField.textColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        textField.textAlignment = .left
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9294117647, blue: 0.937254902, alpha: 1)
        return textField
    }()
    public let tfName:UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Enter name", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.337254902, green: 0.4039215686, blue: 0.4666666667, alpha: 1)])
        textField.textColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        textField.textAlignment = .left
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9294117647, blue: 0.937254902, alpha: 1)
        return textField
    }()
    
    private let gender:UISegmentedControl = {
        let seg = UISegmentedControl()
        seg.insertSegment(withTitle: "Male", at: 0, animated: true)
        seg.insertSegment(withTitle: "Female", at: 1, animated: true)
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
        if gender.selectedSegmentIndex == 0{
        }else{
           
        }
    }
    private let classView = UIPickerView()
    private let classData = ["Select Class","FYMCA", "SYMCA", "TYMCA"]
    
    private let bdateLbl:UILabel = {
        let label = UILabel()
        label.text="  Select Birthdate: "
        label.textColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        label.textAlignment = .left
        //label.font = .systemFont(ofSize: 22)
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 10
        label.layer.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9294117647, blue: 0.937254902, alpha: 1)
        return label
    }()
    
    private let bDate:UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.timeZone = TimeZone(secondsFromGMT: 0)
        date.addTarget(self, action: #selector(dateClick), for: .valueChanged)
        date.backgroundColor = .white
        date.layer.backgroundColor = UIColor.white.cgColor
        date.tintColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        return date
    }()
    @objc func dateClick()
    {}
    private let AddBtn:UIButton = {
        let button=UIButton()
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(btnTapHandle), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    @objc func btnTapHandle()
    {
        let id = Int(tfSPID.text!)!
        let name = tfName.text!
        let gen : String
        if gender.selectedSegmentIndex == 0{
            gen = "Male"
        }else{
            gen = "Female"
        }
        let Class : String
        if classData[classView.selectedRow(inComponent: 0)] == "FYMCA"{
            Class = "FYMCA"
        }else if classData[classView.selectedRow(inComponent: 0)] == "SYMCA"{
            Class = "SYMCA"
        }else if classData[classView.selectedRow(inComponent: 0)] == "TYMCA"{
            Class = "TYMCA"
        }else{
            Class = ""
        }
        let Bdate : String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd, MMM yyyy"
        Bdate = dateFormatter.string(from: bDate.date)
        
        if let stu = stud
          {
            coreDataHandler.shared.update(stud:stu , Name: name, Gender: gen , Cls: Class , Bdate: Bdate) {
                print("updated")
                self.reset()
            }
        } else {
            coreDataHandler.shared.insert(Spid: id ,Pwd : "123456", Name: name, Gender: gen , Cls: Class , Bdate: Bdate ){
            print("inserted")
            self.reset()
            }
        }
    }
    private func reset()
    {
        stud = nil
        tfSPID.text = ""
        tfName.text = ""
        gender.selectedSegmentIndex = 0
        classView.selectedRow(inComponent: 0)
        bDate.setDate(Date(), animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        TopView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(TopView)
        TopView.addSubview(backBtn)
        TopView.addSubview(topTitle)
        //TopView.addSubview(deleteBtn)
        view.addSubview(tfSPID)
        view.addSubview(tfName)
        view.addSubview(gender)
        view.addSubview(classView)
        classView.dataSource = self
        classView.delegate = self
        view.addSubview(bdateLbl)
        view.addSubview(bDate)
        view.addSubview(AddBtn)
        
        if temp == 0{
            topTitle.text = "Add Student"
            AddBtn.setTitle("Add", for: .normal)
            deleteBtn.removeFromSuperview()
        }else{
            topTitle.text = "Update Student"
            AddBtn.setTitle("Update", for: .normal)
            TopView.addSubview(deleteBtn)
        }
        
        if let s1 = stud {
            tfSPID.text = String(s1.spid)
            tfName.text = s1.name
            if s1.gender == "Male"{
                gender.selectedSegmentIndex = 0
            }else{
                gender.selectedSegmentIndex = 1
            }
            if s1.cls == "FYMCA"{
                classView.selectRow(1, inComponent: 0, animated: true)
            }else if s1.cls == "SYMCA"{
                classView.selectRow(2, inComponent: 0, animated: true)
            }else if s1.cls == "TYMCA"{
                classView.selectRow(3, inComponent: 0, animated: true)
            }
            bDate.setDate(from: s1.bdate!, format: "dd, MMM yyyy")
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        TopView.frame = CGRect(x: 0, y: 0, width: view.width, height: 100)
        backBtn.frame = CGRect(x: 20, y: 58, width: 24, height: 24)
        topTitle.frame = CGRect(x: 0, y: 58, width: view.width, height: 24)
        deleteBtn.frame = CGRect(x: (TopView.width - 24 ) - 20 , y: 58, width: 24, height: 24)
        tfSPID.frame = CGRect(x: 20, y: TopView.bottom + 25, width: view.width - 40, height: 50)
        tfName.frame = CGRect(x: 20, y: tfSPID.bottom + 20, width: view.width - 40, height: 50)
        gender.frame = CGRect(x: 20, y: tfName.bottom + 20, width: view.width - 40, height: 50)
        classView.frame = CGRect(x: 15, y: gender.bottom + 15, width: view.width - 30, height: 80)
        bdateLbl.frame =  CGRect(x: 20, y: classView.bottom + 10 , width: view.width - 40, height: 50)
        bDate.frame = CGRect(x: 160 , y: classView.bottom + 10 , width:130  , height: 50)
        AddBtn.frame = CGRect(x: 20, y: bdateLbl.bottom + 30 , width: view.width - 40, height: 50)
    }
}
extension newStudent : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return classData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return classData[row]
    }
}
extension UIDatePicker {

   func setDate(from string: String, format: String, animated: Bool = true) {

      let formater = DateFormatter()

      formater.dateFormat = format

      let date = formater.date(from: string) ?? Date()

      setDate(date, animated: animated)
   }
}
