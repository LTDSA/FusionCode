require "import"
require "Pretend"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.drawable.ColorDrawable"
activity.setTitle('保存内容')
activity.setTheme(R.Theme_AppLua14)
activity.setContentView(loadlayout("savelay"))
activity.ActionBar.setBackgroundDrawable(ColorDrawable(0xff2c2e43))
状态栏颜色(0xff2c2e43)
--设置名称输入框颜色
name.getBackground().setColorFilter(PorterDuffColorFilter(0xFF33A7AA,PorterDuff.Mode.SRC_ATOP));

function onCreate()
  if(读取文件(获取手机存储路径().."/FusionCode/Config/night.txt")=="true")
    控件颜色(back,0xff000000)
    desc.setTextColor(0xffffffff)
    name.setTextColor(0xffffffff)
    tips.setTextColor(0xffffffff)
  end
end
save.onClick=function()
  if(获取文本(name)=="")then
    写入文件(获取手机存储路径().."/FusionCode/FusionCode.lua",读取文件(获取手机存储路径().."/FusionCode/Temp.txt"))
   else
    写入文件(获取手机存储路径().."/FusionCode/"..获取文本(name)..".lua",读取文件(获取手机存储路径().."/FusionCode/Temp.txt"))
  end
  删除文件(获取手机存储路径().."/FusionCode/Temp.txt")
  print("保存成功")
  关闭页面()
end