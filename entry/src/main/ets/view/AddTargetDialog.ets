import DataModel, { TargetItemStruct } from '../viewModel/DateModel';
@CustomDialog
export default struct AddTargetDialogWidget {
  private targetName: string;
  @Link
  targets: Array<TargetItemStruct>
  private controller: CustomDialogController = new CustomDialogController({
    builder: AddTargetDialogWidget({
      targets: $targets
    })
  });

  build() {
    Column() {
      Row() {
        Text("添加子目标")
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .justifyContent(FlexAlign.Start)
      .width("100%")

      Row() {
        TextInput({ placeholder: "请输入子目标名称" }).onChange((inputValue) => {
          this.targetName = inputValue;
        })
      }.width("95%")

      Row() {
        Column() {
          Button("取消").onClick(() => {
            this.controller.close()
          })
        }

        Column() {
          Button("确认").onClick(() => {
            // DataModel.addData(new TargetItemStruct(this.targetName,new Date().toString() ,false))
            this.targets.push(new TargetItemStruct(this.targetName,new Date().toString() ,false))
            this.controller.close()
          })
        }
      }
      .width("100%")
      .justifyContent(FlexAlign.SpaceAround)
    }
    .height(150)
    .justifyContent(FlexAlign.SpaceAround)
  }
}