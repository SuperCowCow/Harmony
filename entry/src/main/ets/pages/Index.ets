import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State helloWorld: string = 'Hello World'
  @State nextMessage: string = 'Next'

  build() {
    Row() {
      Column() {
        Text(this.helloWorld)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button(){
          Text(this.nextMessage)
            .fontColor(Color.Red)
            .fontSize(30)
        }
        .type(ButtonType.Circle)
        .margin({
          top: 20
        })
        .backgroundColor(Color.Green)
        .width('40%')
        .height('10%')
        .onClick(() => {router.pushUrl({url : 'pages/Second'})})
      }
      .width('100%')
    }
    .height('100%')
  }
}