import type AbilityConstant from "@ohos:app.ability.AbilityConstant";
import UIAbility from "@ohos:app.ability.UIAbility";
import type Want from "@ohos:app.ability.Want";
import type window from "@ohos:window";
import type { BusinessError } from "@ohos:base";
export default class EntryAbility extends UIAbility {
    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    }
    onDestroy(): void {
    }
    onWindowStageCreate(windowStage: window.WindowStage): void {
        windowStage.loadContent('pages/Index', (err) => {
            if (err.code) {
                console.error(`loadContent failed: ${JSON.stringify(err)}`);
            }
        });
        windowStage.getMainWindow().then((win: window.Window) => {
            win.setWindowLayoutFullScreen(true).catch((e: BusinessError) => {
                console.error(`setWindowLayoutFullScreen failed: ${JSON.stringify(e)}`);
            });
        });
    }
    onWindowStageDestroy(): void {
    }
    onForeground(): void {
    }
    onBackground(): void {
    }
}
