import DataModel, { TargetItemStruct } from '../viewModel/DateModel'
@Component

export default struct TargetListItem {
  private targetStruct: TargetItemStruct

  @State
  index: number = -1

  @Prop
  isEditMode: boolean

  @Link @Watch('onClickIndexChanged')
  clickIndex: number

  @State
  isExpanded: boolean = false

  @Consume
  countOfFinishedTargets: number

  onClickIndexChanged() {
    if (this.clickIndex !== this.index) {
      this.isExpanded = false;
    }
  }

  build(){
    Column() {
      Row() {
        Column() {
          Text(this.targetStruct.targetName)
        }

        Column() {
          Column() {
            Text(this.targetStruct.isFinished ? "100%" : "0%")
            Row() {
              Text($r('app.string.Update_time'))
              Text(this.targetStruct.updateDate)
                .width(180)
                .margin({left: 20})
            }
          }
        }

        if (this.isEditMode) {
          Column() {
            Checkbox({ name: this.index.toString(), group: "SubTargets" })
          }
        }
      }
      .width("90%")
      .justifyContent(FlexAlign.SpaceBetween)
      .onClick(() => {
        this.clickIndex = this.index
        this.isExpanded = !this.isExpanded
      })

      if (this.isExpanded){
        Blank()
        Row(){
          Text("取消").fontColor(Color.Blue)
            .onClick(() => {
              this.isExpanded = false
            })
          Text("完成").fontColor(Color.Blue)
            .onClick(()=> {
              if (!DataModel.getData()[this.index].isFinished) {
                DataModel.updateProgress(this.index, new Date().toString())
              }
              this.isExpanded = false

            })
        }
        .height(20)
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
      }
    }
    .height(this.isExpanded && !this.isEditMode? 100 : 50)




  }


}
