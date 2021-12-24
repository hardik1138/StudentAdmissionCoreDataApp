
import UIKit

class ChangePassword: UIViewController {

    
    private let TopView = UIView()
    private let topTitle : UILabel = {
        let lb = UILabel ()
        lb.text = "Change Password"
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
    public let tfPwd:UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Enter old password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.337254902, green: 0.4039215686, blue: 0.4666666667, alpha: 1)])
        textField.textColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        textField.textAlignment = .left
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9294117647, blue: 0.937254902, alpha: 1)
        return textField
    }()
    public let tfNewPwd:UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Enter new password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.337254902, green: 0.4039215686, blue: 0.4666666667, alpha: 1)])
        textField.textColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        textField.textAlignment = .left
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9294117647, blue: 0.937254902, alpha: 1)
        return textField
    }()
    private let AddBtn:UIButton = {
        let button=UIButton()
        button.setTitle("Change password", for: .normal)
        button.addTarget(self, action: #selector(btnTapHandle), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    @objc func btnTapHandle()
    {
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        TopView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(TopView)
        TopView.addSubview(backBtn)
        TopView.addSubview(topTitle)
        view.addSubview(tfPwd)
        view.addSubview(tfNewPwd)
        view.addSubview(AddBtn)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TopView.frame = CGRect(x: 0, y: 0, width: view.width, height: 100)
        backBtn.frame = CGRect(x: 20, y: 58, width: 24, height: 24)
        topTitle.frame = CGRect(x: 0, y: 58, width: view.width, height: 24)
        
        tfPwd.frame = CGRect(x: 20, y: TopView.bottom + 25, width: view.width - 40, height: 50)
        tfNewPwd.frame = CGRect(x: 20, y: tfPwd.bottom + 20, width: view.width - 40, height: 50)
        AddBtn.frame = CGRect(x: 20, y: tfNewPwd.bottom + 30 , width: view.width - 40, height: 50)
    }
}
