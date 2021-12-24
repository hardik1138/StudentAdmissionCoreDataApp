

import UIKit

private let BgView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.image = UIImage(named: "Splashscreen")
    iv.clipsToBounds = true
    return iv
}()
private let loading:UIActivityIndicatorView = {
    let act = UIActivityIndicatorView()
    act.color = .black
    act.hidesWhenStopped = true
    return act
}()

class spleshScreen: UIViewController {
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidLoad()
        view.addSubview(BgView)
        view.addSubview(loading)
    }
    override func viewDidLayoutSubviews() {
        BgView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        loading.frame = CGRect(x: (view.width - 70)/2, y: view.bottom - 80, width: 70, height: 70)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.async {
            loading.isHidden = !loading.isHidden
            loading.isHidden ? loading.stopAnimating() : loading.startAnimating()
            if !loading.isHidden {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                    loading.stopAnimating()
                    loading.isHidden = true
                    let vc = LoginScreen()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
}
