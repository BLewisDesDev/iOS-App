
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnListView: UIButton!
    
    @IBOutlet weak var btnList: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func goToList(_ sender: Any) {
        performSegue(withIdentifier: "goToList", sender: self)
    }
}

