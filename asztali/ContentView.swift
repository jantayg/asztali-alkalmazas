//
//  ContentView.swift
//  asztali
//
//  Created by Gusztav Jantay on 2021. 04. 20..
//

import SwiftUI
import AVFoundation

struct AlertId: Identifiable {
    
    var id: AlertType
    
    enum AlertType {
        case win
        case loose
    }
}

struct ContentView: View {
    
    @State var cpuItem = "spaceholder"
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var alertId: AlertId?
    
    var body: some View {
        VStack {
            Spacer()
            Text("CPU")
                .foregroundColor(.orange)
            Image(cpuItem)
                .resizable()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack{
                Spacer()
                Button (action: {turn()
                    if  cpuItem == "sizors"  {
                        playerScore += 1
                        win()
                    }
                    if  cpuItem == "paper"  {
                        cpuScore += 1
                        loose()
                    }
                },label:{Image("rock")
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
                })
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button (action: {turn()
                    if  cpuItem == "paper"  {
                        playerScore += 1
                        win()
                    }
                    if  cpuItem == "rock"  {
                        cpuScore += 1
                        loose()
                    }
                },label:{Image("sizors")
                    .resizable()
                    .frame(width: 100.0, height: 100.0)})
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button (action: {turn()
                    if  cpuItem == "rock"  {
                        playerScore += 1
                        win()
                    }
                    if  cpuItem == "sizors"  {
                        cpuScore += 1
                        loose()
                    }
                },label:{Image("paper")
                    .resizable()
                    .frame(width: 100.0, height: 100.0)})
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
            HStack{
                Spacer()
                VStack{
                    Text("CPU score")
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.orange)
                    Text(String(cpuScore))
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.orange)
                }
                Spacer()
                VStack{
                    Text("Player score")
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.orange)
                    Text(String(playerScore))
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.orange)
                }
                Spacer()
            }
            Spacer()
            Button (action:{restart()},label:{Text("Restart the game") .foregroundColor(.orange)})
            Spacer()
                
                .alert(item: $alertId) { (alertId) -> Alert in
                    return createAlert(alertId: alertId)
                }
        }
    }
    func turn() {
        let randomcpu = Int.random(in: 1...3)
        if randomcpu == 1  {
            cpuItem = "rock"
        }
        if randomcpu == 2  {
            cpuItem = "sizors"}
        if randomcpu == 3 {
            cpuItem = "paper"
        }
    }
    func restart() -> Void{
        playerScore = 0
        cpuScore = 0
        cpuItem = "spaceholder"
    }
    func win() -> Void{
        if playerScore == 10 {
            self.alertId = AlertId(id: .win)
            restart()
        }
    }
    func loose() -> Void {
        if cpuScore == 10 {
            self.alertId = AlertId(id: .loose)
            restart()
        }
    }
    func createAlert(alertId: AlertId) -> Alert {
        switch alertId.id {
        case .win:
            return Alert(title: Text("Congratulation, you won!"),dismissButton: .default(Text("Play again!")))
        case .loose:
            return Alert(title: Text("Sorry, you lost!"),dismissButton: .default(Text("Play again!")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
