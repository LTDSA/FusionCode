require "import"
require "Pretend"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.drawable.ColorDrawable"
import "com.pretend.appluag.*"
import "android.content.pm.PackageManager"
activity.setTitle('FusionCode')
activity.setTheme(R.Theme_AppLua14)
activity.setContentView(loadlayout("layout"))
activity.ActionBar.setBackgroundDrawable(ColorDrawable(0xff2c2e43))

function onCreateOptionsMenu(menu)
  menu.add("复制内容")
  menu.add("分享内容")
  menu.add("打开 FusionApp")
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
   elseif(item.Title=="打开 FusionApp")then
    if pcall(function() activity.getPackageManager().getPackageInfo("cn.coldsong.fusionapp",0) end) then
      打开app("cn.coldsong.fusionapp")
     else
      print("您还未安装 FusionApp！")
    end
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