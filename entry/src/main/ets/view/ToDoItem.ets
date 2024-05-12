@Component
export struct ToDoItem {
  itemIndex?: number
  itemValue?: string;
  @State isClicked: boolean = false;
  @State isChecked: boolean = false

  build() {


    Row() {
      Radio({ value: this.itemValue, group: this.itemIndex.toString() }).checked(this.isChecked)
        .onClick(() => {
          this.isClicked = !this.isClicked
          this.isChecked = !this.isChecked
        })
        .margin({ left: 20 })
      Text(this.itemValue)
        .decoration(this.isClicked ? {
                                       type: TextDecorationType.LineThrough,
                                       color: Color.Blue
                                     } : {
                                           type: TextDecorationType.None
                                         })
        .fontSize(30)
        .margin({ left: 30 })

    }
    .width('100%')
    .margin({ top: 15 })

  }
}