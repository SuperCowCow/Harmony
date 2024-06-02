import router from '@ohos.router'
import AddTargetDialog from '../view/AddTargetDialog'
import TargetListItem from '../view/TargetListItem'
import DataModel, { TargetItemStruct } from '../viewModel/DateModel';

@Entry
@Component
@Preview
struct Content {
  @State
  targets: Array<TargetItemStruct> = DataModel.getData();
  @State
  isEditMode: boolean = false
  @State
  clickIndex: number = -1

  customDialogController: CustomDialogController = new CustomDialogController({
    builder: AddTargetDialog({
      targets: $targets
    }),
  })

  build() {
    List() {
      ListItemGroup({ header: this.itemGroupTitle($r('app.string.Work_objectives') as unknown as string, 40) }) {
        ListItem() {
          Column() {
            Row() {
              Column() {
                Image($r("app.media.workflow"))
                  .margin({ top: 20 })
              }
              .width("50%")


              Column() {
                Text($r('app.string.First_quarter_operating_goals'))
                  .fontSize(20)
                Text($r('app.string.User_increased'))
                  .fontSize(15)
                  .fontColor("#b3b3b3")
              }
            }
            .justifyContent(FlexAlign.SpaceAround)
            .width("100%")

            Row() {
              Column() {
                Text($r('app.string.Overall_progress'))
                  .fontSize(15)
                  .align(Alignment.Start)
                Text($r('app.string.Update_time'))
                  .fontSize(10)
                  .fontColor("#b3b3b3")
                Text("03/26/2024 19:20")
                  .fontSize(15)
              }

              Column() {
                Stack() {
                  Row() {
                    Text(this.targets.filter((target) => {target.isFinished == true}).length.toString())
                      .fontColor(Color.Blue)
                    Text("/" + this.targets.length)
                  }

                  Progress({ value: this.targets.filter((target) => {target.isFinished == true}).length, total: this.targets.length, type: ProgressType.Ring })
                }
              }
            }
            .width("100%")
            .justifyContent(FlexAlign.SpaceAround)
          }
        }
        .border({ radius: 10 })
        .width("95%")
        .backgroundColor(Color.White)
        .margin({ left: "2.5%" })
      }
      .height("20%")

      ListItemGroup({
        header: this.subTargetGroupTitle($r('app.string.Sub_target') as unknown as string, 25, this.isEditMode)
      }) {
        ForEach(this.targets, (target, index) => {
          ListItem() {
            TargetListItem({clickIndex: $clickIndex, targetStruct: target, index: index, isEditMode: this.isEditMode})
          }
          .height(100)
          .border({ radius: 10 })
          .width("95%")
          .margin({ left: "2.5%" })
          .backgroundColor(Color.White)
        })
      }
      .height("60%")
      .width("100%")

      ListItem() {
        if (this.isEditMode) {
          Text("删除").fontSize(30)
            .fontColor(Color.Red)
        }
        else {
          Button("添加子目标", { type: ButtonType.Capsule })
            .onClick(() => {
              this.customDialogController.open()
            })
        }
      }
      .width("100%")
      .height("20%")

    }
    .height("100%")
    .width("100%")
    .backgroundColor("#f2f2f2")

  }

  @Builder subTargetGroupTitle(text: string, fontSize: number, isEditMode: boolean) {
    Row() {
      Column() {
        this.itemGroupTitle(text, fontSize)
      }
      .width("30%")

      Column() {
        Row() {
          if (isEditMode) {
            Text("取消").fontSize(20).fontColor(Color.Blue).onClick(() => {
              this.isEditMode = false
            })
              .margin({ right: 10 })
            Text("全选").fontSize(20).fontColor(Color.Blue)
            CheckboxGroup({ group: "SubTargets" })
          }
          else {
            Text("编辑").fontColor(Color.Blue)
              .onClick(() => {
                this.isEditMode = true
                console.log("hello 编辑");
              })
              .fontSize(20)
          }
        }
      }
      .width("60%")
      .margin({ left: "80" })
    }
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder itemGroupTitle(text: string, fontSize: number) {
    Text(text)
      .fontSize(fontSize)
      .backgroundColor("#f2f2f2")
      .width("100%")
  }
}

