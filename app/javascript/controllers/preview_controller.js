import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["previewImage"] // ターゲット名をより明確に（imageだと予約語に近い場合があるため）

    connect() {
        console.log("Preview controller connected!") // ブラウザの検証画面でこれが出るか確認
    }

    // 選択されたファイルをプレビューする
    display(event) {
        const reader = new FileReader()
        const file = event.target.files[0]

        if (file) {
            reader.onload = (e) => {
                this.previewImageTarget.src = e.target.result
                this.previewImageTarget.style.display = "block"
            }
            reader.readAsDataURL(file)
        }
    }
}
