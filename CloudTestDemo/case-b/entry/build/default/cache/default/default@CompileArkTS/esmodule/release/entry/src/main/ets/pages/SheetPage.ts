if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import window from "@ohos:window";
import router from "@ohos:router";
class SheetPage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.showSheet = false;
        this.sheetHeight = 400;
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.showSheet = false;
        this.sheetHeight = 400;
    }
    @Local
    showSheet: boolean;
    @Local
    sheetHeight: number;
    aboutToAppear(): void {
        const ctx = this.getUIContext().getHostContext();
        if (!ctx) {
            return;
        }
        window.getLastWindow(ctx).then((win) => {
            const ui = this.getUIContext();
            this.sheetHeight = ui.px2vp(win.getWindowProperties().windowRect.width);
        });
        setTimeout(() => {
            this.showSheet = true;
        }, 100);
    }
    sheetBuilder(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 14 });
            Column.width('100%');
            Column.height(this.sheetHeight);
            Column.padding({ top: 36, bottom: 36 });
            Column.backgroundColor('#FFFFFF');
            Column.justifyContent(FlexAlign.Center);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777226, "type": 20000, params: [], "bundleName": "com.ct.caseb", "moduleName": "entry" });
            Image.width(56);
            Image.height(56);
            Image.borderRadius(14);
            Image.objectFit(ImageFit.Contain);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('环球资讯');
            Text.fontSize(20);
            Text.fontWeight(FontWeight.Bold);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('版本 1.0.0 (100)');
            Text.fontSize(13);
            Text.fontColor('#999999');
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 12 });
            Column.margin({ top: 6 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('《用户服务协议》');
            Text.fontSize(14);
            Text.fontColor('#007DFF');
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('《隐私政策》');
            Text.fontSize(14);
            Text.fontColor('#007DFF');
        }, Text);
        Text.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Blank.create();
            Blank.layoutWeight(1);
        }, Blank);
        Blank.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('同意并继续');
            Button.width('80%');
            Button.height(44);
            Button.fontSize(15);
            Button.onClick(() => { this.showSheet = false; });
        }, Button);
        Button.pop();
        Column.pop();
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.height('100%');
            Column.backgroundColor('#FFFFFF');
            Column.bindSheet(this.showSheet, { builder: () => {
                    this.sheetBuilder.call(this);
                } }, {
                height: this.sheetHeight,
                preferType: SheetType.BOTTOM,
                dragBar: true,
                showClose: true,
                backgroundColor: '#FFFFFF'
            });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.width('100%');
            Row.padding({ left: 12, top: 44, bottom: 12 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width(48);
            Column.height(48);
            Column.justifyContent(FlexAlign.Center);
            Column.onClick(() => { router.back(); });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777227, "type": 20000, params: [], "bundleName": "com.ct.caseb", "moduleName": "entry" });
            Image.width(36);
            Image.height(36);
        }, Image);
        Column.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 12 });
            Column.width('100%');
            Column.layoutWeight(1);
            Column.justifyContent(FlexAlign.Center);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('半模态弹窗测试页');
            Text.fontSize(22);
            Text.fontWeight(FontWeight.Bold);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('进入页面后自动弹出应用信息半模态');
            Text.fontSize(14);
            Text.fontColor('#999999');
        }, Text);
        Text.pop();
        Column.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "SheetPage";
    }
}
registerNamedRoute(() => new SheetPage(undefined, {}), "", { bundleName: "com.ct.caseb", moduleName: "entry", pagePath: "pages/SheetPage", pageFullPath: "entry/src/main/ets/pages/SheetPage", integratedHsp: "false", moduleType: "followWithHap" });
