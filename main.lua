require "import"
require "Pretend"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.drawable.ColorDrawable"
import "com.pretend.appluag.*"
import "android.content.pm.PackageManager"
import "java.io.File"
activity.setTitle('FusionCode')
activity.setTheme(R.Theme_AppLua14)
activity.setContentView(loadlayout("layout"))
activity.ActionBar.setBackgroundDrawable(ColorDrawable(0xff2c2e43))
状态栏颜色(0xff2c2e43)
function onCreate()
  if(File(获取手机存储路径().."/FusionCode/").exists()==false)then
    写入文件(获取手机存储路径().."/FusionCode/Config/night.txt","false")
    写入文件(获取手机存储路径().."/FusionCode/Config/dev.txt","false")
  end
  if(activity.getPackageName()~="cn.ltdsa.fusioncode")then
    activity.setTitle('FusionCode【非官方版本】')
    activity.ActionBar.setBackgroundDrawable(ColorDrawable(0xffff0000))
    状态栏颜色(0xffff0000)
    对话框()
    .设置标题("警告")
    .设置消息("您当前使用的 FusionCode 版本已被人为篡改，为了保证您的数据安全，请从酷安下载最新官方版。")
    .设置积极按钮("退出",function()
      结束程序()
    end)
    .设置消极按钮("去下载",function()
      import "android.content.Intent"
      import "android.net.Uri"
      url="https://www.coolapk.com/apk/cn.ltdsa.fusioncode"
      viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
      activity.startActivity(viewIntent)
    end)
    .设置中立按钮("继续使用（不推荐）",function()
    end)
    .显示()
  end
  if(读取文件(获取手机存储路径().."/FusionCode/Config/night.txt")=="true")
    控件颜色(code,0xff000000)
    code.setTextColor(0xffffffff)
  end
end
function onCreateOptionsMenu(menu)
  menu.add("复制内容")
  menu.add("粘贴内容")
  menu.add("保存内容")
  menu.add("分享内容")
  menu.add("打开 FusionApp")
  menu.add("设置")
  if(读取文件(获取手机存储路径().."/FusionCode/Config/dev.txt")=="true")then
    menu.add("开发者选项")
  end
  menu.add("关于 FusionCode")
  menu.add("退出")
end
function onOptionsItemSelected(item)
  if(item.Title=="复制内容")then
    if(获取文本(code)=="")then
      print("您还没有键入内容")
     else
      写入剪贴板(获取文本(code))
      print("已复制")
    end
   elseif(item.Title=="粘贴内容")then
    if(获取剪贴版()=="")then
      print("剪贴板为空")
     else
      code.setText(获取文本(code)..activity.getSystemService(Context.CLIPBOARD_SERVICE).getText())
    end
   elseif(item.Title=="保存内容")then
    if(获取文本(code)=="")then
      print("您还没有键入内容")
     else
      写入文件(获取手机存储路径().."/FusionCode/Temp.txt",获取文本(code))
      activity.newActivity("save")
    end
   elseif(item.Title=="打开 FusionApp")then
    if pcall(function() activity.getPackageManager().getPackageInfo("cn.coldsong.fusionapp",0) end) then
      打开app("cn.coldsong.fusionapp")
     else
      print("您还未安装 FusionApp！")
    end
   elseif(item.Title=="设置")then
    activity.newActivity("settings")
   elseif(item.Title=="开发者选项")then
    activity.newActivity("dev")
   elseif(item.Title=="关于 FusionCode")then
    --对话框()
    --.设置标题("关于 FusionCode")
    --.设置消息("版本 "..activity.getPackageManager().getPackageInfo("cn.ltdsa.fusioncode", 0).versionName.."\n\n开发者：LTDSA\n\n由于 FusionApp 自带的代码编辑器 bug 不断（比如操作方向反转），所以只好自己写了一个代码编辑器。")
    --.设置积极按钮("确定",function()
    --end)
    --.显示()
    activity.newActivity("about")
   elseif(item.Title=="分享内容")then
    if(获取文本(code)=="")then
      print("您还没有键入内容")
     else
      分享文字(获取文本(code))
    end
   elseif(item.Title=="退出")then
    对话框()
    .设置标题("退出")
    .设置消息("您确定要退出吗？")
    .设置积极按钮("确定",function()
      结束程序()
    end)
    .设置消极按钮("取消",function()
    end)
    .显示()
  end
end

参数=0
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if 参数+2 > tonumber(os.time()) then
      activity.finish()
     else
      Toast.makeText(activity,"再按一次返回键退出" , Toast.LENGTH_SHORT )
      .show()
      参数=tonumber(os.time())

      return true
    end
  end
end
