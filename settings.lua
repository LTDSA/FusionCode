require "import"
require "Pretend"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.drawable.ColorDrawable"
activity.setTitle('设置')
activity.setTheme(R.Theme_AppLua14)
activity.setContentView(loadlayout("setlay"))
activity.ActionBar.setBackgroundDrawable(ColorDrawable(0xff2c2e43))
状态栏颜色(0xff2c2e43)
--设置夜间模式开关颜色
night.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFF33A7AA,PorterDuff.Mode.SRC_ATOP));
night.TrackDrawable.setColorFilter(PorterDuffColorFilter(0xFF33A7AA,PorterDuff.Mode.SRC_ATOP))
function onCreate()
  if(读取文件(获取手机存储路径().."/FusionCode/Config/night.txt")=="true")
    控件颜色(back,0xff000000)
    night.setTextColor(0xffffffff)
    reset.setTextColor(0xffffffff)
    night.setChecked(true)
  end
end
night.onClick=function()
  --print(night.isChecked())
  if(night.isChecked()==true)then
    写入文件(获取手机存储路径().."/FusionCode/Config/night.txt", "true")
    --print("true")
    控件颜色(back,0xff000000)
    night.setTextColor(0xffffffff)
    reset.setTextColor(0xffffffff)
   else
    写入文件(获取手机存储路径().."/FusionCode/Config/night.txt", "false")
    print("重新启动本软件来生效")
    --print("false")
  end
end

reset.onClick=function()
  night.setChecked(false)
  print("重新启动本软件来生效")
end

