if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import router from "@ohos:router";
interface SettingItem {
    title: string;
    value: string;
    color: string;
}
class DensePage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.settings = [
            { title: '账号与安全', value: '', color: '#4A6CF7' },
            { title: '消息通知', value: '已开启', color: '#2FDE5F' },
            { title: '深色模式', value: '跟随系统', color: '#E6810C' },
            { title: '字体大小', value: '标准', color: '#9C6BEF' },
            { title: '存储空间', value: '12.6 GB', color: '#EF5B8B' },
            { title: '清理缓存', value: '236 MB', color: '#5BEF8B' },
            { title: '流量使用', value: 'WiFi 优先', color: '#5B8DEF' },
            { title: '隐私与权限', value: '', color: '#F7A44A' },
            { title: '语言与地区', value: '简体中文', color: '#44C2F7' },
            { title: '辅助功能', value: '', color: '#8BEF5B' },
            { title: '检查更新', value: 'v1.0.0', color: '#DE5F2F' },
            { title: '关于应用', value: '', color: '#6B7BEF' }
        ];
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
    }
    private settings: SettingItem[];
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
            Row.padding({ left: 8, top: 40, bottom: 4 });
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
            Text.create('设置');
            Text.fontSize(20);
            Text.fontWeight(FontWeight.Bold);
            Text.width('100%');
            Text.padding({ left: 10, top: 4, bottom: 6 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            List.create({ space: 0 });
            List.layoutWeight(1);
            List.width('100%');
            List.scrollBar(BarState.Off);
        }, List);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = (_item, idx: number) => {
                const s = _item;
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
                            Row.create({ space: 10 });
                            Row.width('100%');
                            Row.padding({ left: 8, right: 8, top: 13, bottom: 13 });
                            Row.backgroundColor(idx % 2 === 0 ? '#FFFFFF' : '#F2F4F7');
                        }, Row);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Column.create();
                            Column.width(26);
                            Column.height(26);
                            Column.borderRadius(6);
                            Column.backgroundColor(s.color);
                        }, Column);
                        Column.pop();
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create(s.title);
                            Text.fontSize(15);
                            Text.layoutWeight(1);
                            Text.fontColor('#222222');
                        }, Text);
                        Text.pop();
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            If.create();
                            if (s.value.length > 0) {
                                this.ifElseBranchUpdateFunction(0, () => {
                                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                                        Text.create(s.value);
                                        Text.fontSize(13);
                                        Text.fontColor('#999999');
                                    }, Text);
                                    Text.pop();
                                });
                            }
                            else {
                                this.ifElseBranchUpdateFunction(1, () => {
                                });
                            }
                        }, If);
                        If.pop();
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create('>');
                            Text.fontSize(14);
                            Text.fontColor('#CCCCCC');
                        }, Text);
                        Text.pop();
                        Row.pop();
                        ListItem.pop();
                    };
                    this.observeComponentCreation2(itemCreation2, ListItem);
                    ListItem.pop();
                }
            };
            this.forEachUpdateFunction(elmtId, this.settings, forEachItemGenFunction, (s: SettingItem) => s.title, true, false);
        }, ForEach);
        ForEach.pop();
        List.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "DensePage";
    }
}
registerNamedRoute(() => new DensePage(undefined, {}), "", { bundleName: "com.ct.casea", moduleName: "entry", pagePath: "pages/DensePage", pageFullPath: "entry/src/main/ets/pages/DensePage", integratedHsp: "false", moduleType: "followWithHap" });
