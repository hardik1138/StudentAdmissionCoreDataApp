
import UIKit

class LoginScreen: UIViewController {

    private let BgView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Loginscreen")
        iv.clipsToBounds = true
        return iv
    }()
    
    public let mytfspid:UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Enter SPID", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.337254902, green: 0.4039215686, blue: 0.4666666667, alpha: 1)])
        textField.textColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        textField.textAlignment = .left
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(50, 0, 0)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9294117647, blue: 0.937254902, alpha: 1)
        return textField
    }()
    private let spidtficon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "spidicon")
        iv.clipsToBounds = true
        return iv
    }()
    public let mytfpwd:UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Enter password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.337254902, green: 0.4039215686, blue: 0.4666666667, alpha: 1)])
        textField.textColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        textField.isSecureTextEntry = true
        textField.textAlignment = .left
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(50, 0, 0)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9294117647, blue: 0.937254902, alpha: 1)

        return textField
    }()
    private let pwdtficon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "pwdicon")
        iv.clipsToBounds = true
        return iv
    }()
    private let Forgotlabel : UILabel = {
        let lb = UILabel ()
        lb.text = "Forgot Password?"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = #colorLiteral(red: 0.337254902, green: 0.4039215686, blue: 0.4666666667, alpha: 1)
        lb.textAlignment = .left
        return lb
    }()
    private let LoginBtn:UIButton = {
        let button=UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(btnTapHandle), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    @objc func btnTapHandle()
    {
        let s = coreDataHandler.shared.chkLogin(spid: Int(mytfspid.text!)!, pwd: mytfpwd.text!)
        if mytfspid.text == "Admin" && mytfpwd.text == "admin"{
            let vc = AdminDash()
             navigationController?.pushViewController(vc, animated: true)
        }else if s.name != "" {
            let vc = StudentDash()
            vc.stud = s
             navigationController?.pushViewController(vc, animated: true)
        }else{
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(BgView)
        view.addSubview(mytfspid)
        view.addSubview(spidtficon)
        view.addSubview(mytfpwd)
        view.addSubview(pwdtficon)
        view.addSubview(Forgotlabel)
        view.addSubview(LoginBtn)
        
        mytfspid.delegate = self
        mytfpwd.delegate = self
    
    }
    override func viewDidLayoutSubviews() {
        BgView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        mytfspid.frame = CGRect(x: 30, y: 375, width: view.width - 60, height: 50)
        spidtficon.frame = CGRect(x: 40, y: mytfspid.top - (mytfspid.height/2 ) + 35, width: 30, height: 30 )
        mytfpwd.frame = CGRect(x: 30, y: mytfspid.bottom + 20, width: view.width - 60, height: 50)
        pwdtficon.frame = CGRect(x: 40, y: mytfpwd.top - (mytfpwd.height/2 ) + 35, width: 30, height: 30 )
        Forgotlabel.frame = CGRect(x: 226, y: mytfpwd.bottom + 10, width: 120, height: 17)
        LoginBtn.frame = CGRect(x: 30, y: Forgotlabel.bottom + 30 , width: view.width - 60, height: 50)
    }
}
extension LoginScreen : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderColor = #colorLiteral(red: 0.9254901961, green: 0.9294117647, blue: 0.937254902, alpha: 1)
        return true
    }
}
