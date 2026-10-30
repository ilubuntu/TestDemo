if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import router from "@ohos:router";
import mediaquery from "@ohos:mediaquery";
interface SettingDef {
    title: string;
    color: string;
}
class SettingToggle extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.initParam("title", (params && "title" in params) ? params.title : '');
        this.initParam("color", (params && "color" in params) ? params.color : '#4A6CF7');
        this.isOn = false;
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.resetParam("title", (params && "title" in params) ? params.title : '');
        this.resetParam("color", (params && "color" in params) ? params.color : '#4A6CF7');
        this.isOn = false;
    }
    @Param
    readonly title: string;
    @Param
    readonly color: string;
    @Local
    isOn: boolean;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create({ space: 10 });
            Row.width('100%');
            Row.padding({ left: 12, right: 12, top: 12, bottom: 12 });
            Row.backgroundColor('#FFFFFF');
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width(24);
            Column.height(24);
            Column.borderRadius(6);
            Column.backgroundColor(this.color);
        }, Column);
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.title);
            Text.fontSize(15);
            Text.layoutWeight(1);
            Text.fontColor('#222222');
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Toggle.create({ type: ToggleType.Switch, isOn: this.isOn });
            Toggle.onChange((isOn: boolean) => {
                this.isOn = isOn;
            });
        }, Toggle);
        Toggle.pop();
        Row.pop();
    }
    public updateStateVars(params) {
        if (params === undefined) {
            return;
        }
        if ("title" in params) {
            this.updateParam("title", params.title);
        }
        if ("color" in params) {
            this.updateParam("color", params.color);
        }
    }
    rerender() {
        this.updateDirtyElements();
    }
}
class StateLossPage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.isWide = false;
        this.settings = [
            { title: '消息通知', color: '#4A6CF7' },
            { title: '深色模式', color: '#2F3138' },
            { title: '自动播放视频', color: '#EF5B8B' },
            { title: '省流量模式', color: '#5BEF8B' },
            { title: '横屏锁定', color: '#E6810C' },
            { title: '手势导航', color: '#9C6BEF' },
            { title: '自动更新', color: '#2FDE5F' },
            { title: '云同步', color: '#5B8DEF' },
            { title: '指纹解锁', color: '#F7A44A' },
            { title: '悬浮窗', color: '#44C2F7' },
            { title: '夜间护眼', color: '#8BEF5B' },
            { title: '振动反馈', color: '#DE5F2F' },
            { title: '蓝牙', color: '#6B7BEF' },
            { title: '位置信息', color: '#EF8B5B' },
            { title: '勿扰模式', color: '#6BEFC2' },
            { title: '智能推荐', color: '#C26BEF' },
            { title: '高清画质', color: '#EF5B5B' },
            { title: '自动缓存', color: '#5BDEF0' },
            { title: '桌面快捷方式', color: '#A2EF5B' },
            { title: '实验室功能', color: '#EFDA5B' }
        ];
        this.mediaQueryListener = undefined;
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.isWide = false;
    }
    @Local
    isWide: boolean;
    private settings: SettingDef[];
    private mediaQueryListener?: mediaquery.MediaQueryListener;
    aboutToAppear(): void {
        this.mediaQueryListener = mediaquery.matchMediaSync('(min-width: 600vp)');
        this.isWide = this.mediaQueryListener.matches;
        this.mediaQueryListener.on('change', (result: mediaquery.MediaQueryResult) => {
            this.isWide = result.matches;
        });
    }
    aboutToDisappear(): void {
        this.mediaQueryListener?.off('change');
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
            Image.create({ "id": 16777224, "type": 20000, params: [], "bundleName": "com.ct.casec", "moduleName": "entry" });
            Image.width(36);
            Image.height(36);
        }, Image);
        Column.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('通用设置');
            Text.fontSize(20);
            Text.fontWeight(FontWeight.Bold);
            Text.width('100%');
            Text.padding({ left: 16, top: 4, bottom: 8 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (this.isWide) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        List.create({ space: 0 });
                        List.layoutWeight(1);
                        List.width('100%');
                        List.lanes(2);
                        List.scrollBar(BarState.Off);
                    }, List);
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        ForEach.create();
                        const forEachItemGenFunction = _item => {
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
                                    {
                                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                                            if (isInitialRender) {
                                                let componentCall = new SettingToggle(this, { title: s.title, color: s.color }, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/StateLossPage.ets", line: 87, col: 15 });
                                                ViewV2.create(componentCall);
                                                let paramsLambda = () => {
                                                    return {
                                                        title: s.title,
                                                        color: s.color
                                                    };
                                                };
                                                componentCall.paramsGenerator_ = paramsLambda;
                                            }
                                            else {
                                                this.updateStateVarsOfChildByElmtId(elmtId, {
                                                    title: s.title, color: s.color
                                                });
                                            }
                                        }, { name: "SettingToggle" });
                                    }
                                    ListItem.pop();
                                };
                                this.observeComponentCreation2(itemCreation2, ListItem);
                                ListItem.pop();
                            }
                        };
                        this.forEachUpdateFunction(elmtId, this.settings, forEachItemGenFunction, (s: SettingDef) => s.title, false, false);
                    }, ForEach);
                    ForEach.pop();
                    List.pop();
                });
            }
            else {
                this.ifElseBranchUpdateFunction(1, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        List.create({ space: 0 });
                        List.layoutWeight(1);
                        List.width('100%');
                        List.scrollBar(BarState.Off);
                    }, List);
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        ForEach.create();
                        const forEachItemGenFunction = _item => {
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
                                    {
                                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                                            if (isInitialRender) {
                                                let componentCall = new SettingToggle(this, { title: s.title, color: s.color }, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/StateLossPage.ets", line: 98, col: 15 });
                                                ViewV2.create(componentCall);
                                                let paramsLambda = () => {
                                                    return {
                                                        title: s.title,
                                                        color: s.color
                                                    };
                                                };
                                                componentCall.paramsGenerator_ = paramsLambda;
                                            }
                                            else {
                                                this.updateStateVarsOfChildByElmtId(elmtId, {
                                                    title: s.title, color: s.color
                                                });
                                            }
                                        }, { name: "SettingToggle" });
                                    }
                                    ListItem.pop();
                                };
                                this.observeComponentCreation2(itemCreation2, ListItem);
                                ListItem.pop();
                            }
                        };
                        this.forEachUpdateFunction(elmtId, this.settings, forEachItemGenFunction, (s: SettingDef) => s.title, false, false);
                    }, ForEach);
                    ForEach.pop();
                    List.pop();
                });
            }
        }, If);
        If.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "StateLossPage";
    }
}
registerNamedRoute(() => new StateLossPage(undefined, {}), "", { bundleName: "com.ct.casec", moduleName: "entry", pagePath: "pages/StateLossPage", pageFullPath: "entry/src/main/ets/pages/StateLossPage", integratedHsp: "false", moduleType: "followWithHap" });
