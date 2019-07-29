require "import"
require "Pretend"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.drawable.ColorDrawable"
import "com.pretend.appluag.*"
import "android.content.pm.PackageManager"
activity.setTitle('开发者选项')
activity.setTheme(R.Theme_AppLua14)
activity.setContentView(loadlayout("devlay"))
activity.ActionBar.setBackgroundDrawable(ColorDrawable(0xff2c2e43))
状态栏颜色(0xff2c2e43)
设置文本(model,Build.MODEL)
model.getPaint().setFakeBoldText(true)
function onCreate()
  if(读取文件(获取手机存储路径().."/FusionCode/Config/dev.txt")=="true")then
    toggle.setChecked(true)
  end
end
if pcall(function() activity.getPackageManager().getPackageInfo("cn.coldsong.fusionapp",0) end) then
  faver=activity.getPackageManager().getPackageInfo("cn.coldsong.fusionapp", 0).versionName
 else
  faver="未安装"
end
fcver=activity.getPackageManager().getPackageInfo("cn.ltdsa.fusioncode", 0).versionName
device.onClick=function()
  对话框()
  .设置标题("设备详细信息")
  .设置消息("机型："..Build.MODEL.."\nAndroid 版本："..Build.VERSION.RELEASE.."\nSDK 版本："..Build.VERSION.SDK.."\nFusionApp 版本："..faver.."\nFusionCode 版本："..fcver)
  .设置积极按钮("确定",function()
  end)
  .显示()
end

dlfa.onClick=function()
  import "android.content.Intent"
  import "android.net.Uri"
  url="https://www.coolapk.com/apk/cn.coldsong.fusionapp"
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
  activity.startActivity(viewIntent)
end

toggle.onClick=function()
  if(读取文件(获取手机存储路径().."/FusionCode/Config/dev.txt")=="false")then
    写入文件(获取手机存储路径().."/FusionCode/Config/dev.txt","true")
    toggle.setChecked(true)
    print("您已开启开发者模式，重新启动本软件来生效")
   else
    写入文件(获取手机存储路径().."/FusionCode/Config/dev.txt","false")
    toggle.setChecked(false)
    print("您已关闭开发者模式，重新启动本软件来生效")
  end
end