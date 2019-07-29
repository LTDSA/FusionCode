require "import"
require "Pretend"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.drawable.ColorDrawable"
import "android.content.Intent"
import "android.net.Uri"
activity.setTitle('关于 FusionCode')
activity.setTheme(R.Theme_AppLua14)
activity.setContentView(loadlayout("aboutlay"))
activity.ActionBar.setBackgroundDrawable(ColorDrawable(0xff2c2e43))
状态栏颜色(0xff2c2e43)

function onCreate()
  if(读取文件(获取手机存储路径().."/FusionCode/Config/night.txt")=="true")
    控件颜色(back,0xff000000)
    name.setTextColor(0xffffffff)
    version.setTextColor(0xffffffff)
    dev.setTextColor(0xffffffff)
    intro.setTextColor(0xffffffff)
  end
end
设置文本(version,"版本 "..activity.getPackageManager().getPackageInfo("cn.ltdsa.fusioncode", 0).versionName)
website.onClick=function()
  url="https://www.ltdsa.cn/"
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
  activity.startActivity(viewIntent)
end

icon.onLongClick=function()
  if(读取文件(获取手机存储路径().."/FusionCode/Config/dev.txt")=="false")then
  写入文件(获取手机存储路径().."/FusionCode/Config/dev.txt","true")
  print("您已进入开发者模式，重新启动本软件来生效")
  else
  写入文件(获取手机存储路径().."/FusionCode/Config/dev.txt","false")
  print("您已退出开发者模式，重新启动本软件来生效")
  end
end