if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import router from "@ohos:router";
import { buildCurrencies } from "@normalized:N&&&entry/src/main/ets/model/Currency&";
import type { Currency } from "@normalized:N&&&entry/src/main/ets/model/Currency&";
class StatusBarCutPage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.currencies = buildCurrencies();
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.currencies = buildCurrencies();
    }
    @Local
    currencies: Currency[];
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.height('100%');
            Column.backgroundColor('#FFFFFF');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.width('100%');
            Stack.height(280);
            Stack.alignContent(Alignment.BottomStart);
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777228, "type": 20000, params: [], "bundleName": "com.ct.casea", "moduleName": "entry" });
            Image.width('100%');
            Image.height(280);
            Image.objectFit(ImageFit.Cover);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.height(280);
            Column.backgroundColor('rgba(12,22,54,0.85)');
        }, Column);
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 8 });
            Column.alignItems(HorizontalAlign.Start);
            Column.padding({ left: 20, bottom: 20 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('全球汇率资讯');
            Text.fontSize(26);
            Text.fontWeight(FontWeight.Bold);
            Text.fontColor('#FFFFFF');
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('今日主流货币汇率走势与要闻');
            Text.fontSize(14);
            Text.fontColor('#C9D3F0');
        }, Text);
        Text.pop();
        Column.pop();
        Stack.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.width('100%');
            Row.padding(12);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width(48);
            Column.height(48);
            Column.justifyContent(FlexAlign.Center);
            Column.onClick(() => { router.back(); });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777227, "type": 20000, params: [], "bundleName": "com.ct.casea", "moduleName": "entry" });
            Image.width(36);
            Image.height(36);
        }, Image);
        Column.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            List.create({ space: 0 });
            List.layoutWeight(1);
            List.width('100%');
            List.scrollBar(BarState.Off);
        }, List);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = _item => {
                const c = _item;
                {
                    const itemCreation = (elmtId, isInitialRender) => {
                        ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
                        ListItem.create(deepRenderFunction, true);
                        if (!isInitialRender) {
                            ListItem.pop();
                        }
                        ViewStackProcessor.StopGetAccessRecording();
                    };
                    const itemCreation2 = (elmtId, isInitialRender) => {
                        ListItem.create(deepRenderFunction, true);
                    };
                    const deepRenderFunction = (elmtId, isInitialRender) => {
                        itemCreation(elmtId, isInitialRender);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Row.create({ space: 12 });
                            Row.width('100%');
                            Row.padding({ left: 16, right: 16, top: 12, bottom: 12 });
                        }, Row);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Image.create(c.flag);
                            Image.width(32);
                            Image.height(32);
                            Image.borderRadius(16);
                            Image.objectFit(ImageFit.Cover);
                        }, Image);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create(`${c.name} ${c.code}`);
                            Text.fontSize(15);
                            Text.layoutWeight(1);
                        }, Text);
                        Text.pop();
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create(c.rate);
                            Text.fontSize(15);
                            Text.fontColor('#333333');
                        }, Text);
                        Text.pop();
                        Row.pop();
                        ListItem.pop();
                    };
                    this.observeComponentCreation2(itemCreation2, ListItem);
                    ListItem.pop();
                }
            };
            this.forEachUpdateFunction(elmtId, this.currencies, forEachItemGenFunction, (c: Currency) => c.code + c.rate, false, false);
        }, ForEach);
        ForEach.pop();
        List.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "StatusBarCutPage";
    }
}
registerNamedRoute(() => new StatusBarCutPage(undefined, {}), "", { bundleName: "com.ct.casea", moduleName: "entry", pagePath: "pages/StatusBarCutPage", pageFullPath: "entry/src/main/ets/pages/StatusBarCutPage", integratedHsp: "false", moduleType: "followWithHap" });
