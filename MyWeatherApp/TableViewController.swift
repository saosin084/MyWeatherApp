import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{ //追加①

    let TODO = ["東京", "大阪", "広島"] //追加②
    var ken = ""
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
           // ②Segueの識別子確認
           if segue.identifier == "ViewController" {
    
               // ③遷移先ViewCntrollerの取得
               let nextView = segue.destination as! ViewController
    
               // ④値の設定
               nextView.argString = ken
           }
       }

    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //追加③ セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TODO.count
    }

    //追加④ セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = TODO[indexPath.row]
        
        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           ken = TODO[indexPath.row]
    
           // セルの選択を解除
           tableView.deselectRow(at: indexPath, animated: true)
    
           // 別の画面に遷移
           performSegue(withIdentifier: "ViewController", sender: nil)
       }
}
