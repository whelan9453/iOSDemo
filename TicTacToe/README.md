# TicTacToe

### Sync Multiple Button Actions
We have to change _sender: Any to _sender: **AnyObject**
````swift
    @IBAction func buttonPressed(_ sender: AnyObject) {
        drawAndRecord(button: sender as! UIButton, position: sender.tag)
    }
````
