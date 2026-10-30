if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import router from "@ohos:router";
class S2KeyboardPage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.timerId = -1;
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
    }
    private timerId: number;
    aboutToAppear(): void {
        this.timerId = setTimeout(() => {
            focusControl.requestFocus('feedbackInput');
        }, 500);
    }
    aboutToDisappear(): void {
        clearTimeout(this.timerId);
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.height('100%');
            Column.backgroundColor('#FFFFFF');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.width('100%');
            Row.padding(12);
            Row.margin({ top: 40 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width(48);
            Column.height(48);
            Column.justifyContent(FlexAlign.Center);
            Column.onClick(() => { router.back(); });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777227, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" });
            Image.width(36);
            Image.height(36);
        }, Image);
        Column.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('意见反馈');
            Text.fontSize(20);
            Text.fontWeight(FontWeight.Bold);
            Text.width('100%');
            Text.padding({ left: 16, top: 8, bottom: 8 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TextArea.create({ placeholder: '请详细描述您遇到的问题或建议...' });
            TextArea.key('feedbackInput');
            TextArea.height(140);
            TextArea.margin({ left: 16, right: 16, top: 16 });
            TextArea.backgroundColor('#F5F6F7');
            TextArea.borderRadius(10);
        }, TextArea);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('提交后我们将在 3 个工作日内处理并回复。紧急问题请优先联系在线客服。');
            Text.fontSize(13);
            Text.fontColor('#999999');
            Text.lineHeight(20);
            Text.margin(16);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('提交反馈');
            Button.width('80%');
            Button.height(48);
            Button.fontSize(16);
        }, Button);
        Button.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "S2KeyboardPage";
    }
}
registerNamedRoute(() => new S2KeyboardPage(undefined, {}), "", { bundleName: "com.ct.cased", moduleName: "entry", pagePath: "pages/S2KeyboardPage", pageFullPath: "entry/src/main/ets/pages/S2KeyboardPage", integratedHsp: "false", moduleType: "followWithHap" });
