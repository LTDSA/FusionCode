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
设置文本(version,"版本 "..activity.getPackageManager().getPackageInfo("cn.ltdsa.fusioncode", 0).versionName)
website.onClick=function()
  url="https://www.ltdsa.cn/"
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
  activity.startActivity(viewIntent)
end