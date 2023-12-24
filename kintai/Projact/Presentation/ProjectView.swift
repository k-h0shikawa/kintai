import SwiftUI

struct ProjectView: View {
    @State private var projectName = ""

    var body: some View {
        VStack {
            TextField("プロジェクト名を入力してください", text: $projectName)
                .padding()
                .border(Color.gray, width: 0.5)

            Button(action: {
                print("対応完了ボタンが押されました")
                // ここに対応完了時の処理を書く
            }) {
                Text("対応完了")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: {
                print("PDF出力ボタンが押されました")
                // ここにPDF出力時の処理を書く
            }) {
                Text("PDF出力")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
