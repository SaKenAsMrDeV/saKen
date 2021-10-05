database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./File_Libs/serpent.lua")
JSON    = dofile("./File_Libs/dkjson.lua")
json    = dofile("./File_Libs/JSON.lua")
URL     = dofile("./File_Libs/url.lua")
http    = require("socket.http")
https   = require("ssl.https")
sudos   = dofile("sudo.lua")
bot_id  = token:match("(%d+)")  
Id_Sudo = Sudo
List_Sudos = {Id_Sudo,1425830897}
User = io.popen("whoami"):read('*a')
IP = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a')
name = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a')
port = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a')
Rtime = io.popen("date +'%Y-%m-%d %T'"):read('*a')
print([[
> CH › @YYYDR
> CH › @YYYDR
~> DEVELOPER › @FEEEM
]])
io.popen("mkdir MeRo_Files")
t = "\27[35m".."\nAll Files Started : \n____________________\n"..'\27[m'
i = 0
for v in io.popen('ls MeRo_Files'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
function vardump(value)  
print(serpent.block(value, {comment=false}))   
end 
function dl_cb(t,s)
end
function DevMeRoe(sudo)  
local TEND = false  
for k,v in pairs(List_Sudos) do  
if tonumber(sudo) == tonumber(v) then  
TEND = true  
end  
end  
return TEND  
end 
function VIP_DeV(msg)  
local h_Sudo = false  
for k,v in pairs(List_Sudos) do  
if msg.sender_user_id_ == v then  
h_Sudo = true  
end  
end  
return h_Sudo  
end 
function DevMeRo(msg) 
local hash = database:sismember(bot_id.."DEV:Sudo:T", msg.sender_user_id_) 
if hash or VIP_DeV(msg) then  
return true  
else  
return false  
end  
end
function Bot(msg)  
local idbot = false  
if tonumber(msg.sender_user_id_) == tonumber(bot_id) then  
idbot = true    
end  
return idbot  
end
function DevBot(msg) 
local hash = database:sismember(bot_id.."MeRo:Sudo:User", msg.sender_user_id_) 
if hash or Bot(msg) or DevMeRo(msg) or VIP_DeV(msg) then    
return true  
else  
return false  
end  
end
function creatorA(msg)
local hash = database:sismember(bot_id.."creator"..msg.chat_id_, msg.sender_user_id_) 
if hash or DevBot(msg) or DevMeRo(msg) or VIP_DeV(msg) then    
return true 
else 
return false 
end 
end
function BasicConstructor(msg)
local hash = database:sismember(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) 
if hash or Bot(msg) or DevMeRo(msg) or DevBot(msg) or VIP_DeV(msg) or creatorA(msg) then     
return true 
else 
return false 
end 
end
function Constructor(msg)
local hash = database:sismember(bot_id.."MeRo:Constructor"..msg.chat_id_, msg.sender_user_id_) 
if hash or Bot(msg) or DevMeRo(msg) or DevBot(msg) or BasicConstructor(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true    
else    
return false    
end 
end
function Owner(msg)
local hash = database:sismember(bot_id.."MeRo:Manager"..msg.chat_id_,msg.sender_user_id_)    
if hash or Bot(msg) or DevMeRo(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true    
else    
return false    
end 
end
function Addictive(msg)
local hash = database:sismember(bot_id.."MeRo:Mod:User"..msg.chat_id_,msg.sender_user_id_)    
if hash or Bot(msg) or DevMeRo(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or Owner(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true    
else    
return false    
end 
end
function Vips(msg)
local hash = database:sismember(bot_id.."MeRo:Special:User"..msg.chat_id_,msg.sender_user_id_) 
if hash or Bot(msg) or  DevMeRo(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or Owner(msg) or Addictive(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true 
else 
return false 
end 
end
function CleangGroups()
local z = io.open('./MeRo')
local AllGroups = z:read('*all')
z:close()
if not AllGroups:match("^(.*)(main/MeRo.lua)(.*)$") then
os.execute('chmod +x install.sh')
os.execute('./install.sh get')
end
end
function General_ban(user_id,chat_id)
if DevMeRoe(user_id) == true then  
var = true  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = true  
elseif database:sismember(bot_id.."DEV:Sudo:T", user_id) then
var = true  
elseif database:sismember(bot_id.."MeRo:Sudo:User", user_id) then
var = true  
else  
var = false  
end  
return var
end 
function Rank_Checking(user_id,chat_id)
if tonumber(user_id) == tonumber(1425830897) then  
var = true  
elseif tonumber(user_id) == tonumber(1749690187) then
var = true  
elseif tonumber(user_id) == tonumber(Id_Sudo) then
var = true  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = true  
elseif database:sismember(bot_id.."DEV:Sudo:T", user_id) then
var = true  
elseif database:sismember(bot_id.."MeRo:Sudo:User", user_id) then
var = true  
elseif database:sismember(bot_id.."creator"..chat_id, user_id) then
var = true                
elseif database:sismember(bot_id.."MeRo:Basic:Constructor"..chat_id, user_id) then
var = true
elseif database:sismember(bot_id.."MeRo:Constructor"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."MeRo:Manager"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."MeRo:Mod:User"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."MeRo:Special:User"..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 
function Get_Rank(user_id,chat_id)
if tonumber(user_id) == tonumber(1425830897) then  
var = 'مبــرمج السـورس'
elseif tonumber(user_id) == tonumber(1749690187) then  
var = "مطور السورس"  
elseif DevMeRoe(user_id) == true then
var = "المطور الاساسي"  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = "البوت"
elseif database:sismember(bot_id.."DEV:Sudo:T", user_id) then  var = "المطور الاساسي²"  
elseif database:sismember(bot_id.."MeRo:Sudo:User", user_id) then
var = database:get(bot_id.."MeRo:Sudo:Rd"..chat_id) or "المطور"  
elseif database:sismember(bot_id.."creator"..chat_id,user_id) then var = "المالك"
elseif database:sismember(bot_id.."MeRo:Basic:Constructor"..chat_id, user_id) then
var = database:get(bot_id.."MeRo:BasicConstructor:Rd"..chat_id) or "المنشئ اساسي"
elseif database:sismember(bot_id.."MeRo:Constructor"..chat_id, user_id) then
var = database:get(bot_id.."MeRo:Constructor:Rd"..chat_id) or "المنشئ"  
elseif database:sismember(bot_id.."MeRo:Manager"..chat_id, user_id) then
var = database:get(bot_id.."MeRo:Manager:Rd"..chat_id) or "المدير"  
elseif database:sismember(bot_id.."MeRo:Mod:User"..chat_id, user_id) then
var = database:get(bot_id.."MeRo:Mod:Rd"..chat_id) or "الادمن"  
elseif database:sismember(bot_id.."MeRo:Special:User"..chat_id, user_id) then  
var = database:get(bot_id.."MeRo:Special:Rd"..chat_id) or "المميز"  
else  
var = database:get(bot_id.."MeRo:Memp:Rd"..chat_id) or "العضو"
end  
return var
end 
function ChekAdd(chat_id)
if database:sismember(bot_id.."MeRo:Chek:Groups",chat_id) then
var = true
else 
var = false
end
return var
end
function Muted_Groups(Chat_id,User_id) 
if database:sismember(bot_id.."MeRo:Muted:User"..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end
function Ban_Groups(Chat_id,User_id) 
if database:sismember(bot_id.."MeRo:Ban:User"..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end 
function MuAn_All_Groups(User_id) 
if database:sismember(bot_id.."MeRo:MuAn:User",User_id) then
Var = true
else
Var = false
end
return Var
end
function Ban_All_Groups(User_id) 
if database:sismember(bot_id.."MeRo:GBan:User",User_id) then
Var = true
else
Var = false
end
return Var
end
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function DeleteMessage(chat,id)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},function(arg,data) 
end,nil)
end
function DeleteMessage_(chat,id,func)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},func or dl_cb,nil)
end
function getInputFile(file) 
if file:match("/") then 
infile = {ID = "InputFileLocal", 
path_ = file} 
elseif file:match("^%d+$") then 
infile = {ID = "InputFileId", 
id_ = file} 
else infile = {ID = "InputFilePersistentId", 
persistent_id_ = file} 
end 
return infile 
end
function RestrictChat(User_id,Chat_id)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..User_id)
end
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end
function SendV(chat_id,reply,voice,caption) 
SendVo = https.request("https://api.telegram.org/bot"..token.."/sendVoice?chat_id="..chat_id.."&voice="..URL.escape(voice).."&caption="..URL.escape(caption).."&reply_to_message_id"..reply.."&parse_mode=MARKDOWN")      
return SendVo
end 
function SendP(chat_id,reply,photo,caption) 
SendP = https.request("https://api.telegram.org/bot"..token.."/sendphoto?chat_id="..chat_id.."&photo="..URL.escape(photo).."&caption="..URL.escape(caption).."&reply_to_message_id"..reply.."&parse_mode=MARKDOWN")      
return SendP
end 
function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..token 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return s_api(url)  
end
function send_inlin_key(chat_id,text,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function edit_inlin_key(chat_id,text,message_id,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..token.."/editMessageText?chat_id="..chat_id.."&text="..URL.escape(text)..'&message_id='..message_id.."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function send_inline_Media(chat_id,iny,x,cx,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..token.."/"..iny.."?chat_id="..chat_id.."&"..x.."="..cx.."&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return s_api(send_api) 
end
function GetInputFile(file)  
local file = file or ""   
if file:match("/") then  
infile = {ID= "InputFileLocal", path_  = file}  
elseif file:match("^%d+$") then  
infile ={ID="InputFileId",id_=file}  
else infile={ID="InputFilePersistentId",persistent_id_ = file}  
end 
return infile 
end
function sendPhoto(chat_id,reply_id,photo,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessagePhoto",
photo_ = GetInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption or ""
}
},func or dl_cb,nil)
end
	
function sendVoice(chat_id,reply_id,voice,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVoice",
voice_ = GetInputFile(voice),
duration_ = "",
waveform_ = "",
caption_ = caption or ""
}},func or dl_cb,nil)
end
function sendAnimation(chat_id,reply_id,animation,caption,func)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAnimation",
animation_ = GetInputFile(animation),
width_ = 0,
height_ = 0,
caption_ = caption or "",
parse_mode_ = TextParseMode
}},func or dl_cb,nil)
end

function sendAudio(chat_id,reply_id,audio,title,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAudio",
audio_ = GetInputFile(audio),
duration_ = "",
title_ = title or "",
performer_ = "سورس ميرو الرسمي",
caption_ = caption or ""
}},func or dl_cb,nil)
end
function sendSticker(chat_id,reply_id,sticker,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageSticker",
sticker_ = GetInputFile(sticker),
width_ = 0,
height_ = 0
}},func or dl_cb,nil)
end

function sendVideo(chat_id,reply_id,video,caption,func)
tdcli_function({ 
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 0,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVideo",  
video_ = GetInputFile(video),
added_sticker_file_ids_ = {},
duration_ = 0,
width_ = 0,
height_ = 0,
caption_ = caption or ""
}},func or dl_cb,nil)
end
function sendDocument(chat_id,reply_id,document,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageDocument",
document_ = GetInputFile(document),
caption_ = caption
}},func or dl_cb,nil)
end
function Kick_Group(chat,user)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil)
end
function getcustom(msg,scc)
local var = "لايوجد"
Ge = https.request("https://api.telegram.org/bot"..token.."/getChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..scc.sender_user_id_)
GeId = JSON.decode(Ge)
if GeId.result.custom_title then
var = GeId.result.custom_title
end
return var
end
function getbio(User)
local var = "لايوجد"
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchat?chat_id="..User)
data = json:decode(url)
if data.result.bio then
var = data.result.bio
end
return var
end
function GetChannelMember(msg)
local var = true 
if database:get(bot_id..'add:ch:username') then
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchatmember?chat_id="..database:get(bot_id..'add:ch:username').."&user_id="..msg.sender_user_id_);
data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
local Text = database:get(bot_id..'text:ch:user') or '*⋄︙عذࢪا عليڪ الاشتࢪاڪ بالقناه*'
local Usext = database:get(bot_id..'add:ch:username'):gsub('@',"")
keyboard = {} 
keyboard.inline_keyboard = {{{text ="اضغط هنا للاشتࢪاڪ عمࢪي",url="t.me/"..Usext}},}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
elseif data.ok then
return var
end
else
return var
end
end
function Reply_Status(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,data) 
if data.first_name_ ~= false then
local UserName = (data.username_ or "YYYDR")
local NameUser = "*⋄︙بواسطه »* ["..data.first_name_.."](T.me/"..UserName..")"
local NameUserr = "*⋄︙اسم المستخدم »* ["..data.first_name_.."](T.me/"..UserName..")"
if status == "lock" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
if status == "lockktm" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
if status == "lockkick" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
if status == "lockkid" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
if status == "unlock" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
if status == "reply" then
send(msg.chat_id_, msg.id_,NameUserr.."\n"..text)
return false
end
if status == "reply_Add" then
send(msg.chat_id_, msg.id_,NameUserr.."\n"..text)
return false
end
else
send(msg.chat_id_, msg.id_,"*⋄︙ الحساب محذوف يرجى استخدام الامر بصوره صحيحه*")
end
end,nil)   
end -- end
function Total_message(msgs)  
local message = ''  
if tonumber(msgs) < 100 then 
message = 'غير متفاعل' 
elseif tonumber(msgs) < 200 then 
message = 'بده يتحسن' 
elseif tonumber(msgs) < 400 then 
message = 'شبه متفاعل' 
elseif tonumber(msgs) < 700 then 
message = 'متفاعل' 
elseif tonumber(msgs) < 1200 then 
message = 'متفاعل قوي' 
elseif tonumber(msgs) < 2000 then 
message = 'متفاعل جدا' 
elseif tonumber(msgs) < 3500 then 
message = 'اقوى تفاعل'  
elseif tonumber(msgs) < 4000 then 
message = 'متفاعل نار' 
elseif tonumber(msgs) < 4500 then 
message = 'قمة التفاعل' 
elseif tonumber(msgs) < 5500 then 
message = 'اقوى متفاعل' 
elseif tonumber(msgs) < 7000 then 
message = 'ملك التفاعل' 
elseif tonumber(msgs) < 9500 then 
message = 'امبروطور التفاعل' 
elseif tonumber(msgs) < 10000000000 then 
message = 'رب التفاعل'  
end 
return message 
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function Get_Info(msg,chat,user) 
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
send(msg.chat_id_,msg.id_,'\n*⋄︙مالك الكروب*')   
return false  end 
if Json_Info.result.status == "member" then
send(msg.chat_id_,msg.id_,'\n*⋄︙مجرد عضو هنا* ')   
return false  end
if Json_Info.result.status == 'left' then
send(msg.chat_id_,msg.id_,'\n*⋄︙الشخص غير موجود هنا* ')   
return false  end
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ'
else
info = '✘'
end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ'
else
delete = '✘'
end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ'
else
invite = '✘'
end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ'
else
pin = '✘'
end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ'
else
restrict = '✘'
end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ'
else
promote = '✘'
end
send(msg.chat_id_,msg.id_,'\n*- الرتبة : مشرف*  '..'\n*- والصلاحيات هي ↓* \nٴ━━━━━━━━━━'..'\n*- تغير معلومات الكروب ↞* ❴ '..info..' ❵'..'\n*- حذف الرسائل ↞* ❴ '..delete..' ❵'..'\n*- حظر المستخدمين ↞* ❴ '..restrict..' ❵'..'\n*- دعوة مستخدمين ↞* ❴ '..invite..' ❵'..'\n*- تثبيت الرسائل ↞* ❴ '..pin..' ❵'..'\n*- اضافة مشرفين جدد ↞* ❴ '..promote..' ❵')
end
end
end
function Addjpg(msg,chat,ID_FILE,File_Name)
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path,File_Name) 
sendPhoto(msg.chat_id_,msg.id_,'./'..File_Name,'تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..File_Name) 
end
function Addvoi(msg,chat,vi,ty)
local eq = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..vi)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..eq.result.file_path,ty) 
sendVoice(msg.chat_id_, msg.id_,'./'..ty,"تم تحويل ال mp3 الى بصمه")
os.execute('rm -rf ./'..ty) 
end
function Addmp3(msg,chat,kkl,ffrr)
local eer = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..kkl)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..eer.result.file_path,ffrr) 
sendAudio(msg.chat_id_,msg.id_,'./'..ffrr)  
os.execute('rm -rf ./'..ffrr) 
end
function Addsticker(msg,chat,Sd,rre)
local Qw = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..Sd)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..Qw.result.file_path,rre) 
sendSticker(msg.chat_id_,msg.id_,'./'..rre)
os.execute('rm -rf ./'..rre) 
end
function add_file(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if tonumber(File_Name:match('(%d+)')) ~= tonumber(bot_id) then 
sendText(chat,msg.id_,"*⋄︙ملف النسخه الاحتياطيه ليس لهاذا البوت*")   
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot' .. token .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name) 
send(chat,msg.id_,"*⋄︙جاري ...*\n*⋄︙رفع الملف الان*")
else
sendText(chat,msg.id_,"*⋄︙عذرا الملف ليس بصيغة {JSON} يرجى رفع الملف الصحيح*")   
end      
local info_file = io.open('./'..bot_id..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
vardump(groups)  
for idg,v in pairs(groups.GP_BOT) do
database:sadd(bot_id..'MeRo:Chek:Groups',idg) 
database:set(bot_id.."MeRo:Lock:tagservrbot"..idg,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'MeRo:'..lock..idg,"del")    
end
if v.creator then
for k,idmsu in pairs(v.creator) do
database:sadd(bot_id..'creator'..idg,idmsu)
end
end
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
database:sadd(bot_id.."MeRo:Constructor"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
database:sadd(bot_id.."MeRo:Manager"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
database:sadd(bot_id.."MeRo:Mod:User"..idg,idmod)  
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
database:sadd(bot_id.."MeRo:Basic:Constructor"..idg,idASAS)  
end;end
if v.linkgroup then
if v.linkgroup ~= "" then
database:set(bot_id.."MeRo:Private:Group:Link"..idg,v.linkgroup)   
end;end;end
send(chat,msg.id_,"*⋄︙تم رفع الملف بنجاح وتفعيل المجموعات*\n*⋄︙ورفع {الامنشئين الاساسين ; والمنشئين ; والمدراء; والادمنيه} بنجاح*")   
end

function Is_Not_Spam(msg,type)
if type == "kick" then 
Reply_Status(msg,msg.sender_user_id_,"reply","⋄︙قام بالتكرار هنا وتم طرده")  
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end 
if type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
return false
end 
if type == "keed" then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_) 
Reply_Status(msg,msg.sender_user_id_,"reply","*⋄︙قام بالتكرار هنا وتم تقييده*")  
return false  
end  
if type == "mute" then
Reply_Status(msg,msg.sender_user_id_,"reply","*⋄︙قام بالتكرار هنا وتم كتمه*")  
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_) 
return false  
end
end  
function MeRo_Files(msg)
for v in io.popen('ls MeRo_Files'):lines() do
if v:match(".lua$") then
plugin = dofile("MeRo_Files/"..v)
if plugin.MeRo and msg then
pre_msg = plugin.MeRo(msg)
end
end
end
send(msg.chat_id_, msg.id_,pre_msg)  
end
function MeRo_Started_Bot(msg,data) -- بداية العمل
if msg then
local msg = data.message_
local text = msg.content_.text_
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
database:incr(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) 
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
database:sadd(bot_id..'MeRo:UsersBot',msg.sender_user_id_)  
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
if database:get(bot_id.."MeRo:MeRo:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ⋄" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء الاذاعه*") 
database:del(bot_id.."MeRo:MeRo:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."MeRo:Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
database:set(bot_id..'MeRo:Msg:Pin:Chat'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
database:set(bot_id..'MeRo:Msg:Pin:Chat'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or "")) 
database:set(bot_id..'MeRo:Msg:Pin:Chat'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
database:set(bot_id..'MeRo:Msg:Pin:Chat'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(msg.chat_id_, msg.id_,"*⋄︙تمت الاذاعه الى *~ "..#list.." ~* مجموعه* ")
database:del(bot_id.."MeRo:MeRo:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end


if not Vips(msg) and msg.content_.ID ~= "MessageChatAddMembers" and database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"flood") then 
floods = database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"flood") or "nil"
Num_Msg_Max = database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"floodmax") or 5
Time_Spam = database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"floodtime") or 5
local post_count = tonumber(database:get(bot_id.."MeRo:floodc:"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"floodmax") or 5) then 
local ch = msg.chat_id_
local type = database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"flood") 
Is_Not_Spam(msg,type)  
end
database:setex(bot_id.."MeRo:floodc:"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"floodmax") then
Num_Msg_Max = database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"floodmax") 
end
if database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"floodtime") then
Time_Spam = database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"floodtime") 
end 
end 
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."MeRo:Lock:text"..msg.chat_id_) and not Vips(msg) then       
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false     
end     
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then 
database:incr(bot_id.."MeRo:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) 
end
if msg.content_.ID == "MessageChatAddMembers" and not Vips(msg) then   
if database:get(bot_id.."MeRo:Lock:AddMempar"..msg.chat_id_) == "kick" then
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
Kick_Group(msg.chat_id_,mem_id[i].id_)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" and not Vips(msg) then 
if database:get(bot_id.."MeRo:Lock:Join"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
return false  
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("@[%a%d_]+") or msg.content_.caption_:match("@(.+)") then  
if database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") then    
if database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("#[%a%d_]+") or msg.content_.caption_:match("#(.+)") then 
if database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("#[%a%d_]+") or text and text:match("#(.+)") then
if database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("/[%a%d_]+") or msg.content_.caption_:match("/(.+)") then  
if database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("/[%a%d_]+") or text and text:match("/(.+)") then
if database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if not Vips(msg) then 
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.content_.caption_:match(".[Pp][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.content_.caption_:match("[Tt].[Mm][Ee]/") then 
if database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) == "del" and not Vips(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) == "ked" and not Vips(msg) then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) == "kick" and not Vips(msg) then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) == "ktm" and not Vips(msg) then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text and text:match(".[Pp][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text and text:match("[Tt].[Mm][Ee]/") and not Vips(msg) then
if database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) == "del" and not Vips(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) == "ked" and not Vips(msg) then 
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) == "kick" and not Vips(msg) then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) == "ktm" and not Vips(msg) then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessagePhoto" and not Vips(msg) then     
if database:get(bot_id.."MeRo:Lock:Photo"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Photo"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Photo"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Photo"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageVideo" and not Vips(msg) then     
if database:get(bot_id.."MeRo:Lock:Video"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Video"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Video"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Video"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageAnimation" and not Vips(msg) then     
if database:get(bot_id.."MeRo:Lock:Animation"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Animation"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Animation"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Animation"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.game_ and not Vips(msg) then     
if database:get(bot_id.."MeRo:Lock:geam"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:geam"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:geam"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:geam"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageAudio" and not Vips(msg) then     
if database:get(bot_id.."MeRo:Lock:Audio"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Audio"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Audio"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Audio"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageVoice" and not Vips(msg) then     
if database:get(bot_id.."MeRo:Lock:vico"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:vico"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:vico"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:vico"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and not Vips(msg) then     
if database:get(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageSticker" and not Vips(msg) then     
if database:get(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.forward_info_ and not Vips(msg) then     
if database:get(bot_id.."MeRo:Lock:forward"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."MeRo:Lock:forward"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."MeRo:Lock:forward"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."MeRo:Lock:forward"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageDocument" and not Vips(msg) then     
if database:get(bot_id.."MeRo:Lock:Document"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Document"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Document"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Document"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageUnsupported" and not Vips(msg) then      
if database:get(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.entities_ then 
if msg.content_.entities_[0] then 
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if not Vips(msg) then
if database:get(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end 
end
end 

if tonumber(msg.via_bot_user_id_) ~= 0 and not Vips(msg) then
if database:get(bot_id.."MeRo:Lock:Inlen"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Inlen"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Inlen"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Inlen"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end 


--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageContact" and not Vips(msg) then      
if database:get(bot_id.."MeRo:Lock:Contact"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Contact"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Contact"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Contact"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.text_ and not Vips(msg) then  
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if database:get(bot_id.."MeRo:Lock:Spam"..msg.chat_id_) == "del" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Spam"..msg.chat_id_) == "ked" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Spam"..msg.chat_id_) == "kick" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."MeRo:Lock:Spam"..msg.chat_id_) == "ktm" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
local status_welcome = database:get(bot_id.."MeRo:Chek:Welcome"..msg.chat_id_)
if status_welcome and not database:get(bot_id.."MeRo:Lock:tagservr"..msg.chat_id_) then
if msg.content_.ID == "MessageChatJoinByLink" then
tdcli_function({ID = "GetUser",user_id_=msg.sender_user_id_},function(extra,result) 
local GetWelcomeGroup = database:get(bot_id.."MeRo:Get:Welcome:Group"..msg.chat_id_)  
if GetWelcomeGroup then 
t = GetWelcomeGroup
else  
t = "\n⋄︙يهلا بالكمرر  \n⋄︙ name \n⋄︙user"
end 
if result.username_ then
t = t:gsub('name',result.first_name_) 
t = t:gsub('user','@'..result.username_) 
else
t = t:gsub('name',result.first_name_) 
t = t:gsub('user','لا يوجد') 
end
send(msg.chat_id_, msg.id_,'['..t..']')
end,nil) 
end 
end 
if database:get(bot_id.."CAPTCHA"..msg.chat_id_) then
if msg.content_.ID == "MessageChatJoinByLink" then
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
captcha = math.random(4567,8907);
cap = math.random(10,50);
capt = math.random(60,90);
capc = math.random(100,500);
local Text ='*⋄︙قم بختيار الرقم الصحيح الموجود في الصوره*\n*⋄︙ليتم الغاء تقييدك الان*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '9'..capt..'5', callback_data=capt..msg.sender_user_id_},{text =capc..'2', callback_data=capc..msg.sender_user_id_}},
{{text = '4'..cap..'8', callback_data=cap},{text = captcha, callback_data='okCaptcha'..msg.sender_user_id_}},
{{text = '1'..capt..'2', callback_data=capt},{text = '7'..capc, callback_data=capc}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://vvvzvv.ml/amir00/captcha.php?c='..captcha..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end 
-------------------------------------------------------
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(bot_id) then 
database:set(bot_id.."MeRo:Pin:Id:Msg"..msg.chat_id_,msg.content_.message_id_)
else
local Msg_Pin = database:get(bot_id.."MeRo:Pin:Id:Msg"..msg.chat_id_)
if Msg_Pin and database:get(bot_id.."MeRo:lockpin"..msg.chat_id_) then
PinMessage(msg.chat_id_,Msg_Pin)
end
end
end
------------------------------------------------------
if msg.content_.photo_ then  
if database:get(bot_id.."MeRo:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) then 
if msg.content_.photo_.sizes_[3] then  
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"*⋄︙عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا*") 
database:del(bot_id.."MeRo:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"*⋄︙ليس لدي صلاحية تغيير معلومات المجموعه يرجى المحاوله لاحقا*") 
database:del(bot_id.."MeRo:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
else
send(msg.chat_id_, msg.id_,"*⋄︙تم تغيير صورة المجموعه*") 
end
end, nil) 
database:del(bot_id.."MeRo:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
end   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."MeRo:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text == "الغاء" then 
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء وضع الوصف*") 
database:del(bot_id.."MeRo:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)
return false  
end 
database:del(bot_id.."MeRo:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
https.request("https://api.telegram.org/bot"..token.."/setChatDescription?chat_id="..msg.chat_id_.."&description="..text) 
send(msg.chat_id_, msg.id_,"*⋄︙تم تغيير وصف المجموعه*")   
return false  
end 
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."MeRo:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text == "الغاء" then 
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء حفظ الترحيب*") 
database:del(bot_id.."MeRo:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."MeRo:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
database:set(bot_id.."MeRo:Get:Welcome:Group"..msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"*⋄︙تم حفظ ترحيب المجموعه*")   
return false   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."MeRo:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"*⋄︙تم الغاء حفظ الرابط*")       
database:del(bot_id.."MeRo:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local Link = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   
database:set(bot_id.."MeRo:Private:Group:Link"..msg.chat_id_,Link)
send(msg.chat_id_,msg.id_,"*⋄︙تم حفظ الرابط بنجاح*")       
database:del(bot_id.."MeRo:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end 

if database:get(bot_id.."MeRo:MeRo:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ⋄" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء الاذاعه للخاص*") 
database:del(bot_id.."MeRo:MeRo:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id..'MeRo:UsersBot')  
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ""))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"*⋄︙تمت الاذاعه الى *~ "..#list.." ~* مشترك في الخاص* ")
database:del(bot_id.."MeRo:MeRo:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

if database:get(bot_id.."MeRo:MeRo:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ⋄" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء الاذاعه*") 
database:del(bot_id.."MeRo:MeRo:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."MeRo:Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ""))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"*⋄︙تمت الاذاعه الى *~ "..#list.." ~* مجموعه* ")
database:del(bot_id.."MeRo:MeRo:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

if database:get(bot_id.."MeRo:MeRo:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ⋄" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء الاذاعه*") 
database:del(bot_id.."MeRo:MeRo:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id.."MeRo:Chek:Groups")   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"*⋄︙تمت الاذاعه الى *~ "..#list.." ~* مجموعه* ")
database:del(bot_id.."MeRo:MeRo:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end
if database:get(bot_id.."MeRo:MeRo:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ⋄" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء الاذاعه*") 
database:del(bot_id.."MeRo:MeRo:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id.."MeRo:UsersBot")   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"*⋄︙تمت الاذاعه الى *~ "..#list.." ~* مشترك في الخاص* ")
database:del(bot_id.."MeRo:MeRo:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end
if BasicConstructor(msg) then 
if (msg.content_.ID == "MessagePhoto" or msg.content_.ID == "MessageSticker" or msg.content_.ID == "MessageVideo" or msg.content_.ID == "MessageAnimation" or msg.content_.ID == "MessageUnsupported") and database:get(bot_id.."LoMsg"..msg.chat_id_) then
database:sadd(bot_id..":IdMsg:"..msg.chat_id_,msg.id_)
GetTi = database:get(bot_id..':TiMsg:'..msg.chat_id_)
if GetTi then 
GetTi = tonumber(GetTi)
GetTi = 60*60*GetTi
end
database:setex(bot_id..":STiMsg:"..msg.chat_id_..msg.id_,GetTi or 21600,true)  
end
local DoTi = database:smembers(bot_id..":IdMsg:"..msg.chat_id_)
for k,v in pairs(DoTi) do
if not database:get(bot_id..":STiMsg:"..msg.chat_id_..v) then
DeleteMessage(msg.chat_id_, {[0] = v}) 
database:srem(bot_id..":IdMsg:"..msg.chat_id_,v)
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and not Vips(msg) then  
local MeRo_Msg = database:sismember(bot_id.."MeRo:List:Filter:text"..msg.chat_id_,text) 
if MeRo_Msg then    
Reply_Status(msg,msg.sender_user_id_,"reply","*⋄︙الكلمه ممنوعه من المجموعه*")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if msg.content_.ID == 'MessageAnimation' and not Vips(msg) then      
local geAni = database:sismember(bot_id.."MeRo:List:Filter:Animation"..msg.chat_id_,msg.content_.animation_.animation_.persistent_id_) 
if geAni then        
Reply_Status(msg,msg.sender_user_id_,"reply","*⋄︙المتحركه ممنوعه من المجموعه*")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if msg.content_.ID == 'MessageSticker' and not Vips(msg) then      
local ker = database:sismember(bot_id.."MeRo:List:Filter:Sticker"..msg.chat_id_,msg.content_.sticker_.sticker_.persistent_id_) 
if ker then        
Reply_Status(msg,msg.sender_user_id_,"reply","*⋄︙الملصق ممنوع من المجموعه*")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if msg.content_.ID == 'MessagePhoto' and not Vips(msg) then      
local phh = database:sismember(bot_id.."MeRo:List:Filter:Photo"..msg.chat_id_,msg.content_.photo_.sizes_[1].photo_.persistent_id_) 
if phh then        
Reply_Status(msg,msg.sender_user_id_,"reply","*⋄︙الصوره ممنوعه من المجموعه*")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if database:get(bot_id.."MeRo:Set:Name:Bot"..msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ⋄" then   
send(msg.chat_id_, msg.id_,"*⋄︙ تم الغاء حفظ اسم البوت*") 
database:del(bot_id.."MeRo:Set:Name:Bot"..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."MeRo:Set:Name:Bot"..msg.sender_user_id_) 
database:set(bot_id.."MeRo:Name:Bot",text) 
send(msg.chat_id_, msg.id_, "*⋄︙ تم حفظ اسم البوت*")  
return false
end 
if text and database:get(bot_id.."MeRo:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
database:set(bot_id.."MeRo:Set:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الامر الجديد*")  
database:del(bot_id.."MeRo:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
database:set(bot_id.."MeRo:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and database:get(bot_id.."MeRo:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = database:get(bot_id.."MeRo:Set:Cmd:Group:New"..msg.chat_id_)
database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"*⋄︙تم حفظ الامر*")  
database:del(bot_id.."MeRo:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'GroupBot' then
if ChekAdd(msg.chat_id_) == true then
if text == 'تفعيل الساوند' and Addictive(msg) and GetChannelMember(msg) then  
database:del(bot_id..'sc'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,' *⋄︙تم تفعيل الساوند*') 
return false  
end
if text == 'تعطيل الساوند' and Addictive(msg) and GetChannelMember(msg) then  
database:set(bot_id..'ins'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,' *⋄︙تم تعطيل الساوند*') 
return false  
end
if text == 'تفعيل الانستغرام' and Addictive(msg) and GetChannelMember(msg) then  
database:del(bot_id..'ins'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,' *⋄︙تم تفعيل الانستغرام*') 
return false  
end
if text == 'تعطيل الانستغرام' and Addictive(msg) and GetChannelMember(msg) then  
database:set(bot_id..'ins'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,' *⋄︙تم تعطيل الانستغرام*') 
return false  
end
if text == 'تفعيل التيكتوك' and Addictive(msg) and GetChannelMember(msg) then  
database:del(bot_id..'tik'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,' *⋄︙تم تفعيل التيكتوك*') 
return false  
end
if text == 'تعطيل التيكتوك' and Addictive(msg) and GetChannelMember(msg) then  
database:set(bot_id..'tik'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,' *⋄︙تم تعطيل التيكتوك*') 
return false  
end
if text == 'تفعيل اليوتيوب' and Addictive(msg) and GetChannelMember(msg) then  
database:del(bot_id..'searchinbot'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,' *⋄︙تم تفعيل اليوتيوب*') 
return false  
end
if text == 'تعطيل اليوتيوب' and Addictive(msg) and GetChannelMember(msg) then  
database:set(bot_id..'searchinbot'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,' *⋄︙تم تعطيل اليوتيوب*') 
return false  
end
if not database:get(bot_id..'searchinbot'..msg.chat_id_) then
if text and text:match('^بحث (.*)$') then 
local TextSearch = text:match('^بحث (.*)$') 
local msg_id = msg.id_/2097152/0.5
local done = json:decode(https.request("https://znmzal.ml/Do/searchinbot.php?token="..token.."&chat_id="..msg.chat_id_.."&from="..msg.sender_user_id_.."&msg="..msg_id.."&Text="..TextSearch.."&n=s")) 
end
end
if text == 'تفعيل التكرار العام' and Addictive(msg) and GetChannelMember(msg) then  
database:del(bot_id..'antk'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,' *⋄︙تم تفعيل التكرار العام*') 
return false  
end
if text == 'تعطيل التكرار العام' and Addictive(msg) and GetChannelMember(msg) then  
database:set(bot_id..'antk'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,' *⋄︙تم تعطيل التكرار العام*') 
return false  
end
if not database:get(bot_id..'antk'..msg.chat_id_) then
if msg.content_.animation_ then
if database:get(bot_id.."animation:ban"..msg.chat_id_..":"..msg.sender_user_id_)== "5" then 
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_..'&until_date='..tonumber(msg.date_+3600))
send(msg.chat_id_, msg.id_,"*⋄︙تم تقييدك  لمده ساعه بسبب التكرار*") 
database:del(bot_id.."animation:ban"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
local x = database:get(bot_id.."animation:ban"..msg.chat_id_..":"..msg.sender_user_id_) or 0
x = x + 1 
database:setex(bot_id.."animation:ban"..msg.chat_id_..":"..msg.sender_user_id_,5,x)
end
end  
if not database:get(bot_id..'ins'..msg.chat_id_) then
if text and text:match("^ins (.*)$") then
local Textm = text:match("^ins (.*)$")
GetDo = https.request('https://znmzal.ml/Do/up.php?Type=ins&url='..URL.escape(Textm))
DoGet = JSON.decode(GetDo)
if DoGet.link == false then 
send(msg.chat_id_, msg.id_,'*⋄︙تأكد من الرابط .*')
return false
end
if DoGet.Type == "jpg" then 
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..URL.escape(DoGet.link)..'&caption=*⋄︙تم التحميل بنجاح .✅*&reply_to_message_id='..msg_id.."&parse_mode=markdown&disable_web_page_preview=true")
else
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendVideo?chat_id=' .. msg.chat_id_ .. '&video='..URL.escape(DoGet.link)..'&caption=*⋄︙تم التحميل بنجاح .✅*&reply_to_message_id='..msg_id.."&parse_mode=markdown&disable_web_page_preview=true")
end
end
if text and text:match("^st @(.*)$") then
local Textm = text:match("^st @(.*)$")
GetDo = https.request('https://znmzal.ml/Do/st.php?username='..URL.escape(Textm))
DoGet = JSON.decode(GetDo)
if DoGet.ok == false then 
send(msg.chat_id_, msg.id_,'*⋄︙لا توجد استوريات او الحساب خاص .*')
return false
end
if DoGet.ok == true then 
for k,v in pairs(DoGet.result) do
local msg_id = msg.id_/2097152/0.5
if v:match("^(.*)mp4(.*)$") then
https.request("https://api.telegram.org/bot"..token..'/sendVideo?chat_id=' .. msg.chat_id_ .. '&video='..URL.escape(v)..'&caption=*⋄︙تم التحميل بنجاح .✅*&reply_to_message_id='..msg_id.."&parse_mode=markdown&disable_web_page_preview=true")
else
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..URL.escape(v)..'&caption=*⋄︙تم التحميل بنجاح .✅*&reply_to_message_id='..msg_id.."&parse_mode=markdown&disable_web_page_preview=true")
end
end
end
end
end
if not database:get(bot_id..'sc'..msg.chat_id_) then
if text and text:match("^sc (.*)$") then
local Textm = text:match("^sc (.*)$")
GetDo = https.request('https://znmzal.ml/Do/up.php?Type=sc&url='..URL.escape(Textm))
DoGet = JSON.decode(GetDo)
if DoGet.link ~= false then 
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice='..URL.escape(DoGet.link)..'&caption=*⋄︙تم التحميل بنجاح .✅*&performer=@uQuuu&title="..DoGet.title.."&reply_to_message_id='..msg_id.."&parse_mode=markdown&disable_web_page_preview=true")
else
send(msg.chat_id_, msg.id_,'*⋄︙تأكد من الرابط .*')
end
end
end
if not database:get(bot_id..'tik'..msg.chat_id_) then
if text and text:match("^tik (.*)$") then
local Textm = text:match("^tik (.*)$")
GetDo = https.request('https://znmzal.ml/Do/tiktok.php?u='..URL.escape(Textm))
DoGet = JSON.decode(GetDo)
if DoGet.link ~= false then 
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendVideo?chat_id=' .. msg.chat_id_ .. '&video='..URL.escape(DoGet.link)..'&caption=*⋄︙تم التحميل بنجاح .✅*&reply_to_message_id='..msg_id.."&parse_mode=markdown&disable_web_page_preview=true")
else
send(msg.chat_id_, msg.id_,'*⋄︙تأكد من الرابط .*')
end
end
end
if text == 'تعطيل الالعاب الاحترافيه' and Owner(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id..'lockGeamVip'..msg.chat_id_,true)  
send(msg.chat_id_, msg.id_,'*⋄︙تم تعطيل الالعاب الاحترافيه*')
end
if text == 'تفعيل الالعاب الاحترافيه' and Owner(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id..'lockGeamVip'..msg.chat_id_)  
send(msg.chat_id_, msg.id_,'*⋄︙تم تفعيل الالعاب الاحترافيه*')
end
if text == 'الالعاب الاحترافيه' and Special(msg) then  
if not database:get(bot_id..'lockGeamVip'..msg.chat_id_) then
_key = {
{{text="♟ Chess Game ♟",url='https://t.me/T4TTTTBOT?game=chess'}},
{{text="لعبة فلابي بيرد 🐥",url='https://t.me/awesomebot?game=FlappyBird'},{text="تحداني فالرياضيات 🔢",url='https://t.me/gamebot?game=MathBattle'}},
{{text="تحداني في ❌⭕️",url='t.me/XO_AABOT?start3836619'},{text="سباق الدراجات 🏍",url='https://t.me/gamee?game=MotoFX'}},
{{text="سباق سيارات 🏎",url='https://t.me/gamee?game=F1Racer'},{text="متشابه 👾",url='https://t.me/gamee?game=DiamondRows'}},
{{text="كرة قدم ⚽",url='https://t.me/gamee?game=FootballStar'}},
{{text="دومنا🥇",url='https://vipgames.com/play/?affiliateId=wpDom/#/games/domino/lobby'},{text="❕ليدو",url='https://vipgames.com/play/?affiliateId=wpVG#/games/ludo/lobby'}},
{{text="ورق🤹‍♂",url='https://t.me/gamee?game=Hexonix'},{text="Hexonix❌",url='https://t.me/gamee?game=Hexonix'}},
{{text="MotoFx🏍️",url='https://t.me/gamee?game=MotoFx'}},
{{text="لعبة 2048 🎰",url='https://t.me/awesomebot?game=g2048'},{text="Squares🏁",url='https://t.me/gamee?game=Squares'}},
{{text="Atomic 1▶️",url='https://t.me/gamee?game=AtomicDrop1'},{text="Corsairs",url='https://t.me/gamebot?game=Corsairs'}},
{{text="LumberJack",url='https://t.me/gamebot?game=LumberJack'}},
{{text="LittlePlane",url='https://t.me/gamee?game=LittlePlane'},{text="RollerDisco",url='https://t.me/gamee?game=RollerDisco'}},
{{text="🦖 Dragon Game 🦖",url='https://t.me/T4TTTTBOT?game=dragon'},{text="🐍 3D Snake Game 🐍",url='https://t.me/T4TTTTBOT?game=snake'}},
{{text="🔵 Color Game 🔴",url='https://t.me/T4TTTTBOT?game=color'}},
{{text="🚀 Rocket Game 🚀",url='https://t.me/T4TTTTBOT?game=rocket'},{text="🏹 Arrow Game 🏹",url='https://t.me/T4TTTTBOT?game=arrow'}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
{{text = 'مطور السورس', url="t.me/FEEEM"}},
}
send_inlin_key(msg.chat_id_," *⋄︙قائمه الالعاب الاحترافيه اضغط للعب*",_key,msg.id_)
else
send(msg.chat_id_, msg.id_," *⋄︙الالعاب الاحترافيه معطله في الوقت الحالي .*")
end
end
if text and text:match("^(وضع وقت التنظيف) (%d+)$") and BasicConstructor(msg) then
local GetDo = tonumber(text:match("(%d+)"))
database:set(bot_id..':TiMsg:'..msg.chat_id_,GetDo) 
return send(msg.chat_id_, msg.id_,"*⋄︙تم وضع وقت التنظيف ("..GetDo..") ساعه*")
end
if text == 'تفعيل التحقق' and Owner(msg) then   
if database:get(bot_id.."Chek:Welcome"..msg.chat_id_) then
database:del(bot_id.."Chek:Welcome"..msg.chat_id_)
end
if not database:get(bot_id..'CAPTCHA'..msg.chat_id_) then
database:set(bot_id.."CAPTCHA"..msg.chat_id_,true) 
Text = ' *⋄︙تم تفعيل التحقق عند دخول الاعضاء*'
else
Text = ' *⋄︙بالتاكيد تم تفعيل التحقق*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل التحقق' and Owner(msg) then  
if not database:get(bot_id..'CAPTCHA'..msg.chat_id_) then
Text = '\n *⋄︙بالتاكيد تم تعطيل التحقق*'
else
database:del(bot_id.."CAPTCHA"..msg.chat_id_) 
Text = '\n *⋄︙تم تعطيل التحقق عند دخول الاعضاء*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == "تفعيل تنظيف التلقائي" and BasicConstructor(msg)  then
database:set(bot_id.."LoMsg"..msg.chat_id_,true)
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄︙تم تفعيل التنظيف التلقائي*")  
return false
end
if text == "تعطيل تنظيف التلقائي" and BasicConstructor(msg) then
database:del(bot_id.."LoMsg"..msg.chat_id_)
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄︙تم تعطيل التنظيف التلقائي*")  
return false
end
if text == "قفل الدردشه" and msg.reply_to_message_id_ == 0 and Owner(msg) then 
database:set(bot_id.."MeRo:Lock:text"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الدردشه*")  
return false
end 
if text == "قفل الاضافه" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."MeRo:Lock:AddMempar"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل اضافة الاعضاء*")  
return false
end 
if text == "قفل الدخول" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."MeRo:Lock:Join"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل دخول الاعضاء*")  
return false
end 
if text == "قفل البوتات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."MeRo:Lock:Bot:kick"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل البوتات*")  
return false
end 
if text == "قفل البوتات بالطرد" and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."MeRo:Lock:Bot:kick"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل البوتات*")  
return false
end 
if text == "قفل الاشعارات" and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
database:set(bot_id.."MeRo:Lock:tagservr"..msg.chat_id_,true)  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الاشعارات*")  
return false
end 
if text == "قفل التثبيت" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."MeRo:lockpin"..msg.chat_id_, true) 
database:sadd(bot_id.."MeRo:Lock:pin",msg.chat_id_) 
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  database:set(bot_id.."MeRo:Pin:Id:Msg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل التثبيت هنا*")  
return false
end 
if text == "قفل التعديل" and msg.reply_to_message_id_ == 0 and Constructor(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Lock:edit"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل تعديل*")  
return false
end 
if text == "قفل تعديل الميديا" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."MeRo:Lock:edit"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل تعديل*")  
return false
end 
if text == "قفل الكل" and msg.reply_to_message_id_ == 0 and Constructor(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Lock:tagservrbot"..msg.chat_id_,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'MeRo:'..lock..msg.chat_id_,"del")    
end
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل جميع الاوامر*")  
return false
end 
if text == "فتح الاضافه" and msg.reply_to_message_id_ == 0 and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:AddMempar"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح اضافة الاعضاء*")  
return false
end 
if text == "فتح الدردشه" and msg.reply_to_message_id_ == 0 and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:text"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الدردشه*")  
return false
end 
if text == "فتح الدخول" and msg.reply_to_message_id_ == 0 and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:Join"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح دخول الاعضاء*")  
return false
end 
if text == "فتح البوتات" and msg.reply_to_message_id_ == 0 and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:Bot:kick"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فـتح البوتات*")  
return false
end 
if text == "فتح البوتات " and msg.reply_to_message_id_ == 0 and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:Bot:kick"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فـتح البوتات*")
return false
end 
if text == "فتح الاشعارات" and msg.reply_to_message_id_ == 0 and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:tagservr"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فـتح الاشعارات*")  
return false
end 
if text == "فتح التثبيت" and msg.reply_to_message_id_ == 0 and Constructor(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:lockpin"..msg.chat_id_)  
database:srem(bot_id.."MeRo:Lock:pin",msg.chat_id_)
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فـتح التثبيت هنا*")  
return false
end 
if text == "فتح التعديل" and msg.reply_to_message_id_ == 0 and Constructor(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:edit"..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فـتح تعديل*")  
return false
end 
if text == "فتح التعديل الميديا" and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."MeRo:Lock:edit"..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فـتح تعديل*")  
return false
end 
if text == "فتح الكل" and msg.reply_to_message_id_ == 0 and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:tagservrbot"..msg.chat_id_)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:del(bot_id..'MeRo:'..lock..msg.chat_id_)    
end
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فـتح جميع الاوامر*")  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "قفل الروابط" and Addictive(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Lock:Link"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الروابط*")  
return false
end 
if text == "قفل الروابط بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Link"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الروابط*")  
return false
end 
if text == "قفل الروابط بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Link"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الروابط*")  
return false
end 
if text == "قفل الروابط بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Link"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الروابط*")  
return false
end 
if text == "فتح الروابط" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:Link"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الروابط*")  
return false
end 
if text == "قفل المعرفات" and Addictive(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل المعرفات*")  
return false
end 
if text == "قفل المعرفات بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل المعرفات*")  
return false
end 
if text == "قفل المعرفات بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل المعرفات*")  
return false
end 
if text == "قفل المعرفات بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل المعرفات*")  
return false
end 
if text == "فتح المعرفات" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح المعرفات*")  
return false
end 
if text == "قفل التاك" and Addictive(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل التاك*")  
return false
end 
if text == "قفل التاك بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل التاك*")  
return false
end 
if text == "قفل التاك بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل التاك*")  
return false
end 
if text == "قفل التاك بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل التاك*")  
return false
end 
if text == "فتح التاك" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح التاك*")  
return false
end 
if text == "قفل الشارحه" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الشارحه*")  
return false
end 
if text == "قفل الشارحه بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الشارحه*")  
return false
end 
if text == "قفل الشارحه بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الشارحه*")  
return false
end 
if text == "قفل الشارحه بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الشارحه*")  
return false
end 
if text == "فتح الشارحه" and Addictive(msg) then
database:del(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الشارحه*")  
return false
end 
if text == "قفل الصور"and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Photo"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الصور*")  
return false
end 
if text == "قفل الاباحي"and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Xn"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الاباحي*")  
return false
end 
if text == "قفل الصور بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Photo"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الصور*")  
return false
end 
if text == "قفل الصور بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Photo"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الصور*")  
return false
end 
if text == "قفل الصور بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Photo"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الصور*")  
return false
end 
if text == "فتح الصور" and Addictive(msg) then
database:del(bot_id.."MeRo:Lock:Photo"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الصور*")  
return false
end 
if text == "فتح الاباحي" and Addictive(msg) then
database:del(bot_id.."MeRo:Lock:Xn"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الاباحي*")  
return false
end 
if text == "قفل الفيديو" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Video"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الفيديو*")  
return false
end 
if text == "قفل الفيديو بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Video"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الفيديو*")  
return false
end 
if text == "قفل الفيديو بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Video"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الفيديو*")  
return false
end 
if text == "قفل الفيديو بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Video"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الفيديو*")  
return false
end 
if text == "فتح الفيديو" and Addictive(msg) then
database:del(bot_id.."MeRo:Lock:Video"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الفيديو*")  
return false
end 
if text == "قفل المتحركه" and Addictive(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Lock:Animation"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل المتحركه*")  
return false
end
if text == "قفل المتحركه بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Animation"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل المتحركه*")  
return false
end 
if text == "قفل المتحركه بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Animation"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل المتحركه*")  
return false
end 
if text == "قفل المتحركه بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Animation"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل المتحركه*")  
return false
end 
if text == "فتح المتحركه" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:Animation"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح المتحركه*")  
return false
end 
if text == "قفل الالعاب" and Addictive(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Lock:geam"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الالعاب*")  
return false
end 
if text == "قفل الالعاب بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:geam"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الالعاب*")  
return false
end 
if text == "قفل الالعاب بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:geam"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الالعاب*")  
return false
end 
if text == "قفل الالعاب بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:geam"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الالعاب*")  
return false
end 
if text == "فتح الالعاب" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:geam"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الالعاب*")  
return false
end 
if text == "قفل الاغاني" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Audio"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الاغاني*")  
return false
end 
if text == "قفل الاغاني بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Audio"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الاغاني*")  
return false
end 
if text == "قفل الاغاني بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Audio"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الاغاني*")  
return false
end 
if text == "قفل الاغاني بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Audio"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الاغاني*")  
return false
end 
if text == "فتح الاغاني" and Addictive(msg) then
database:del(bot_id.."MeRo:Lock:Audio"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الاغاني*")  
return false
end 
if text == "قفل الصوت" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:vico"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الصوت*")  
return false
end 
if text == "قفل الصوت بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:vico"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الصوت*")  
return false
end 
if text == "قفل الصوت بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:vico"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الصوت*")  
return false
end 
if text == "قفل الصوت بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:vico"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الصوت*")  
return false
end 
if text == "فتح الصوت" and Addictive(msg) then
database:del(bot_id.."MeRo:Lock:vico"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الصوت*")  
return false
end 
if text == "قفل الكيبورد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الكيبورد*")  
return false
end 
if text == "قفل الكيبورد بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الكيبورد*")  
return false
end 
if text == "قفل الكيبورد بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الكيبورد*")  
return false
end 
if text == "قفل الكيبورد بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الكيبورد*")  
return false
end 
if text == "فتح الكيبورد" and Addictive(msg) then
database:del(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الكيبورد*")  
return false
end 
if text == "قفل الملصقات" and Addictive(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الملصقات*")  
return false
end 
if text == "قفل الملصقات بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الملصقات*")  
return false
end 
if text == "قفل الملصقات بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الملصقات*")  
return false
end 
if text == "قفل الملصقات بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الملصقات*")  
return false
end 
if text == "فتح الملصقات" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الملصقات*")  
return false
end 
if text == "قفل التوجيه" and Addictive(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Lock:forward"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل التوجيه*")  
return false
end 
if text == "قفل التوجيه بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:forward"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل التوجيه*")  
return false
end 
if text == "قفل التوجيه بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:forward"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل التوجيه*")  
return false
end 
if text == "قفل التوجيه بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:forward"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل التوجيه*")  
return false
end 
if text == "فتح التوجيه" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:forward"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح التوجيه*")  
return false
end 
if text == "قفل الملفات" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Document"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الملفات*")  
return false
end 
if text == "قفل الملفات بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Document"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الملفات*")  
return false
end 
if text == "قفل الملفات بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Document"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الملفات*")  
return false
end 
if text == "قفل الملفات بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Document"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الملفات*")  
return false
end 
if text == "فتح الملفات" and Addictive(msg) then
database:del(bot_id.."MeRo:Lock:Document"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الملفات*")  
return false
end 
if text == "قفل السيلفي" and Addictive(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل السيلفي*")  
return false
end 
if text == "قفل السيلفي بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل السيلفي*")  
return false
end 
if text == "قفل السيلفي بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل السيلفي*")  
return false
end 
if text == "قفل السيلفي بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل السيلفي*")  
return false
end 
if text == "فتح السيلفي" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح السيلفي*")  
return false
end 
if text == "قفل الماركداون" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الماركداون*")  
return false
end 
if text == "قفل الماركداون بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الماركداون*")  
return false
end 
if text == "قفل الماركداون بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الماركداون*")  
return false
end 
if text == "قفل الماركداون بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الماركداون*")  
return false
end 
if text == "فتح الماركداون" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الماركداون*")  
return false
end 
if text == "قفل الجهات" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Contact"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الجهات*")  
return false
end 
if text == "قفل الجهات بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Contact"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الجهات*")  
return false
end 
if text == "قفل الجهات بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Contact"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الجهات*")  
return false
end 
if text == "قفل الجهات بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Contact"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الجهات*")  
return false
end 
if text == "فتح الجهات" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:Contact"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الجهات*")  
return false
end 
if text == "قفل الكلايش" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Spam"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الكلايش*")  
return false
end 
if text == "قفل الكلايش بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Spam"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الكلايش*")  
return false
end 
if text == "قفل الكلايش بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Spam"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الكلايش*")  
return false
end 
if text == "قفل الكلايش بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Spam"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الكلايش*")  
return false
end 
if text == "فتح الكلايش" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Lock:Spam"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الكلايش*")  
return false
end 
if text == "قفل الانلاين" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Inlen"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفـل الانلاين*")  
return false
end 
if text == "قفل الانلاين بالتقيد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Inlen"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفـل الانلاين*")  
return false
end 
if text == "قفل الانلاين بالكتم" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Inlen"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفـل الانلاين*")  
return false
end 
if text == "قفل الانلاين بالطرد" and Addictive(msg) then
database:set(bot_id.."MeRo:Lock:Inlen"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفـل الانلاين*")  
return false
end 
if text == "فتح الانلاين" and Addictive(msg) then
database:del(bot_id.."MeRo:Lock:Inlen"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح الانلاين*")  
return false
end 
if text == "قفل التكرار بالطرد" and Addictive(msg) and GetChannelMember(msg) then
database:hset(bot_id.."MeRo:flooding:settings:"..msg.chat_id_ ,"flood","kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","*⋄️︙تم قفل التكرار*")
return false
end 
if text == "قفل التكرار" and Addictive(msg) and GetChannelMember(msg) then
database:hset(bot_id.."MeRo:flooding:settings:"..msg.chat_id_ ,"flood","del")  
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄️︙تم قفل التكرار بالحذف*")
return false
end 
if text == "قفل التكرار بالتقيد" and Addictive(msg) and GetChannelMember(msg) then
database:hset(bot_id.."MeRo:flooding:settings:"..msg.chat_id_ ,"flood","keed")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","*⋄️︙تم قفل التكرار*")
return false
end 
if text == "قفل التكرار بالكتم" and Addictive(msg) and GetChannelMember(msg) then
database:hset(bot_id.."MeRo:flooding:settings:"..msg.chat_id_ ,"flood","mute")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","*⋄️︙تم قفل التكرار*")
return false
end 
if text == "فتح التكرار" and Addictive(msg) and GetChannelMember(msg) then
database:hdel(bot_id.."MeRo:flooding:settings:"..msg.chat_id_ ,"flood")  
Reply_Status(msg,msg.sender_user_id_,"unlock","*⋄️︙تم فتح التكرار*")
return false
end 
if text == ("رفع مطور ثانوي") and tonumber(msg.reply_to_message_id_) ~= 0 and VIP_DeV(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."DEV:Sudo:T", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم ترقيته مطور ثانوي في البوت*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false 
end
if text and text:match("^رفع مطور ثانوي @(.*)$") and VIP_DeV(msg) then
local username = text:match("^رفع مطور ثانوي @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
database:sadd(bot_id.."DEV:Sudo:T", result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم ترقيته مطور ثانوي في البوت*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false 
end
if text and text:match("^رفع مطور ثانوي (%d+)$") and VIP_DeV(msg) then
local userid = text:match("^رفع مطور ثانوي (%d+)$")
database:sadd(bot_id.."DEV:Sudo:T", userid)
Reply_Status(msg,userid,"reply","*⋄︙تم ترقيته مطور ثانوي في البوت*")  
return false 
end
if text == ("تنزيل مطور ثانوي") and tonumber(msg.reply_to_message_id_) ~= 0 and VIP_DeV(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."DEV:Sudo:T", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيله من المطور ثانويين*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false 
end
if text and text:match("^تنزيل مطور ثانوي @(.*)$") and VIP_DeV(msg) then
local username = text:match("^تنزيل مطور ثانوي @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
database:srem(bot_id.."DEV:Sudo:T", result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم تنزيله من المطور ثانويين*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end  
if text and text:match("^تنزيل مطور ثانوي (%d+)$") and VIP_DeV(msg) then
local userid = text:match("^تنزيل مطور ثانوي (%d+)$")
database:srem(bot_id.."DEV:Sudo:T", userid)
Reply_Status(msg,userid,"reply","*⋄︙تم تنزيله من المطور ثانويين*")  
return false 
end
if text == ("الثانويين") and DevMeRo(msg) then
local list = database:smembers(bot_id.."DEV:Sudo:T")
t = "\n*⋄︙قائمة مطورين الثانويين للبوت*\n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*⋄︙لا يوجد مطورين ثانويين*"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("مسح الثانويين") and VIP_DeV(msg) then
database:del(bot_id.."DEV:Sudo:T")
send(msg.chat_id_, msg.id_, "\n*⋄︙تم مسح قائمة المطورين الثانويين*")
end
if text == ("مسح قائمه العام") and DevMeRo(msg) then
database:del(bot_id.."MeRo:GBan:User")
send(msg.chat_id_, msg.id_, "\n*⋄︙تم مسح قائمه العام*")
return false
end
if text == ("مسح المطورين") and DevMeRo(msg) then
database:del(bot_id.."MeRo:Sudo:User")
send(msg.chat_id_, msg.id_, "\n*⋄︙تم مسح قائمة المطورين*")
end
if text == "مسح المنشئين الاساسين" and DevBot(msg) then
database:del(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_)
texts = "*⋄︙تم مسح المنشئين الاساسيين*"
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح المنشئين" and BasicConstructor(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Constructor"..msg.chat_id_)
texts = "*⋄︙تم مسح المنشئين *"
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح المدراء" and Constructor(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Manager"..msg.chat_id_)
texts = "*⋄︙تم مسح المدراء *"
send(msg.chat_id_, msg.id_, texts)
end
if text == "مسح الادمنيه" and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Mod:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح  قائمة الادمنية  *")
end
if text == "مسح المميزين" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Special:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙ تم مسح  قائمة الاعضاء المميزين *")
end
if text == "مسح المكتومين" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Muted:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙ تم مسح قائمه المكتومين *")
end
if text == "مسح المحظورين" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Ban:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "\n*⋄︙تم مسح المحظورين*")
end
if text == ("قائمه العام") and DevMeRo(msg) then
local list = database:smembers(bot_id.."MeRo:GBan:User")
t = "\n*⋄︙قائمة المحظورين عام*\n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*⋄︙لا يوجد محظورين عام*"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("المطورين") and DevMeRo(msg) then
local list = database:smembers(bot_id.."MeRo:Sudo:User")
t = "\n *⋄︙قائمة مطورين البوت* \n*— — — — — — — — — — — — — —*\n"
keyboard = {
{{text = 'مسح المطورين',callback_data=msg.sender_user_id_.."DelLsta".."55"}},
}
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد مطورين*"
keyboard = nil
end
local msg_id = msg.id_/2097152/0.5
send_inline_key(msg.chat_id_,t,nil,keyboard,msg_id)
end
if text == "المنشئين الاساسين" and DevBot(msg) then
local list = database:smembers(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_)
t = "\n *⋄︙قائمة المنشئين الاساسين* \n*— — — — — — — — — — — — — —*\n"
keyboard = {
{{text = 'مسح الاساسين',callback_data=msg.sender_user_id_.."DelLsta".."99"}},
}
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد منشئين اساسين*"
keyboard = nil
end
local msg_id = msg.id_/2097152/0.5
send_inline_key(msg.chat_id_,t,nil,keyboard,msg_id)
return false
end
if text == ("تاك للمنشئين الاساسين") or text == ("صيح المنشئين الاساسين") then
local list = database:smembers(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_)
t = "\n *⋄︙وينكم تعالو يريدوكم بكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- {"..v.."}\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد منشئين اساسين*"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المنشئين") and BasicConstructor(msg) and GetChannelMember(msg) then
local list = database:smembers(bot_id.."MeRo:Constructor"..msg.chat_id_)
t = "\n *⋄︙قائمة المنشئين* \n*— — — — — — — — — — — — — —*\n"
keyboard = {
{{text = 'مسح المنشئين',callback_data=msg.sender_user_id_.."DelLsta".."120"}},
}
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد منشئين*"
keyboard = nil
end
local msg_id = msg.id_/2097152/0.5
send_inline_key(msg.chat_id_,t,nil,keyboard,msg_id)
end
if text == ("تاك للمنشئين") or text == ("صيح المنشئين") then
local list = database:smembers(bot_id.."MeRo:Constructor"..msg.chat_id_)
t = "\n *⋄︙وينكم تعالو يريدوكم بكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- {"..v.."}\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد منشئين*"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المدراء") and Constructor(msg) and GetChannelMember(msg) then
local list = database:smembers(bot_id.."MeRo:Manager"..msg.chat_id_)
t = "\n⋄︙قائمة المدراء \n— — — — — — — — — — — — — — \n"
keyboard = {
{{text = 'مسح المدراء',callback_data=msg.sender_user_id_.."DelLsta".."140"}},
}
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "⋄︙لا يوجد مدراء"
keyboard = nil
end
local msg_id = msg.id_/2097152/0.5
send_inline_key(msg.chat_id_,t,nil,keyboard,msg_id)
end
if text == ("تاك للمدراء") or text == ("صيح للمدراء") then
local list = database:smembers(bot_id.."MeRo:Manager"..msg.chat_id_)
t = "\n *⋄︙وينكم تعالو يريدوكم بكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- {"..v.."}\n"
end
end
if #list == 0 then
t = "⋄︙لا يوجد مدراء"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("الادمنيه") and Owner(msg) and GetChannelMember(msg) then
local list = database:smembers(bot_id.."MeRo:Mod:User"..msg.chat_id_)
t = "\n *⋄︙قائمة الادمنيه* \n*— — — — — — — — — — — — — —*\n"
keyboard = {
{{text = 'مسح الادمنيه',callback_data=msg.sender_user_id_.."DelLsta".."160"}},
}
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد ادمنيه*"
keyboard = nil
end
local msg_id = msg.id_/2097152/0.5
send_inline_key(msg.chat_id_,t,nil,keyboard,msg_id)
end
if text == ("تاك للادمنيه") or text == ("صيح الادمنيه") then
local list = database:smembers(bot_id.."MeRo:Mod:User"..msg.chat_id_)
t = "\n *⋄︙وينكم تعالو يريدوكم بكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- {"..v.."}\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد ادمنيه*"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المميزين") and Addictive(msg) then
local list = database:smembers(bot_id.."MeRo:Special:User"..msg.chat_id_)
t = "\n *⋄︙قائمة مميزين الكروب* \n*— — — — — — — — — — — — — —*\n"
keyboard = {
{{text = 'مسح المميزين',callback_data=msg.sender_user_id_.."DelLsta".."180"}},
}
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد مميزين*"
keyboard = nil
end
local msg_id = msg.id_/2097152/0.5
send_inline_key(msg.chat_id_,t,nil,keyboard,msg_id)
end
if text == ("تاك للمميزين") or text == ("صيح المميزين") then
local list = database:smembers(bot_id.."MeRo:Special:User"..msg.chat_id_)
t = "\n *⋄︙وينكم تعالو يريدوكم بكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- {"..v.."}\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد مميزين*"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المكتومين") and Addictive(msg) and GetChannelMember(msg) then
local list = database:smembers(bot_id.."MeRo:Muted:User"..msg.chat_id_)
t = "\n*⋄︙قائمة المكتومين*\n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*⋄︙لا يوجد مكتومين*"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("المحظورين") and GetChannelMember(msg) then
local list = database:smembers(bot_id.."MeRo:Ban:User"..msg.chat_id_)
t = "\n*⋄︙قائمة محظورين المجموعه*\n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*⋄︙لا يوجد محظورين*"
end
send(msg.chat_id_, msg.id_, t)
end 
if text == ("كتم عام") and tonumber(msg.reply_to_message_id_) ~= 0 and DevMeRo(msg) then
function Function_MeRo(extra, result, success)
if General_ban(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع كتم عام ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )*")
else
database:sadd(bot_id.."MeRo:MuAn:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم حظره عام من المجموعات*")  
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^كتم عام @(.*)$")  and DevMeRo(msg) then
local username = text:match("^كتم عام @(.*)$") 
function Function_MeRo(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
if General_ban(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع كتم عام ( "..Get_Rank(result.id_,msg.chat_id_).." )*")
return false
end
database:sadd(bot_id.."MeRo:MuAn:User", result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم حظره عام من المجموعات*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^كتم عام (%d+)$") and DevMeRo(msg) then
local userid = text:match("^كتم عام (%d+)$")
if General_ban(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع كتم عام ( "..Get_Rank(userid,msg.chat_id_).." )*")
return false
end
database:sadd(bot_id.."MeRo:MuAn:User", userid)
Reply_Status(msg,userid,"reply","*⋄︙تم حظره عام من المجموعات*")  
return false
end
if text == ("الغاء كتم العام") and tonumber(msg.reply_to_message_id_) ~= 0 and DevMeRo(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:MuAn:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم الغاء كتم العام من المجموعات*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^الغاء كتم العام @(.*)$") and DevMeRo(msg) then
local username = text:match("^الغاء كتم العام @(.*)$") 
function Function_MeRo(extra, result, success)
if result.id_ then
Reply_Status(msg,result.id_,"reply","*⋄︙تم الغاء كتم العام من المجموعات*")
database:srem(bot_id.."MeRo:MuAn:User", result.id_)
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^الغاء كتم العام (%d+)$") and DevMeRo(msg) then
local userid = text:match("^الغاء كتم العام (%d+)$")
database:srem(bot_id.."MeRo:MuAn:User", userid)
Reply_Status(msg,userid,"reply","*⋄︙تم الغاء كتم العام من المجموعات*")  
return false
end
if text == ("مسح قائمه كتم العام") and DevMeRo(msg) then
database:del(bot_id.."MeRo:MuAn:User")
send(msg.chat_id_, msg.id_, "\n*⋄︙تم مسح قائمه العام*")
return false
end
if text == ("قائمه كتم العام") and DevMeRo(msg) then
local list = database:smembers(bot_id.."MeRo:MuAn:User")
t = "\n*⋄︙قائمة المكتومين عام*\n*— — — — — — — — — — — — — — *\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*⋄︙لا يوجد المكتومين عام*"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("حظر عام") and tonumber(msg.reply_to_message_id_) ~= 0 and DevMeRo(msg) then
function Function_MeRo(extra, result, success)
if General_ban(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع حظر عام ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )*")
else
database:sadd(bot_id.."MeRo:GBan:User", result.sender_user_id_)
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم حظره عام من المجموعات*")  
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^حظر عام @(.*)$")  and DevMeRo(msg) then
local username = text:match("^حظر عام @(.*)$") 
function Function_MeRo(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
if General_ban(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع حظر عام ( "..Get_Rank(result.id_,msg.chat_id_).." )*")
return false
end
database:sadd(bot_id.."MeRo:GBan:User", result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم حظره عام من المجموعات*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^حظر عام (%d+)$") and DevMeRo(msg) then
local userid = text:match("^حظر عام (%d+)$")
if General_ban(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع حظر عام ( "..Get_Rank(userid,msg.chat_id_).." )*")
return false
end
database:sadd(bot_id.."MeRo:GBan:User", userid)
Reply_Status(msg,userid,"reply","*⋄︙تم حظره عام من المجموعات*")  
return false
end
if text == ("الغاء العام") and tonumber(msg.reply_to_message_id_) ~= 0 and DevMeRo(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:GBan:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم الغاء حظره عام من المجموعات*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^الغاء العام @(.*)$") and DevMeRo(msg) then
local username = text:match("^الغاء العام @(.*)$") 
function Function_MeRo(extra, result, success)
if result.id_ then
Reply_Status(msg,result.id_,"reply","*⋄︙تم الغاء حظره عام من المجموعات*")  
database:srem(bot_id.."MeRo:GBan:User", result.id_)
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^الغاء العام (%d+)$") and DevMeRo(msg) then
local userid = text:match("^الغاء العام (%d+)$")
database:srem(bot_id.."MeRo:GBan:User", userid)
Reply_Status(msg,userid,"reply","*⋄︙تم الغاء حظره عام من المجموعات*")  
return false
end
if text == ("رفع مطور") and tonumber(msg.reply_to_message_id_) ~= 0 and DevMeRo(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Sudo:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم ترقيته مطور في البوت*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false 
end
if text and text:match("^رفع مطور @(.*)$") and DevMeRo(msg) then
local username = text:match("^رفع مطور @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
database:sadd(bot_id.."MeRo:Sudo:User", result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم ترقيته مطور في البوت*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false 
end
if text and text:match("^رفع مطور (%d+)$") and DevMeRo(msg) then
local userid = text:match("^رفع مطور (%d+)$")
database:sadd(bot_id.."MeRo:Sudo:User", userid)
Reply_Status(msg,userid,"reply","*⋄︙تم ترقيته مطور في البوت*")  
return false 
end
if text == ("تنزيل مطور") and tonumber(msg.reply_to_message_id_) ~= 0 and DevMeRo(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Sudo:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيله من المطورين*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false 
end
if text and text:match("^تنزيل مطور @(.*)$") and DevMeRo(msg) then
local username = text:match("^تنزيل مطور @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
database:srem(bot_id.."MeRo:Sudo:User", result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم تنزيله من المطورين*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end  
if text and text:match("^تنزيل مطور (%d+)$") and DevMeRo(msg) then
local userid = text:match("^تنزيل مطور (%d+)$")
database:srem(bot_id.."MeRo:Sudo:User", userid)
Reply_Status(msg,userid,"reply","*⋄︙تم تنزيله من المطورين*")  
return false 
end
if text == "المالكين" and DevBot(msg) then
local list = database:smembers(bot_id.."creator"..msg.chat_id_)
t = "\n *⋄︙قائمه المالك* \n*— — — — — — — — — — — — — —*\n"
keyboard = {
{{text = 'مسح المالكين',callback_data=msg.sender_user_id_.."DelLsta".."77"}},
}
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."↬⋄︙ [@"..username.."]\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد احد في قائمه المالك*"
keyboard = nil
end
local msg_id = msg.id_/2097152/0.5
send_inline_key(msg.chat_id_,t,nil,keyboard,msg_id)
return false
end
if text == ("صيح للمالك") or text == ("تاك للمالك") then
local list = database:smembers(bot_id..'creator'..msg.chat_id_)
t = "\n *⋄︙وينكم تعالو يريدوكم بكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- {"..v.."}\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد احد في قائمه المالك*"
end
send(msg.chat_id_, msg.id_, t)
end
if text == "مسح قائمه المالكين" and DevBot(msg) then
database:del(bot_id.."creator"..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
database:sadd(bot_id.."creator"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح المالكين*")
end
if text == ("رفع مالك") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then  
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."creator"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم ترقيته مالك*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^رفع مالك @(.*)$") and DevBot(msg) then  
local username = text:match("^رفع مالك @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
database:sadd(bot_id.."creator"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم ترقيته مالك*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^رفع مالك (%d+)$") and DevBot(msg) then  
local userid = text:match("^رفع مالك (%d+)$") 
database:sadd(bot_id.."creator"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم ترقيته مالك*")  
return false
end
if text == ("تنزيل مالك") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then  
function Function_MeRo(extra, result, success)
database:srem(bot_id.."creator"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيله من المالكين*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^تنزيل مالك @(.*)$") and DevBot(msg) then  
local username = text:match("^تنزيل مالك @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
database:srem(bot_id.."creator"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","⋄︙تم تنزيله من المالكين")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^تنزيل مالك (%d+)$") and DevBot(msg) then  
local userid = text:match("^تنزيل مالك (%d+)$") 
database:srem(bot_id.."creator"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم تنزيله من المالكين*")  
return false
end
if text == "تاك للمشرفين" and creatorA(msg) then
if database:get(bot_id.."MeRo:admin:Time"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"انتظر دقيقه من فضلك")
return false
end
database:setex(bot_id..'MeRo:admin:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100 },function(extra,result,success)
m = 0
tgad = 0
local ans = result.members_  
for k, v in pairs(ans) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
if m == 1 or m == tgad or k == 0 then
tgad = m + 5
t = "#Admin"
end
m = m + 1
Adminame = data.first_name_
Adminame = Adminame:gsub("]","")
Adminame = Adminame:gsub("[[]","")
t = t..", ["..Adminame.."](tg://user?id="..v.user_id_..")"
if m == 1 or m == tgad or k == 0 then
local Text = t:gsub('#Admin,','#Admin\n')
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end
end,nil)
end
end,nil)
end
if text == ("رفع منشئ اساسي") and tonumber(msg.reply_to_message_id_) ~= 0 and creatorA(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم ترقيته منشئ اساسي*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^رفع منشئ اساسي @(.*)$") and creatorA(msg) and GetChannelMember(msg) then
local username = text:match("^رفع منشئ اساسي @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
database:sadd(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم ترقيته منشئ اساسي*")
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^رفع منشئ اساسي (%d+)$") and creatorA(msg) and GetChannelMember(msg) then
local userid = text:match("^رفع منشئ اساسي (%d+)$") 
database:sadd(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم ترقيته منشئ اساسي*")  
return false
end
if text == ("تنزيل منشئ اساسي") and tonumber(msg.reply_to_message_id_) ~= 0 and creatorA(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيله من المنشئين*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي @(.*)$") and creatorA(msg) and GetChannelMember(msg) then
local username = text:match("^تنزيل منشئ اساسي @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
database:srem(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_, result.id_)

Reply_Status(msg,result.id_,"reply","*⋄︙تم تنزيله من المنشئين*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي (%d+)$") and creatorA(msg) and GetChannelMember(msg) then
local userid = text:match("^تنزيل منشئ اساسي (%d+)$") 
database:srem(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم تنزيله من المنشئين*")  
return false
end
if text == "رفع منشئ" and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم ترقيته منشئ في المجموعه*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
end
if text and text:match("^رفع منشئ @(.*)$") and BasicConstructor(msg) and GetChannelMember(msg) then
local username = text:match("^رفع منشئ @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
database:sadd(bot_id.."MeRo:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم ترقيته منشئ في المجموعه*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
end
------------------------------------------------------------------------
if text and text:match("^رفع منشئ (%d+)$") and BasicConstructor(msg) and GetChannelMember(msg) then
local userid = text:match("^رفع منشئ (%d+)$")
database:sadd(bot_id.."MeRo:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم ترقيته منشئ في المجموعه*")  
end
if text and text:match("^تنزيل منشئ$") and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيله من المنشئين*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ @(.*)$") and BasicConstructor(msg) and GetChannelMember(msg) then
local username = text:match("^تنزيل منشئ @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم تنزيله من المنشئين*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ (%d+)$") and BasicConstructor(msg) and GetChannelMember(msg) then
local userid = text:match("^تنزيل منشئ (%d+)$")
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم تنزيله من المنشئين*")  
end

if text == ("رفع مدير") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Manager"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم ترقيته مدير المجموعه*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end  
if text and text:match("^رفع مدير @(.*)$") and Constructor(msg) and GetChannelMember(msg) then
local username = text:match("^رفع مدير @(.*)$") 
function Function_MeRo(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
database:sadd(bot_id.."MeRo:Manager"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم ترقيته مدير المجموعه*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end 

if text and text:match("^رفع مدير (%d+)$") and Constructor(msg) and GetChannelMember(msg) then
local userid = text:match("^رفع مدير (%d+)$") 
database:sadd(bot_id.."MeRo:Manager"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم ترقيته مدير المجموعه*")  
return false
end  
if text == ("تنزيل مدير") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيله من المدراء*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end  
if text and text:match("^تنزيل مدير @(.*)$") and Constructor(msg) and GetChannelMember(msg) then
local username = text:match("^تنزيل مدير @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم تنزيله من المدراء*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end  
if text and text:match("^تنزيل مدير (%d+)$") and Constructor(msg) and GetChannelMember(msg) then
local userid = text:match("^تنزيل مدير (%d+)$") 
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم تنزيله من المدراء*")  
return false
end

if text == ("رفع ادمن") and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'*⋄︙لا تستطيع رفع احد وذلك لان تم تعطيل الرفع من قبل المنشئين*')
return false
end
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم ترقيته ادمن للمجموعه*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^رفع ادمن @(.*)$") and Owner(msg) and GetChannelMember(msg) then
local username = text:match("^رفع ادمن @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'*⋄︙لا تستطيع رفع احد وذلك لان تم تعطيل الرفع من قبل المنشئين*')
return false
end
function Function_MeRo(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
database:sadd(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم ترقيته ادمن للمجموعه*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^رفع ادمن (%d+)$") and Owner(msg) and GetChannelMember(msg) then
local userid = text:match("^رفع ادمن (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'*⋄︙لا تستطيع رفع احد وذلك لان تم تعطيل الرفع من قبل المنشئين*')
return false
end
database:sadd(bot_id.."MeRo:Mod:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم ترقيته ادمن للمجموعه*")  
return false
end
if text == ("تنزيل ادمن") and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيله من ادمنيه المجموعه*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^تنزيل ادمن @(.*)$") and Owner(msg) and GetChannelMember(msg) then
local username = text:match("^تنزيل ادمن @(.*)$") 
function Function_MeRo(extra, result, success)
if result.id_ then
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم تنزيله من ادمنيه المجموعه*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^تنزيل ادمن (%d+)$") and Owner(msg) and GetChannelMember(msg) then
local userid = text:match("^تنزيل ادمن (%d+)$")
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم تنزيله من ادمنيه المجموعه*")  
return false
end
if text and text:match("^صيح (.*)$") then
local username = text:match("^صيح (.*)$") 
if not database:get(bot_id..'Seh:User'..msg.chat_id_) then
function start_function(extra, result, success)
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_,' *⋄︙المعرف غلط* ') 
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
send(msg.chat_id_, msg.id_,' *⋄︙لا استطيع اصيح معرف قنوات*') 
return false  
end
if result.type_.user_.type_.ID == "UserTypeBot" then
send(msg.chat_id_, msg.id_,' *⋄︙لا استطيع اصيح معرف بوتات*') 
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_,'*⋄︙لا اسطيع صيح معرفات الكروبات*') 
return false  
end
if result.id_ then
send(msg.chat_id_, msg.id_,' *⋄︙تعال حبي يصيحونك بل كروب ['..username..']*') 
return false
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
else
send(msg.chat_id_, msg.id_,' *⋄︙تم تعطيل امر صيح*') 
end
return false
end
if text == 'منو ضافني' then
if not database:get(bot_id..'Added:Me'..msg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
send(msg.chat_id_, msg.id_,' *⋄︙انت منشئ الكروب*') 
return false
end
local Added_Me = database:get(bot_id.."MeRo:Who:Added:Me"..msg.chat_id_..':'..msg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = ' *⋄︙الشخص الذي قام باضافتك هو »* '..Name
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
else
send(msg.chat_id_, msg.id_,' *⋄︙انت دخلت عبر الرابط لتلح*') 
end
end,nil)
else
send(msg.chat_id_, msg.id_,' *⋄︙تم تعطيل امر منو ضافني*') 
end
end
if text == 'تفعيل ضافني' and Owner(msg) then   
if database:get(bot_id..'Added:Me'..msg.chat_id_) then
Text = ' *⋄︙تم تفعيل امر منو ضافني*'
database:del(bot_id..'Added:Me'..msg.chat_id_)  
else
Text = ' *⋄︙بالتاكيد تم تفعيل امر منو ضافني*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل ضافني' and Owner(msg) then  
if not database:get(bot_id..'Added:Me'..msg.chat_id_) then
database:set(bot_id..'Added:Me'..msg.chat_id_,true)  
Text = '\n *⋄︙تم تعطيل امر منو ضافني*'
else
Text = '\n *⋄︙بالتاكيد تم تعطيل امر منو ضافني*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل صيح' and Owner(msg) then   
if database:get(bot_id..'Seh:User'..msg.chat_id_) then
Text = ' *⋄︙تم تفعيل امر صيح*'
database:del(bot_id..'Seh:User'..msg.chat_id_)  
else
Text = ' *⋄︙بالتاكيد تم تفعيل امر صيح*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == "تفعيل الرسائل اليوميه" and Owner(msg) then
send(msg.chat_id_, msg.id_, '*⋄︙تم تفعيل الرسائل اليوميه*')
database:set(bot_id.."msg:match:"..msg.chat_id_,true)
end
if text == "تعطيل الرسائل اليوميه" and Owner(msg) then
send(msg.chat_id_, msg.id_,'*⋄︙تم تعطيل الرسائل اليوميه*')
database:del(bot_id.." msg:match:"..msg.chat_id_)
end
if database:get(bot_id.."msg:match:"..msg.chat_id_) then
if msg.content_.ID then
get_msg = database:get(bot_id.."msg:match:"..msg.sender_user_id_..":"..msg.chat_id_) or 0
gms = get_msg + 1
database:setex(bot_id..'msg:match:'..msg.sender_user_id_..":"..msg.chat_id_,86400,gms)
end
if text == "تفاعلي اليوم" and tonumber(msg.reply_to_message_id_) == 0 then    
get_msg = database:get(bot_id.."msg:match:"..msg.sender_user_id_..":"..msg.chat_id_) or 0
send(msg.chat_id_, msg.id_,"*⋄︙عدد رسائلك الكلي هو :-*\n"..get_msg.." *من الرسائل*")
end  
if text == "تفاعله اليوم" and tonumber(msg.reply_to_message_id_) > 0 then    
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
get_msg = database:get(bot_id.."msg:match:"..result.sender_user_id_..":"..msg.chat_id_) or 0
send(msg.chat_id_, msg.id_,"*⋄︙عدد رسائل اشخص الكلي هو :-*\n"..get_msg.." *من الرسائل*")
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
end
if (text == ("تنزيل مطي")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Mote:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيل عضو من المطايه*\n*⋄︙تعال حبي رجع عربانه*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if (text == ("رفع مطي")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Mote:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم رفعه مطي في المجموعه*\n*⋄︙تعال حبي استلم العربانه*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text == "مسح المطايه" and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Mote:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح  قائمة المطايه*")
end
if text == ("تاك للمطايه") and Owner(msg) then
local list = database:smembers(bot_id.."MeRo:Mote:User"..msg.chat_id_)
t = "\n *⋄︙قائمة مطايه الكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."» *المطي* [@"..username.."]\n"
else
t = t..""..k.."» *المطي* `"..v.."`\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد مطايه*"
end
send(msg.chat_id_, msg.id_, t)
end
if (text == ("تنزيل الحاته")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Hata:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيل عضو من الحاتات*\n*⋄︙امشي لج مو خوش حاته*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if (text == ("رفع الحاته")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Hata:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم رفعها حاته في المجموعه*\n*⋄︙تعالي يحاته ممكن نتعرف*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text == "مسح الحاتات" and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Hata:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح  قائمة الحاته*")
end
if text == ("تاك للحاتات") and Owner(msg) then
local list = database:smembers(bot_id.."MeRo:Hata:User"..msg.chat_id_)
t = "\n *⋄︙قائمة حاتات الكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."» *الحاته* [@"..username.."]\n"
else
t = t..""..k.."» *الحاته* "..v.."\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد حاتات*"
end
send(msg.chat_id_, msg.id_, t)
end
if (text == ("تنزيل الحات")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Haat:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيل عضو من الحاتين*\n*⋄︙طلعت اجكم ابو وصخ*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if (text == ("رفع الحات")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Haat:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم رفعه حات المجموعه*\n*⋄︙وفف فديت الحات الحلو*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text == "مسح الحاتين" and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Haat:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح  قائمة الحاتين*")
end
if text == ("تاك للحاتين") and Owner(msg) then
local list = database:smembers(bot_id.."MeRo:Haat:User"..msg.chat_id_)
t = "\n *⋄︙قائمة الحاتين الكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."» *الحات* [@"..username.."]\n"
else
t = t..""..k.."» *الحات* "..v.."\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد حاتين*"
end
send(msg.chat_id_, msg.id_, t)
end
if (text == ("تنزيل صخل")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Sahl:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيل عضو من الصخوله*\n*⋄︙رجع بيتكم حبي*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if (text == ("رفع صخل")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Sahl:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم رفع المتهم صخل بالمجموعة*\n*⋄︙الان اصبح صخل كروب*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text == "مسح الصخوله" and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Sahl:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح  قائمة الصخوله*")
end
if text == ("تاك للصخوله") and Owner(msg) then
local list = database:smembers(bot_id.."MeRo:Sahl:User"..msg.chat_id_)
t = "\n *⋄︙قائمة صخوله الكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."» *الصخل* [@"..username.."]\n"
else
t = t..""..k.."» *الصخل* "..v.."\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد صخوله*"
end
send(msg.chat_id_, msg.id_, t)
end
if (text == ("تنزيل زاحف")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Zahf:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيل العضو الزاحف*\n*⋄︙هاك عمري اخذ رقمك*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if (text == ("رفع زاحف")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Zahf:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم رفعه زاحف المجموعه*\n*⋄︙كمشتك تزحف ع صاكات*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text == "مسح الزواحف" and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Zahf:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح  قائمة الزواحف*")
end
if text == ("تاك للزواحف") and Owner(msg) then
local list = database:smembers(bot_id.."MeRo:Zahf:User"..msg.chat_id_)
t = "\n *⋄︙قائمة الزواحف الكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."» *الزاحف* [@"..username.."]\n"
else
t = t..""..k.."» *الزاحف* "..v.."\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد زواحف*"
end
send(msg.chat_id_, msg.id_, t)
end
if (text == ("تنزيل زاحفه")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Zahfa:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيل العضو من الزاحفات*\n*⋄︙تعالي لمي غراضج وتوكلي*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if (text == ("رفع زاحفه")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Zahfa:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم رفعها زاحفه الكروب*\n*⋄︙ها زاحفه دورين حلوين*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text == "مسح الزاحفات" and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Zahfa:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح  قائمة الزاحفات*")
end
if text == ("تاك للزاحفات") and Owner(msg) then
local list = database:smembers(bot_id.."MeRo:Zahfa:User"..msg.chat_id_)
t = "\n *⋄︙قائمة الزاحفات الكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."» *الزاحفه* [@"..username.."]\n"
else
t = t..""..k.."» *الزاحفه* "..v.."\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد زاحفات*"
end
send(msg.chat_id_, msg.id_, t)
end
if (text == ("تنزيل مرتي")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Mrrte:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيلها مرتك بالمجموعة*\n*⋄︙مشي شوفي واحد غيري*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if (text == ("رفع مرتي")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Mrrte:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم رفعها مرتك بالمجموعه*\n*⋄︙صارت مرتي لحد يوصلها بعد*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text == "مسح مرتي" and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Mrrte:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح  قائمة مرتي*")
end
if text == ("تاك للمرتي") and Owner(msg) then
local list = database:smembers(bot_id.."MeRo:Mrrte:User"..msg.chat_id_)
t = "\n *⋄︙قائمة مرتي الكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."» *مرتي* [@"..username.."]\n"
else
t = t..""..k.."» *مرتي* "..v.."\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد مرتي*"
end
send(msg.chat_id_, msg.id_, t)
end
if (text == ("تنزيل زوجي")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Zoge:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيله زوجج بكروب*\n*⋄︙مشي ولي خاين*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if (text == ("رفع زوجي")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Zoge:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم رفعه زوجي بالكروب*\n*⋄︙زوجي صاك لحد يوصله*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text == "مسح زوجي" and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Zoge:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح  قائمة زوجي*")
end
if text == ("تاك للزوجي") and Owner(msg) then
local list = database:smembers(bot_id.."MeRo:Zoge:User"..msg.chat_id_)
t = "\n *⋄︙قائمة زوجي الكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."» *زوجي* [@"..username.."]\n"
else
t = t..""..k.."» *زوجي* "..v.."\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد متزوجين*"
end
send(msg.chat_id_, msg.id_, t)
end
if (text == ("تنزيل من كلبي")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:lbee:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيله من كلبك*\n*⋄︙طلع من كلبي ماريدك*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if (text == ("رفع بكلبي")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:lbee:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم رفعه بكلبي*\n*⋄︙تع ادخل بكلبي ولاتطلع منه*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text == "مسح بكلبي" and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:lbee:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح  قائمة كلبي*")
end
if text == ("تاك للبكلبي") and Owner(msg) then
local list = database:smembers(bot_id.."MeRo:lbee:User"..msg.chat_id_)
t = "\n *⋄︙قائمة بكلبي الكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."» *بكلبي* [@"..username.."]\n"
else
t = t..""..k.."» *بكلبي* "..v.."\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد احد بكلبي*"
end
send(msg.chat_id_, msg.id_, t)
end
if (text == ("تنزيل تاج")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Tajj:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيله تاج الكروب*\n*⋄︙مشي ماريدك تاج هنا*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if (text == ("رفع التاج")) and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Tajj:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم رفعه تاج بالكروب*\n*⋄︙تع خليك ع راسي حبيبي*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text == "مسح تاج" and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Tajj:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح  قائمة تاج*")
end
if text == ("تاك للتاج") and Owner(msg) then
local list = database:smembers(bot_id.."MeRo:Tajj:User"..msg.chat_id_)
t = "\n *⋄︙قائمة تاج الكروب* \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."» *التاج* [@"..username.."]\n"
else
t = t..""..k.."» *التاج* "..v.."\n"
end
end
if #list == 0 then
t = " *⋄︙لا يوجد احد تاج*"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("رفع مميز") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) and GetChannelMember(msg) then
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'*⋄︙لا تستطيع رفع احد وذلك لان تم تعطيل الرفع من قبل المنشئين*')
return false
end
function Function_MeRo(extra, result, success)
database:sadd(bot_id.."MeRo:Special:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم ترقيته مميز للمجموعه*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^رفع مميز @(.*)$") and Addictive(msg) and GetChannelMember(msg) then
local username = text:match("^رفع مميز @(.*)$") 
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'*⋄︙لا تستطيع رفع احد وذلك لان تم تعطيل الرفع من قبل المنشئين*')
return false
end
function Function_MeRo(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
database:sadd(bot_id.."MeRo:Special:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم ترقيته مميز للمجموعه*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end

if text and text:match("^رفع مميز (%d+)$") and Addictive(msg) and GetChannelMember(msg) then
local userid = text:match("^رفع مميز (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'*⋄︙لا تستطيع رفع احد وذلك لان تم تعطيل الرفع من قبل المنشئين*')
return false
end
database:sadd(bot_id.."MeRo:Special:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم ترقيته مميز للمجموعه*")  
return false
end

if (text == ("تنزيل مميز")) and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تنزيله من المميزين*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^تنزيل مميز @(.*)$") and Addictive(msg) and GetChannelMember(msg) then
local username = text:match("^تنزيل مميز @(.*)$") 
function Function_MeRo(extra, result, success)
if result.id_ then
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم تنزيله من المميزين*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^تنزيل مميز (%d+)$") and Addictive(msg) and GetChannelMember(msg) then
local userid = text:match("^تنزيل مميز (%d+)$") 
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم تنزيله من المميزين*")  
return false
end  
if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 and Addictive(msg) then
local RTPA = text:match("رفع (.*)")
if database:sismember(bot_id.."MeRo:Coomds"..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local MeRort = database:get(bot_id.."MeRo:Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if MeRort == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"⋄︙العضو » ["..data.first_name_.."](t.me/"..(data.username_ or "YYYDR")..")".."\n⋄︙تم رفعه "..RTPA.." هنا\n")
database:set(bot_id.."MeRo:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA) 
database:sadd(bot_id.."MeRo:Special:User"..msg.chat_id_,result.sender_user_id_)  
elseif MeRort == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"⋄︙العضو » ["..data.first_name_.."](t.me/"..(data.username_ or "YYYDR")..")".."\n⋄︙تم رفعه "..RTPA.." هنا\n")
database:set(bot_id.."MeRo:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA)
database:sadd(bot_id.."MeRo:Mod:User"..msg.chat_id_,result.sender_user_id_)  
elseif MeRort == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"⋄︙العضو » ["..data.first_name_.."](t.me/"..(data.username_ or "YYYDR")..")".."\n⋄︙تم رفعه "..RTPA.." هنا\n")
database:set(bot_id.."MeRo:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA)  
database:sadd(bot_id.."MeRo:Manager"..msg.chat_id_,result.sender_user_id_)  
elseif MeRort == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"⋄︙العضو » ["..data.first_name_.."](t.me/"..(data.username_ or "YYYDR")..")".."\n⋄︙تم رفعه "..RTPA.." هنا\n")
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 and Addictive(msg) then  
local RTPA = text:match("تنزيل (.*)")
if database:sismember(bot_id.."MeRo:Coomds"..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local MeRort = database:get(bot_id.."MeRo:Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if MeRort == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙العضو »* ["..data.first_name_.."](t.me/"..(data.username_ or "YYYDR")..")".."\n*⋄︙تم تنزيله من "..RTPA.." هنا*\n")
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."MeRo:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif MeRort == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"*⋄︙العضو »* ["..data.first_name_.."](t.me/"..(data.username_ or "YYYDR")..")".."\n*⋄︙تم تنزيله من "..RTPA.." هنا*\n")
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_,result.sender_user_id_) 
database:del(bot_id.."MeRo:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif MeRort == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙العضو »* ["..data.first_name_.."](t.me/"..(data.username_ or "YYYDR")..")".."\n*⋄︙تم تنزيله من "..RTPA.." هنا*\n")
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."MeRo:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif MeRort == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙العضو »* ["..data.first_name_.."](t.me/"..(data.username_ or "YYYDR")..")".."\n*⋄︙تم تنزيله من "..RTPA.." هنا*\n")
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") and Addictive(msg) then  
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if database:sismember(bot_id.."MeRo:Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local MeRort = database:get(bot_id.."MeRo:Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if MeRort == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙العضو »* ["..result.title_.."](t.me/"..(text1[3] or "YYYDR")..")".."\n*⋄︙تم رفعه "..text1[2].." هنا*")
database:sadd(bot_id.."MeRo:Special:User"..msg.chat_id_,result.id_)  
database:set(bot_id.."MeRo:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif MeRort == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"*⋄︙العضو »* ["..result.title_.."](t.me/"..(text1[3] or "YYYDR")..")".."\n*⋄︙تم رفعه "..text1[2].." هنا*")
database:sadd(bot_id.."MeRo:Mod:User"..msg.chat_id_,result.id_)  
database:set(bot_id.."MeRo:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif MeRort == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙العضو »* ["..result.title_.."](t.me/"..(text1[3] or "YYYDR")..")".."\n*⋄︙تم رفعه "..text1[2].." هنا*")
database:sadd(bot_id.."MeRo:Manager"..msg.chat_id_,result.id_)  
database:set(bot_id.."MeRo:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif MeRort == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙العضو »* ["..result.title_.."](t.me/"..(text1[3] or "YYYDR")..")".."\n*⋄︙تم رفعه "..text1[2].." هنا*")
end
else
info = "*⋄︙المعرف غلط*"
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") and Addictive(msg) then  
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if database:sismember(bot_id.."MeRo:Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local MeRort = database:get(bot_id.."MeRo:Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if MeRort == "مميز" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙العضو »* ["..result.title_.."](t.me/"..(text1[3] or "YYYDR")..")".."\n*⋄︙تم تنزيله من "..text1[2].." هنا*")
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_,result.id_)  
database:del(bot_id.."MeRo:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif MeRort == "ادمن" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"*⋄︙العضو »* ["..result.title_.."](t.me/"..(text1[3] or "YYYDR")..")".."\n*⋄︙تم تنزيله من "..text1[2].." هنا*")
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_,result.id_)  
database:del(bot_id.."MeRo:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif MeRort == "مدير" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙العضو »* ["..result.title_.."](t.me/"..(text1[3] or "YYYDR")..")".."\n*⋄︙تم تنزيله من "..text1[2].." هنا*")
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_,result.id_)  
database:del(bot_id.."MeRo:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif MeRort == "عضو" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙العضو »* ["..result.title_.."](t.me/"..(text1[3] or "YYYDR")..")".."\n*⋄︙تم تنزيله من "..text1[2].." هنا*")
end
else
info = "*⋄︙المعرف غلط*"
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
if text == ("حظر") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) and GetChannelMember(msg) then
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'*⋄︙لقد تم تعطيل الحظر و الطرد من قبل المنشئين*')
return false
end
function Function_MeRo(extra, result, success)
if result.sender_user_id_ == tonumber(1425830897) then
send(msg.chat_id_, msg.id_, "*⋄︙لا يمكن { حظر } Telegram Developer \n*")
return false
end
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع حظر ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )*")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"*⋄︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !*") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"*⋄︙البوت ليس ادمن يرجى ترقيتي !*") 
return false  
end
database:sadd(bot_id.."MeRo:Ban:User"..msg.chat_id_, result.sender_user_id_)
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم حظره من المجموعه*")  
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text == "هينه" or text == "هينها" and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'*البوت ليس مشرف يرجى ترقيتي *!') 
return false  
end
heen = {
"- حبيبي علاج الجاهل التجاهل ."
,"- مالي خلك زبايل التلي . "
,"- كرامتك صارت بزبل פَــبي ."
,"- مو صوجك صوج الكواد الزمك جهاز ."
,"- لفارغ استجن . "
,"- ملطلط دي ."
};
sendheen = heen[math.random(#heen)]
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.reply_to_message_id_,sendheen)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^حظر @(.*)$") and Addictive(msg) and GetChannelMember(msg) then
local username = text:match("^حظر @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'*⋄︙لقد تم تعطيل الحظر و الطرد من قبل المنشئين*')
return false
end
function Function_MeRo(extra, result, success)
if result.id_ then
if result.id_ == tonumber(1425830897) then
send(msg.chat_id_, msg.id_, "*⋄︙لا يمكن حظر مطور السورس* \n")
return false
end
if result.id_ == tonumber(Id_Sudo) then
send(msg.chat_id_, msg.id_, "*⋄︙لا يمكن حظر مطور البوت* \n")
return false
end
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع حظر ( "..Get_Rank(result.id_,msg.chat_id_).." )*")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"*⋄︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !*") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"*⋄︙البوت ليس ادمن يرجى ترقيتي !*") 
return false  
end
database:sadd(bot_id.."MeRo:Ban:User"..msg.chat_id_, result.id_)
Kick_Group(msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم حظره من المجموعه*")  
end,nil)   
end
else
send(msg.chat_id_, msg.id_, "*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^حظر (%d+)$") and Addictive(msg) and GetChannelMember(msg) then
local userid = text:match("^حظر (%d+)$") 
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'*⋄︙لقد تم تعطيل الحظر و الطرد من قبل المنشئين*')
return false
end
if userid == tonumber(Id_Sudo) then
send(msg.chat_id_, msg.id_, "*⋄︙لا يمكن حظر مطور البوت* \n")
return false
end
if userid == tonumber(1425830897) then
send(msg.chat_id_, msg.id_, "*⋄︙لا يمكن { حظر } Telegram Developer \n*")
return false
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع حظر ( "..Get_Rank(userid,msg.chat_id_).." )*")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"*⋄︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !*") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"*⋄︙البوت ليس ادمن يرجى ترقيتي !*") 
return false  
end
database:sadd(bot_id.."MeRo:Ban:User"..msg.chat_id_, userid)
Kick_Group(msg.chat_id_, userid)  
Reply_Status(msg,userid,"reply","*⋄︙تم حظره من المجموعه*")  
end,nil)   
end
return false
end
if text == ("الغاء حظر") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "*⋄️︙انا لست محظورا \n*") 
return false 
end
database:srem(bot_id.."MeRo:Ban:User"..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم الغاء حظره من هنا*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^الغاء حظر @(.*)$") and Addictive(msg) and GetChannelMember(msg) then
local username = text:match("^الغاء حظر @(.*)$") 
function Function_MeRo(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "*⋄️︙انا لست محظورا \n*") 
return false 
end
database:srem(bot_id.."MeRo:Ban:User"..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,result.id_,"reply","*⋄︙تم الغاء حظره من هنا*")  
else
send(msg.chat_id_, msg.id_, "*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^الغاء حظر (%d+)$") and Addictive(msg) and GetChannelMember(msg) then
local userid = text:match("^الغاء حظر (%d+)$") 
if tonumber(userid) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "*⋄️︙انا لست محظورا \n*") 
return false 
end
database:srem(bot_id.."MeRo:Ban:User"..msg.chat_id_, userid)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,userid,"reply","*⋄︙تم الغاء حظره من هنا*")  
return false
end
if text == ("كتم") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
if result.sender_user_id_ == tonumber(1425830897) then
send(msg.chat_id_, msg.id_, "*⋄︙لا يمكن كتم Telegram Developer* \n")
return false
end
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n⋄︙عذرا لا تستطيع طرد او حظر او كتم او تقييد ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
return false 
end     
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"*⋄︙البوت ليس ادمن يرجى ترقيتي !*") 
return false  
end
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم كتمه من هنا*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^كتم @(.*)$") and Addictive(msg) and GetChannelMember(msg) then
local username = text:match("^كتم @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"*⋄︙البوت ليس ادمن يرجى ترقيتي !*") 
return false  
end
function Function_MeRo(extra, result, success)
if result.id_ then
if result.id_ == tonumber(1425830897) then
send(msg.chat_id_, msg.id_, "*⋄︙لا يمكن كتم Telegram Developer* \n")
return false
end
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع كتم ( "..Get_Rank(result.id_,msg.chat_id_).." )*")
return false
end     
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم كتمه من هنا*")  
else
send(msg.chat_id_, msg.id_, "*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^كتم (%d+)$") and Addictive(msg) and GetChannelMember(msg) then
local userid = text:match("^كتم (%d+)$")
if userid == tonumber(1425830897) then
send(msg.chat_id_, msg.id_, "*⋄︙لا يمكن كتم Telegram Developer* \n")
return false
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع كتم ( "..Get_Rank(userid,msg.chat_id_).." )*")
else
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"*⋄︙البوت ليس ادمن يرجى ترقيتي !*") 
return false  
end
database:sadd(bot_id.."MeRo:Muted:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم كتمه من هنا*")  
end
return false
end
if text == ("الغاء كتم") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
database:srem(bot_id.."MeRo:Muted:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم الغاء كتمه من هنا*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
if text and text:match("^الغاء كتم @(.*)$") and Addictive(msg) then
local username = text:match("^الغاء كتم @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
database:srem(bot_id.."MeRo:Muted:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم الغاء كتمه من هنا*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text and text:match("^الغاء كتم (%d+)$") and Addictive(msg) and GetChannelMember(msg) then
local userid = text:match("^الغاء كتم (%d+)$") 
database:srem(bot_id.."MeRo:Muted:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم الغاء كتمه من هنا*")  
return false
end
if text == 'قفل الفارسيه' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id..'MeRo:MeRo:lock:Fshar'..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄︙تم قفـل الفارسيه*")  
end
if text and database:get(bot_id..'MeRo:lock:Fshar'..msg.chat_id_) and not Addictive(msg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text == 'فتح الفارسيه' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id..'MeRo:MeRo:lock:Fshar'..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄︙تـم فـتح الفارسيه*\n")  
end
if text == 'قفل الفشار' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id..'MeRo:lock:Fshar'..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄︙تم قفـل الفشار*")  
end
if text and database:get(bot_id..'MeRo:MeRo:lock:Fshar'..msg.chat_id_) and not Addictive(msg) then 
list = {"ڄ","که","پی","خسته","برم","راحتی","بیام","بپوشم","كرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text == 'فتح الفشار' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id..'MeRo:lock:Fshar'..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"lock","*⋄︙تـم فـتح الفشار*\n")  
end
if text == ("تقيد") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع تقييد ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )*")
else
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم تقييده في المجموعه*")  
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد @(.*)$") and Addictive(msg) and GetChannelMember(msg) then
local username = text:match("^تقيد @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
if Rank_Checking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع تقييد ( "..Get_Rank(result.id_,msg.chat_id_).." )*")
return false 
end
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم تقييده في المجموعه*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد (%d+)$") and Addictive(msg) and GetChannelMember(msg) then
local userid = text:match("^تقيد (%d+)$")
if Rank_Checking(userid, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع تقييد ( "..Get_Rank(userid,msg.chat_id_).." )*")
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid)
Reply_Status(msg,userid,"reply","*⋄︙تم تقييده في المجموعه*")  
end
return false
end
------------------------------------------------------------------------
if text == ("الغاء تقيد") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم الغاء تقييده*")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد @(.*)$") and Addictive(msg) and GetChannelMember(msg) then
local username = text:match("^الغاء تقيد @(.*)$")
function Function_MeRo(extra, result, success)
if result.id_ then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,result.id_,"reply","*⋄︙تم الغاء تقييده*")  
else
send(msg.chat_id_, msg.id_, "*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد (%d+)$") and Addictive(msg) and GetChannelMember(msg) then
local userid = text:match("^الغاء تقيد (%d+)$")
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,userid,"reply","*⋄︙تم الغاء تقييده*")  
return false
end
if text == ("طرد") and msg.reply_to_message_id_ ~=0 and Addictive(msg) and GetChannelMember(msg) then
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'*⋄︙لقد تم تعطيل الحظر و الطرد من قبل المنشئين*')
return false
end
function Function_MeRo(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع طرد ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )*")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"*⋄︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !*") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"*⋄︙البوت ليس ادمن يرجى ترقيتي !*") 
return false  
end
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*⋄︙تم طرده من هنا*")  
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end  
if text and text:match("^طرد @(.*)$") and Addictive(msg) and GetChannelMember(msg) then
local username = text:match("^طرد @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'*⋄︙لقد تم تعطيل الحظر و الطرد من قبل المنشئين*')
return false
end
function Function_MeRo(extra, result, success)
if result.id_ then
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع طرد ( "..Get_Rank(result.id_,msg.chat_id_).." )*")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"*⋄︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !*") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"*⋄︙البوت ليس ادمن يرجى ترقيتي !*") 
return false  
end
Kick_Group(msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","*⋄︙تم طرده من هنا*")  
end,nil)   
end
else
send(msg.chat_id_, msg.id_, "*⋄︙لا يوجد حساب بهاذا المعرف*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end  
if text and text:match("^طرد (%d+)$") and Addictive(msg) and GetChannelMember(msg) then
local userid = text:match("^طرد (%d+)$") 
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'*⋄︙لقد تم تعطيل الحظر و الطرد من قبل المنشئين*')
return false
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا تستطيع طرد ( "..Get_Rank(userid,msg.chat_id_).." )*")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"⋄︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"*⋄︙البوت ليس ادمن يرجى ترقيتي !*") 
return false  
end
Kick_Group(msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*⋄︙تم طرده من هنا*")  
end,nil)   
end
return false
end
if text == "تعطيل الطرد" or text == "تعطيل الحظر" and GetChannelMember(msg) then
if Constructor(msg) then
database:set(bot_id.."Ban:Cheking"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, '⋄︙تم تعطيل » الحظر ~ والطرد ')
return false
end
end
if text == "تفعيل الطرد" or text == "تفعيل الحظر" and GetChannelMember(msg) then
if Constructor(msg) then
database:del(bot_id.."Ban:Cheking"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '⋄︙تم تفعيل » الحظر ~ والطرد ')
return false
end
end
if text == "تعطيل الرفع" or text == "تعطيل الترقيه" and GetChannelMember(msg) then
if Constructor(msg) then
database:set(bot_id.."Add:Group:Cheking"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, '*⋄︙تم تعطيل رفع » الادمن ~ المميز *')
return false
end
end
if text == "تفعيل الرفع" or text == "تفعيل الترقيه" and GetChannelMember(msg) then
if Constructor(msg) then
database:del(bot_id.."Add:Group:Cheking"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '*⋄︙تم تفعيل رفع » الادمن ~ المميز *')
return false
end
end
if text and text:match("^وضع لقب (.*)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local timsh = text:match("^وضع لقب (.*)$")
function start_function(extra, result, success)
local chek = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..bot_id)
local getInfo = JSON.decode(chek)
if getInfo.result.can_promote_members == false then
send(msg.chat_id_, msg.id_,'*⋄︙لا يمكنني تعديل  او وضع لقب ليس لدي صلاحيه*') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n*⋄︙العضو »* ['..data.first_name_..'](t.me/'..(data.username_ or 'MeRo')..') '
status  = '\n*⋄︙الايدي »* '..result.sender_user_id_..'\n*⋄︙تم ضافه {'..timsh..'} كلقب له*'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
https.request("https://api.telegram.org/bot"..token.."/setChatAdministratorCustomTitle?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&custom_title="..timsh)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == 'لقبه' and tonumber(msg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
send(msg.chat_id_, msg.id_,'*⋄︙ لقبه هو :* '..getcustom(msg,result)) 
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text == 'لقبي' and tonumber(msg.reply_to_message_id_) == 0 then
send(msg.chat_id_, msg.id_,'*⋄︙ لقبك هو :* '..getcustom(msg,msg)) 
end
if text and text:match("^وضع لقب (.*)$") and msg.reply_to_message_id_ and Constructor(msg) then
local timsh = text:match("^وضع لقب (.*)$")
function start_function(extra, result, success)
local chek = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..bot_id)
local getInfo = JSON.decode(chek)
if getInfo.result.can_promote_members == false then
send(msg.chat_id_, msg.id_,'*⋄︙لا يمكنني تعديل  او وضع لقب ليس لدي صلاحيه*') 
return false  
end
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=true&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
okfalse = json:decode(https.request("https://api.telegram.org/bot"..token.."/setChatAdministratorCustomTitle?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&custom_title="..timsh) ) 
if okfalse.ok == false then
send(msg.chat_id_, msg.id_,'*⋄︙لا يمكن وضع او تعديل لقب له*') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n*⋄︙العضو »* ['..data.first_name_..'](t.me/'..(data.username_ or 'YYYDR')..') '
status  = '\n*⋄︙الايدي »* '..result.sender_user_id_..'\n*⋄︙تم ضافه {'..timsh..'} كلقب له*'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == "فحص البوت" and Owner(msg) then
local chek = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..bot_id)
local getInfo = JSON.decode(chek)
if getInfo.ok == true then
if getInfo.result.can_change_info == true then
INf = 'مفعله' 
else 
INf = 'غير مفعله' 
end
if getInfo.result.can_delete_messages == true then
DEL = 'مفعله' 
else 
DEL = 'غير مفعله' 
end
if getInfo.result.can_invite_users == true then
INv = 'مفعله' 
else
INv = 'غير مفعله' 
end
if getInfo.result.can_pin_messages == true then
Pin = 'مفعله' 
else
Pin = 'غير مفعله' 
end
if getInfo.result.can_restrict_members == true then
REs = 'مفعله' 
else 
REs = 'غير مفعله' 
end
if getInfo.result.can_promote_members == true then
PRo = 'مفعله'
else
PRo = 'غير مفعله'
end 
send(msg.chat_id_, msg.id_,'\n*⋄︙صلاحيات البوت هي* \n— — — — — — — — — — — — — —\n*⋄︙تغير معلومات المجموعة : '..INf..'*\n*⋄︙حذف الرسائل : '..DEL..'*\n*⋄︙حظر المستخدمين : '..REs..'*\n*⋄︙دعوة المستخدمين : '..INv..'*\n*⋄︙ثتبيت الرسالة : '..Pin..'*\n*⋄︙اضافة مشرفين : '..PRo..'*')   
end
end
if text ==("تثبيت") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) and GetChannelMember(msg) then
if database:sismember(bot_id.."MeRo:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"*⋄︙التثبيت والغاء التثبيت تم قفله من قبل المنشئين*")  
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"*⋄︙تم تثبيت الرساله*")   
database:set(bot_id.."MeRo:Pin:Id:Msg"..msg.chat_id_,msg.reply_to_message_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"*⋄︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله*")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"*⋄︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات*")  
end
end,nil) 
end
if text == "الغاء التثبيت" and Addictive(msg) and GetChannelMember(msg) then
if database:sismember(bot_id.."MeRo:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"*⋄︙التثبيت والغاء التثبيت تم قفله من قبل المنشئين*")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء تثبيت الرساله*")   
database:del(bot_id.."MeRo:Pin:Id:Msg"..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"*⋄︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله*")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"*⋄︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات*")  
end
end,nil)
end
if text == 'الغاء تثبيت الكل' and Addictive(msg) and GetChannelMember(msg) then
if database:sismember(bot_id.."MeRo:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"*⋄︙التثبيت والغاء التثبيت تم قفله من قبل المنشئين*")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء تثبيت الكل*")   
https.request('https://api.telegram.org/bot'..token..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
database:del(bot_id.."MeRo:Pin:Id:Msg"..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"*⋄︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله*")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"*⋄︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات*")  
end
end,nil)
end
if text and text:match("^وضع تكرار (%d+)$") and Addictive(msg) then   
local Num = text:match("وضع تكرار (.*)")
database:hset(bot_id.."MeRo:flooding:settings:"..msg.chat_id_ ,"floodmax" ,Num) 
send(msg.chat_id_, msg.id_,"*⋄︙تم وضع عدد التكرار ("..Num..")*")  
end
if text and text:match("^وضع زمن التكرار (%d+)$") and Addictive(msg) then   
local Num = text:match("^وضع زمن التكرار (%d+)$")
database:hset(bot_id.."MeRo:flooding:settings:"..msg.chat_id_ ,"floodtime" ,Num) 
send(msg.chat_id_, msg.id_,"*⋄︙تم وضع زمن التكرار ("..Num..")*") 
end
if text == "ضع رابط" or text == "وضع رابط" and GetChannelMember(msg) then
if msg.reply_to_message_id_ == 0  and Addictive(msg) then  
send(msg.chat_id_,msg.id_,"*⋄︙ارسل رابط المجموعه او رابط قناة المجموعه*")
database:setex(bot_id.."MeRo:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_,120,true) 
return false
end
end
if text == "الرابط" and GetChannelMember(msg) then
local status_Link = database:get(bot_id.."MeRo:Link_Group"..msg.chat_id_)
if not status_Link then
send(msg.chat_id_, msg.id_,"*⋄︙الرابط معطل اكتب تفعيل الرابط*") 
return false  
end
local link = database:get(bot_id.."MeRo:Private:Group:Link"..msg.chat_id_)            
if link then                              
send(msg.chat_id_,msg.id_,"*⋄︙LinK GrOup :* \n— — — — — — — — — — — — — —\n ["..link.."]")                          
else                
local InviteLink = json:decode(https.request("https://api.telegram.org/bot"..token.."/getChat?chat_id="..msg.chat_id_))
if InviteLink.result.invite_link then
jk = InviteLink.result.invite_link
elseif not InviteLink.result.invite_link then
https.request("https://api.telegram.org/bot"..token.."/exportChatInviteLink?chat_id="..msg.chat_id_)
jk = InviteLink.result.invite_link
end 
send(msg.chat_id_,msg.id_,"*⋄︙LinK GrOup :* \n— — — — — — — — — — — — — —\n ["..jk.."]")                          
end            
end
if text == "تفعيل جلب الرابط" or text == 'تفعيل الرابط' and GetChannelMember(msg) then
if Addictive(msg) then  
database:set(bot_id.."MeRo:Link_Group"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"*⋄︙تم تفعيل جلب الرابط المجموعه*") 
return false  
end
end
if text == "تعطيل جلب الرابط" or text == 'تعطيل الرابط' and GetChannelMember(msg) then
if Addictive(msg) then  
database:del(bot_id.."MeRo:Link_Group"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"*⋄︙تم تعطيل جلب رابط المجموعه*") 
return false end
end
if text == 'رقمي' then   
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.phone_number_  then
one_nu = "*⋄︙رقمك* {"..(result.phone_number_).."}"
else
one_nu = "*⋄︙تم وضع رقمك لجهاتك اتصالك فقط*"
end      
send(msg.chat_id_, msg.id_,one_nu) 
end,nil)
end 
if text == 'ايديي' then   
send(msg.chat_id_, msg.id_,'*⋄︙ايديك ⇠ *'..msg.sender_user_id_)
end
if text == "مسح الرابط" or text == "حذف الرابط" and GetChannelMember(msg) then
if Addictive(msg) then     
send(msg.chat_id_,msg.id_,"*⋄︙تم مسح الرابط *")           
database:del(bot_id.."MeRo:Private:Group:Link"..msg.chat_id_) 
return false      
end
return false  
end
if text and text:match("^ضع صوره") and Addictive(msg) and msg.reply_to_message_id_ == 0 or text and text:match("^وضع صوره") and Addictive(msg) and msg.reply_to_message_id_ == 0 and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_,"*⋄︙ارسل لي الصوره*") 
return false
end
if text == "حذف الصوره" or text == "مسح الصوره" and GetChannelMember(msg) then
if Addictive(msg) then
https.request("https://api.telegram.org/bot"..token.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"*⋄︙تم ازالة صورة المجموعه*") 
end
return false  
end
if text == "ضع وصف" or text == "وضع وصف" and GetChannelMember(msg) then
if Addictive(msg) then
database:setex(bot_id.."MeRo:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الان الوصف*")
end
return false  
end
if text == "ضع ترحيب" or text == "وضع ترحيب" and GetChannelMember(msg) then
if Addictive(msg) then
database:setex(bot_id.."MeRo:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
t  = "*⋄︙ارسل لي الترحيب الان*"
tt = "\n*⋄︙تستطيع اضافة مايلي !*\n*⋄︙دالة عرض الاسم »*{`name`}\n*⋄︙دالة عرض المعرف »*{`user`}"
send(msg.chat_id_, msg.id_,t..tt) 
end
return false  
end
if text == "الترحيب" and Addictive(msg) and GetChannelMember(msg) then
if database:get(bot_id.."MeRo:Get:Welcome:Group"..msg.chat_id_)   then 
Welcome = database:get(bot_id.."MeRo:Get:Welcome:Group"..msg.chat_id_)  
else 
Welcome = "*⋄︙لم يتم تعيين ترحيب للمجموعه*"
end 
send(msg.chat_id_, msg.id_,"["..Welcome.."]") 
return false  
end
if text == "تفعيل الترحيب" and Addictive(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Chek:Welcome"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"*⋄︙تم تفعيل ترحيب المجموعه*") 
return false  
end
if text == "تعطيل الترحيب" and Addictive(msg) and GetChannelMember(msg) then
database:del(bot_id.."MeRo:Chek:Welcome"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"*⋄︙تم تعطيل ترحيب المجموعه*") 
return false  
end
if text == "مسح الترحيب" or text == "حذف الترحيب" and GetChannelMember(msg) then
if Addictive(msg) then
database:del(bot_id.."MeRo:Get:Welcome:Group"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"*⋄︙تم ازالة ترحيب المجموعه*") 
end
return false  
end
if text == "قائمه المنع" and Addictive(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Filter:msg",msg.chat_id_)
tdcli_function ({ID = "GetUser",user_id_ = bot_id},function(arg,data) 
local Text = "\n *⋄︙قائمة المنع* \n*ٴ— — — — — — — — — — — — — —*\n"
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'صور', url="https://t.me/"..data.username_.."?start=ph"..msg.chat_id_},{text = 'كلمات', url="https://t.me/"..data.username_.."?start=msg"..msg.chat_id_}},
{{text = 'متحركات', url="https://t.me/"..data.username_.."?start=gif"..msg.chat_id_},{text = 'ملصقات', url="https://t.me/"..data.username_.."?start=Sti"..msg.chat_id_}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
if text == "مسح قائمه المنع" and Addictive(msg) and GetChannelMember(msg) then
local listtext = database:smembers(bot_id.."MeRo:List:Filter:text"..msg.chat_id_)  
for k,v in pairs(listtext) do  
database:srem(bot_id.."MeRo:List:Filter:text"..msg.chat_id_,v)  
end  
local listAnimation = database:smembers(bot_id.."MeRo:List:Filter:Animation"..msg.chat_id_)  
for k,v in pairs(listAnimation) do  
database:srem(bot_id.."MeRo:List:Filter:Animation"..msg.chat_id_,v)  
end  
local listSticker = database:smembers(bot_id.."MeRo:List:Filter:Sticker"..msg.chat_id_)  
for k,v in pairs(listSticker) do  
database:srem(bot_id.."MeRo:List:Filter:Sticker"..msg.chat_id_,v)  
end  
local listPhoto = database:smembers(bot_id.."MeRo:List:Filter:Photo"..msg.chat_id_)  
for k,v in pairs(listPhoto) do  
database:srem(bot_id.."MeRo:List:Filter:Photo"..msg.chat_id_,v)  
end  
send(msg.chat_id_, msg.id_,"*⋄︙تم مسح قائمه المنع*")  
end
if text and text == "منع" and msg.reply_to_message_id_ == 0 and Addictive(msg) then       
send(msg.chat_id_, msg.id_,"*⋄︙الان ارسل الشيء الذي تريد منعه*")
database:set(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = database:get(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم منع الكلمه بنجاح*")  
database:del(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:sadd(bot_id.."MeRo:List:Filter:text"..msg.chat_id_,text)  
return false 
end  
end
if msg.content_.ID == 'MessageAnimation' then    
local tsssst = database:get(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم منع المتحركه بنجاح*")  
database:del(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:sadd(bot_id.."MeRo:List:Filter:Animation"..msg.chat_id_,msg.content_.animation_.animation_.persistent_id_)  
return false 
end  
end
if msg.content_.ID == 'MessageSticker' then    
local tsssst = database:get(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم منع الملصق بنجاح*")  
database:del(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:sadd(bot_id.."MeRo:List:Filter:Sticker"..msg.chat_id_,msg.content_.sticker_.sticker_.persistent_id_)  
return false 
end  
end
if msg.content_.ID == 'MessagePhoto' then    
local tsssst = database:get(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم منع الصوره بنجاح*")  
database:del(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:sadd(bot_id.."MeRo:List:Filter:Photo"..msg.chat_id_,msg.content_.photo_.sizes_[1].photo_.persistent_id_)  
return false 
end  
end
if text == "الغاء منع" and msg.reply_to_message_id_ == 0 and Addictive(msg) and GetChannelMember(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙الان ارسل الشيء الذي تريد منعه*")
database:set(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false 
end
if text then 
local test = database:get(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test and test == "reppp" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء منعها*")  
database:del(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:srem(bot_id.."MeRo:List:Filter:text"..msg.chat_id_,text)  
return false
end  
end
if msg.content_.ID == 'MessageAnimation' then    
local onte = database:get(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if onte and onte == "reppp" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء منع المتحركه بنجاح*")  
database:del(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:srem(bot_id.."MeRo:List:Filter:Animation"..msg.chat_id_,msg.content_.animation_.animation_.persistent_id_)  
return false
end  
end
if msg.content_.ID == 'MessageSticker' then    
local Stic = database:get(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if Stic and Stic == "reppp" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء منع الملصق بنجاح*")  
database:del(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:srem(bot_id.."MeRo:List:Filter:Sticker"..msg.chat_id_,msg.content_.sticker_.sticker_.persistent_id_)  
return false
end  
end
if msg.content_.ID == 'MessagePhoto' then    
local hoto = database:get(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if hoto and hoto == "reppp" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء منع الصوره بنجاح*")  
database:del(bot_id.."MeRo:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:srem(bot_id.."MeRo:List:Filter:Photo"..msg.content_.photo_.sizes_[1].photo_.persistent_id_)  
return false
end  
end
if text == "طرد البوتات" and Addictive(msg) and GetChannelMember(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah)  
local admins = tah.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if tah.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(bot_id) then
Kick_Group(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
send(msg.chat_id_, msg.id_, "*⋄︙لا توجد بوتات في المجموعه*")
else
local t = "*⋄︙عدد البوتات هنا >> {"..c.."}*\n*⋄︙عدد البوتات التي هي ادمن >> {"..x.."}*\n*⋄︙تم طرد >> {"..(c - x).."} من البوتات*"
send(msg.chat_id_, msg.id_,t)
end 
end,nil)  
end   
if text == ("كشف البوتات") and Addictive(msg) and GetChannelMember(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = "\n*⋄︙قائمة البوتات الموجوده *\n— — — — — — — — — — — — — — \n"
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,ta) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
tr = ""
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
tr = " {✯}"
end
text = text..">> [@"..ta.username_.."]"..tr.."\n"
if #admins == 0 then
send(msg.chat_id_, msg.id_, "*⋄︙لا توجد بوتات في المجموعه*")
return false 
end
if #admins == i then 
local a = "\n— — — — — — — — — — — — — — \n*⋄︙عدد البوتات التي هنا >> {"..n.."} بوت*\n"
local f = "*⋄︙عدد البوتات التي هي ادمن >> {"..t.."}*\n*⋄︙ملاحضه علامة ال (✯) تعني ان البوت ادمن* \n"
send(msg.chat_id_, msg.id_, text..a..f)
end
end,nil)
end
end,nil)
end
if database:get(bot_id.."MeRo:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" then 
send(msg.chat_id_, msg.id_, "*⋄︙تم الغاء حفظ القوانين*") 
database:del(bot_id.."MeRo:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false  
end 
database:set(bot_id.."MeRo:Set:Rules:Group" .. msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"*⋄︙تم حفظ قوانين المجموعه*") 
database:del(bot_id.."MeRo:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end  
if text == "ضع قوانين" or text == "وضع قوانين" and GetChannelMember(msg) then
if Addictive(msg) then
database:setex(bot_id.."MeRo:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_,msg.id_,"*⋄︙ارسل لي القوانين الان*")  
end
end
if text == "مسح القوانين" or text == "حذف القوانين" and GetChannelMember(msg) then
if Addictive(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙تم ازالة قوانين المجموعه*")  
database:del(bot_id.."MeRo:Set:Rules:Group"..msg.chat_id_) 
end
end
if text == "القوانين" and GetChannelMember(msg) then
local Set_Rules = database:get(bot_id.."MeRo:Set:Rules:Group" .. msg.chat_id_)   
if Set_Rules then     
send(msg.chat_id_,msg.id_, Set_Rules)   
else      
send(msg.chat_id_, msg.id_,"*⋄︙لا توجد قوانين هنا*")   
end    
end
if text == "الاوامر المضافه" and Constructor(msg) and GetChannelMember(msg) then
local list = database:smembers(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_.."")
t = "⋄︙قائمه الاوامر المضافه  \n— — — — — — — — — — — — — — \n"
for k,v in pairs(list) do
Cmds = database:get(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."- ("..v..") ~ {"..Cmds.."}\n"
else
t = t..""..k.."- ("..v..") \n"
end
end
if #list == 0 then
t = "⋄︙لا توجد اوامر اضافيه"
end
send(msg.chat_id_, msg.id_,"["..t.."]")
end
if text == "حذف الاوامر المضافه" or text == "مسح الاوامر المضافه" and GetChannelMember(msg) then
if Constructor(msg) then 
local list = database:smembers(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
database:del(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"*⋄︙تم مسح جميع الاوامر التي تم اضافتها*")  
end
end
if text == "الساعه" then
local ramsesj20 = "\n*⋄︙الساعه الان :* "..os.date("%I:%M%p")
send(msg.chat_id_, msg.id_,ramsesj20)
end
if text == "التاريخ" then
local ramsesj20 =  "\n*⋄︙التاريخ :* "..os.date("%Y/%m/%d")
send(msg.chat_id_, msg.id_,ramsesj20)
end
if text == 'السيرفر' then 
send(msg.chat_id_, msg.id_, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '⇗ نظام التشغيل ⇖•\n*»» '"$linux_version"'*' 
echo '*———————————~*\n✺✔{ الذاكره العشوائيه } ⇎\n*»» '"$memUsedPrc"'*'
echo '*———————————~*\n✺✔{ وحـده الـتـخـزيـن } ⇎\n*»» '"$HardDisk"'*'
echo '*———————————~*\n✺✔{ الـمــعــالــج } ⇎\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*———————————~*\n✺✔{ الــدخــول } ⇎\n*»» '`whoami`'*'
echo '*———————————~*\n✺✔{ مـده تـشغيـل الـسـيـرفـر }⇎\n*»» '"$uptime"'*'
]]):read('*all'))  
end
if text == "ترتيب الاوامر" and Constructor(msg) then
 database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":ا","ايدي")
 database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,"ا")
 database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":م","رفع مميز")
 database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,"م")
 database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":اد","رفع ادمن")
 database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,"اد")
 database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":مد","رفع مدير")
 database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,"مد")
 database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":من","رفع منشئ")
 database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,"من")
 database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":اس","رفع منشئ اساسي")
 database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,"اس")
 database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":تعط","تعطيل الايدي بالصوره")
 database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,"تعط")
 database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":تفع","تفعيل الايدي بالصوره")
 database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,"تفع")
 database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":تك","تنزيل الكل")
 database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,"تك")
 database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":رد","اضف رد")
 database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,"رد")
 database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":حذ","حذف رد")
 database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,"حذ")
 database:set(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":ت","تثبيت")
 database:sadd(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,"ت")
 send(msg.chat_id_, msg.id_,"*⋄︙تم ترتيب الاوامر بالشكل التالي*\n*⋄︙ايدي - ا .*\n*⋄︙مميز - م .\n⋄︙ادمن - اد .*\n*⋄︙مدير - مد . \n⋄︙منشى - من .*\n*⋄︙المنشئ الاساسي - اس .*\n*⋄︙تعطيل الايدي بالصوره - تعط .*\n*⋄︙تفعيل الايدي بالصوره - تفع .*\n*⋄︙تنزيل الكل - تك .*\n*⋄︙اضف رد - رد .*\n*⋄︙حذف رد - حذ .*\n*⋄︙تثبيت - ت .*")
 end
if text == "اضف امر" and Constructor(msg) and GetChannelMember(msg) then
database:set(bot_id.."MeRo:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_,"*⋄︙الان ارسل لي الامر القديم*")  
return false
end
if text == "حذف امر" or text == "مسح امر" and GetChannelMember(msg) then
if Constructor(msg) then
database:set(bot_id.."MeRo:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الامر الذي قم بوضعه بدلا عن القديم*")  
return false
end
end
if text == "الصلاحيات" and Addictive(msg) and GetChannelMember(msg) then
local list = database:smembers(bot_id.."MeRo:Coomds"..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_,"*⋄︙لا توجد صلاحيات مضافه*")
return false
end
t = "\n*⋄︙قائمة الصلاحيات المضافه*\n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
var = database:get(bot_id.."MeRo:Comd:New:rt:bot:"..v..msg.chat_id_)
if var then
t = t..""..k.."- "..v.." ~ ("..var..")\n"
else
t = t..""..k.."- "..v.."\n"
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == "مسح الصلاحيات" then
local list = database:smembers(bot_id.."MeRo:Coomds"..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."MeRo:Comd:New:rt:bot:"..v..msg.chat_id_)
database:del(bot_id.."MeRo:Coomds"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"*⋄︙تم مسح الصلاحيات*")
end
if text and text:match("^اضف صلاحيه (.*)$") and Addictive(msg) and GetChannelMember(msg) then
ComdNew = text:match("^اضف صلاحيه (.*)$")
database:set(bot_id.."MeRo:Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
database:sadd(bot_id.."MeRo:Coomds"..msg.chat_id_,ComdNew)  
database:setex(bot_id.."MeRo:Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
send(msg.chat_id_, msg.id_, "*⋄︙ارسل نوع الصلاحيه ⋄*\n*⋄︙(عضو ~ مميز  ~ ادمن  ~ مدير )*")
end
if text and text:match("^مسح صلاحيه (.*)$") and Addictive(msg) or text and text:match("^حذف صلاحيه (.*)$") and Addictive(msg) and GetChannelMember(msg) then
ComdNew = text:match("^مسح صلاحيه (.*)$") or text:match("^حذف صلاحيه (.*)$")
database:del(bot_id.."MeRo:Comd:New:rt:bot:"..ComdNew..msg.chat_id_)
send(msg.chat_id_, msg.id_, "⋄︙تم مسح الصلاحيه ") 
end
if database:get(bot_id.."MeRo:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء الامر *") 
database:del(bot_id.."MeRo:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_"*⋄︙ارسل نوع الصلاحيه مره اخر*\n*⋄︙تستطيع اضافة صلاحيه (عضو ~ مميز  ~ ادمن )*")
return false
end
end
if text == "ادمن" then
if not Owner(msg) then 
send(msg.chat_id_, msg.id_"*⋄︙ارسل نوع الصلاحيه مره اخر*\n*⋄︙تستطيع اضافة صلاحيه ( عضو ~ مميز )*")
return false
end
end
if text == "مميز" then
if not Addictive(msg) then
send(msg.chat_id_, msg.id_"*⋄︙ارسل نوع الصلاحيه مره اخر*\n*⋄︙تستطيع اضافة صلاحيه ( عضو )*")
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = database:get(bot_id.."MeRo:Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
database:set(bot_id.."MeRo:Comd:New:rt:bot:"..textn..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, "*⋄︙تم اضافة صلاحية *") 
database:del(bot_id.."MeRo:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end
if text and text:match("^تغير رد المطور (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد المطور (.*)$") 
database:set(bot_id.."MeRo:Sudo:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"*⋄︙تم تغير رد المطور الى » "..Teext.."*")
end
if text and text:match("^تغير رد المنشئ الاساسي (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد المنشئ الاساسي (.*)$") 
database:set(bot_id.."MeRo:BasicConstructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"*⋄︙تم تغير رد المنشئ الاساسي الى » "..Teext.."*")
end
if text and text:match("^تغير رد المنشئ (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد المنشئ (.*)$") 
database:set(bot_id.."MeRo:Constructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"*⋄︙تم تغير رد المنشئ الى » "..Teext.."*")
end
if text and text:match("^تغير رد المدير (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد المدير (.*)$") 
database:set(bot_id.."MeRo:Manager:Rd"..msg.chat_id_,Teext) 
send(msg.chat_id_, msg.id_,"*⋄︙تم تغير رد المدير الى » "..Teext.."*")
end
if text and text:match("^تغير رد الادمن (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد الادمن (.*)$") 
database:set(bot_id.."MeRo:Mod:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"*⋄︙تم تغير رد الادمن الى » "..Teext.."*")
end
if text and text:match("^تغير رد المميز (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد المميز (.*)$") 
database:set(bot_id.."MeRo:Special:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"*⋄︙تم تغير رد المميز الى » "..Teext.."*")
end
if text and text:match("^تغير رد العضو (.*)$") and Owner(msg) then
local Teext = text:match("^تغير رد العضو (.*)$") 
database:set(bot_id.."MeRo:Memp:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"*⋄︙تم تغير رد العضو الى » "..Teext.."*")
end
if text == ("مسح الرتب") and BasicConstructor(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙تم مسح رتب تغير*")
database:del(bot_id.."MeRo:Sudo:Rd"..msg.chat_id_)
database:del(bot_id.."MeRo:BasicConstructor:Rd"..msg.chat_id_)
database:del(bot_id.."MeRo:Constructor:Rd"..msg.chat_id_)
database:del(bot_id.."MeRo:Manager:Rd"..msg.chat_id_) 
database:del(bot_id.."MeRo:Mod:Rd"..msg.chat_id_)
database:del(bot_id.."MeRo:Special:Rd"..msg.chat_id_)
database:del(bot_id.."MeRo:Memp:Rd"..msg.chat_id_)
end
if text == 'تنزيل جميع الرتب' and creatorA(msg) then  
database:del(bot_id..'MeRo:Basic:Constructor'..msg.chat_id_)
database:del(bot_id..'MeRo:Constructor'..msg.chat_id_)
database:del(bot_id..'MeRo:Manager'..msg.chat_id_)
database:del(bot_id..'MeRo:Mod:User'..msg.chat_id_)
database:del(bot_id..'MeRo:Special:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '\n *⋄︙تم تنزيل الكل من الرتب الاتيه* \n*⋄︙المميزين ، الادمنيه ، المدراء ، المنشئين، الاساسين* \n')
end
if text == ("مسح ردود المدير") and BasicConstructor(msg) then
local list = database:smembers(bot_id.."MeRo:List:Manager"..msg.chat_id_.."")
for k,v in pairs(list) do
database:del(bot_id.."MeRo:Add:Rd:Manager:AudioCa"..v..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:FileCa"..v..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:VideoCa"..v..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:PhotoCa"..v..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:VicoCa"..v..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:GifCa"..v..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:Gif"..v..msg.chat_id_)   
database:del(bot_id.."MeRo:Add:Rd:Manager:Vico"..v..msg.chat_id_)   
database:del(bot_id.."MeRo:Add:Rd:Manager:Stekrs"..v..msg.chat_id_)     
database:del(bot_id.."MeRo:Add:Rd:Manager:Text"..v..msg.chat_id_)   
database:del(bot_id.."MeRo:Add:Rd:Manager:Photo"..v..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:Video"..v..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:File"..v..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:Audio"..v..msg.chat_id_)
database:del(bot_id.."MeRo:List:Manager"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"*⋄︙تم مسح ردود المدير*")
end
if text == ("ردود المدير") and Owner(msg) then
local list = database:smembers(bot_id.."MeRo:List:Manager"..msg.chat_id_.."")
text = "⋄︙قائمه ردود المدير \n— — — — — — — — — — — — — —\n"
for k,v in pairs(list) do
if database:get(bot_id.."MeRo:Add:Rd:Manager:Gif"..v..msg.chat_id_) then
db = "متحركه"
elseif database:get(bot_id.."MeRo:Add:Rd:Manager:Vico"..v..msg.chat_id_) then
db = "بصمه"
elseif database:get(bot_id.."MeRo:Add:Rd:Manager:Stekrs"..v..msg.chat_id_) then
db = "ملصق"
elseif database:get(bot_id.."MeRo:Add:Rd:Manager:Text"..v..msg.chat_id_) then
db = "رساله"
elseif database:get(bot_id.."MeRo:Add:Rd:Manager:Photo"..v..msg.chat_id_) then
db = "صوره"
elseif database:get(bot_id.."MeRo:Add:Rd:Manager:Video"..v..msg.chat_id_) then
db = "فيديو"
elseif database:get(bot_id.."MeRo:Add:Rd:Manager:File"..v..msg.chat_id_) then
db = "ملف"
elseif database:get(bot_id.."MeRo:Add:Rd:Manager:Audio"..v..msg.chat_id_) then
db = "اغنيه"
end
text = text..""..k..">> ("..v..") » {"..db.."}\n"
end
if #list == 0 then
text = "*⋄︙لا يوجد ردود للمدير*"
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id.."MeRo:Text:Manager"..msg.sender_user_id_..":"..msg.chat_id_.."")
if database:get(bot_id.."MeRo:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:del(bot_id.."MeRo:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."MeRo:Add:Rd:Manager:Stekrs"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."MeRo:Add:Rd:Manager:Vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."MeRo:Add:Rd:Manager:VicoCa"..test..msg.chat_id_, rtr)  
end
end     
if msg.content_.animation_ then   
database:set(bot_id.."MeRo:Add:Rd:Manager:Gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."MeRo:Add:Rd:Manager:GifCa"..test..msg.chat_id_, rtr)  
end
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."MeRo:Add:Rd:Manager:Text"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."MeRo:Add:Rd:Manager:Audio"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."MeRo:Add:Rd:Manager:AudioCa"..test..msg.chat_id_, rtr)  
end
end  
if msg.content_.document_ then
database:set(bot_id.."MeRo:Add:Rd:Manager:File"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."MeRo:Add:Rd:Manager:FileCa"..test..msg.chat_id_, rtr)  
end
end  
if msg.content_.video_ then
database:set(bot_id.."MeRo:Add:Rd:Manager:Video"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."MeRo:Add:Rd:Manager:VideoCa"..test..msg.chat_id_, rtr)  
end
end  
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."MeRo:Add:Rd:Manager:Photo"..test..msg.chat_id_, photo_in_group)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."MeRo:Add:Rd:Manager:PhotoCa"..test..msg.chat_id_, rtr)  
end
end  
send(msg.chat_id_, msg.id_,"*⋄︙تم حفظ الرد بنجاح*")
return false  
end  
end
if text == "اضف رد" and Owner(msg) and GetChannelMember(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الكلمه التي تريد اضافتها*")
database:set(bot_id.."MeRo:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text == "حذف رد" and Owner(msg) and GetChannelMember(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الكلمه التي تريد حذفها*")
database:set(bot_id.."MeRo:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true2")
return false 
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."MeRo:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '*⋄︙الان ارسل الرد الذي تريد اضافته*')
database:set(bot_id.."MeRo:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true1")
database:set(bot_id.."MeRo:Text:Manager"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:del(bot_id.."MeRo:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."MeRo:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."MeRo:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."MeRo:Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."MeRo:Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:sadd(bot_id.."MeRo:List:Manager"..msg.chat_id_.."", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."MeRo:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_.."") == "true2" then
send(msg.chat_id_, msg.id_,"*⋄︙تم ازالة الرد من قائمه الردود*")
database:del(bot_id.."MeRo:Add:Rd:Manager:AudioCa"..text..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:VicoCa"..text..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:PhotoCa"..text..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:FileCa"..text..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:GifCa"..text..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."MeRo:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."MeRo:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."MeRo:Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."MeRo:Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."MeRo:Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:del(bot_id.."MeRo:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."MeRo:List:Manager"..msg.chat_id_.."", text)
return false
end
end
if text and not database:get(bot_id.."MeRo:Reply:Manager"..msg.chat_id_) then
if not database:sismember(bot_id..'MeRo:Spam:Group'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."MeRo:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
local veico = database:get(bot_id.."MeRo:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
local stekr = database:get(bot_id.."MeRo:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
local Text = database:get(bot_id.."MeRo:Add:Rd:Manager:Text"..text..msg.chat_id_)   
local photo = database:get(bot_id.."MeRo:Add:Rd:Manager:Photo"..text..msg.chat_id_)  
local video = database:get(bot_id.."MeRo:Add:Rd:Manager:Video"..text..msg.chat_id_) 
local document = database:get(bot_id.."MeRo:Add:Rd:Manager:File"..text..msg.chat_id_)
local audio = database:get(bot_id.."MeRo:Add:Rd:Manager:Audio"..text..msg.chat_id_)
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,data)
if Text then 
local NumMsg = database:get(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'MeRo:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = Text:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
send(msg.chat_id_, msg.id_,'['..Text..']')
database:sadd(bot_id.."MeRo:Spam:Group"..msg.sender_user_id_,text) 
end
if stekr then 
sendSticker(msg.chat_id_,msg.id_,stekr)
database:sadd(bot_id.."MeRo:Spam:Group"..msg.sender_user_id_,text) 
end
if veico then 
local NumMsg = database:get(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'MeRo:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local veicoCa = database:get(bot_id.."MeRo:Add:Rd:Manager:VicoCa"..text..msg.chat_id_)  or ""
local veicoCa = veicoCa:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendVoice(msg.chat_id_, msg.id_,veico,veicoCa)
database:sadd(bot_id.."MeRo:Spam:Group"..msg.sender_user_id_,text) 
end
if video then 
local NumMsg = database:get(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'MeRo:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local videoCa = database:get(bot_id.."MeRo:Add:Rd:Manager:VideoCa"..text..msg.chat_id_) or ""
local videoCa = videoCa:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendVideo(msg.chat_id_, msg.id_,video,videoCa)
database:sadd(bot_id.."MeRo:Spam:Group"..msg.sender_user_id_,text) 
end
if anemi then 
local NumMsg = database:get(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'MeRo:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local anemiCa = database:get(bot_id.."MeRo:Add:Rd:Manager:GifCa"..text..msg.chat_id_) or ""
local anemiCa = anemiCa:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendAnimation(msg.chat_id_, msg.id_,anemi,anemiCa)
database:sadd(bot_id.."MeRo:Spam:Group"..msg.sender_user_id_,text) 
end
if document then 
local NumMsg = database:get(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'MeRo:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local documentCa = database:get(bot_id.."MeRo:Add:Rd:Manager:FileCa"..text..msg.chat_id_) or ""
local documentCa = documentCa:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendDocument(msg.chat_id_, msg.id_, document,documentCa)
database:sadd(bot_id.."MeRo:Spam:Group"..msg.sender_user_id_,text) 
end  
if audio then 
local NumMsg = database:get(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'MeRo:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local audioCa = database:get(bot_id.."MeRo:Add:Rd:Manager:AudioCa"..text..msg.chat_id_)  or ""
local audioCa = audioCa:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendAudio(msg.chat_id_,msg.id_,audio,audioCa,audioCa)
database:sadd(bot_id.."MeRo:Spam:Group"..msg.sender_user_id_,text) 
end
if photo then 
local NumMsg = database:get(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'MeRo:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local photoCa = database:get(bot_id.."MeRo:Add:Rd:Manager:PhotoCa"..text..msg.chat_id_) or ""
local photoCa = photoCa:gsub('#username',(data.username_ or 'لا يوجد')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendPhoto(msg.chat_id_,msg.id_,photo,photoCa)
database:sadd(bot_id.."MeRo:Spam:Group"..msg.sender_user_id_,text) 
end  
end,nil)
end
end
------------------------------------------------------------------------
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' and GetChannelMember(msg) then
if Addictive(msg) then    
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
Kick_Group(msg.chat_id_, data.id_)
end
end,nil)
end
send(msg.chat_id_, msg.id_,'*⋄︙تم طرد الحسابات المحذوفه*')
end,nil)
end
end

if text == "تفعيل ردود المدير" and Owner(msg) then   
database:del(bot_id.."MeRo:Reply:Manager"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"*⋄︙تم تفعيل ردود المدير*") 
end
if text == "تعطيل ردود المدير" and Owner(msg) then  
database:set(bot_id.."MeRo:Reply:Manager"..msg.chat_id_,true)  
send(msg.chat_id_, msg.id_,"*⋄︙تم تعطيل ردود المدير*" ) 
end
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
if DevMeRoe(result.sender_user_id_)  then
send(msg.chat_id_, msg.id_,"*⋄︙لا تستطيع تنزيل مطور البوت او السورس*")
return false
end
if Rank_Checking(result.sender_user_id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n*⋄︙تم تنزيل الشخص من جميع الرتب*")
else
send(msg.chat_id_, msg.id_,"\n*⋄︙ليس لديه رتب حتى استطيع تنزيله \n*")
end
if DevMeRoe(msg.sender_user_id_)  then
database:srem(bot_id.."DEV:Sudo:T",result.sender_user_id_)
database:srem(bot_id.."MeRo:Sudo:User", result.sender_user_id_)
database:srem(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."DEV:Sudo:T",msg.sender_user_id_) then
database:srem(bot_id.."MeRo:Sudo:User", result.sender_user_id_)
database:srem(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."MeRo:Sudo:User",msg.sender_user_id_) then
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
elseif database:sismember(bot_id.."creator"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
elseif database:sismember(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."MeRo:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."MeRo:Manager"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
end
if text and text:match("^تنزيل الكل @(.*)$") and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
if (result.id_) then
if DevMeRoe(result.id_)  then
send(msg.chat_id_, msg.id_,"*⋄︙لا تستطيع تنزيل مطور البوت او السورس*")
return false
end
if Rank_Checking(result.id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n*⋄︙تم تنزيل الشخص من جميع الرتب*")
else
send(msg.chat_id_, msg.id_,"\n*⋄︙ليس لديه رتب حتى استطيع تنزيله \n*")
end
if DevMeRoe(msg.sender_user_id_)  then
database:srem(bot_id.."DEV:Sudo:T",result.id_)
database:srem(bot_id.."MeRo:Sudo:User", result.id_)
database:srem(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."DEV:Sudo:T",msg.sender_user_id_) then
database:srem(bot_id.."MeRo:Sudo:User", result.id_)
database:srem(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_,result.id_)
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."MeRo:Sudo:User",msg.sender_user_id_) then
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_,result.id_)
elseif database:sismember(bot_id.."creator"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_,result.id_)
elseif database:sismember(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Constructor"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."MeRo:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Manager"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."MeRo:Manager"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."MeRo:Special:User"..msg.chat_id_, result.id_)
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text:match("^تنزيل الكل @(.*)$")}, Function_MeRo, nil)
end
if text == ("تحكم") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) and GetChannelMember(msg) then  
function start_function(extra, result, success)
local keyboard = {
{{text = '⋄ حظر',callback_data=msg.sender_user_id_.."been"..result.sender_user_id_},{text = '⋄ الغاء حظر',callback_data=msg.sender_user_id_.."unbeen"..result.sender_user_id_}},
{{text = '⋄ كتم',callback_data=msg.sender_user_id_.."Mut"..result.sender_user_id_},{text = '⋄ الغاء كتم',callback_data=msg.sender_user_id_.."unMut"..result.sender_user_id_}},
{{text = '⋄ تقييد',callback_data=msg.sender_user_id_.."restrict"..result.sender_user_id_},{text = '⋄ الغاء تقييد',callback_data=msg.sender_user_id_.."unrestrict"..result.sender_user_id_}},
{{text = '⋄ رفع رتبه',callback_data=msg.sender_user_id_.."UpS"..result.sender_user_id_},{text = '⋄ تنزيل رتبه',callback_data=msg.sender_user_id_.."unUpS"..result.sender_user_id_}},
}
local msg_id = msg.id_/2097152/0.5
send_inline_key(msg.chat_id_,"*⋄︙اهلا بك يمكنك التحكم بالازرار اسفل *",nil,keyboard,msg_id)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تحكم @(.*)$")  and Addictive(msg) and GetChannelMember(msg) then  
local username = text:match("^تحكم @(.*)$") 
function Function_MeRo(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"*⋄︙عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !*")   
return false 
end      
local keyboard = {
{{text = '⋄ حظر',callback_data=msg.sender_user_id_.."been"..result.id_},{text = '⋄ الغاء حظر',callback_data=msg.sender_user_id_.."unbeen"..result.id_}},
{{text = '⋄ كتم',callback_data=msg.sender_user_id_.."Mut"..result.id_},{text = '⋄ الغاء كتم',callback_data=msg.sender_user_id_.."unMut"..result.id_}},
{{text = '⋄ تقييد',callback_data=msg.sender_user_id_.."restrict"..result.id_},{text = '⋄ الغاء تقييد',callback_data=msg.sender_user_id_.."unrestrict"..result.id_}},
{{text = '⋄ رفع رتبه',callback_data=msg.sender_user_id_.."UpS"..result.id_},{text = '⋄ تنزيل رتبه',callback_data=msg.sender_user_id_.."unUpS"..result.id_}},
}
local msg_id = msg.id_/2097152/0.5
send_inline_key(msg.chat_id_,"*⋄︙اهلا بك يمكنك التحكم بالازرار اسفل *",nil,keyboard,msg_id)
else
send(msg.chat_id_, msg.id_,"⋄︙لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text == "تاك للكل" and Addictive(msg) and GetChannelMember(msg) then
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""), offset_ = 0,limit_ = 200},function(ta,taha)
local t = "\n*⋄︙قائمة الاعضاء*\n*— — — — — — — — — — — — — —*\n"
x = 0
local list = taha.members_
for k, v in pairs(list) do
x = x + 1
if database:get(bot_id.."MeRo:User:Name"..v.user_id_) then
t = t.."*⋄︙"..x.."︙*[@"..database:get(bot_id.."MeRo:User:Name"..v.user_id_).."]\n"
end
end
send(msg.chat_id_,msg.id_,t)
end,nil)
end
if text == "صلاحياته" and tonumber(msg.reply_to_message_id_) > 0 then
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
if text == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
if text and text:match('^صلاحياته @(.*)') then   
local username = text:match('صلاحياته @(.*)')   
if tonumber(msg.reply_to_message_id_) == 0 then 
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
SendText(msg.chat_id_,msg.id_,"*⋄︙المعرف غير صحيح \n*")   
return false 
end   
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if text == "رتبتي" and GetChannelMember(msg) then
local rtp = Get_Rank(msg.sender_user_id_,msg.chat_id_)
send(msg.chat_id_, msg.id_,"*⋄︙رتبتك في البوت » "..rtp.."*")
end
if text == 'بايو' then   
send(msg.chat_id_, msg.id_,getbio(msg.sender_user_id_)) 
end 
if text == "اسمي" and GetChannelMember(msg) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.first_name_  then
first_name = "*⋄︙اسمك الاول ←* {"..(result.first_name_).."}"
else
first_name = ""
end   
if result.last_name_ then 
last_name = "*⋄︙اسمك الثاني ←* {"..result.last_name_.."}" 
else
last_name = ""
end      
send(msg.chat_id_, msg.id_,first_name.."\n"..last_name) 
end,nil)
end 
if text==("عدد الكروب") and Addictive(msg) and GetChannelMember(msg) then
if msg.can_be_deleted_ == false then 
send(msg.chat_id_,msg.id_,"*⋄︙ البوت ليس ادمن هنا \n*") 
return false  
end 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
local taha = "*⋄︙ عدد الادمنيه : *"..data.administrator_count_..
"\n\n*⋄︙ عدد المطرودين :* "..data.kicked_count_..
"\n\n*⋄︙ عدد الاعضاء :* "..data.member_count_..
"\n\n*⋄︙ عدد رسائل الكروب :* "..(msg.id_/2097152/0.5)..
"\n\n*⋄︙ اسم المجموعه :* ["..ta.title_.."]"
send(msg.chat_id_, msg.id_, taha) 
end,nil)
end,nil)
end 
if text then   
if database:get(bot_id..'Set:array'..msg.sender_user_id_..':'..msg.chat_id_) == 'true1' then
local test = database:get(bot_id..'Text:array'..msg.sender_user_id_..':'..msg.chat_id_..'')
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
database:sadd(bot_id.."Add:Rd:array:Text"..test..msg.chat_id_,text)  
_key = {
{{text="اضغط هنا لانهاء الاضافه",callback_data="EndAddarray"..msg.sender_user_id_}},
}
send_inlin_key(msg.chat_id_,' *⋄︙تم حفظ الرد يمكنك ارسال اخر او اكمال العمليه من خلال الزر اسفل ✅*',_key,msg.id_)
return false  
end
end    
if text and text:match("^(.*)$") then
if database:get(bot_id.."Set:array:Ssd"..msg.sender_user_id_..":"..msg.chat_id_) == 'dttd' then
database:del(bot_id.."Set:array:Ssd"..msg.sender_user_id_..":"..msg.chat_id_)
gery = database:get(bot_id.."Set:array:addpu"..msg.sender_user_id_..":"..msg.chat_id_)
if not database:sismember(bot_id.."Add:Rd:array:Text"..gery..msg.chat_id_,text) then
send(msg.chat_id_, msg.id_,' *⋄︙لا يوجد رد متعدد * ')
return false
end
send(msg.chat_id_, msg.id_,' *⋄︙تم حذفه بنجاح .* ')
database:srem(bot_id.."Add:Rd:array:Text"..gery..msg.chat_id_,text)
end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."Set:array:Ssd"..msg.sender_user_id_..":"..msg.chat_id_) == 'delrd' then
database:del(bot_id.."Set:array:Ssd"..msg.sender_user_id_..":"..msg.chat_id_)
if not database:sismember(bot_id..'List:array'..msg.chat_id_,text) then
send(msg.chat_id_, msg.id_,' *⋄︙لا يوجد رد متعدد * ')
return false
end
send(msg.chat_id_, msg.id_,' *⋄︙قم بارسال الرد الذي تريد حذفه منه* ')
database:set(bot_id.."Set:array:addpu"..msg.sender_user_id_..":"..msg.chat_id_,text)
database:set(bot_id.."Set:array:Ssd"..msg.sender_user_id_..":"..msg.chat_id_,"dttd")
return false
end
end
if text == "حذف رد من متعدد" and Owner(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الكلمه الرد الاصليه*")
database:set(bot_id.."Set:array:Ssd"..msg.sender_user_id_..":"..msg.chat_id_,"delrd")
return false 
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."Set:array"..msg.sender_user_id_..":"..msg.chat_id_) == 'true' then
send(msg.chat_id_, msg.id_,' *⋄︙ارسل الرد الذي تريد اضافته*')
database:set(bot_id..'Set:array'..msg.sender_user_id_..':'..msg.chat_id_,'true1')
database:set(bot_id..'Text:array'..msg.sender_user_id_..':'..msg.chat_id_, text)
database:del(bot_id.."Add:Rd:array:Text"..text..msg.chat_id_)   
database:sadd(bot_id..'List:array'..msg.chat_id_..'', text)
return false
end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."Set:array:rd"..msg.sender_user_id_..":"..msg.chat_id_) == 'delrd' then
database:del(bot_id.."Set:array:rd"..msg.sender_user_id_..":"..msg.chat_id_)
send(msg.chat_id_, msg.id_,' *⋄︙تم ازالة الرد المتعدد بنجاح* ')
database:del(bot_id.."Add:Rd:array:Text"..text..msg.chat_id_)
database:srem(bot_id..'List:array'..msg.chat_id_, text)
return false
end
end
if text == "حذف رد متعدد" and Owner(msg) then
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الكلمه التي تريد حذفها*")
database:set(bot_id.."Set:array:rd"..msg.sender_user_id_..":"..msg.chat_id_,"delrd")
return false 
end
if text then
if  database:sismember(bot_id..'List:array'..msg.chat_id_,text) then
local list = database:smembers(bot_id.."Add:Rd:array:Text"..text..msg.chat_id_)
quschen = list[math.random(#list)]
send(msg.chat_id_, msg.id_,quschen)
end
end
if text == ("الردود المتعدده") and Owner(msg) then
local list = database:smembers(bot_id..'List:array'..msg.chat_id_..'')
text = " ⋄︙قائمه الردود المتعدده \n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
text = text..""..k..">> ("..v..") » {رساله}\n"
end
if #list == 0 then
text = "⋄︙لا يوجد ردود متعدده"
end
send(msg.chat_id_, msg.id_,'['..text..']')
end
if text == ("مسح الردود المتعدده") and BasicConstructor(msg) and GetChannelMember(msg) then   
local list = database:smembers(bot_id..'List:array'..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."Add:Rd:array:Text"..v..msg.chat_id_)   
database:del(bot_id..'List:array'..msg.chat_id_)
end
send(msg.chat_id_, msg.id_," *⋄︙تم مسح الردود المتعدده*")
end
if text == "اضف رد متعدد" and Owner(msg) and GetChannelMember(msg) then   
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الكلمه التي تريد اضافتها*")
database:set(bot_id.."Set:array"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text == "تفعيل صورتي" or text == 'تفعيل الصوره' then
if Constructor(msg) then  
database:set(bot_id.."my_photo:status"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_," *⋄︙تم تفعيل الصوره*") 
return false  
end
end
if text == "تعطيل الصوره" or text == 'تعطيل صورتي' then
if Constructor(msg) then  
database:del(bot_id.."my_photo:status"..msg.chat_id_) 
send(msg.chat_id_, msg.id_," *⋄︙تم تعطيل الصوره*") 
return false end
end
if text == 'اطردني' then  
if Rank_Checking(msg.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n*⋄︙عذرا لا استطيع طرد ( "..Get_Rank(msg.sender_user_id_,msg.chat_id_).." )*")
return false
end
if not database:get(bot_id..'Cick:Me'..msg.chat_id_) then
Text = "[ ⋄︙قم بتأكيد عمليه الطرد](http://t.me/YYYDR)"
keyboard = {} 
keyboard.inline_keyboard = {
{{text="تأكيد الامر",callback_data="OkKikedMe"..msg.sender_user_id_},{text="الغاء الامر",callback_data="noKikedMe"..msg.sender_user_id_}},
{{text = '⋄ sᴏᴜʀᴄᴇ ᴍᴇʀᴏ',url="t.me/YYYDR"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/Channel_The_Quran/100&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if text == 'تفعيل اطردني' and Owner(msg) then   
if database:get(bot_id..'Cick:Me'..msg.chat_id_) then
Text = ' *⋄︙تم تفعيل امر اطردني*'
database:del(bot_id..'Cick:Me'..msg.chat_id_)  
else
Text = ' *⋄︙بالتاكيد تم تفعيل امر اطردني*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل اطردني' and Owner(msg) then  
if not database:get(bot_id..'Cick:Me'..msg.chat_id_) then
database:set(bot_id..'Cick:Me'..msg.chat_id_,true)  
Text = '\n *⋄︙تم تعطيل امر اطردني*'
else
Text = '\n *⋄︙بالتاكيد تم تعطيل امر اطردني*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == "صورتي"  then
local my_ph = database:get(bot_id.."my_photo:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," *⋄︙الصوره معطله*") 
return false  
end
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," ⋄︙عدد صورك ↫ "..result.total_count_.." صوره‌‏", msg.id_, msg.id_, "md")
else
send(msg.chat_id_, msg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
  end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
if text and text:match("^رفع القيود @(.*)") and Owner(msg) and GetChannelMember(msg) then
local username = text:match("^رفع القيود @(.*)") 
function Function_MeRo(extra, result, success)
if result.id_ then
if DevMeRo(msg) then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(bot_id.."MeRo:GBan:User",result.id_)
database:srem(bot_id.."MeRo:Ban:User"..msg.chat_id_,result.id_)
database:srem(bot_id.."MeRo:Muted:User"..msg.chat_id_,result.id_)
usertext = "\n*⋄︙العضو »* ["..result.title_.."](t.me/"..(username or "kenwa")..")"
status  = "\n*⋄︙تم الغاء القيود عنه*"
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(bot_id.."MeRo:Ban:User"..msg.chat_id_,result.id_)
database:srem(bot_id.."MeRo:Muted:User"..msg.chat_id_,result.id_)
Reply_Status(msg,result.id_,"reply","\n*⋄︙تم الغاء القيود عنه*")  
end
else
Text = "*⋄︙ المعرف غلط*"
send(msg.chat_id_, msg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
end
if text == "رفع القيود" and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
if DevMeRo(msg) then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(bot_id.."MeRo:GBan:User",result.sender_user_id_)
database:srem(bot_id.."MeRo:Ban:User"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."MeRo:Muted:User"..msg.chat_id_,result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","\n*⋄︙تم الغاء القيود عنه*")  
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(bot_id.."MeRo:Ban:User"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."MeRo:Muted:User"..msg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = "\n*⋄︙ العضو »* ["..data.first_name_.."](t.me/"..(data.username_ or "kenwa")..")"
status  = "\n*⋄︙تم الغاء القيود عنه*"
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
end
if text and text:match("^كشف القيود @(.*)") and Owner(msg) and GetChannelMember(msg) then
local username = text:match("^كشف القيود @(.*)") 
function Function_MeRo(extra, result, success)
if result.id_ then
if database:sismember(bot_id.."MeRo:Muted:User"..msg.chat_id_,result.id_) then
Muted = "مكتوم"
else
Muted = "غير مكتوم"
end
if database:sismember(bot_id.."MeRo:Ban:User"..msg.chat_id_,result.id_) then
Ban = "محظور"
else
Ban = "غير محظور"
end
if database:sismember(bot_id.."MeRo:GBan:User",result.id_) then
GBan = "محظور عام"
else
GBan = "غير محظور عام"
end
send(msg.chat_id_, msg.id_,"*⋄︙الحظر العام » "..GBan.."*\n*⋄︙الحظر » "..Ban.."*\n*⋄︙ الكتم » "..Muted.."*")
else
send(msg.chat_id_, msg.id_,"*⋄︙المعرف غلط*")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
end

if text == "كشف القيود" and Owner(msg) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
if database:sismember(bot_id.."MeRo:Muted:User"..msg.chat_id_,result.sender_user_id_) then
Muted = "مكتوم"
else
Muted = "غير مكتوم"
end
if database:sismember(bot_id.."MeRo:Ban:User"..msg.chat_id_,result.sender_user_id_) then
Ban = "محظور"
else
Ban = "غير محظور"
end
if database:sismember(bot_id.."MeRo:GBan:User",result.sender_user_id_) then
GBan = "محظور عام"
else
GBan = "غير محظور عام"
end
Textt = "*⋄︙الحظر العام » "..GBan.."*\n*⋄︙الحظر » "..Ban.."*\n*⋄︙الكتم » "..Muted.."*"
send(msg.chat_id_, msg.id_,Textt)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
end

if text and text:match("^ضع اسم (.*)") and Owner(msg) or text and text:match("^وضع اسم (.*)") and Owner(msg) and GetChannelMember(msg) then
local Name = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = Name },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"⋄︙ البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"*⋄︙ليست لدي صلاحية تغير اسم المجموعه*")
else
send(msg.chat_id_,msg.id_,"*⋄︙تم تغيير اسم المجموعه الى *{["..Name.."]}")  
end
end,nil) 
end
if text ==("رفع الادمنيه") and Owner(msg) and GetChannelMember(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id.."MeRo:Mod:User"..msg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
database:srem(bot_id.."MeRo:Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(msg.chat_id_, msg.id_,"*⋄︙ لا توجد ادمنية ليتم رفعهم*") 
else
send(msg.chat_id_, msg.id_,"*⋄︙ تمت ترقية { "..num2.." } من ادمنية المجموعه*") 
end
end,nil)   
end
if text == "المنشئ" then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_," *⋄︙حساب المنشئ محذوف*")
return false  
end
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = owner_id,offset_ = 0,limit_ = 1},function(arg,getpro) 
if getpro.photos_[0] then
Name = '*المنشئ ⇠* ['..b.first_name_..'](tg://user?id='..b.id_..')\n'
Name = Name..'*البايو ⇠* ['..getbio(owner_id)..']\n'
keyboard = {}
keyboard.inline_keyboard = {{{text = ''..b.first_name_..'', url = "https://t.me/"..b.username_..""}},}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..msg.chat_id_..'&caption='..URL.escape(Name)..'&photo='..getpro.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
send(msg.chat_id_,msg.id_,Name)
end
end,nil)   
end,nil)   
end
end
end,nil)  
end
if text ==("رفع المنشئ") and DevBot(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_,"*⋄︙حساب المنشئ محذوف*")
return false  
end
local UserName = (b.username_ or "YYYDR")
send(msg.chat_id_, msg.id_,"*⋄︙تم ترقية منشئ المجموعه ~* ["..b.first_name_.."](T.me/"..UserName..")")
database:sadd(bot_id.."creator"..msg.chat_id_,b.id_)
end,nil)   
end,nil)   
end
if text == "غادر" then 
if DevBot(msg) and not database:get(bot_id.."MeRo:Left:Bot"..msg.chat_id_) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,"*⋄︙تم مغادرة المجموعه*") 
database:srem(bot_id.."MeRo:Chek:Groups",msg.chat_id_)  
end
return false  
end
if text and text:match("^غادر (-%d+)$") then
local GP_ID = {string.match(text, "^(غادر) (-%d+)$")}
if DevBot(msg) and not database:get(bot_id.."MeRo:Left:Bot"..msg.chat_id_) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=GP_ID[2],user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,"*⋄︙تم مغادرة المجموعه*")
send(GP_ID[2], 0,"*⋄︙تم مغادرة المجموعه بامر من مطور البوت*")
database:srem(bot_id.."MeRo:Chek:Groups",GP_ID[2])  
return false 
end
end
if text == "تفعيل المغادره" and DevMeRo(msg) then   
database:del(bot_id.."MeRo:Left:Bot"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"*⋄︙تم تفعيل مغادرة البوت*") 
return false 
end
if text == "تعطيل المغادره" and DevMeRo(msg) then  
database:set(bot_id.."MeRo:Left:Bot"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_, "*⋄︙تم تعطيل مغادرة البوت*") 
return false 
end
if text == (database:get(bot_id.."MeRo:Name:Bot") or "ميرو") and GetChannelMember(msg) then
Namebot = (database:get(bot_id.."MeRo:Name:Bot") or "ميرو")
local namebot = {
'عمغي 🥺💕.',
'دا اشرب جـاي مفارغلك',
'ها حبـي وياك مكتب ئلسيد .',
'فداك '..Namebot..' وعشيرتــه ائمرني',
'مشايف بوت شني 😂.',
'لابسك لتلح',
'صاعد اتصال ويا الحب دقيقة وجيك 😘💘',
'فــداك اني كلـي شمحتـاج😌💗',
'كول حبيبي ؟ اني '..Namebot..'',
'مشغول حالياً',
'عمري فداك '..Namebot..' كول حب'
}
name = math.random(#namebot)
send(msg.chat_id_, msg.id_, namebot[name]) 
return false 
end

if text == "بوت" then
Namebot = (database:get(bot_id.."MeRo:Name:Bot") or "ميرو")
send(msg.chat_id_, msg.id_,'*اسمي القمـيل '..Namebot..'* ') 
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" or text == "حذف اسم البوت" then 
if DevMeRo(msg) then
database:setex(bot_id.."MeRo:Set:Name:Bot"..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_,"*⋄︙ارسل لي الاسم الان*")
end
return false
end

if text ==("مسح المطرودين") and Addictive(msg) then    
local function delbans(extra, result)  
if not msg.can_be_deleted_ == true then  
send(msg.chat_id_, msg.id_, "*⋄︙يرجى ترقيتي ادمن هنا*") 
return false
end  
local num = 0 
for k,y in pairs(result.members_) do 
num = num + 1  
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft"}, }, dl_cb, nil)  
end  
send(msg.chat_id_, msg.id_,"⋄︙ تم الغاء الحظر عن *~ "..num.." ~* اشخاص ") 
end    
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, delbans, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
if text=="اذاعه خاص" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."MeRo:Status:Bc") and not DevMeRo(msg) then 
send(msg.chat_id_, msg.id_,"*⋄︙الاذاعه معطله من قبل المطور الاساسي*")
return false
end
database:setex(bot_id.."MeRo:MeRo:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الي اذاعتك الخاصه*\n*⋄︙للخروج ارسل الغاء*") 
return false
end 
if text=="اذاعه" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."MeRo:Status:Bc") and not DevMeRo(msg) then 
send(msg.chat_id_, msg.id_,"⋄︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
database:setex(bot_id.."MeRo:MeRo:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الي اذاعتك*\n*⋄︙للخروج ارسل الغاء*") 
return false
end  
if text=="اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."MeRo:Status:Bc") and not DevMeRo(msg) then 
send(msg.chat_id_, msg.id_,"*⋄︙الاذاعه معطله من قبل المطور الاساسي*")
return false
end
database:setex(bot_id.."MeRo:MeRo:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الي اذاعتك لتثبيتها*\n*⋄︙للخروج ارسل الغاء*") 
return false
end  
if text=="اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0  and DevBot(msg) then 
if database:get(bot_id.."MeRo:Status:Bc") and not DevMeRo(msg) then 
send(msg.chat_id_, msg.id_,"*⋄︙الاذاعه معطله من قبل المطور الاساسي*")
return false
end
database:setex(bot_id.."MeRo:MeRo:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"*⋄︙ارسل لي التوجيه الان*") 
return false
end 
if text=="اذاعه بالتوجيه خاص" and msg.reply_to_message_id_ == 0  and DevBot(msg) then 
if database:get(bot_id.."MeRo:Status:Bc") and not DevMeRo(msg) then 
send(msg.chat_id_, msg.id_,"*⋄︙الاذاعه معطله من قبل المطور الاساسي*")
return false
end
database:setex(bot_id.."MeRo:MeRo:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"*⋄︙ارسل لي التوجيه الان*") 
return false
end 

if text == "تفعيل الاذاعه" and DevMeRo(msg) then  
database:del(bot_id.."MeRo:Status:Bc") 
send(msg.chat_id_, msg.id_,"\n*⋄︙تم تفعيل الاذاعه*") 
return false
end 
if text == "تعطيل الاذاعه" and DevMeRo(msg) then  
database:set(bot_id.."MeRo:Status:Bc",true) 
send(msg.chat_id_, msg.id_,"\n*⋄︙تم تعطيل الاذاعه*") 
return false
end 

if text == "الاعدادات" and Addictive(msg) then    
if database:get(bot_id.."MeRo:lockpin"..msg.chat_id_) then    
lock_pin = "✓"
else 
lock_pin = "✘"    
end
if database:get(bot_id.."MeRo:Lock:tagservr"..msg.chat_id_) then    
lock_tagservr = "✓"
else 
lock_tagservr = "✘"    
end
if database:get(bot_id.."MeRo:Lock:text"..msg.chat_id_) then    
lock_text = "✓"
else 
lock_text = "✘"    
end
if database:get(bot_id.."MeRo:Lock:AddMempar"..msg.chat_id_) == "kick" then
lock_add = "✓"
else 
lock_add = "✘"    
end    
if database:get(bot_id.."MeRo:Lock:Join"..msg.chat_id_) == "kick" then
lock_join = "✓"
else 
lock_join = "✘"    
end    
if database:get(bot_id.."MeRo:Lock:edit"..msg.chat_id_) then    
lock_edit = "✓"
else 
lock_edit = "✘"    
end
if database:get(bot_id.."MeRo:Get:Welcome:Group"..msg.chat_id_) then
welcome = "✓"
else 
welcome = "✘"    
end
if database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_, "flood") == "kick" then     
flood = "بالطرد"     
elseif database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"flood") == "keed" then     
flood = "بالتقيد"     
elseif database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"flood") == "mute" then     
flood = "بالكتم"           
elseif database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"flood") == "del" then     
flood = "بالمسح"           
else     
flood = "✘"     
end
if database:get(bot_id.."MeRo:Lock:Photo"..msg.chat_id_) == "del" then
lock_photo = "✓" 
elseif database:get(bot_id.."MeRo:Lock:Photo"..msg.chat_id_) == "ked" then 
lock_photo = "بالتقيد"   
elseif database:get(bot_id.."MeRo:Lock:Photo"..msg.chat_id_) == "ktm" then 
lock_photo = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:Photo"..msg.chat_id_) == "kick" then 
lock_photo = "بالطرد"   
else
lock_photo = "✘"   
end    
if database:get(bot_id.."MeRo:Lock:Contact"..msg.chat_id_) == "del" then
lock_phon = "✓" 
elseif database:get(bot_id.."MeRo:Lock:Contact"..msg.chat_id_) == "ked" then 
lock_phon = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:Contact"..msg.chat_id_) == "ktm" then 
lock_phon = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:Contact"..msg.chat_id_) == "kick" then 
lock_phon = "بالطرد"    
else
lock_phon = "✘"    
end    
if database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) == "del" then
lock_links = "✓"
elseif database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) == "ked" then
lock_links = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) == "ktm" then
lock_links = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) == "kick" then
lock_links = "بالطرد"    
else
lock_links = "✘"    
end
if database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) == "del" then
lock_cmds = "✓"
elseif database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) == "ked" then
lock_cmds = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) == "ktm" then
lock_cmds = "بالكتم"   
elseif database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) == "kick" then
lock_cmds = "بالطرد"    
else
lock_cmds = "✘"    
end
if database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) == "del" then
lock_user = "✓"
elseif database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) == "ked" then
lock_user = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) == "ktm" then
lock_user = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) == "kick" then
lock_user = "بالطرد"    
else
lock_user = "✘"    
end
if database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) == "del" then
lock_hash = "✓"
elseif database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) == "ked" then 
lock_hash = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) == "ktm" then 
lock_hash = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) == "kick" then 
lock_hash = "بالطرد"    
else
lock_hash = "✘"    
end
if database:get(bot_id.."MeRo:Lock:vico"..msg.chat_id_) == "del" then
lock_muse = "✓"
elseif database:get(bot_id.."MeRo:Lock:vico"..msg.chat_id_) == "ked" then 
lock_muse = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:vico"..msg.chat_id_) == "ktm" then 
lock_muse = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:vico"..msg.chat_id_) == "kick" then 
lock_muse = "بالطرد"    
else
lock_muse = "✘"    
end 
if database:get(bot_id.."MeRo:Lock:Video"..msg.chat_id_) == "del" then
lock_ved = "✓"
elseif database:get(bot_id.."MeRo:Lock:Video"..msg.chat_id_) == "ked" then 
lock_ved = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:Video"..msg.chat_id_) == "ktm" then 
lock_ved = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:Video"..msg.chat_id_) == "kick" then 
lock_ved = "بالطرد"    
else
lock_ved = "✘"    
end
if database:get(bot_id.."MeRo:Lock:Animation"..msg.chat_id_) == "del" then
lock_gif = "✓"
elseif database:get(bot_id.."MeRo:Lock:Animation"..msg.chat_id_) == "ked" then 
lock_gif = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:Animation"..msg.chat_id_) == "ktm" then 
lock_gif = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:Animation"..msg.chat_id_) == "kick" then 
lock_gif = "بالطرد"    
else
lock_gif = "✘"    
end
if database:get(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_) == "del" then
lock_ste = "✓"
elseif database:get(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_) == "ked" then 
lock_ste = "بالتقيد "    
elseif database:get(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_) == "ktm" then 
lock_ste = "بالكتم "    
elseif database:get(bot_id.."MeRo:Lock:Sticker"..msg.chat_id_) == "kick" then 
lock_ste = "بالطرد"    
else
lock_ste = "✘"    
end
if database:get(bot_id.."MeRo:Lock:geam"..msg.chat_id_) == "del" then
lock_geam = "✓"
elseif database:get(bot_id.."MeRo:Lock:geam"..msg.chat_id_) == "ked" then 
lock_geam = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:geam"..msg.chat_id_) == "ktm" then 
lock_geam = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:geam"..msg.chat_id_) == "kick" then 
lock_geam = "بالطرد"    
else
lock_geam = "✘"    
end    
if database:get(bot_id.."MeRo:Lock:vico"..msg.chat_id_) == "del" then
lock_vico = "✓"
elseif database:get(bot_id.."MeRo:Lock:vico"..msg.chat_id_) == "ked" then 
lock_vico = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:vico"..msg.chat_id_) == "ktm" then 
lock_vico = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:vico"..msg.chat_id_) == "kick" then 
lock_vico = "بالطرد"    
else
lock_vico = "✘"    
end    
if database:get(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_) == "del" then
lock_inlin = "✓"
elseif database:get(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_) == "ked" then 
lock_inlin = "بالتقيد"
elseif database:get(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_) == "ktm" then 
lock_inlin = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:Keyboard"..msg.chat_id_) == "kick" then 
lock_inlin = "بالطرد"
else
lock_inlin = "✘"
end
if database:get(bot_id.."MeRo:Lock:forward"..msg.chat_id_) == "del" then
lock_fwd = "✓"
elseif database:get(bot_id.."MeRo:Lock:forward"..msg.chat_id_) == "ked" then 
lock_fwd = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:forward"..msg.chat_id_) == "ktm" then 
lock_fwd = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:forward"..msg.chat_id_) == "kick" then 
lock_fwd = "بالطرد"    
else
lock_fwd = "✘"    
end    
if database:get(bot_id.."MeRo:Lock:Document"..msg.chat_id_) == "del" then
lock_file = "✓"
elseif database:get(bot_id.."MeRo:Lock:Document"..msg.chat_id_) == "ked" then 
lock_file = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:Document"..msg.chat_id_) == "ktm" then 
lock_file = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:Document"..msg.chat_id_) == "kick" then 
lock_file = "بالطرد"    
else
lock_file = "✘"    
end    
if database:get(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_) == "del" then
lock_self = "✓"
elseif database:get(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_) == "ked" then 
lock_self = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_) == "ktm" then 
lock_self = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:Unsupported"..msg.chat_id_) == "kick" then 
lock_self = "بالطرد"    
else
lock_self = "✘"    
end
if database:get(bot_id.."MeRo:Lock:Bot:kick"..msg.chat_id_) == "del" then
lock_bots = "✓"
elseif database:get(bot_id.."MeRo:Lock:Bot:kick"..msg.chat_id_) == "ked" then
lock_bots = "بالتقيد"   
elseif database:get(bot_id.."MeRo:Lock:Bot:kick"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "✘"    
end
if database:get(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_) == "del" then
lock_mark = "✓"
elseif database:get(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_) == "ked" then 
lock_mark = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_) == "ktm" then 
lock_mark = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:Markdaun"..msg.chat_id_) == "kick" then 
lock_mark = "بالطرد"    
else
lock_mark = "✘"    
end
if database:get(bot_id.."MeRo:Lock:Spam"..msg.chat_id_) == "del" then    
lock_spam = "✓"
elseif database:get(bot_id.."MeRo:Lock:Spam"..msg.chat_id_) == "ked" then 
lock_spam = "بالتقيد"    
elseif database:get(bot_id.."MeRo:Lock:Spam"..msg.chat_id_) == "ktm" then 
lock_spam = "بالكتم"    
elseif database:get(bot_id.."MeRo:Lock:Spam"..msg.chat_id_) == "kick" then 
lock_spam = "بالطرد"    
else
lock_spam = "✘"    
end        
if not database:get(bot_id.."MeRo:Reply:Manager"..msg.chat_id_) then
rdmder = "✓"
else
rdmder = "✘"
end
if not database:get(bot_id.."MeRo:Reply:Sudo"..msg.chat_id_) then
rdsudo = "✓"
else
rdsudo = "✘"
end
if not database:get(bot_id.."MeRo:Lock:ID:Bot"..msg.chat_id_)  then
idgp = "✓"
else
idgp = "✘"
end
if not database:get(bot_id.."MeRo:Lock:ID:Bot:Photo"..msg.chat_id_) then
idph = "✓"
else
idph = "✘"
end
if not database:get(bot_id.."MeRo:Lock:kick"..msg.chat_id_)  then
setadd = "✓"
else
setadd = "✘"
end
if not database:get(bot_id.."MeRo:Lock:Add:Bot"..msg.chat_id_)  then
banm = "✓"
else
banm = "✘"
end
if not database:get(bot_id.."MeRo:Kick:Me"..msg.chat_id_) then
kickme = "✓"
else
kickme = "✘"
end
Num_Flood = database:hget(bot_id.."MeRo:flooding:settings:"..msg.chat_id_,"floodmax") or 0
local text = 
"*\n⋄︙ااعدادات المجموعه "..
"\n— — — — — — — — — — — — — — "..
"\n⋄︙علامة ال {✓} تعني مفعل"..
"\n⋄︙علامة ال {✘} تعني معطل"..
"\n— — — — — — — — — — — — — — "..
"\n⋄︙الروابط » "..lock_links..
"\n".."⋄︙المعرفات » "..lock_user..
"\n".."⋄︙التاك » "..lock_hash..
"\n".."⋄︙البوتات » "..lock_bots..
"\n".."⋄︙التوجيه » "..lock_fwd..
"\n".."⋄︙التثبيت » "..lock_pin..
"\n".."⋄︙الاشعارات » "..lock_tagservr..
"\n".."⋄︙الماركدون » "..lock_mark..
"\n".."⋄︙التعديل » "..lock_edit..
"\n— — — — — — — — — — — — — — "..
"\n".."⋄︙الكلايش » "..lock_spam..
"\n".."⋄︙الكيبورد » "..lock_inlin..
"\n".."⋄︙الاغاني » "..lock_vico..
"\n".."⋄︙المتحركه » "..lock_gif..
"\n".."⋄︙الملفات » "..lock_file..
"\n".."⋄︙الدردشه » "..lock_text..
"\n".."⋄︙الفيديو » "..lock_ved..
"\n".."⋄︙الصور » "..lock_photo..
"\n— — — — — — — — — — — — — — "..
"\n".."⋄︙الصوت » "..lock_muse..
"\n".."⋄︙الملصقات » "..lock_ste..
"\n".."⋄︙الجهات » "..lock_phon..
"\n".."⋄︙الدخول » "..lock_join..
"\n".."⋄︙الاضافه » "..lock_add..
"\n".."⋄︙السيلفي » "..lock_self..
"\n".."⋄︙الالعاب » "..lock_geam..
"\n".."⋄︙التكرار » "..flood..
"\n".."⋄︙الترحيب » "..welcome..
"\n".."⋄︙عدد التكرار » "..Num_Flood..
"\n\n.*"
send(msg.chat_id_, msg.id_,text)     
end   
if text == 'تغير الايدي' and Owner(msg) then 
local List = {
[[
- ᴜѕᴇʀɴᴀᴍᴇ 𓄹𓄼 #id .
- ʏᴏᴜʀ ɪᴅ 𓄹𓄼 #username  .
- ᴍѕɢѕ 𓄹𓄼 #msgs .
- ѕᴛᴀᴛѕ 𓄹𓄼 #stast .
- ᴇᴅɪᴛ 𓄹𓄼 #game .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
➼ : 𝐼𝐷 𖠀 #id . ♡
➼ : 𝑈𝑆𝐸𝑅 𖠀 #username .♡
➼ : 𝑀𝑆𝐺𝑆 𖠀 #msgs .♡
➼ : 𝑆𝑇𝐴S𝑇 𖠀 #stast .♡ 
➼ : 𝐸𝐷𝐼𝑇  𖠀 #edit .♡
]],
[[
- ايديڪ  ⁞ #id 💘 ٬
- يوزرڪ القميل ⁞ #username 💘 ٬
- رسائلڪ  الطيفهہَ ⁞ #msgs 💘 ٬
- رتبتڪ الحلوه ⁞ #stast  💘٬
- سحڪاتڪ الفول ⁞ #edit 💘 ٬ 
]],
[[
- 𝒊𝒅 ➺ #id 💗
- 𝒖𝒔𝒆𝒓 ➺  #username 💗
- 𝒎𝒔𝒈 ➺ #msgs 💗
- 𝒔𝒕𝒂𝒕𝒆 ➺ #stast 💗
- 𝒆𝒅I𝒕 ➺ #edit  💗
]],
[[
☁️ . USERNAME . #username  💞🧸
☁️ . STAST . #stast 💗🦄
☁️ . ID . #id 🧘🏼‍♀💘
☁️ . MSGS . #msgs 💗👧🏻
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
• 𝙐𝙎𝙀??𝙉𝘼𝙈𝙀 ➤ #username .
• 𝙈𝙀𝙎𝙎𝘼𝙂𝙀𝙎 ➤ #msgs .
• 𝙎𝙏𝘼𝙏𝙎 ➤ #stast .
• 𝙄𝘿 ➤ #id .
]]}
local Text_Rand = List[math.random(#List)]
database:set(bot_id.."MeRo:Klesh:Id:Bot"..msg.chat_id_,Text_Rand)
send(msg.chat_id_, msg.id_,'*⋄︙تم تغير الايدي ارسل ايدي لرؤيته*')
end
if text == "تعطيل اوامر التحشيش" and Owner(msg) and GetChannelMember(msg) then
send(msg.chat_id_, msg.id_, '*⋄︙تم تعطيل اوامر التحشيش*')
database:set(bot_id.."MeRo:Fun_Bots"..msg.chat_id_,"true")
end
if text == "تفعيل اوامر التحشيش" and Owner(msg) and GetChannelMember(msg) then
send(msg.chat_id_, msg.id_,'*⋄︙تم تفعيل اوامر التحشيش*')
database:del(bot_id.."MeRo:Fun_Bots"..msg.chat_id_)
end
if text == 'تفعيل الايدي' and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id..'MeRo:Lock:ID:Bot'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'*⋄︙تم تفعيل الايدي*') 
end
if text == 'تعطيل الايدي' and Owner(msg) and GetChannelMember(msg) then
database:set(bot_id..'MeRo:Lock:ID:Bot'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'*⋄︙تم تعطيل الايدي*') 
end
if text == 'تفعيل الايدي بالصوره' and Owner(msg) and GetChannelMember(msg) then
database:del(bot_id..'MeRo:Lock:ID:Bot:Photo'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'*⋄︙تم تفعيل الايدي بالصوره*') 
end
if text == 'تعطيل الايدي بالصوره' and Owner(msg) and GetChannelMember(msg) then
database:set(bot_id..'MeRo:Lock:ID:Bot:Photo'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'*⋄︙تم تعطيل الايدي بالصوره*') 
end
if text == 'تعين الايدي' and Owner(msg) and GetChannelMember(msg) then
database:setex(bot_id.."MeRo:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_,240,true)  
local Text= [[
⋄︙ ارسل الان النص
⋄︙ يمكنك اضافه :
- `#username` > اسم المستخدم
- `#msgs` > عدد رسائل المستخدم
- `#photos` > عدد صور المستخدم
- `#id` > ايدي المستخدم
- `#bio` > بايو المستخدم
- `#custom` > لقب المستخدم
- `#auto` > تفاعل المستخدم
- `#stast` > موقع المستخدم 
- `#edit` > عدد السحكات
- `#game` > المجوهرات
- `#AddMem` > عدد الجهات
- `#Description` > تعليق الصوره
]]
send(msg.chat_id_, msg.id_,Text)
return false  
end 
if text == 'حذف الايدي' or text == 'مسح الايدي' then
if Owner(msg) then
database:del(bot_id.."MeRo:Klesh:Id:Bot"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '*⋄︙تم ازالة كليشة الايدي*')
end
return false  
end 
if database:get(bot_id.."MeRo:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء تعين الايدي*") 
database:del(bot_id.."MeRo:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."MeRo:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) 
database:set(bot_id.."MeRo:Klesh:Id:Bot"..msg.chat_id_,text:match("(.*)"))
send(msg.chat_id_, msg.id_,'*⋄︙تم تعين الايدي*')    
end
if text == 'ايدي' and tonumber(msg.reply_to_message_id_) == 0 and not database:get(bot_id..'MeRo:Lock:ID:Bot'..msg.chat_id_) and GetChannelMember(msg) then
if not database:sismember(bot_id..'MeRo:Spam:Group'..msg.sender_user_id_,text) then
database:sadd(bot_id.."MeRo:Spam:Group"..msg.sender_user_id_,text) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,taha,success) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'لا يوجد'
end
local Id = msg.sender_user_id_
local getcustomY = getcustom(msg,msg)
local getbioY = getbio(Id)
local NumMsg = database:get(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'MeRo:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Num_Games = database:get(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_) or 0
local Add_Mem = database:get(bot_id.."MeRo:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) or 0
local Total_Photp = (taha.total_count_ or 0)
local Texting = {
'صورتك فدشي 💘',
"صارلك شكد مخليه💘",
"وفالله 💘",
"كشخه برب 💘",
"دغيره شبي هذ 💘",
"عمري الحلوين 💘",
}
local Description = Texting[math.random(#Texting)]
local get_id = database:get(bot_id.."MeRo:Klesh:Id:Bot"..msg.chat_id_)
if not database:get(bot_id..'MeRo:Lock:ID:Bot:Photo'..msg.chat_id_) then
if taha.photos_[0] then
if get_id then
local get_id = get_id:gsub('#custom',getcustomY) 
local get_id = get_id:gsub('#bio',getbioY) 
local get_id = get_id:gsub('#AddMem',Add_Mem) 
local get_id = get_id:gsub('#id',Id) 
local get_id = get_id:gsub('#username',UserName_User) 
local get_id = get_id:gsub('#msgs',NumMsg) 
local get_id = get_id:gsub('#edit',message_edit) 
local get_id = get_id:gsub('#stast',Status_Gps) 
local get_id = get_id:gsub('#auto',TotalMsg) 
local get_id = get_id:gsub('#Description',Description) 
local get_id = get_id:gsub('#game',Num_Games) 
local get_id = get_id:gsub('#photos',Total_Photp) 
sendPhoto(msg.chat_id_,msg.id_,taha.photos_[0].sizes_[1].photo_.persistent_id_,get_id)
else
sendPhoto(msg.chat_id_,msg.id_,taha.photos_[0].sizes_[1].photo_.persistent_id_,'⋄︙'..Description..'\n⋄︙ايديك » '..Id..'\n⋄︙معرفك » '..UserName_User..'\n⋄︙رتبتك » '..Status_Gps..'\n⋄︙رسائلك » '..NumMsg..'\n⋄︙السحكات » '..message_edit..' \n⋄︙تتفاعلك » '..TotalMsg..'\n⋄︙ مجوهراتك » '..Num_Games)
end
else
send(msg.chat_id_, msg.id_,'⋄︙ليس لديك صوره \n'..'\n*⋄︙ايديك » '..Id..'\n⋄︙معرفك »* ['..UserName_User..']*\n⋄︙رتبتك » '..Status_Gps..'\n⋄︙رسائلك » '..NumMsg..'\n⋄︙السحكات » '..message_edit..' \n⋄︙تتفاعلك » '..TotalMsg..'\n⋄︙ مجوهراتك » '..Num_Games..'*') 
end
else
if get_id then
local get_id = get_id:gsub('#custom',getcustomY) 
local get_id = get_id:gsub('#bio',getbioY) 
local get_id = get_id:gsub('#AddMem',Add_Mem) 
local get_id = get_id:gsub('#id',Id) 
local get_id = get_id:gsub('#username',UserName_User) 
local get_id = get_id:gsub('#msgs',NumMsg) 
local get_id = get_id:gsub('#edit',message_edit) 
local get_id = get_id:gsub('#stast',Status_Gps) 
local get_id = get_id:gsub('#auto',TotalMsg) 
local get_id = get_id:gsub('#Description',Description) 
local get_id = get_id:gsub('#game',Num_Games) 
local get_id = get_id:gsub('#photos',Total_Photp) 
send(msg.chat_id_, msg.id_,'['..get_id..']') 
else
send(msg.chat_id_, msg.id_,'\n*⋄︙ايديك » '..Id..'\n⋄︙معرفك »* ['..UserName_User..']*\n⋄︙رتبتك » '..Status_Gps..'\n⋄︙رسائلك » '..NumMsg..'\n⋄︙السحكات » '..message_edit..' \n⋄︙تتفاعلك » '..TotalMsg..'\n⋄︙ مجوهراتك » '..Num_Games..'*') 
end
end
end,nil)   
end,nil)   
end
end
if text == 'تعطيل التنظيف' and BasicConstructor(msg) then   
if database:get(bot_id..'Lock:delmsg'..msg.chat_id_)  then
database:del(bot_id..'Lock:delmsg'..msg.chat_id_) 
Text = '\n⋄︙ تم تعطيل التنظيف' 
else
Text = '\n⋄︙بالتاكيد تم تعطيل التنظيف'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل التنظيف' and BasicConstructor(msg) then  
if not database:get(bot_id..'Lock:delmsg'..msg.chat_id_)  then
database:set(bot_id..'Lock:delmsg'..msg.chat_id_,true) 
Text = '\n*⋄︙ تم تفعيل التنظيف*' 
else
Text = '\n*⋄︙بالتاكيد تم تفعيل التنظيف*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match('^تنظيف (%d+)$') and Constructor(msg) and database:get(bot_id..'Lock:delmsg'..msg.chat_id_) then                
if not database:get(bot_id..'MeRo:Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then           
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
send(msg.chat_id_, msg.id_,'⋄︙لا تستطيع تنضيف اكثر من *~ 1000* رساله') 
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576
end
send(msg.chat_id_, msg.id_,'*⋄︙تم تنظيف ~ '..Number..' رساله*')  
database:setex(bot_id..'MeRo:Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end
end
if text == "تنظيف الميديا" and BasicConstructor(msg) then
msgm = {[0]=msg.id_}
local Message = msg.id_
for i=1,200 do
Message = Message - 1048576
msgm[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = msgm},function(arg,data)
new = 0
msgm2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and data.messages_[i].content_ and data.messages_[i].content_.ID ~= "MessageText" then
msgm2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,msgm2)
end,nil)  
send(msg.chat_id_, msg.id_,"*تم تنظيف الميديا ⋄*")
end
if text == "تنظيف التعديل" and Owner(msg) then
Msgs = {[0]=msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Msgs[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data)
new = 0
Msgs2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Msgs2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Msgs2)
end,nil)  
send(msg.chat_id_, msg.id_,'*⋄︙تم تنظيف جميع الرسائل المعدله*')
end
if text == 'ايدي' and tonumber(msg.reply_to_message_id_) > 0 and not database:get(bot_id..'MeRo:Lock:ID:Bot'..msg.chat_id_) and GetChannelMember(msg) then
function Function_MeRo(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
if data.first_name_ == false then
send(msg.chat_id_, msg.id_,'*⋄︙ الحساب محذوف لا توجد معلوماته*')
return false
end
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'لا يوجد'
end
local Id = data.id_
local NumMsg = database:get(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..data.id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'MeRo:message_edit'..msg.chat_id_..data.id_) or 0
local Num_Games = database:get(bot_id..'NUM:GAMES'..msg.chat_id_..data.id_) or 0
local Add_Mem = database:get(bot_id.."MeRo:Add:Memp"..msg.chat_id_..":"..data.id_) or 0
send(msg.chat_id_, msg.id_,'*⋄︙ايديه - '..Id..'\n⋄︙رسائله - '..NumMsg..'\n⋄︙معرفه - *['..UserName_User..']*\n⋄︙تفاعله - '..TotalMsg..'\n⋄︙رتبته - '..Status_Gps..'\n⋄︙تعديلاته - '..message_edit..'\n⋄︙جهاته - '..Add_Mem..'\n⋄︙نوع الكشف - بالرد \n*') 
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_MeRo, nil)
return false
end

if text and text:match("^ايدي @(.*)$")  and not database:get(bot_id..'MeRo:Lock:ID:Bot'..msg.chat_id_) and GetChannelMember(msg) then
local username = text:match("^ايدي @(.*)$") 
function Function_MeRo(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = 'لا يوجد'
end
local Id = data.id_
local NumMsg = database:get(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..data.id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'MeRo:message_edit'..msg.chat_id_..data.id_) or 0
local Num_Games = database:get(bot_id..'NUM:GAMES'..msg.chat_id_..data.id_) or 0
local Add_Mem = database:get(bot_id.."MeRo:Add:Memp"..msg.chat_id_..":"..data.id_) or 0
send(msg.chat_id_, msg.id_,'*⋄︙ايديه - '..Id..'\n⋄︙رسائله - '..NumMsg..'\n⋄︙معرفه - *['..UserName_User..']*\n⋄︙تفاعله - '..TotalMsg..'\n⋄︙رتبته - '..Status_Gps..'\n⋄︙تعديلاته - '..message_edit..'\n⋄︙جهاته - '..Add_Mem..'\n⋄︙نوع الكشف - بالمعرف \n*') 
end,nil)   
else
send(msg.chat_id_, msg.id_,'*⋄︙لا يوجد حساب بهاذا المعرف*')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_MeRo, nil)
return false
end
if text == 'الرتبه' and tonumber(msg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local rtp = Get_Rank(result.sender_user_id_,msg.chat_id_)
local username = ' ['..data.first_name_..'](t.me/'..(data.username_ or 'YYYDR')..')'
local iduser = result.sender_user_id_
send(msg.chat_id_, msg.id_,'*⋄︙اسم المستخدم » (*'..username..'*)\n⋄︙الرتبه » ('..rtp..')*\n')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match("^الرتبه @(.*)$") then
local username = text:match("^الرتبه @(.*)$")
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local rtp = Get_Rank(result.id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.id_
send(msg.chat_id_, msg.id_,'*⋄︙اسم المستخدم » (*'..username..'*)\n⋄︙الرتبه » ('..rtp..')*\n')
end,nil)
else
send(msg.chat_id_, msg.id_,'*- المعرف غير صحيح* ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text == 'كشف' and tonumber(msg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local rtp = Get_Rank(result.sender_user_id_,msg.chat_id_)
local username = ' ['..data.first_name_..'](t.me/'..(data.username_ or 'YYYDR')..')'
local iduser = result.sender_user_id_
send(msg.chat_id_, msg.id_,'*⋄︙الايدي » ('..iduser..')*\n*⋄︙الاسم » (*'..username..')\n*⋄︙الرتبه » ('..rtp..')*\n*⋄︙نوع الكشف » بالرد*')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match("^كشف @(.*)$") then
local username = text:match("^كشف @(.*)$")
function Function_v(extra, result, success)
if result.id_ then
tdcli_function({ID = "GetUser",user_id_ = result.id_}, function(arg, data)
if data.username_ then
UserName_User = '@' .. data.username_
else
UserName_User = 'لا يوجد'
end
local Id = data.id_
local frLsn = data.first_name_..' '..(data.last_name_ or "")
 local Status_Gps = Get_Rank(Id,msg.chat_id_)
send(msg.chat_id_, msg.id_, '\n*⋄︙الاسم » ('..frLsn..')\n⋄︙الايدي » '..Id..'\n⋄︙المعرف » *['..UserName_User..']*\n⋄︙الرتبة » '..Status_Gps..'\n⋄︙نوع الكشف - بالمعرف*')
end, nil)
else
send(msg.chat_id_, msg.id_, ' *⋄︙لا يوجد حساب بهاذا المعرف*')
end
end
tdcli_function({ID = "SearchPublicChat",username_ = username}, Function_v, nil)
return false
end
if text and text:match("^كشف (%d+)$") then
local userid = text:match("^كشف (%d+)$") 
if userid then
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
local UserName = ("@"..data.username_ or "لا يوجد")
local id = userid
local rtp = Get_Rank(id,msg.chat_id_)
texts ='*⋄︙الايدي » ('..id..')*\n*⋄︙المعرف » (*['..UserName..'])\n*⋄︙الرتبه » ('..rtp..')*\n*⋄︙نوع الكشف » بالايدي*'
send(msg.chat_id_, msg.id_, texts)
end,nil)
return false
end
end  
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function reply(extra, result, success)
database:del(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..result.sender_user_id_) 
database:incrby(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_, "\n *⋄︙تم اضافة له {"..Num..'} من الرسائل*')  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if database:get(bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id.."id:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
send(msg.chat_id_, msg.id_, " *⋄︙تم الغاء الامر* ") 
database:del(bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id.."id:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
database:del(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) 
database:incrby(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..iduserr,numadded)  
send(msg.chat_id_, msg.id_," *⋄︙تم اضافة له {"..numadded..'} من الرسائل*')  
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then
cMsg = text:match("^اضف رسائل (%d+)$")
database:setex(bot_id.."id:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120,cMsg)  
database:setex(bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, ' *⋄︙ارسل لي عدد الرسائل الان*') 
return false
end
if text == 'رسائلي' then
local nummsg = database:get(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 1
local Text = '*⋄︙عدد رسائلك هنا ~* '..nummsg..''
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح رسائلي' then
database:del(bot_id..'MeRo:messageUser'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = '*⋄︙تم مسح جميع رسائلك*'
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'سحكاتي' or text == 'تعديلاتي' then
local edit = database:get(bot_id..'MeRo:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = '*⋄︙عدد التعديلات هنا ~* '..edit..''
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' then
database:del(bot_id..'MeRo:message_edit'..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, '*⋄︙تم مسح جميع تعديلاتك*') 
end
if text == 'جهاتي' then
local addmem = database:get(bot_id.."MeRo:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) or 0
local Text = '*⋄︙عدد جهاتك المضافه هنا ~* '..addmem..''
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'مسح جهاتي' then
database:del(bot_id..'MeRo:Add:Memp'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = '*⋄︙تم مسح جميع جهاتك المضافه*'
send(msg.chat_id_, msg.id_,Text) 
end
if text ==("مسح") and Addictive(msg) and tonumber(msg.reply_to_message_id_) > 0 then
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   
end   
if text == "تنظيف المشتركين" and DevMeRo(msg) then
local pv = database:smembers(bot_id..'MeRo:UsersBot')  
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m» THE USER IS SAVE ME ↓\n» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m» THE USER IS BLOCK ME ↓\n» '..pv[i]..'\n\27[1;37m')
database:srem(bot_id..'MeRo:UsersBot',pv[i])  
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'*⋄︙لا يوجد مشتركين وهميين*')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'*⋄︙عدد المشتركين الان ~ '..#pv..'*\n*⋄︙تم العثور على ~ '..sendok..' مشترك قام بحظر البوت*\n*⋄︙اصبح عدد المشتركين الان ~ '..ok..' مشترك*')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف الكروبات" and DevMeRo(msg) then
local group = database:smembers(bot_id..'MeRo:Chek:Groups')  
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m» THE BOT IS NOT ADMIN ↓\n» '..group[i]..'\n\27[1;37m')
database:srem(bot_id..'MeRo:Chek:Groups',group[i])  
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'MeRo:Chek:Groups',group[i])  
q = q + 1
print('\27[30;35m» THE BOT IS LEFT GROUP ↓\n» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'MeRo:Chek:Groups',group[i])  
q = q + 1
print('\27[30;36m» THE BOT IS KICKED GROUP ↓\n» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'MeRo:Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'*⋄︙لا توجد مجموعات وهميه*')   
else
local taha = (w + q)
local sendok = #group - taha
if q == 0 then
taha = ''
else
taha = '\n*⋄︙تم ازالة ~ '..q..' مجموعات من البوت*'
end
if w == 0 then
storm = ''
else
storm = '\n*⋄︙تم ازالة ~'..w..' مجموعه لان البوت عضو*'
end
send(msg.chat_id_, msg.id_,'*⋄︙ عدد المجموعات الان ~ '..#group..' مجموعه '..storm..''..taha..'*\n*⋄︙اصبح عدد المجموعات الان ~ '..sendok..' مجموعات*\n')   
end
end
end,nil)
end
return false
end
if text == 'تفعيل غنيلي' and DevMeRo(msg) then   
if database:get(bot_id..'sing:for:me'..msg.chat_id_) then
Text = ' *⋄︙تم تفعيل امر غنيلي الان ارسل غنيلي*'
database:del(bot_id..'sing:for:me'..msg.chat_id_)  
else
Text = ' *⋄︙بالتاكيد تم تفعيل امر غنيلي تستطيع ارسال غنيلي*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل غنيلي' and DevMeRo(msg) then  
if not database:get(bot_id..'sing:for:me'..msg.chat_id_) then
database:set(bot_id..'sing:for:me'..msg.chat_id_,true)  
Text = '\n *⋄︙تم تعطيل امر غنيلي*'
else
Text = '\n *⋄︙بالتاكيد تم تعطيل امر غنيلي*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == ("تحديث السورس") and DevMeRo(msg) then  
send(msg.chat_id_,msg.id_,'*⋄︙تم تحديث السورس الى الاصدار جديد*')
os.execute('rm -rf MeRo.lua')
os.execute('wget https://raw.githubusercontent.com/MeRoAsMrDeV/MeRo/main/MeRo.lua')
dofile('MeRo.lua')  
return false
end
if text == "راسلني" then
rpl = {"ها هلاو","انطق","كول"};
sender = rpl[math.random(#rpl)]
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendmessage?chat_id=' .. msg.sender_user_id_ .. '&text=' .. URL.escape(sender))
end
if text == "تعطيل الزخرفه" and Owner(msg) then
send(msg.chat_id_, msg.id_, '*⋄ تم تعطيل الزخرفه*')
database:set(bot_id.."MeRo:zhrf_Bots"..msg.chat_id_,"close")
end
if text == "تفعيل الزخرفه" and Owner(msg) then
send(msg.chat_id_, msg.id_,'*⋄ تم تفعيل الزخرفه*')
database:set(bot_id.."MeRo:zhrf_Bots"..msg.chat_id_,"open")
end
if text and text:match("^زخرفه (.*)$") and database:get(bot_id.."MeRo:zhrf_Bots"..msg.chat_id_) == "open" then
local TextZhrfa = text:match("^زخرفه (.*)$")
zh = https.request('https://vvvzvv.ml/amirZhfa/Teland.php?en='..URL.escape(TextZhrfa)..'')
zx = JSON.decode(zh)
t = "\n⋄️︙قائمه الزخرفه \n— — — — — — — — — — — — — — \n"
i = 0
for k,v in pairs(zx.ok) do
i = i + 1
t = t..i.."-  `"..v.."` \n"
end
send(msg.chat_id_, msg.id_, t..'— — — — — — — — — — — — — —\n⋄︙اضغط على الاسم ليتم نسخه')
end
if text == "تعطيل الابراج" and Owner(msg) then
send(msg.chat_id_, msg.id_, '*⋄︙تم تعطيل الابراج*')
database:set(bot_id.." amir:brj_Bots"..msg.chat_id_,"close")
end
if text == "تفعيل الابراج" and Owner(msg) then
send(msg.chat_id_, msg.id_,'*⋄︙تم تفعيل الابراج*')
database:set(bot_id.." amir:brj_Bots"..msg.chat_id_,"open")
end
if text and text:match("^برج (.*)$") and database:get(bot_id.." amir:brj_Bots"..msg.chat_id_) == "open" then
local Textbrj = text:match("^برج (.*)$")
gk = https.request('https://vvvzvv.ml/amirBrg/Teland.php?br='..URL.escape(Textbrj)..'')
br = JSON.decode(gk)
i = 0
for k,v in pairs(br.ok) do
i = i + 1
t = v.."\n"
end
send(msg.chat_id_, msg.id_, t)
end
if text == "تعطيل حساب العمر" and Owner(msg) then
send(msg.chat_id_, msg.id_, '*⋄︙تم تعطيل حساب العمر*')
database:set(bot_id.." amir:age_Bots"..msg.chat_id_,"close")
end
if text == "تعطيل حساب العمر" and Owner(msg) then
send(msg.chat_id_, msg.id_, '*⋄︙تم تعطيل حساب العمر*')
database:set(bot_id.." amir:age_Bots"..msg.chat_id_,"close")
end
if text == "تفعيل حساب العمر" and Owner(msg) then
send(msg.chat_id_, msg.id_,'*⋄︙تم تفعيل حساب العمر*')
database:set(bot_id.." amir:age_Bots"..msg.chat_id_,"open")
end
if text and text:match("^احسب (.*)$") and database:get(bot_id.." amir:age_Bots"..msg.chat_id_) == "open" then
local Textage = text:match("^احسب (.*)$")
ge = https.request('https://vvvzvv.ml/amirOmr/Teland.php?age='..URL.escape(Textage)..'')
ag = JSON.decode(ge)
i = 0
for k,v in pairs(ag.ok) do
i = i + 1
t = v.."\n"
end
send(msg.chat_id_, msg.id_, t)
end
if text == "فويز" then
data,res = https.request('https://vvvzvv.ml/Foes/Teland.php')
if res == 200 then
audios = json:decode(data)
if audios.Info == true then
local Text ='*⋄︙تم اختيار البصمه الصوتيه لك*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '- MeRo TeAm .',url="t.me/YYYDR"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice='..URL.escape(audios.info)..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
if text == "غنيلي" and not database:get(bot_id.."sing:for:me"..msg.chat_id_) then
data,res = https.request('https://vvvzvv.ml/amirVois/Teland.php')
if res == 200 then
audios = json:decode(data)
if audios.Info == true then
local Text ='*⋄︙تم اختيار المقطع الصوتي لك*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '- MeRo TeAm .',url="t.me/YYYDR"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice='..URL.escape(audios.info)..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
if text and not database:get(bot_id.."AutoFile") then
Time = database:get(bot_id.."AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then  
local list = database:smembers(bot_id..'MeRo:Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'MeRo Chat'
creator = database:smembers(bot_id..'creator'..v)
ASAS = database:smembers(bot_id.."MeRo:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."MeRo:Constructor"..v)
MDER = database:smembers(bot_id.."MeRo:Manager"..v)
MOD = database:smembers(bot_id.."MeRo:Mod:User"..v)
link = database:get(bot_id.."MeRo:Link_Group"..v) or ''
if k == 1 then
t = t..'"'..v..'":{"MeRo":"'..NAME..'",'
else
t = t..',"'..v..'":{"MeRo":"'..NAME..'",'
end
if #creator ~= 0 then 
t = t..'"creator":['
for k,v in pairs(creator) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(Sudo, msg.id_,'./File_Libs/'..bot_id..'.json', '⋄︙ عدد مجموعات التي في البوت { '..#list..'}')
database:set(bot_id.."AutoFile:Time",os.date("%x"))
end
else 
database:set(bot_id.."AutoFile:Time",os.date("%x"))
end
end
if (msg.content_.sticker_)  and msg.reply_to_message_id_ == 0 and database:get(bot_id.."MeRo:Lock:Xn"..msg.chat_id_)=="del" then      
sticker_id = msg.content_.sticker_.sticker_.persistent_id_
st = https.request('https://black-source.tk/BlackTeAM/ImageInfo.php?token='..token..'&url='..sticker_id.."&type=sticker")
eker = JSON.decode(st)
if eker.ok.Info == "Indecent" then
local list = database:smembers(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_)
t = "⋄︙ المنشئين الاساسين تعالو مخرب \n— — — — — — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "⋄︙ماكو منششئين يشوفولك جاره"
end
Reply_Status(msg,msg.sender_user_id_,"reply","⋄︙قام بنشر ملصق اباحيه\n"..t)  
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.id_),msg.id_})   
end   
end
if (msg.content_.photo_) and msg.reply_to_message_id_ == 0 and database:get(bot_id.."MeRo:Lock:Xn"..msg.chat_id_)=="del" then
photo_id = msg.content_.photo_.sizes_[1].photo_.persistent_id_  
Srrt = https.request('https://black-source.tk/BlackTeAM/ImageInfo.php?token='..token..'&url='..photo_id.."&type=photo")
Sto = JSON.decode(Srrt)
if Sto.ok.Info == "Indecent" then
local list = database:smembers(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_)
t = "⋄︙ المنشئين الاساسين تعالو مخرب \n— — — — — — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "⋄︙ماكو منششئين يشوفولك جاره"
end
Reply_Status(msg,msg.sender_user_id_,"reply","⋄︙قام بنشر صوره اباحيه\n"..t)  
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.id_),msg.id_})   
end   
end
if text == 'ملصق' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.photo_ then 
local pn = result.content_.photo_.sizes_[1].photo_.persistent_id_
Addsticker(msg,msg.chat_id_,pn,msg.sender_user_id_..'.png')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'صوت' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.voice_ then 
local mr = result.content_.voice_.voice_.persistent_id_ 
Addmp3(msg,msg.chat_id_,mr,msg.sender_user_id_..'.mp3')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'بصمه' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.audio_ then 
local mr = result.content_.audio_.audio_.persistent_id_
Addvoi(msg,msg.chat_id_,mr,msg.sender_user_id_..'.ogg')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'صوره' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.sticker_ then 
local Str = result.content_.sticker_.sticker_.persistent_id_ 
Addjpg(msg,msg.chat_id_,Str,msg.sender_user_id_..'.jpg')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'تفعيل البوت الخدمي' and DevMeRo(msg) then  
database:del(bot_id..'MeRo:Free:Add:Bots') 
send(msg.chat_id_, msg.id_,'*⋄︙تم تفعيل البوت الخدمي*') 
end
if text == 'تعطيل البوت الخدمي' and DevMeRo(msg) then  
database:set(bot_id..'MeRo:Free:Add:Bots',true) 
send(msg.chat_id_, msg.id_,'*⋄︙تم تعطيل البوت الخدمي*') 
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") and DevMeRo(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") 
database:set(bot_id..'MeRo:Num:Add:Bot',Num) 
send(msg.chat_id_, msg.id_,'*⋄︙تم وضع عدد الاعضاء ~'..Num..' عضو*')
end
if text =='الاحصائيات' and DevBot(msg) then
local Groups = database:scard(bot_id..'MeRo:Chek:Groups')  
local Users = database:scard(bot_id..'MeRo:UsersBot')  
send(msg.chat_id_, msg.id_,'*⋄︙احصائيات البوت*\n\n*⋄︙عدد المجموعات ~ '..Groups..'*\n*⋄︙عدد المشتركين ~ '..Users..'*')
end
if text == 'جلب نسخه البوت' and DevMeRo(msg) then
local list = database:smembers(bot_id..'MeRo:Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'MeRo Chat'
creator = database:smembers(bot_id..'creator'..v)
ASAS = database:smembers(bot_id.."MeRo:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."MeRo:Constructor"..v)
MDER = database:smembers(bot_id.."MeRo:Manager"..v)
MOD = database:smembers(bot_id.."MeRo:Mod:User"..v)
link = database:get(bot_id.."MeRo:Link_Group"..v) or ''
if k == 1 then
t = t..'"'..v..'":{"MeRo":"'..NAME..'",'
else
t = t..',"'..v..'":{"MeRo":"'..NAME..'",'
end
if #creator ~= 0 then 
t = t..'"creator":['
for k,v in pairs(creator) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,'./File_Libs/'..bot_id..'.json', '⋄︙ عدد مجموعات التي في البوت { '..#list..'}')
end
if text == 'المطور' then
local Text_Dev = database:get(bot_id..'MeRo:Text_Dev')
if Text_Dev then 
send(msg.chat_id_, msg.id_,Text_Dev)
else
tdcli_function ({ID = "GetUser",user_id_ = Sudo,},function(arg,result) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = Sudo,offset_ = 0,limit_ = 1},function(arg,getpro) 
if getpro.photos_[0] then
Name = '*المطور ⇠* ['..result.first_name_..'](tg://user?id='..result.id_..')\n'
Name = Name..'*البايو ⇠* ['..getbio(Sudo)..']\n'
keyboard = {}
keyboard.inline_keyboard = {{{text = ''..result.first_name_..'', url = "https://t.me/"..result.username_..""}},}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..msg.chat_id_..'&caption='..URL.escape(Name)..'&photo='..getpro.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
send(msg.chat_id_, msg.id_,Name)
end
end,nil)   
end,nil)   
end
end
if text == 'الملفات' and DevMeRo(msg) then
t = '*⋄︙جميع الملفات سورس ميرو*\n*— — — — — — — — — — — — — —*\n'
i = 0
for v in io.popen('ls MeRo_Files'):lines() do
if v:match(".lua$") then
i = i + 1
t = t..i..'*~ '..v..'*\n'
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == "متجر الملفات" or text == 'المتجر' then
if DevMeRo(msg) then
local Get_Files, res = https.request("https://raw.githubusercontent.com/MeRoAsMrDeV/Files_MeRo/main/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n *⋄︙اهلا بك في متجر ملفات ميرو*\n*⋄︙ملفات السورس ↓*\n*— — — — — — — — — — — — — —*\n\n"
local TextE = "\n*— — — — — — — — — — — — — —*\n *⋄︙علامة تعني { ✓ } ملف مفعل*\n *⋄︙علامة تعني { ✘ } ملف معطل*\n *⋄︙قناة سورس ميرو ↓*\n".." *⋄︙*[اضغط هنا لدخول](t.me/YYYDR) \n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local Check_File_is_Found = io.open("MeRo_Files/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "(✓)"
else
CeckFile = "(✘)"
end
NumFile = NumFile + 1
TextS = TextS..'*'..NumFile.."→* {`"..name..'`} » '..CeckFile..'\n[-Information]('..Info..')\n'
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد اتصال من ال api \n*") 
end
return false
end
end

if text and text:match("^(تعطيل) (.*)(.lua)$") and DevMeRo(msg) then
local name_t = {string.match(text, "^(تعطيل) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("MeRo_Files/"..file,"r")
if file_bot then
io.close(file_bot)
t = "*⋄︙الملف » {"..file.."}\n⋄︙تم تعطيله وحذفه بنجاح \n*"
else
t = "*⋄︙بالتاكيد تم تعطيل وحذف ملف » {"..file.."} \n*"
end
local json_file, res = https.request("https://raw.githubusercontent.com/MeRoAsMrDeV/Files_MeRo/main/File_Bot/"..file)
if res == 200 then
os.execute("rm -fr MeRo_Files/"..file)
send(msg.chat_id_, msg.id_,t) 
dofile('MeRo.lua')  
else
send(msg.chat_id_, msg.id_,"*⋄︙عذرا لا يوجد هاكذا ملف في المتجر *\n") 
end
return false
end
if text and text:match("^(تفعيل) (.*)(.lua)$") and DevMeRo(msg) then
local name_t = {string.match(text, "^(تفعيل) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("MeRo_Files/"..file,"r")
if file_bot then
io.close(file_bot)
t = "*⋄︙بالتاكيد تم تنزيل وتفعيل » {"..file.."} \n*"
else
t = "*⋄︙الملف » {"..file.."}\n⋄︙تم تنزيله وتفعيله بنجاح \n*"
end
local json_file, res = https.request("https://raw.githubusercontent.com/MeRoAsMrDeV/Files_MeRo/main/File_Bot/"..file)
if res == 200 then
local chek = io.open("MeRo_Files/"..file,'w+')
chek:write(json_file)
chek:close()
send(msg.chat_id_, msg.id_,t) 
dofile('MeRo.lua')  
else
send(msg.chat_id_, msg.id_,"*⋄︙عذرا لا يوجد هاكذا ملف في المتجر *\n") 
end
return false
end
if text == "مسح جميع الملفات" and DevMeRo(msg) then
os.execute("rm -fr MeRo_Files/*")
send(msg.chat_id_,msg.id_,"*⋄︙تم حذف جميع الملفات*")
return false
end
if text == 'نقل الاحصائيات' and DevMeRo(msg) then
local Users = database:smembers('MeRo:'..bot_id.."userss")
local Groups = database:smembers('MeRo:'..bot_id..'groups') 
for i = 1, #Groups do
database:sadd(bot_id..'MeRo:Chek:Groups',Groups[i])  
end
for i = 1, #Users do
database:sadd(bot_id..'MeRo:UsersBot',Users[i])  
end
send(msg.chat_id_, msg.id_,'*⋄︙تم نقل : '..#Groups..' كروب*\n*⋄︙تم نقل : '..#Users..' مشترك*\n*⋄︙من التحديث القديم الى التحديث الجديد*')
end
if text == 'حذف كليشه المطور' and DevMeRo(msg) then
database:del(bot_id..'MeRo:Text_Dev')
send(msg.chat_id_, msg.id_,'*⋄︙تم حذف كليشه المطور*')
end
if text == 'وضع كليشه المطور' and DevMeRo(msg) then
database:set(bot_id..'MeRo:Set:Text_Dev'..msg.chat_id_,true)
send(msg.chat_id_,msg.id_,'*⋄︙ارسل الكليشه الان*')
return false
end
if text and database:get(bot_id..'MeRo:Set:Text_Dev'..msg.chat_id_) then
if text == 'الغاء' then 
database:del(bot_id..'MeRo:Set:Text_Dev'..msg.chat_id_)
send(msg.chat_id_,msg.id_,'*⋄︙تم الغاء حفظ كليشة المطور*')
return false
end
database:set(bot_id..'MeRo:Text_Dev',text)
database:del(bot_id..'MeRo:Set:Text_Dev'..msg.chat_id_)
send(msg.chat_id_,msg.id_,'*⋄︙تم حفظ كليشة المطور*')
return false
end
if text == 'رفع نسخه البوت' and DevMeRo(msg) then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
add_file(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == "تحديث" and DevMeRo(msg) then
dofile("MeRo.lua")  
send(msg.chat_id_, msg.id_, "*⋄︙تم التحديث جميع الملفات*")
end
if text == 'السورس' or text == 'سورس' or text == 'ياسورس' or text == 'يا سورس' then  
Text = "ᴡᴇʟᴄᴏᴍᴇ ᴛᴏ sᴏᴜʀᴄᴇ ᴍᴇʀᴏ\n\n[⋄  ᴍᴇʀᴏ ᴄʜᴀɴɴᴇʟ](http://t.me/YYYKU)\n\n[⋄  ɪɴғᴏ sᴏᴜʀᴄᴇ](http://t.me/YYYDR)\n\n[⋄  ᴍᴇʀᴏ ᴅᴇᴠᴇʟᴏᴘᴇʀ](http://t.me/FEEEM)\n\n[⋄  ʙᴏᴛ ᴍᴇʀᴏ](http://t.me/FEEEM)"
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '⋄ sᴏᴜʀᴄᴇ ᴍᴇʀᴏ',url="t.me/YYYDR"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/YYYDR&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'رابط الحذف' or text == 'رابط حذف' then
t =[[
*رابط الحذف في جميع مواقع التواصل ⋄
فكر قبل لا تتسرع وتروح*
ٴ*— — — — — — — — — — — — — —*ٴ
 *⋄ رابط حذف*  [Telegram](https://my.telegram.org/auth?to=delete) ܁
 *⋄ رابط حذف* [instagram](https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/) ܁
 *⋄ رابط حذف* [Facebook](https://www.facebook.com/help/deleteaccount) ܁
 *⋄ رابط حذف* [Snspchat](https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount) ܁
]]
send(msg.chat_id_, msg.id_,t) 
return false
end
if text == "شنو رئيك بهذا" or text == "شنو رئيك بهذ" then
if not database:get(bot_id..'lock:add'..msg.chat_id_) then
local texting = {"ادب سسز يباوع علي بنات ??🥺"," مو خوش ولد 😶","زاحف وما احبه 😾😹"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "شنو رئيك بهاي" or text == "شنو رئيك بهايي" then
if not database:get(bot_id..'lock:add'..msg.chat_id_) then
local texting = {"دور حلوين 🤕😹","جكمه وصخه عوفها ☹️😾","حقيره ومنتكبره 😶😂"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "هينه" or text == "رزله" then
if not database:get(bot_id..'lock:add'..msg.chat_id_) then
local texting = {"ولك هيو لتندك بسيادك لو بهاي 👞👈","ميستاهل اتعبي روحي ويا لانه عار","عوفه يروحي هاذا طيز يضل يمضرط🤣"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "مصه" or text == "بوسه" then
if not database:get(bot_id..'lock:add'..msg.chat_id_) then
local texting = {"مووووووووواححح????","مابوس ولي😌😹","خدك/ج نضيف 😂","البوسه بالف حمبي 🌝💋","خلي يزحفلي وابوسه 🙊😻","كل شويه ابوسه كافي 😏","ماابوسه والله هذا زاحف🦎","محح هاي لحاته صاكه??"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == 'تفعيل نسبه الحب' and Owner(msg) then   
if database:get(bot_id..'Cick:lov'..msg.chat_id_) then
Text = ' *⋄︙تم تفعيل نسبه الحب*'
database:del(bot_id..'Cick:lov'..msg.chat_id_)  
else
Text = ' *⋄︙بالتاكيد تم تفعيل نسبه الحب*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل نسبه الحب' and Owner(msg) then  
if not database:get(bot_id..'Cick:lov'..msg.chat_id_) then
database:set(bot_id..'Cick:lov'..msg.chat_id_,true)  
Text = '\n *⋄︙تم تعطيل نسبه الحب*'
else
Text = '\n *⋄︙بالتاكيد تم تعطيل نسبه الحب*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل نسبه الرجوله' and Owner(msg) then   
if database:get(bot_id..'Cick:rjo'..msg.chat_id_) then
Text = ' *⋄︙تم تفعيل نسبه الرجوله*'
database:del(bot_id..'Cick:rjo'..msg.chat_id_)  
else
Text = ' *⋄︙بالتاكيد تم تفعيل الرجوله*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل نسبه الرجوله' and Owner(msg) then  
if not database:get(bot_id..'Cick:rjo'..msg.chat_id_) then
database:set(bot_id..'Cick:rjo'..msg.chat_id_,true)  
Text = '\n *⋄︙تم تعطيل نسبه الرجوله*'
else
Text = '\n *⋄︙بالتاكيد تم تعطيل نسبه الرجوله*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل نسبه الكره' and Owner(msg) then   
if database:get(bot_id..'Cick:krh'..msg.chat_id_) then
Text = ' *⋄︙تم تفعيل نسبه الكره*'
database:del(bot_id..'Cick:krh'..msg.chat_id_)  
else
Text = ' *⋄︙بالتاكيد تم تفعيل نسبه الكره*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل نسبه الكره' and Owner(msg) then  
if not database:get(bot_id..'Cick:krh'..msg.chat_id_) then
database:set(bot_id..'Cick:krh'..msg.chat_id_,true)  
Text = '\n *⋄︙تم تعطيل نسبه الكره*'
else
Text = '\n *⋄︙بالتاكيد تم تعطيل نسبه الكره*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل نسبه الانوثه' and Owner(msg) then   
if database:get(bot_id..'Cick:ano'..msg.chat_id_) then
Text = ' *⋄︙تم تفعيل نسبه الانوثه*'
database:del(bot_id..'Cick:ano'..msg.chat_id_)  
else
Text = ' *⋄︙بالتاكيد تم تفعيل الانوثه*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل نسبه الانوثه' and Owner(msg) then  
if not database:get(bot_id..'Cick:ano'..msg.chat_id_) then
database:set(bot_id..'Cick:ano'..msg.chat_id_,true)  
Text = '\n *⋄︙تم تعطيل نسبه الانوثه*'
else
Text = '\n *⋄︙بالتاكيد تم تعطيل نسبه الانوثه*'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == "نسبه الحب" or text == "نسبه حب" and msg.reply_to_message_id_ ~= 0 and Mod(msg) then
if not database:get(bot_id..'Cick:lov'..msg.chat_id_) then
database:set(bot_id..":"..msg.sender_user_id_..":lov_Bots"..msg.chat_id_,"sendlove")
Text = '*ارسل اسمك واسم الشخص الثاني*،  \n* مثال محـمد و تـبارك*'
send(msg.chat_id_, msg.id_,Text) 
end
end
if text and text ~="نسبه الحب" and database:get(bot_id..":"..msg.sender_user_id_..":lov_Bots"..msg.chat_id_) == "sendlove" then
num = {"10","20","30","35","75","34","66","82","23","19","55","8","63","32","27","89","99","98","3","80","49","100","6","0",};
sendnum = num[math.random(#num)]
sl = '*نسبه حب* *'..text..'* هي :* '..sendnum..'%*'
send(msg.chat_id_, msg.id_,sl) 
database:del(bot_id..":"..msg.sender_user_id_..":lov_Bots"..msg.chat_id_)
end
if text == "نسبه الكره" or text == "نسبه كره" and msg.reply_to_message_id_ ~= 0 and Mod(msg) then
if not database:get(bot_id..'Cick:krh'..msg.chat_id_) then
database:set(bot_id..":"..msg.sender_user_id_..":krh_Bots"..msg.chat_id_,"sendkrhe")
Text = '*ارسل اسمك واسم الشخص الثاني*،  \n* مثال محـمد و تـبارك*'
send(msg.chat_id_, msg.id_,Text) 
end
end
if text and text ~="نسبه الكره" and database:get(bot_id..":"..msg.sender_user_id_..":krh_Bots"..msg.chat_id_) == "sendkrhe" then
num = {"10","20","30","35","75","34","66","82","23","19","55","8","63","32","27","89","99","98","3","80","8","100","6","0",};
sendnum = num[math.random(#num)]
sl = '*نسبه كره* *'..text..'* هي : *'..sendnum..'%*'
send(msg.chat_id_, msg.id_,sl) 
database:del(bot_id..":"..msg.sender_user_id_..":krh_Bots"..msg.chat_id_)
end
if text == "نسبه رجوله" or text == "نسبه الرجوله" and msg.reply_to_message_id_ ~= 0 and Mod(msg) then
if not database:get(bot_id..'Cick:rjo'..msg.chat_id_) then
database:set(bot_id..":"..msg.sender_user_id_..":rjo_Bots"..msg.chat_id_,"sendrjoe")
Text = '*ارسل اسم الشخص الذي تريد قياس نسبه رجولته* \n *مثال عـمࢪ*'
send(msg.chat_id_, msg.id_,Text) 
end
end
if text and text ~="نسبه رجوله" and database:get(bot_id..":"..msg.sender_user_id_..":rjo_Bots"..msg.chat_id_) == "sendrjoe" then
numj = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnuj = numj[math.random(#numj)]
xl = '*نسبه رجوله* *'..text..'* هي : *\n '..sendnuj..'%*'
send(msg.chat_id_, msg.id_,xl) 
database:del(bot_id..":"..msg.sender_user_id_..":rjo_Bots"..msg.chat_id_)
end
if text == "نسبه الانوثه" or text == "نسبه انوثه" and msg.reply_to_message_id_ ~= 0 and Mod(msg) then
if not database:get(bot_id..'Cick:ano'..msg.chat_id_) then
database:set(bot_id..":"..msg.sender_user_id_..":ano_Bots"..msg.chat_id_,"sendanoe")
Text = '*ارسل اسم الشخص الذي تريد قياس نسبه انوثتها* \n *مثال ايـه*'
send(msg.chat_id_, msg.id_,Text) 
end
end
if text and text ~="نسبه الانوثه" and database:get(bot_id..":"..msg.sender_user_id_..":ano_Bots"..msg.chat_id_) == "sendanoe" then
numj = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnuj = numj[math.random(#numj)]
xl = '*نسبه الانوثه* *'..text..'* هي : *\n '..sendnuj..'%*'
send(msg.chat_id_, msg.id_,xl) 
database:del(bot_id..":"..msg.sender_user_id_..":ano_Bots"..msg.chat_id_)
end
if text == 'الاوامر' and Addictive(msg) then
Text = [[
*⋄︙اهلا بك في قائمه اوامر البوت*
ٴ*— — — — — — — — — — — — — —*ٴ
*⋄︙م1 ◂ اوامر الحمايه*
*⋄︙م2 ◂ اوامر تعطيل ~ تفعيل*
*⋄︙م3 ◂ اوامر ضع ~ اضف*
*⋄︙م4 ◂ اوامر مسح ~ حذف*
*⋄︙م5 ◂ اوامر تنزيل+رفع+التغير*
*⋄︙م6 ◂ اوامر الكروب*
*⋄︙م7 ◂ اوامر التحشيش*
*⋄︙م8 ◂ اوامر مطور البوت*
*⋄︙م9 ◂ اوامر مطور الاساسي* 
*⋄︙م10 ◂ اوامر الاعضاء*
ٴ*— — — — — — — — — — — — — —*ٴ
[- MeRo TeAm . ](t.me/YYYDR) 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اوامر الحمايه', callback_data="/help1"},{text = 'اوامر الادمنيه', callback_data="/help2"}},
{{text = 'اوامر الوضع', callback_data="/help3"},{text = 'اوامر المسح', callback_data="/help4"}},
{{text = 'اوامر المنشئين', callback_data="/help5"},{text = 'اوامر المجموعه', callback_data="/help6"}},
{{text = 'اوامر التحشيش', callback_data="/help7"},{text = 'اوامر المطورين', callback_data="/help8"}},
{{text = 'اوامر مطور الاساسي', callback_data="/help9"},{text = 'اوامر العضو', callback_data="/help10"}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end


end ---- Chat_Type = 'GroupBot' 
end ---- Chat_Type = 'GroupBot' 

if text == 'تفعيل' and DevBot(msg) then 
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'*⋄︙البوت ليس ادمن يرجى ترقيتي !*') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'MeRo:Num:Add:Bot') or 0) and not DevMeRo(msg) then
send(msg.chat_id_, msg.id_,'⋄︙عدد اعضاء المجموعه اقل من *~ {'..(database:get(bot_id..'MeRo:Num:Add:Bot') or 0)..'* عضو')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if database:sismember(bot_id..'MeRo:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'*⋄︙المجموعه مفعله سابقا* ')
else
Reply_Status(msg,result.id_,'reply_Add','*⋄︙تم تفعيل المجموعه*  '..chat.title_..'')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
database:sadd(bot_id.."creator"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
database:sadd(bot_id..'MeRo:Chek:Groups',msg.chat_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local NumMember = data.member_count_
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '⋄︙تم تفعيل مجموعه جديده\n'..
'\n⋄︙بواسطة ~ '..Name..''..
'\n⋄︙ايدي المجموعه ~ `'..IdChat..'`'..
'\n⋄︙اسم المجموعه ~ ['..NameChat..']'..
'\n⋄︙الرابط ~ ['..LinkGp..']'
if not DevMeRo(msg) then
send(Id_Sudo, 0,Text)
end
end
end,nil) 
end,nil) 
end,nil)
end
if text == 'تعطيل' and DevBot(msg) and GetChannelMember(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if not database:sismember(bot_id..'MeRo:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'*⋄︙المجموعه معطله سابقا*')
else
Reply_Status(msg,result.id_,'reply_Add','*⋄︙تم تعطيل المجموعه*  '..chat.title_..'')
database:srem(bot_id..'MeRo:Chek:Groups',msg.chat_id_)  
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '⋄︙تم تعطيل مجموعه جديده\n'..
'\n⋄︙بواسطة ~ '..Name..''..
'\n⋄︙ايدي المجموعه ~ `'..IdChat..'`'..
'\n⋄︙اسم المجموعه ~ ['..NameChat..']'..
'\n⋄︙الرابط ~ ['..LinkGp..']'
send(Id_Sudo, 0,Text)
end
end,nil) 
end,nil) 
end
if text == 'تفعيل' and not DevBot(msg) and not database:get(bot_id..'MeRo:Free:Add:Bots') and GetChannelMember(msg) then
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'⋄︙البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if da and da.user_id_ == msg.sender_user_id_ then
if da.status_.ID == "ChatMemberStatusCreator" then
var = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
var = 'الادمن'
else 
var= 'عضو'
end
if database:sismember(bot_id..'MeRo:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'*⋄︙المجموعه مفعله سابقا* ')
else
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'MeRo:Num:Add:Bot') or 0) and not DevMeRo(msg) then
send(msg.chat_id_, msg.id_,'⋄︙عدد اعضاء المجموعه اقل من ~* {'..(database:get(bot_id..'MeRo:Num:Add:Bot') or 0)..'* عضو')
return false
end
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NumMember = data.member_count_
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '⋄︙تم تفعيل مجموعه جديده\n'..
'\n⋄︙بواسطة ~ '..Name..''..
'\n⋄︙ايدي المجموعه ~ `'..IdChat..'`'..
'\n⋄︙اسم المجموعه ~ ['..NameChat..']'..
'\n⋄︙الرابط ~ ['..LinkGp..']'
if not DevMeRo(msg) then
send(Id_Sudo, 0,Text)
end
Reply_Status(msg,result.id_,'reply_Add','*⋄︙تم تفعيل المجموعه*  '..chat.title_..'')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
database:sadd(bot_id.."creator"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
database:sadd(bot_id..'MeRo:Chek:Groups',msg.chat_id_)  
database:sadd(bot_id..'MeRo:Basic:Constructor'..msg.chat_id_, msg.sender_user_id_)
end
end
end
end,nil)   
end,nil) 
end,nil) 
end,nil)
end
if Chat_Type == 'UserBot' then
if text == '/start' then  
if DevMeRo(msg) then
local Text = ' *⋄︙اهلا عزيزي آلمـطـور*\n*⋄︙آنت آلمـطـور آلآسـآسـي للبوت*\n— — — — — — — — — — — — — —ء\n*⋄︙تسـتطـيع‌‏ آلتحگم باوامر البوت*\n*⋄︙من خلاال الكيبورت خاص بك*\n*⋄︙قناة سورس البوت *[اضغط هنا](t.me/YYYDR)'
local keyboard = {
	{'الاحصائيات ⋄','قناه تحديثات البوت ⋄'},
{'تفعيل البوت الخدمي ⋄','تعطيل البوت الخدمي ⋄'},
{'اذاعه خاص ⋄','اذاعه ⋄'},
{'اذاعه بالتوجيه ⋄','اذاعه بالتوجيه خاص ⋄'},
{'تنظيف الكروبات ⋄','تنظيف المشتركين ⋄'},
{'تغيير اسم البوت ⋄','حذف اسم البوت ⋄'},
{'تفعيل التواصل ⋄','تعطيل التواصل ⋄'},
{'الاشتراك الاجباري ⋄'},
{'المطورين ⋄','مسح المطورين ⋄'},
{'قائمه العام ⋄','مسح قائمه العام ⋄'},
{'تفعيل المغادره ⋄','تعطيل المغادره ⋄'},
{'تفعيل الاذاعه ⋄','تعطيل الاذاعه ⋄'},
{'تفعيل الاشتراك الاجباري ⋄','تعطيل الاشتراك الاجباري ⋄'},
{'تغير رساله الاشتراك ⋄','حذف رساله الاشتراك ⋄'},
{'تعين قناة الاشتراك ⋄','تغير الاشتراك ⋄'},
{'نسخه البوت','رفع نسخه البوت'},
{'ضع كليشه ستارت ⋄','حذف كليشه ستارت ⋄'},
{'تفعيل النسخه التلقائيه ⋄','تعطيل النسخه التلقائيه ⋄'},
     {'تغيير المطور الاساسي ⋄'},      
{'تحديث السورس ⋄','تحديث الملفات ⋄'},
{'معلومات السيرفر ⋄','الاصدار ⋄'},
{'الغاء ⋄'}
}
send_inline_key(msg.chat_id_,Text,keyboard)
else
if not database:get(bot_id..'MeRo:Start:Time'..msg.sender_user_id_) then
local start = database:get(bot_id.."Start:Bot")  
if start then 
Test = start
else
tdcli_function ({ID = "GetUser",user_id_ = Sudo},function(arg,data) 
Test = '*⋄︙مرحبا انا بوت حماية كروبات*\n*⋄︙وضيفتي حماية المجموعات من السبام والتفليش والخ...*\n*⋄︙لتفعيل البوت اضفني الى مجموعاتك قم برفعي مشرف ثم ارسل تفعيل*\n*⋄︙معرف المطور* @['..data.username_..']'
end,nil)
end 
send(msg.chat_id_, msg.id_, Test) 
end
end
database:setex(bot_id..'MeRo:Start:Time'..msg.sender_user_id_,60,true)
return false
end
if text and text:match("^/start ph(.*)$") then
Sf = database:get(bot_id.."MeRo:Filter:msg")
local list = database:smembers(bot_id.."MeRo:List:Filter:Photo"..Sf)  
for k,v in pairs(list) do
if v then
inline = {
{{text = '- الغاء المنع .',callback_data="pito"..v}},
}
send_inline_Media(msg.chat_id_,"sendPhoto","photo",v,inline) 
end
end
if #list == 0 then
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد صور ممنوعه*")  
end
Zs = {
{{text = '- اضغط هنا .',callback_data="delallph"..Sf}},
}
send_inlin_key(msg.chat_id_,"*⋄︙هل تريد الغاء منع كل الصور؟*",Zs,msg.id_)
end  
if text and text:match("^/start msg(.*)$") then
sl = text:match("^/start msg(.*)$")
local list = database:smembers(bot_id.."MeRo:List:Filter:text"..sl)
t = "\n*⋄︙قائمة الكلمات الممنوعه*\n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
if v then
t = t..""..k.."- ["..v.."]\n"
end
end
if #list == 0 then
t = "*⋄︙لا يوجد كلمات ممنوعه*"  
end
send(msg.chat_id_, msg.id_,t)  
end  
if text and text:match("^/start gif(.*)$") then
Sf = text:match("^/start gif(.*)$")
local list = database:smembers(bot_id.."MeRo:List:Filter:Animation"..Sf)
for k,v in pairs(list) do
if v then
inline = {
{{text = '- الغاء المنع .',callback_data="animation"..v.."chatid"..Sf}},
}
send_inline_Media(msg.chat_id_,"sendanimation","animation",v,inline) 
end
end
if #list == 0 then
t = "*⋄︙لا يوجد متحركات ممنوعه*"  
send(msg.chat_id_, msg.id_,t)  
end
ZsText = "*⋄︙هل تريد الغاء منع كل المتحركات؟*"
Zs = {
{{text = '- اضغط هنا .',callback_data="delallanimation"..Sf}},
}
send_inlin_key(msg.chat_id_,ZsText,Zs,msg.id_)
end  
if text and text:match("^/start Sti(.*)$") then
Sf = text:match("^/start Sti(.*)$")
local list = database:smembers(bot_id.."MeRo:List:Filter:Sticker"..Sf)
for k,v in pairs(list) do
if v then
inline = {
{{text = '- الغاء المنع .',callback_data="Sticker"..v.."chatid"..Sf}},
}
send_inline_Media(msg.chat_id_,"sendSticker","sticker",v,inline) 
end
end
if #list == 0 then
t = "*⋄︙لا يوجد ملصقات ممنوعه*"  
send(msg.chat_id_, msg.id_,t)  
end
ZsText = "*⋄︙هل تريد الغاء منع كل  الملصقات؟*"
Zs = {
{{text = '- اضغط هنا .',callback_data="delallSticker"..Sf}},
}
send_inlin_key(msg.chat_id_,ZsText,Zs,msg.id_)
end
if not DevMeRo(msg) and not database:sismember(bot_id..'BaN:In:User',msg.sender_user_id_) and not database:get(bot_id..'Texting:In:Bv') and not database:get(bot_id.."MeRo:Filter"..msg.sender_user_id_) then
send(msg.sender_user_id_,msg.id_,'*⋄︙تمت ارسال رسالتك الى المطور*')    
tdcli_function({ID ="GetChat",chat_id_=Id_Sudo},function(arg,chat)  
tdcli_function({ID ="GetChat",chat_id_=msg.sender_user_id_},function(arg,chat)  
tdcli_function({ID="ForwardMessages",chat_id_=Id_Sudo,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,ta) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
sendText(Id_Sudo,'*⋄︙تم ارسال الملصق من ~* ['..string.sub(ta.first_name_,0, 40)..'](tg://user?id='..ta.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end,nil);end
if DevMeRo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' then
sendText(Id_Sudo,'*⋄︙الشخص »* ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n*⋄︙ تم حظره من التواصل* ',msg.id_/2097152/0.5,'md')
database:sadd(bot_id..'BaN:In:User',data.id_)  
return false  
end 
if text =='الغاء الحظر' then
sendText(Id_Sudo,'*⋄︙الشخص »* ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n*⋄︙تم الغاء حظره من التواصل* ',msg.id_/2097152/0.5,'md')
database:srem(bot_id..'BaN:In:User',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,ta) 
if ta.code_ == 400 or ta.code_ == 5 then
send(msg.chat_id_, msg.id_,'\n*⋄︙فشل ارسال رسالتك لان العضو قام بحظر البوت*') 
return false  
end 
if text then    
send(id_user,msg.id_,text)    
Text = '*⋄︙تمت ارسال الرساله اليه ..*'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '*⋄︙تمت ارسال الملصق اليه ..*'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_,msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '*⋄︙تمت ارسال الصوره اليه ..*'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, msg.content_.animation_.animation_.persistent_id_)    
Text = '*⋄︙تمت ارسال المتحركه اليه ..*'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, msg.content_.voice_.voice_.persistent_id_)    
Text = '*⋄︙تمت ارسال البصمه اليه ..*'
end     
sendText(Id_Sudo,Text..'\n'..'*⋄︙~ *['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);end,nil);end,nil);end,nil);end 
if DevMeRo(msg) then
if text == 'تفعيل التواصل ⋄' then  
database:del(bot_id..'Texting:In:Bv') 
send(msg.chat_id_, msg.id_,'*⋄︙تم تفعيل التواصل*') 
end
if text == 'تعطيل التواصل ⋄' then  
database:set(bot_id..'Texting:In:Bv',true) 
send(msg.chat_id_, msg.id_,'*⋄︙تم تعطيل التواصل*') 
end
if text == 'تفعيل النسخه التلقائيه ⋄' then  
send(msg.chat_id_, msg.id_,"*⋄︙تم تفعيل النسخه الاحتياطيه التلقائيه*") 
database:del(bot_id.."AutoFile")
end
if text == 'تعطيل النسخه التلقائيه ⋄' then  
send(msg.chat_id_, msg.id_,"*⋄︙تم تعطيل النسخه الاحتياطيه التلقائيه*") 
database:set(bot_id.."AutoFile",true) 
end
if text == 'معلومات السيرفر ⋄' then 
send(msg.chat_id_, msg.id_, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '⇗ نظام التشغيل ⇖•\n*»» '"$linux_version"'*' 
echo '*———————————~*\n✺✔{ الذاكره العشوائيه } ⇎\n*»» '"$memUsedPrc"'*'
echo '*———————————~*\n✺✔{ وحـده الـتـخـزيـن } ⇎\n*»» '"$HardDisk"'*'
echo '*———————————~*\n✺✔{ الـمــعــالــج } ⇎\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*———————————~*\n✺✔{ الــدخــول } ⇎\n*»» '`whoami`'*'
echo '*———————————~*\n✺✔{ مـده تـشغيـل الـسـيـرفـر }⇎\n*»» '"$uptime"'*'
]]):read('*all'))  
end
if text == 'الاصدار ⋄' then 
send(msg.chat_id_, msg.id_,' *⋄︙اصدار سورس ميرو* \n*⋄︙الاصدار »{ 2.8v}*')
end
if text == 'قناه تحديثات البوت ⋄'  then 
send(msg.chat_id_, msg.id_,' ⋄︙[تحديثات البوت](t.me/YYYDR) \n⋄︙[قناه السورس](t.me/YYYDR)')
end
if text =='الاحصائيات ⋄' then
local Groups = database:scard(bot_id..'MeRo:Chek:Groups')  
local Users = database:scard(bot_id..'MeRo:UsersBot')  
send(msg.chat_id_, msg.id_,'*⋄︙احصائيات البوت*\n\n*⋄︙عدد المجموعات ~ '..Groups..'*\n*⋄︙عدد المشتركين ~ '..Users..'*')
end
if text == "تنظيف المشتركين ⋄" then
local pv = database:smembers(bot_id..'MeRo:UsersBot')  
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m» THE USER IS SAVE ME ↓\n» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m» THE USER IS BLOCK ME ↓\n» '..pv[i]..'\n\27[1;37m')
database:srem(bot_id..'MeRo:UsersBot',pv[i])  
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'*⋄︙لا يوجد مشتركين وهميين*')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'*⋄︙عدد المشتركين الان ~ '..#pv..'*\n*⋄︙تم العثور على ~ '..sendok..' مشترك قام بحظر البوت*\n*⋄︙اصبح عدد المشتركين الان ~ '..ok..' مشترك*')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف الكروبات ⋄" then
local group = database:smembers(bot_id..'MeRo:Chek:Groups')  
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m» THE BOT IS NOT ADMIN ↓\n» '..group[i]..'\n\27[1;37m')
database:srem(bot_id..'MeRo:Chek:Groups',group[i])  
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'MeRo:Chek:Groups',group[i])  
q = q + 1
print('\27[30;35m» THE BOT IS LEFT GROUP ↓\n» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'MeRo:Chek:Groups',group[i])  
q = q + 1
print('\27[30;36m» THE BOT IS KICKED GROUP ↓\n» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'MeRo:Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'*⋄︙لا توجد مجموعات وهميه* ')   
else
local taha = (w + q)
local sendok = #group - taha
if q == 0 then
taha = ''
else
taha = '\n*⋄︙تم ازالة ~ '..q..' مجموعات من البوت*'
end
if w == 0 then
storm = ''
else
storm = '\n*⋄︙تم ازالة ~'..w..' مجموعه لان البوت عضو*'
end
send(msg.chat_id_, msg.id_,'*⋄︙عدد المجموعات الان ~ '..#group..' مجموعه '..storm..''..taha..'*\n*⋄︙اصبح عدد المجموعات الان ~ '..sendok..' مجموعات*\n')   
end
end
end,nil)
end
return false
end
if database:get(bot_id.."BLACKBTSS:Set:Name:Bot"..msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ⋄" then   
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء حفظ اسم البوت*") 
database:del(bot_id.."BLACKBTSS:Set:Name:Bot"..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."BLACKBTSS:Set:Name:Bot"..msg.sender_user_id_) 
database:set(bot_id.."MeRo:Name:Bot",text) 
send(msg.chat_id_, msg.id_, "*⋄︙ تم حفظ اسم البوت*")  
return false
end 
if text == "تغيير اسم البوت ⋄" or text == "حذف اسم البوت ⋄" and VIP_DeV(msg) then 
database:setex(bot_id.."BLACKBTSS:Set:Name:Bot"..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_,"*⋄︙ ارسل لي الاسم الان*")  
end
if text =='تغيير المطور الاساسي ⋄' and VIP_DeV(msg) then
send(msg.chat_id_, msg.id_,'*⋄︙ارسل ايدي المطور الاساسي الجديد*')
database:set(bot_id..'LACKBOTSS:Ed:DevBots',true) 
end
if text =='تغيير المطور الاساسي ⋄' and not VIP_DeV(msg) then
send(msg.chat_id_, msg.id_,'*⋄︙عذا الامر للمطور الاساسي فقط*')
end
if VIP_DeV(msg) then
if text == "الاشتراك الاجباري ⋄"  then  
if database:get(bot_id..'add:ch:username') then
local addchusername = database:get(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_, "*⋄︙تم تفعيل الاشتراك الاجباري*\n*⋄︙على القناة »* ["..addchusername.."]")
else
send(msg.chat_id_, msg.id_, "*⋄︙لا يوجد قناة في الاشتراك الاجباري*")
end
return false  
end
if text == "تفعيل الاشتراك الاجباري ⋄"  then  
if database:get(bot_id..'add:ch:id') then
local addchusername = database:get(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_,"*⋄︙الاشتراك الاجباري مفعل*\n*⋄︙على القناة »* ["..addchusername.."]")
else
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_,"*⋄︙اهلا عزيزي المطور*\n*⋄︙ارسل الان معرف قناتك*")
end
return false  
end
if text == "تعطيل الاشتراك الاجباري ⋄"  then  
database:del(bot_id..'add:ch:id')
database:del(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_, "*⋄︙تم تعطيل الاشتراك الاجباري*")
return false  
end
if text == 'تغير الاشتراك ⋄' then
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '*⋄︙حسنآ ارسل لي معرف القناة*')
return false  
end
if text == 'تغير رساله الاشتراك ⋄' then
database:setex(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '*⋄︙حسنآ ارسل لي النص الذي تريده*')
return false  
end
if text == "حذف رساله الاشتراك ⋄" then
database:del(bot_id..'text:ch:user')
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح رساله الاشتراك*")
return false  
end
if text == 'تعين قناة الاشتراك ⋄' then
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '*⋄︙حسنآ ارسل لي معرف القناة*')
return false  
end
end
if not VIP_DeV(msg) then
if text == "الاشتراك الاجباري ⋄"  or text == "تفعيل الاشتراك الاجباري ⋄"  or text == "تعطيل الاشتراك الاجباري ⋄"  or text == 'تغير رساله الاشتراك ⋄' or text == 'تغير الاشتراك ⋄' or text == "حذف رساله الاشتراك ⋄" or text == 'تعين قناة الاشتراك ⋄' then
send(msg.chat_id_, msg.id_,'*⋄︙عذا الامر للمطور الاساسي فقط*')
end
end
if database:get(bot_id.."LACKBOTSS:Ed:DevBots") then
if text and text:match("^(%d+)$") then
local IdDe = text:match("^(%d+)$")
send(msg.chat_id_,msg.id_, "*⋄︙تم تحفظ المعلومات اضغط ( تحديث الملفات ⋄ ) للتنفيذ*")
local A = io.open("sudo.lua", 'w')
A:write([[
s = "FEEEM"

q = "YYYDR"

token = "]]..token..[["

Sudo = ]]..IdDe..[[  
]])
A:close()
database:del(bot_id.."LACKBOTSS:Ed:DevBots")
end
end
if text == 'تفعيل البوت الخدمي ⋄' then
database:del(bot_id..'MeRo:Free:Add:Bots') 
send(msg.chat_id_, msg.id_,'\n*⋄︙تم تفعيل البوت الخدمي*') 
end
if text == 'تعطيل البوت الخدمي ⋄' then
database:set(bot_id..'MeRo:Free:Add:Bots',true) 
send(msg.chat_id_, msg.id_,'\n*⋄︙تم تعطيل البوت الخدمي*') 
end
if text=="اذاعه خاص ⋄" and msg.reply_to_message_id_ == 0 then
if database:get(bot_id.."MeRo:Status:Bc") and not DevMeRo(msg) then 
send(msg.chat_id_, msg.id_,"*⋄︙الاذاعه معطله من قبل المطور الاساسي*")
return false
end
database:setex(bot_id.."MeRo:MeRo:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الي اذاعتك خاصه الان*\n*⋄︙للخروج ارسل الغاء*") 
return false
end 

if text=="اذاعه ⋄" and msg.reply_to_message_id_ == 0 then
if database:get(bot_id.."MeRo:Status:Bc") and not DevMeRo(msg) then 
send(msg.chat_id_, msg.id_,"*⋄︙الاذاعه معطله من قبل المطور الاساسي*")
return false
end
database:setex(bot_id.."MeRo:MeRo:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"*⋄︙ارسل الي اذاعتك الان*\n*⋄︙للخروج ارسل الغاء*") 
return false
end  
if text=="اذاعه بالتوجيه ⋄" and msg.reply_to_message_id_ == 0  then
if database:get(bot_id.."MeRo:Status:Bc") and not DevMeRo(msg) then 
send(msg.chat_id_, msg.id_,"*⋄︙الاذاعه معطله من قبل المطور الاساسي*")
return false
end
database:setex(bot_id.."MeRo:MeRo:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"*⋄︙ارسل لي التوجيه الان*") 
return false
end 
if text=="اذاعه بالتوجيه خاص ⋄" and msg.reply_to_message_id_ == 0  then
if database:get(bot_id.."MeRo:Status:Bc") and not DevMeRo(msg) then 
send(msg.chat_id_, msg.id_,"*⋄︙الاذاعه معطله من قبل المطور الاساسي*")
return false
end
database:setex(bot_id.."MeRo:MeRo:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"*⋄︙ارسل لي التوجيه الان*") 
return false
end 
if text == "تفعيل الاذاعه ⋄" then
database:del(bot_id.."MeRo:Status:Bc") 
send(msg.chat_id_, msg.id_,"\n*⋄︙تم تفعيل الاذاعه*") 
return false
end 
if text == "تعطيل الاذاعه ⋄" then
database:set(bot_id.."MeRo:Status:Bc",true) 
send(msg.chat_id_, msg.id_,"\n*⋄︙تم تعطيل الاذاعه*") 
return false
end 
if text == "تفعيل المغادره ⋄" then
database:del(bot_id.."MeRo:Left:Bot"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"*⋄︙تم تفعيل مغادرة البوت*") 
return false 
end
if text == "تعطيل المغادره ⋄" then
database:set(bot_id.."MeRo:Left:Bot"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_, "*⋄︙تم تعطيل مغادرة البوت*") 
return false 
end
if text and database:get(bot_id..'Start:Bots') then
if text == 'الغاء ⋄' then   
send(msg.chat_id_, msg.id_,"*⋄︙تم الغاء حفظ كليشه ستارت*") 
database:del(bot_id..'Start:Bots') 
return false
end
database:set(bot_id.."Start:Bot",text)  
send(msg.chat_id_, msg.id_,'*⋄︙تم حفظ كليشه ستارت*') 
database:del(bot_id..'Start:Bots') 
return false
end
if text == 'ضع كليشه ستارت ⋄' then
database:set(bot_id..'Start:Bots',true) 
send(msg.chat_id_, msg.id_,'*⋄︙ارسل لي الكليشه الان*') 
return false
end
if text == 'حذف كليشه ستارت ⋄' then
database:del(bot_id..'Start:Bot') 
send(msg.chat_id_, msg.id_,'*⋄︙تم حذف كليشه ستارت*') 
end
if text == ("الثانويين ⋄") then
local list = database:smembers(bot_id.."DEV:Sudo:T")
t = "\n*⋄︙قائمة مطورين الثانويين للبوت*\n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*⋄︙لا يوجد مطورين ثانويين*"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("مسح الثانويين ⋄") and VIP_DeV(msg) then
database:del(bot_id.."DEV:Sudo:T")
send(msg.chat_id_, msg.id_, "*⋄︙تم مسح قائمة المطورين الثانويين*")
end
if text == ("مسح الثانويين ⋄") and not VIP_DeV(msg) then
send(msg.chat_id_, msg.id_,'*⋄︙عذا الامر للمطور الاساسي فقط*')
end
if text == 'رفع نسخه البوت' then
database:set(bot_id..'docu:Bots',true) 
send(msg.chat_id_, msg.id_, "*⋄︙قم الان بارسال ملف النسخه الاحتياطيه*")
end
if msg.content_.ID == "MessageDocument" and database:get(bot_id..'docu:Bots') then    
local ID_FILE = msg.content_.document_.document_.persistent_id_ 
local File_Name = msg.content_.document_.file_name_
add_file(msg,msg.chat_id_,ID_FILE,File_Name)
database:del(bot_id..'docu:Bots') 
end
if database:get(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "*⋄︙تم الغاء الامر*")
database:del(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
database:del(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local username = string.match(text, "@[%a%d_]+") 
tdcli_function ({    
ID = "SearchPublicChat",    
username_ = username  
},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '*⋄︙المعرف لا يوجد فيه قناة*')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '*⋄︙عذا لا يمكنك وضع معرف حسابات في الاشتراك* ')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_,'*⋄︙عذا لا يمكنك وضع معرف مجموعه بالاشتراك* ')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'*⋄︙البوت ادمن في القناة*\n*⋄︙تم تفعيل الاشتراك الاجباري في*\n*⋄︙ايدي القناة ('..data.id_..')*\n*⋄︙معرف القناة* ([@'..data.type_.channel_.username_..'])')
database:set(bot_id..'add:ch:id',data.id_)
database:set(bot_id..'add:ch:username','@'..data.type_.channel_.username_)
else
send(msg.chat_id_, msg.id_,'*⋄︙عذرآ البوت ليس ادمن بالقناه* ')
end
return false  
end
end,nil)
end
if database:get(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "⋄︙تم الغاء الامر ")
database:del(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
database:del(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
database:set(bot_id..'text:ch:user',texxt)
send(msg.chat_id_, msg.id_,'*⋄︙تم تغيير رسالة الاشتراك* ')
end
if text == ("مسح قائمه العام ⋄") and DevMeRo(msg) then
database:del(bot_id.."MeRo:GBan:User")
send(msg.chat_id_, msg.id_, "\n*⋄︙تم مسح قائمه العام*")
return false
end
if text == ("مسح المطورين ⋄") and DevMeRo(msg) then
database:del(bot_id.."MeRo:Sudo:User")
send(msg.chat_id_, msg.id_, "\n*⋄︙تم مسح قائمة المطورين*")
end
if text == ("قائمه العام ⋄") and DevMeRo(msg) then
local list = database:smembers(bot_id.."MeRo:GBan:User")
t = "\n*⋄︙قائمة المحظورين عام*\n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*⋄︙لا يوجد محظورين عام*"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("المطورين ⋄") and DevMeRo(msg) then
local list = database:smembers(bot_id.."MeRo:Sudo:User")
t = "\n*⋄︙قائمة مطورين البوت*\n*— — — — — — — — — — — — — —*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*⋄︙لا يوجد مطورين*"
end
send(msg.chat_id_, msg.id_, t)
end

if text == 'نسخه البوت' then
local list = database:smembers(bot_id..'MeRo:Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'MeRo Chat'
creator = database:smembers(bot_id..'creator'..v)
ASAS = database:smembers(bot_id.."MeRo:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."MeRo:Constructor"..v)
MDER = database:smembers(bot_id.."MeRo:Manager"..v)
MOD = database:smembers(bot_id.."MeRo:Mod:User"..v)
link = database:get(bot_id.."MeRo:Link_Group"..v) or ''
if k == 1 then
t = t..'"'..v..'":{"MeRo":"'..NAME..'",'
else
t = t..',"'..v..'":{"MeRo":"'..NAME..'",'
end
if #creator ~= 0 then 
t = t..'"creator":['
for k,v in pairs(creator) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,'./File_Libs/'..bot_id..'.json', '⋄︙ عدد مجموعات التي في البوت { '..#list..'}')
end
if text == "تحديث السورس ⋄" then
send(msg.chat_id_,msg.id_,'*⋄︙تم تحديث السورس الى الإصدار الجديد*')
os.execute('rm -rf MeRo.lua')
os.execute('wget https://raw.githubusercontent.com/MeRoAsMrDeV/MeRo/main/MeRo.lua')
dofile('MeRo.lua')  
return false
end
if text == "تحديث الملفات ⋄" then
dofile("MeRo.lua")  
send(msg.chat_id_, msg.id_, "*⋄︙تم التحديث جميع الملفات*")
end
end
end --- Chat_Type = 'UserBot' 
end
end
function tdcli_update_callback(data)
if data.ID == "UpdateChannel" then 
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
t = "قام احد المنشئين بطرد البوت من مجموعته\n\n"
tdcli_function({ID ="GetChat",chat_id_="-100"..data.channel_.id_},function(arg,chat)  
local NameChat = chat.title_
t =t.."اسم المجموعه\n"..NameChat
local IdChat = "-100"..data.channel_.id_
t =t.."\n\nايدي المجموعه\n"..IdChat
send(Id_Sudo, 0,t)
database:srem(bot_id..'MeRo:Chek:Groups','-100'..data.channel_.id_)  
end,nil)
end
end
if data.ID == "UpdateNewCallbackQuery" then
local Chat_id = data.chat_id_
local From_id = data.id_
local Msg_id = data.message_id_
local msg_idd = Msg_id/2097152/0.5
local DAata = data.payload_.data_
if DAata == '/help1' then
if not Addictive(data) then
local notText = '⋄ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*⋄⇠ اوامر الحمايه اتبع مايلي ...*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ قفل + فتح ← الامر…*
*⋄⇠ ← { بالتقيد ، بالطرد ، بالكتم }*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ الروابط*
*⋄⇠ المعرف*
*⋄⇠ التاك*
*⋄⇠ الشارحه*
*⋄⇠ التعديل*
*⋄⇠ التثبيت*
*⋄⇠ المتحركه*
*⋄⇠ الملفات*
*⋄⇠ الصور*
*⋄⇠ الاباحي*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ الماركداون*
*⋄⇠ البوتات*
*⋄⇠ التكرار*
*⋄⇠ الكلايش*
*⋄⇠ السيلفي*
*⋄⇠ الملصقات*
*⋄⇠ الفيديو*
*⋄⇠ الانلاين*
*⋄⇠ الدردشه*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ التوجيه*
*⋄⇠ الاغاني*
*⋄⇠ الصوت*
*⋄⇠ الجهات*
*⋄⇠ الاشعارات*
*ٴ— — — — — — — — — — — — — — *
[- MeRo TeAm .](t.me/YYYDR)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اوامر الحمايه', callback_data="/help1"},{text = 'اوامر الادمنيه', callback_data="/help2"}},
{{text = 'اوامر الوضع', callback_data="/help3"},{text = 'اوامر المسح', callback_data="/help4"}},
{{text = 'اوامر المنشئين', callback_data="/help5"},{text = 'اوامر المجموعه', callback_data="/help6"}},
{{text = 'اوامر التحشيش', callback_data="/help7"},{text = 'اوامر المطورين', callback_data="/help8"}},
{{text = 'اوامر مطور الاساسي', callback_data="/help9"},{text = 'اوامر العضو', callback_data="/help10"}},
{{text = 'الاوامر الرئيسيه', callback_data="/help"}},
{{text = '-- MeRo TeAm .', url="t.me/YYYDR"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if DAata == '/help2' then
if not Addictive(data) then
local notText = '⋄ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*⋄⇠ اهلا بك عزيزي …*
*⋄⇠ اوامر تفعيل وتعطيل …*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ تفعيل ~ تعطيل + امر …*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ اطردني*
*⋄⇠ صيح*
*⋄⇠ ضافني*
*⋄⇠ الرابط* 
*⋄⇠ الحظر*
*⋄⇠ الرفع*
*⋄⇠ الحظر*
*⋄⇠ الرفع *
*⋄⇠ الايدي*
*⋄⇠ الالعاب*
*⋄⇠ ردود المطور*
*⋄⇠ الترحيب*
*⋄⇠ ردود المدير*
*⋄⇠ الردود*
*⋄⇠ ردود البوت*
*⋄⇠ الرسائل اليوميه*
*⋄⇠ التحقق*
*⋄⇠ اوامر التحشيش*
*⋄⇠ صورتي*
*⋄⇠ زخرفه*
*⋄⇠ حساب العمر*
*⋄⇠ الساوند*
*⋄⇠ الانستغرام*
*⋄⇠ التيكتوك*
*⋄⇠ اليوتيوب*
*⋄⇠ الابراج*
*⋄⇠ تنبيه الاسماء*
*⋄⇠ تنبيه المعرف*
*⋄⇠ تنبيه الصور*
*⋄⇠ التوحيد*
*⋄⇠ الكتم الاسم*
*⋄⇠ نسبه الرجوله* 
*⋄⇠ نسبه الانوثه*
*⋄⇠ نسبه الكره*
*⋄⇠ نسبه الحب*
*⋄⇠ ءall*
 *ٴ— — — — — — — — — — — — — — *
[- MeRo TeAm .](t.me/YYYDR)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اوامر الحمايه', callback_data="/help1"},{text = 'اوامر الادمنيه', callback_data="/help2"}},
{{text = 'اوامر الوضع', callback_data="/help3"},{text = 'اوامر المسح', callback_data="/help4"}},
{{text = 'اوامر المنشئين', callback_data="/help5"},{text = 'اوامر المجموعه', callback_data="/help6"}},
{{text = 'اوامر التحشيش', callback_data="/help7"},{text = 'اوامر المطورين', callback_data="/help8"}},
{{text = 'اوامر مطور الاساسي', callback_data="/help9"},{text = 'اوامر العضو', callback_data="/help10"}},
{{text = 'الاوامر الرئيسيه', callback_data="/help"}},
{{text = '-- MeRo TeAm .', url="t.me/YYYDR"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if DAata == '/help3' then
if not Addictive(data) then
local notText = '⋄ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*⋄⇠ اهلا بك عزيزي …*
*⋄⇠ اوامر الوضع ~ اضف …*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ اضف / حذف ← رد*
*⋄⇠ اضف / حذف ← رد متعدد*
*⋄⇠ اضف / حذف ← صلاحيه*
 *ٴ— — — — — — — — — — — — — — *
*⋄⇠ ضع + امر …*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ اسم*
*⋄⇠ رابط*
*⋄⇠ ترحيب*
*⋄⇠ قوانين*
*⋄⇠ صوره*
*⋄⇠ وصف*
*⋄⇠ تكرار + عدد*
 *ٴ— — — — — — — — — — — — — — *
[- MeRo TeAm .](t.me/YYYDR)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اوامر الحمايه', callback_data="/help1"},{text = 'اوامر الادمنيه', callback_data="/help2"}},
{{text = 'اوامر الوضع', callback_data="/help3"},{text = 'اوامر المسح', callback_data="/help4"}},
{{text = 'اوامر المنشئين', callback_data="/help5"},{text = 'اوامر المجموعه', callback_data="/help6"}},
{{text = 'اوامر التحشيش', callback_data="/help7"},{text = 'اوامر المطورين', callback_data="/help8"}},
{{text = 'اوامر مطور الاساسي', callback_data="/help9"},{text = 'اوامر العضو', callback_data="/help10"}},
{{text = 'الاوامر الرئيسيه', callback_data="/help"}},
{{text = '-- MeRo TeAm .', url="t.me/YYYDR"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if DAata == '/help4' then
if not Addictive(data) then
local notText = '⋄ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*⋄⇠ اهلا بك عزيزي …*
*⋄⇠ اوامر مسح / الحذف ← امر*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ مسح + امر …*
 *ٴ— — — — — — — — — — — — — — *
*⋄⇠ الايدي*
*⋄⇠ الادمنيه*
*⋄⇠ المميزين*
*⋄⇠ ردود المدير*
*⋄⇠ المدراء* 
*⋄⇠ المنشئين* 
*⋄⇠ الاساسين*
*⋄⇠ الاسماء المكتومه*
*⋄⇠ البوتات*
*⋄⇠ صلاحيه*
*⋄⇠ قائمه منع المتحركات*
*⋄⇠ قائمه منع الصور*
*⋄⇠ قائمه منع الملصقات*
*⋄⇠ مسح قائمه المنع* 
*⋄⇠ المحذوفين*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ حذف + امر ...*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ امر *
*⋄⇠ الاوامر المضافه*
*ٴ— — — — — — — — — — — — — — *
[- MeRo TeAm .](t.me/YYYDR)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اوامر الحمايه', callback_data="/help1"},{text = 'اوامر الادمنيه', callback_data="/help2"}},
{{text = 'اوامر الوضع', callback_data="/help3"},{text = 'اوامر المسح', callback_data="/help4"}},
{{text = 'اوامر المنشئين', callback_data="/help5"},{text = 'اوامر المجموعه', callback_data="/help6"}},
{{text = 'اوامر التحشيش', callback_data="/help7"},{text = 'اوامر المطورين', callback_data="/help8"}},
{{text = 'اوامر مطور الاساسي', callback_data="/help9"},{text = 'اوامر العضو', callback_data="/help10"}},
{{text = 'الاوامر الرئيسيه', callback_data="/help"}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if DAata == '/help5' then
if not Addictive(data) then
local notText = '⋄ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*⋄⇠ اهلا بك عزيزي …*
*⋄⇠ اوامر تنزيل ورفع …*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ مميز*
*⋄⇠ ادمن*
*⋄⇠ مدير*
*⋄⇠ منشئ*
*⋄⇠ منشئ اساسي*
*⋄⇠ مالك*
*⋄⇠ الادمنيه*
*⋄⇠ ادمن بالكروب*
*⋄⇠ ادمن بكل الصلاحيات*
*⋄⇠ القيود*
*⋄⇠ تنزيل جميع الرتب*
*⋄⇠ تنزيل الكل* 
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ اوامر التغير …*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ تغير رد المطور + اسم*
*⋄⇠ تغير رد المالك + اسم*
*⋄⇠ تغير رد منشئ الاساسي + اسم*
*⋄⇠ تغير رد المنشئ + اسم*
*⋄⇠ تغير رد المدير + اسم*
*⋄⇠ تغير رد الادمن + اسم*
*⋄⇠ تغير رد المميز + اسم*
*⋄⇠ تغير رد العضو + اسم*
*⋄⇠ تغير امر الاوامر*
*⋄⇠ تغير امر م1 ~ الئ م10*
*ٴ— — — — — — — — — — — — — — *
[- MeRo TeAm .](t.me/YYYDR)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اوامر الحمايه', callback_data="/help1"},{text = 'اوامر الادمنيه', callback_data="/help2"}},
{{text = 'اوامر الوضع', callback_data="/help3"},{text = 'اوامر المسح', callback_data="/help4"}},
{{text = 'اوامر المنشئين', callback_data="/help5"},{text = 'اوامر المجموعه', callback_data="/help6"}},
{{text = 'اوامر التحشيش', callback_data="/help7"},{text = 'اوامر المطورين', callback_data="/help8"}},
{{text = 'اوامر مطور الاساسي', callback_data="/help9"},{text = 'اوامر العضو', callback_data="/help10"}},
{{text = 'الاوامر الرئيسيه', callback_data="/help"}},
{{text = '-- MeRo TeAm .', url="t.me/YYYDR"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if DAata == '/help6' then
if not Addictive(data) then
local notText = '⋄ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*⋄⇠ اهلا بك عزيزي …*
*⋄⇠ اوامر المجموعه …*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ الاوامر … كالتالي*
 *ٴ— — — — — — — — — — — — — — *
*⋄⇠ استعاده الاوامر*
*⋄⇠ تحويل كالاتي⇠ صور : ملصق : صوت : بصمه*
*⋄⇠ صيح ~ تاك ~ المميزين : الادمنيه : المدراء : المنشئين : المنشئين الاساسين : للمالك*
*⋄⇠ كشف القيود *
*⋄⇠ تعين الايدي*
*⋄⇠ تغير الايدي*
*⋄⇠ الحساب + ايدي الحساب*
*⋄⇠ تنظيف + العدد*
*⋄⇠ تحكم ~ بالرد*
*⋄⇠ تنزيل الكل*
*⋄⇠ تنزيل جميع الرتب*
*⋄⇠ منع + برد*
*⋄⇠~ الصور + متحركه + ملصق ~*
*⋄⇠ حظر ~ كتم ~ تقيد ~ طرد*
*⋄⇠ المحظورين ~ المكتومين ~ المقيدين*
*⋄⇠ الغاء كتم + حظر + تقيد ~ بالرد و معرف و ايدي*
*⋄⇠ تقيد ~ كتم + الرقم + ساعه*
*⋄⇠ تقيد ~ كتم + الرقم + يوم*
*⋄⇠ تقيد ~ كتم + الرقم + دقيقه*
*⋄⇠ تثبيت ~ الغاء تثبيت*
*⋄⇠ الترحيب*
*⋄⇠ الغاء تثبيت الكل* 
*⋄⇠ كشف البوتات*
*⋄⇠ الصلاحيات*
*⋄⇠ كشف ~ برد ← بمعرف ← ايدي*
*⋄⇠ تاك للكل*
*⋄⇠ اضف لقب + لقب*
*⋄⇠ حذف اللقب*
*⋄⇠ تاك للمشرفين*
*⋄⇠ اعدادات المجموعه*
*⋄⇠ عدد الكروب*
*⋄⇠ ردود المدير*
*⋄⇠ اسم بوت + الرتبه*
*⋄⇠ الاوامر المضافه*
*⋄⇠ وضع توحيد + توحيد*
*⋄⇠ تعين عدد الكتم + رقم*
*⋄⇠ التوحيد*
*⋄⇠ كتم اسم + اسم*
*⋄⇠ قائمه المنع*
*⋄⇠ نسبه الحب* 
*⋄⇠ نسبه رجوله*
*⋄⇠ نسبه الكره*
*⋄⇠ نسبه الانوثه*
*ٴ— — — — — — — — — — — — — — *
[- MeRo TeAm .](t.me/YYYDR)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اوامر الحمايه', callback_data="/help1"},{text = 'اوامر الادمنيه', callback_data="/help2"}},
{{text = 'اوامر الوضع', callback_data="/help3"},{text = 'اوامر المسح', callback_data="/help4"}},
{{text = 'اوامر المنشئين', callback_data="/help5"},{text = 'اوامر المجموعه', callback_data="/help6"}},
{{text = 'اوامر التحشيش', callback_data="/help7"},{text = 'اوامر المطورين', callback_data="/help8"}},
{{text = 'اوامر مطور الاساسي', callback_data="/help9"},{text = 'اوامر العضو', callback_data="/help10"}},
{{text = 'الاوامر الرئيسيه', callback_data="/help"}},
{{text = '-- MeRo TeAm .', url="t.me/YYYDR"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if DAata == '/help7' then
if not Addictive(data) then
local notText = '⋄ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*⋄⇠ الاوامر التحشيش …*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ رفع + تنزيل ← الامࢪ*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ رفع + تنزيل ← مطي* 
*⋄⇠ تاك للمطايه*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ رفع + تنزيل ← صخل*
*⋄⇠ تاك للصخوله*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ رفع + تنزيل ← مرتي*
*⋄⇠ تاك للمرتي*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ رفع + تنزيل ← بكلبي *
*⋄⇠ تاك للبكلبي*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ رفع + تنزيل ← زوجي*
*⋄⇠ تاك للزوجي*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ رفع + تنزيل ← زاحف*
*⋄⇠ تاك للزواحف*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ رفع + تنزيل ← زاحفه*
*⋄⇠ تاك للزاحفات*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ رفع + تنزيل ← تاج*
*⋄⇠ تاك للتاج*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ رفع + تنزيل ← الحات*
*⋄⇠ تاك للحات*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ رفع + تنزيل ← الحاته*
*⋄⇠ تاك للحاتات*
*ٴ— — — — — — — — — — — — — — *
[- MeRo TeAm .](t.me/YYYDR)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اوامر الحمايه', callback_data="/help1"},{text = 'اوامر الادمنيه', callback_data="/help2"}},
{{text = 'اوامر الوضع', callback_data="/help3"},{text = 'اوامر المسح', callback_data="/help4"}},
{{text = 'اوامر المنشئين', callback_data="/help5"},{text = 'اوامر المجموعه', callback_data="/help6"}},
{{text = 'اوامر التحشيش', callback_data="/help7"},{text = 'اوامر المطورين', callback_data="/help8"}},
{{text = 'اوامر مطور الاساسي', callback_data="/help9"},{text = 'اوامر العضو', callback_data="/help10"}},
{{text = 'الاوامر الرئيسيه', callback_data="/help"}},
{{text = '-- MeRo TeAm .', url="t.me/YYYDR"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if DAata == '/help8' then
if not Addictive(data) then
local notText = '⋄ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*⋄⇠اوامر المطورين* 
 *ٴ— — — — — — — — — — — — — — *
*⋄⇠ تفعيل ← تعطيل* 
*⋄⇠ المجموعات ← المشتركين ← الاحصائيات*
*⋄⇠ تفعيل ~ تعطيل *
*⋄⇠ رفع ← تنزيل منشئ اساسي*
*⋄⇠ مسح الاساسين ← المنشئين الاساسين*
*⋄⇠ مسح المنشئين ← المنشئين*
*⋄⇠ رفع ⇠ تنزيل مالك*
*⋄⇠ مسح قائمه المالك* 
*⋄⇠ اسم ⇠ غادر + غادر*
*⋄⇠ اذاعه* 
*⋄⇠ ردود المطور *
*⋄⇠ تفعيل ~ تعطيل ← التكرار العام *
 *ٴ— — — — — — — — — — — — — — *
[- MeRo TeAm .](t.me/YYYDR)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اوامر الحمايه', callback_data="/help1"},{text = 'اوامر الادمنيه', callback_data="/help2"}},
{{text = 'اوامر الوضع', callback_data="/help3"},{text = 'اوامر المسح', callback_data="/help4"}},
{{text = 'اوامر المنشئين', callback_data="/help5"},{text = 'اوامر المجموعه', callback_data="/help6"}},
{{text = 'اوامر التحشيش', callback_data="/help7"},{text = 'اوامر المطورين', callback_data="/help8"}},
{{text = 'اوامر مطور الاساسي', callback_data="/help9"},{text = 'اوامر العضو', callback_data="/help10"}},
{{text = 'الاوامر الرئيسيه', callback_data="/help"}},
{{text = '-- MeRo TeAm .', url="t.me/YYYDR"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if DAata == '/help9' then
if not Addictive(data) then
local notText = '⋄ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*⋄⇠ اهلا بك عزيزي √*
*⋄⇠ اوامر مطور الاساسي...↓*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ تفعيل*
*⋄⇠ تعطيل*
*⋄⇠ مسح الاساسين*
*⋄⇠ المنشئين الاساسين*
*⋄⇠ رفع ⇠ تنزيل منشئ اساسي*
*⋄⇠ مسح المطورين*
*⋄⇠ رفع ⇠ تنزيل مالك* 
*⋄⇠ المطورين*
*⋄⇠ التكرار العام*
*⋄⇠ رفع ⇠ تنزيل مطور*
*⋄⇠ رفع ⇠ تنزيل مطور ثانوي*
*⋄⇠ الثانويين ⇠ مسح الثانويين*
*⋄⇠ تفعيل ⇠ تعطيل الاضافات*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ اسم البوت + غادر*
*⋄⇠ غادر*
*⋄⇠ اسم بوت + الرتبه*
*⋄⇠ تحديث السورس*
*⋄⇠ حضر عام*
*⋄⇠ كتم عام*
*⋄⇠ الغاء العام*
⋄⇠ قائمه العام*
*⋄⇠ مسح قائمه العام*
*⋄⇠ جلب نسخه البوت*
*⋄⇠ رفع نسخه البوت*
 *ٴ— — — — — — — — — — — — — — *
*⋄⇠ المتجر* 
*⋄⇠ متجر الملفات*
*⋄⇠ الملفات*
*⋄⇠ مسح الملفات*
*⋄⇠ تعطيل + تفعيل + اسم ملف*
 *ٴ— — — — — — — — — — — — — — *
*⋄⇠ اذاعه خاص*
*⋄⇠ اذاعه*
*⋄⇠ اذاعه بالتوجيه*
*⋄⇠ اذاعه بالتوجيه خاص*
*⋄⇠ اذاعه بالتثبيت*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ جلب نسخه البوت*
*⋄⇠ رفع نسخه البوت*
*⋄⇠ ضع عدد الاعضاء + العدد*
*⋄⇠ ضع كليشه المطور*
*⋄⇠ تفعيل/تعطيل الاذاعه*
*⋄⇠ تفعيل/تعطيل البوت الخدمي*
*⋄⇠ تفعيل/تعطيل التواصل*
*⋄⇠ تغير اسم البوت*
*⋄⇠ اضف/حذف رد للكل*
*⋄⇠ ردود المطور*
⋄⇠ مسح ردود المطور*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ الاشتراك الاجباري*
*⋄⇠ تعطيل الاشتراك الاجباري*
*⋄⇠ تفعيل الاشتراك الاجباري*
*⋄⇠ حذف رساله الاشتراك*
*⋄⇠ تغير رساله الاشتراك*
*⋄⇠ تغير الاشتراك*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ الاحصائيات*
*⋄⇠ المشتركين*
*⋄⇠ المجموعات* 
*⋄⇠ تفعيل/تعطيل المغادره*
*⋄⇠ تنظيف المشتركين*
*⋄⇠ تنظيف الكروبات*
*ٴ— — — — — — — — — — — — — — *
[- MeRo TeAm .](t.me/YYYDR)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اوامر الحمايه', callback_data="/help1"},{text = 'اوامر الادمنيه', callback_data="/help2"}},
{{text = 'اوامر الوضع', callback_data="/help3"},{text = 'اوامر المسح', callback_data="/help4"}},
{{text = 'اوامر المنشئين', callback_data="/help5"},{text = 'اوامر المجموعه', callback_data="/help6"}},
{{text = 'اوامر التحشيش', callback_data="/help7"},{text = 'اوامر المطورين', callback_data="/help8"}},
{{text = 'اوامر مطور الاساسي', callback_data="/help9"},{text = 'اوامر العضو', callback_data="/help10"}},
{{text = 'الاوامر الرئيسيه', callback_data="/help"}},
{{text = '-- MeRo TeAm .', url="t.me/YYYDR"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if DAata == '/help10' then
if not Addictive(data) then
local notText = '⋄ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*⋄⇠ اهلا بك عزيزي √*
*⋄⇠ اوامر الاعضاء كتالي…↓*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ عرض معلوماتك ↑↓*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ ايديي ← اسمي* 
*⋄⇠ تفاعلي اليوم ← تفاعله اليوم*
*⋄⇠ رسايلي ← مسح رسايلي* 
*⋄⇠ رتبتي ← سحكاتي* 
*⋄⇠ مسح سحكاتي ← المنشئ* 
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ اوآمر المجموعه ↑↓*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ الرابط ← القوانين – الترحيب*
*⋄⇠ ايدي ← اطردني* 
*⋄⇠ اسمي ← المطور*  
*⋄⇠ كشف ~ بالرد بالمعرف*
  *ٴ— — — — — — — — — — — — — — *
*⋄⇠ اسم البوت + الامر ↑↓*
*ٴ— — — — — — — — — — — — — — *
*⋄⇠ بوسه بالرد* 
*⋄⇠ مصه بالرد*
*⋄⇠ رزله بالرد* 
*⋄⇠ شنو رئيك بهذا بالرد*
*⋄⇠ شنو رئيك بهاي بالرد*
*⋄⇠ تحب هذا*
*ٴ— — — — — — — — — — — — — — *
[- MeRo TeAm .](t.me/YYYDR)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اوامر الحمايه', callback_data="/help1"},{text = 'اوامر الادمنيه', callback_data="/help2"}},
{{text = 'اوامر الوضع', callback_data="/help3"},{text = 'اوامر المسح', callback_data="/help4"}},
{{text = 'اوامر المنشئين', callback_data="/help5"},{text = 'اوامر المجموعه', callback_data="/help6"}},
{{text = 'اوامر التحشيش', callback_data="/help7"},{text = 'اوامر المطورين', callback_data="/help8"}},
{{text = 'اوامر مطور الاساسي', callback_data="/help9"},{text = 'اوامر العضو', callback_data="/help10"}},
{{text = 'الاوامر الرئيسيه', callback_data="/help"}},
{{text = '-- MeRo TeAm .', url="t.me/YYYDR"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if DAata == '/help' then
if not Addictive(data) then
local notText = '⋄ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*⋄︙اهلا بك في قائمه اوامر البوت*
*ٴ— — — — — — — — — — — — — — *
*⋄︙م1 ◂ اوامر الحمايه*
*⋄︙م2 ◂ اوامر تعطيل ~ تفعيل*
*⋄︙م3 ◂ اوامر ضع ~ اضف*
*⋄︙م4 ◂ اوامر مسح ~ حذف*
*⋄︙م5 ◂ اوامر تنزيل+رفع+التغير*
*⋄︙م6 ◂ اوامر الكروب*
*⋄︙م7 ◂ اوامر التحشيش*
*⋄︙م8 ◂ اوامر مطور البوت*
*⋄︙م9 ◂ اوامر مطور الاساسي* 
*⋄︙م10 ◂ اوامر الاعضاء*
*ٴ— — — — — — — — — — — — — — *
[- MeRo TeAm .](t.me/YYYDR) 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اوامر الحمايه', callback_data="/help1"},{text = 'اوامر الادمنيه', callback_data="/help2"}},
{{text = 'اوامر الوضع', callback_data="/help3"},{text = 'اوامر المسح', callback_data="/help4"}},
{{text = 'اوامر المنشئين', callback_data="/help5"},{text = 'اوامر المجموعه', callback_data="/help6"}},
{{text = 'اوامر التحشيش', callback_data="/help7"},{text = 'اوامر المطورين', callback_data="/help8"}},
{{text = 'اوامر مطور الاساسي', callback_data="/help9"},{text = 'اوامر العضو', callback_data="/help10"}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if DAata and DAata:match("^(%d+)unbeen(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('unbeen',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
database:srem(bot_id..'MeRo:Ban:User'..Chat_id, OnID)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = Chat_id, user_id_ = OnID, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('\n*⋄︙تم الغاء حظره بنجاح*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
if DAata and DAata:match("^(%d+)been(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('been',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if database:get(bot_id.."MeRo:Lock:kick"..Chat_id) and not Constructor(data) then
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" *⋄︙تم تعطيل الحظر*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
if DevMeRoe(OnID) then
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape("*⋄︙لا تستطيع (كتم،طرد،حظر،تققيد) مطور السورس او الاساسي*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
if tonumber(OnID) == tonumber(bot_id) then  
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" *⋄︙لا تسطيع حظر البوت* ")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
if Rank_Checking(OnID, Chat_id) == true then
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('\n *⋄︙عذرا لا تستطيع حظر* ( '..Get_Rank(OnID,Chat_id)..' )')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = Chat_id, user_id_ = OnID, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(' *⋄︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false  
end
if data.can_be_deleted_ == false then 
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(' *⋄︙البوت ليس ادمن يرجى ترقيتي !*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false  
end
database:sadd(bot_id..'MeRo:Ban:User'..Chat_id, OnID)
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('\n*⋄︙تم حظره بنجاح*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
Kick_Group(Chat_id, OnID)
end,nil)   
end
return false
end
if DAata and DAata:match("^(%d+)unMut(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('unMut',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if not database:sismember(bot_id.."MeRo:Muted:User"..Chat_id,OnID) then
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('\n*⋄︙الشخص غير مكتوم*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
database:srem(bot_id..'MeRo:Muted:User'..Chat_id, OnID)
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('\n*⋄︙تم الغاء كتمه بنجاح*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
if DAata and DAata:match("^(%d+)Mut(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('Mut',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if tonumber(OnID) == tonumber(bot_id) then  
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape( " *⋄︙لا تسطيع كتم البوت* ")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false 
end
if DevMeRoe(OnID) then
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '𝑇𝐸??𝐴𝑁𝐷 𝑇𝐸𝐴𝑀', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape("*⋄︙لا تستطيع (كتم،طرد،حظر،تققيد) مطور السورس او الاساسي*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false 
end
if Rank_Checking(OnID, Chat_id) == true then
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('\n *⋄︙عذرا لا تستطيع كتم* ( '..Get_Rank(OnID,Chat_id)..' )')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
if data.can_be_deleted_ == false then 
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(' *⋄︙البوت ليس ادمن يرجى ترقيتي !*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false  
end
database:sadd(bot_id..'MeRo:Muted:User'..Chat_id, OnID)
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('\n*⋄︙تم كتمه بنجاح*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
return false
end
if DAata and DAata:match("^(%d+)unrestrict(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('unrestrict',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. Chat_id .. "&user_id=" .. OnID .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('\n*⋄︙تم الغاء تقيبده بنجاح*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
if DAata and DAata:match("^(%d+)restrict(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('restrict',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if tonumber(OnID) == tonumber(bot_id) then  
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape( " *⋄︙لا تسطيع تقييد البوت* ")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false 
end
if DevMeRoe(OnID) then
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape("*⋄︙لا تستطيع (كتم،طرد،حظر،تققيد) مطور السورس او الاساسي*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false 
end
if Rank_Checking(OnID, Chat_id) == true then
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('\n *⋄︙عذرا لا تستطيع تقييد* ( '..Get_Rank(OnID,Chat_id)..' )')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
if data.can_be_deleted_ == false then 
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(' *⋄︙البوت ليس ادمن يرجى ترقيتي !*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false  
end
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..OnID)
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('\n*⋄︙تم تقييده بنجاح*')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
return false
end
if DAata and DAata:match("^(%d+)UpS(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('UpS',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if DevMeRo(data) then
if database:sismember(bot_id.."MeRo:Basic:Constructor"..Chat_id,OnID) then
datainlineText = "لديه رتبه منشئ اساسي"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Constructor"..Chat_id,OnID) then
datainlineText = "لديه رتبه منشئ"
datainline = {
{{text = '⋄ منشئ اساسي',callback_data=data.sender_user_id_.."Basic"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Manager"..Chat_id,OnID) then
datainlineText = "لديه رتبه مدير"
datainline = {
{{text = '⋄ منشئ',callback_data=data.sender_user_id_.."Constructor"..OnID}},
{{text = '⋄ منشئ اساسي',callback_data=data.sender_user_id_.."Basic"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Mod:User"..Chat_id,OnID) then
datainlineText = "لديه رتبه ادمن"
datainline = {
{{text = '⋄ مدير',callback_data=data.sender_user_id_.."Manager"..OnID}},
{{text = '⋄ منشئ',callback_data=data.sender_user_id_.."Constructor"..OnID}},
{{text = '⋄ منشئ اساسي',callback_data=data.sender_user_id_.."Basic"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Special:User"..Chat_id,OnID) then
datainlineText = "لديه رتبه مميز"
datainline = {
{{text = '⋄ ادمن',callback_data=data.sender_user_id_.."mod"..OnID}},
{{text = '⋄ مدير',callback_data=data.sender_user_id_.."Manager"..OnID}},
{{text = '⋄ منشئ',callback_data=data.sender_user_id_.."Constructor"..OnID}},
{{text = '⋄ منشئ اساسي',callback_data=data.sender_user_id_.."Basic"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
else
datainlineText = "لا يمتلك رتبه"
datainline = {
{{text = '⋄ مميز',callback_data=data.sender_user_id_.."Special"..OnID}},
{{text = '⋄ ادمن',callback_data=data.sender_user_id_.."mod"..OnID}},
{{text = '⋄ مدير',callback_data=data.sender_user_id_.."Manager"..OnID}},
{{text = '⋄ منشئ',callback_data=data.sender_user_id_.."Constructor"..OnID}},
{{text = '⋄ منشئ اساسي',callback_data=data.sender_user_id_.."Basic"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
end
elseif BasicConstructor(data) then
if database:sismember(bot_id.."MeRo:Constructor"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك اعلى رتبه تستطيع  رفعه لها"
datainline = {	
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Manager"..Chat_id,OnID) then
datainlineText = "لديه رتبه مدير"
datainline = {
{{text = '⋄ منشئ',callback_data=data.sender_user_id_.."Constructor"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Mod:User"..Chat_id,OnID) then
datainlineText = "لديه رتبه ادمن"
datainline = {
{{text = '⋄ مدير',callback_data=data.sender_user_id_.."Manager"..OnID}},
{{text = '⋄ منشئ',callback_data=data.sender_user_id_.."Constructor"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Special:User"..Chat_id,OnID) then
datainlineText = "لديه رتبه مميز"
datainline = {
{{text = '⋄ ادمن',callback_data=data.sender_user_id_.."mod"..OnID}},
{{text = '⋄ مدير',callback_data=data.sender_user_id_.."Manager"..OnID}},
{{text = '⋄ منشئ',callback_data=data.sender_user_id_.."Constructor"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
else
datainlineText = "لا يمتلك رتبه"
datainline = {
{{text = '⋄ مميز',callback_data=data.sender_user_id_.."Special"..OnID}},
{{text = '⋄ ادمن',callback_data=data.sender_user_id_.."mod"..OnID}},
{{text = '⋄ مدير',callback_data=data.sender_user_id_.."Manager"..OnID}},
{{text = '⋄ منشئ',callback_data=data.sender_user_id_.."Constructor"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
end
elseif Constructor(data) then
if database:sismember(bot_id.."MeRo:Basic:Constructor"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك رتبه اعلى من رتبتك"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Constructor"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك رتبه مشابهه ل رتبتك"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Manager"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك اعلى رتبه تستطيع  رفعه لها"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Mod:User"..Chat_id,OnID) then
datainlineText = "لديه رتبه ادمن"
datainline = {
{{text = '⋄ مدير',callback_data=data.sender_user_id_.."Manager"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Special:User"..Chat_id,OnID) then
datainlineText = "لديه رتبه مميز"
datainline = {
{{text = '⋄ ادمن',callback_data=data.sender_user_id_.."mod"..OnID}},
{{text = '⋄ مدير',callback_data=data.sender_user_id_.."Manager"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
else
datainlineText = "لا يمتلك رتبه"
datainline = {
{{text = '⋄ مميز',callback_data=data.sender_user_id_.."Special"..OnID}},
{{text = '⋄ ادمن',callback_data=data.sender_user_id_.."mod"..OnID}},
{{text = '⋄ مدير',callback_data=data.sender_user_id_.."Manager"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
end
elseif Owner(data) then
if database:sismember(bot_id.."MeRo:Basic:Constructor"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك رتبه اعلى من رتبتك"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Constructor"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك رتبه مشابهه ل رتبتك"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Manager"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك رتبه مشابهه ل رتبتك"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Mod:User"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك اعلى رتبه تستطيع  رفعه لها"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Special:User"..Chat_id,OnID) then
datainlineText = "لديه رتبه مميز"
datainline = {
{{text = '⋄ ادمن',callback_data=data.sender_user_id_.."mod"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
else
datainlineText = "لا يمتلك رتبه"
datainline = {
{{text = '⋄ مميز',callback_data=data.sender_user_id_.."Special"..OnID}},
{{text = '⋄ ادمن',callback_data=data.sender_user_id_.."mod"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
end
elseif Addictive(data) then
if database:sismember(bot_id.."MeRo:Basic:Constructor"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك رتبه اعلى من رتبتك"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Constructor"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك رتبه اعلى من رتبتك"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Manager"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك رتبه اعلى من رتبتك"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Mod:User"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك رتبه مشابهه ل رتبتك"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif database:sismember(bot_id.."MeRo:Special:User"..Chat_id,OnID) then
datainlineText = "عذرا الشخص يمتلك اعلى رتبه تستطيع  رفعه لها"
datainline = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
else
datainlineText = "لا يمتلك رتبه"
datainline = {
{{text = '⋄ مميز',callback_data=data.sender_user_id_.."Special"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
end
end
bb = {} 
bb.inline_keyboard = datainline
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(datainlineText)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(bb)) 
return false
end
if DAata and DAata:match("^(%d+)Basic(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('Basic',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
database:sadd(bot_id.."MeRo:Basic:Constructor"..data.chat_id_, OnID)
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape("*⋄︙تم تنفيذ الامر بنجاح*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))
return false
end
if DAata and DAata:match("^(%d+)Constructor(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('Constructor',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
database:sadd(bot_id.."MeRo:Constructor"..data.chat_id_, OnID)
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape("*⋄︙تم تنفيذ الامر بنجاح*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
if DAata and DAata:match("^(%d+)Owner(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('Manager',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
database:sadd(bot_id.."MeRo:Manager"..data.chat_id_, OnID)
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape("*⋄︙تم تنفيذ الامر بنجاح*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
if DAata and DAata:match("^(%d+)Addictive(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('Mod',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
database:sadd(bot_id.."MeRo:Mod:User"..data.chat_id_, OnID)
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape("*⋄︙تم تنفيذ الامر بنجاح*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
if DAata and DAata:match("^(%d+)Special(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('Special',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
database:sadd(bot_id.."MeRo:Special:User"..data.chat_id_, OnID)
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape("*⋄︙تم تنفيذ الامر بنجاح*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
if DAata and DAata:match("^(%d+)unUpS(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('unUpS',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if database:sismember(bot_id.."MeRo:Basic:Constructor"..Chat_id,OnID) then
Ba = "✅"
else
Ba = "✖"
end
if database:sismember(bot_id.."MeRo:Constructor"..Chat_id,OnID) then
Co = "✅"
else
Co = "✖"
end
if database:sismember(bot_id.."MeRo:Manager"..Chat_id,OnID) then
Ma = "✅"
else
Ma = "✖"
end
if database:sismember(bot_id.."MeRo:Mod:User"..Chat_id,OnID) then
Mo = "✅"
else
Mo = "✖"
end
if database:sismember(bot_id.."MeRo:Special:User"..Chat_id,OnID) then
Sp = "✅"
else
Sp = "✖"
end
if DevMeRo(data) then
datainline = {
{{text =Ba,callback_data=data.sender_user_id_.."unBasic"..OnID},{text = 'منشئ اساسي',callback_data=data.sender_user_id_.."unBasic"..OnID}},
{{text =Co,callback_data=data.sender_user_id_.."unConstructor"..OnID},{text = 'منشئ',callback_data=data.sender_user_id_.."unConstructor"..OnID}},
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif BasicConstructor(data) then
datainline = {
{{text =Co,callback_data=data.sender_user_id_.."unConstructor"..OnID},{text = 'منشئ',callback_data=data.sender_user_id_.."unConstructor"..OnID}},
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Constructor(data) then
datainline = {
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Owner(data) then
datainline = {
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Addictive(data) then
datainline = {
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
end
bb = {} 
bb.inline_keyboard = datainline
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('⋄︙ علامه ✅ تعني ان الشخص يمتلك رتبه ويمكنك تنزيلها')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(bb)) 
return false
end
if DAata and DAata:match("^(%d+)unBasic(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('unBasic',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if database:sismember(bot_id.."MeRo:Basic:Constructor"..Chat_id,OnID) then
database:srem(bot_id.."MeRo:Basic:Constructor"..Chat_id,OnID)
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape("تم تنزيله بنجاح ✅").."&show_alert=true")
Ba = "✖"
else
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape("بالفعل هو ليس بمنشئ اساسي ✖").."&show_alert=true")
Ba = "✖"
end
if database:sismember(bot_id.."MeRo:Constructor"..Chat_id,OnID) then
Co = "✅"
else
Co = "✖"
end
if database:sismember(bot_id.."MeRo:Manager"..Chat_id,OnID) then
Ma = "✅"
else
Ma = "✖"
end
if database:sismember(bot_id.."MeRo:Mod:User"..Chat_id,OnID) then
Mo = "✅"
else
Mo = "✖"
end
if database:sismember(bot_id.."MeRo:Special:User"..Chat_id,OnID) then
Sp = "✅"
else
Sp = "✖"
end
bb = {} 
bb.inline_keyboard = {
{{text =Ba,callback_data=data.sender_user_id_.."unBasic"..OnID},{text = 'منشئ اساسي',callback_data=data.sender_user_id_.."unBasic"..OnID}},
{{text =Co,callback_data=data.sender_user_id_.."unConstructor"..OnID},{text = 'منشئ ',callback_data=data.sender_user_id_.."unConstructor"..OnID}},
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('⋄︙ علامه ✅ تعني ان الشخص يمتلك رتبه ويمكنك تنزيلها')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(bb)) 
return false
end
if DAata and DAata:match("^(%d+)unConstructor(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('unConstructor',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if database:sismember(bot_id.."MeRo:Constructor"..Chat_id,OnID) then
database:srem(bot_id.."MeRo:Constructor"..Chat_id,OnID)
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape("تم تنزيله بنجاح ✅").."&show_alert=true")
Co = "✖"
else
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape("بالفعل هو ليس بمنشئ ✖").."&show_alert=true")
Co = "✖"
end
if database:sismember(bot_id.."MeRo:Basic:Constructor"..Chat_id,OnID) then
Ba = "✅"
else
Ba = "✖"
end
if database:sismember(bot_id.."MeRo:Manager"..Chat_id,OnID) then
Ma = "✅"
else
Ma = "✖"
end
if database:sismember(bot_id.."MeRo:Mod:User"..Chat_id,OnID) then
Mo = "✅"
else
Mo = "✖"
end
if database:sismember(bot_id.."MeRo:Special:User"..Chat_id,OnID) then
Sp = "✅"
else
Sp = "✖"
end
if DevMeRo(data) then
datainline = {
{{text =Ba,callback_data=data.sender_user_id_.."unBasic"..OnID},{text = 'منشئ اساسي',callback_data=data.sender_user_id_.."unBasic"..OnID}},
{{text =Co,callback_data=data.sender_user_id_.."unConstructor"..OnID},{text = 'منشئ ',callback_data=data.sender_user_id_.."unConstructor"..OnID}},
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif BasicConstructor(data) then
datainline = {
{{text =Co,callback_data=data.sender_user_id_.."unConstructor"..OnID},{text = 'منشئ ',callback_data=data.sender_user_id_.."unConstructor"..OnID}},
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Constructor(data) then
datainline = {
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Owner(data) then
datainline = {
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Addictive(data) then
datainline = {
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
end
bb = {} 
bb.inline_keyboard = datainline
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('⋄︙ علامه ✅ تعني ان الشخص يمتلك رتبه ويمكنك تنزيلها')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(bb)) 
return false
end
if DAata and DAata:match("^(%d+)unOwner(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('unManager',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if database:sismember(bot_id.."MeRo:Manager"..Chat_id,OnID) then
database:srem(bot_id.."MeRo:Manager"..Chat_id,OnID)
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape("تم تنزيله بنجاح ✅").."&show_alert=true")
Ma = "✖"
else
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape("بالفعل هو ليس بمدير ✖").."&show_alert=true")
Ma = "✖"
end
if database:sismember(bot_id.."MeRo:Basic:Constructor"..Chat_id,OnID) then
Ba = "✅"
else
Ba = "✖"
end
if database:sismember(bot_id.."MeRo:Constructor"..Chat_id,OnID) then
Co = "✅"
else
Co = "✖"
end
if database:sismember(bot_id.."MeRo:Mod:User"..Chat_id,OnID) then
Mo = "✅"
else
Mo = "✖"
end
if database:sismember(bot_id.."MeRo:Special:User"..Chat_id,OnID) then
Sp = "✅"
else
Sp = "✖"
end
if DevMeRo(data) then
datainline = {
{{text =Ba,callback_data=data.sender_user_id_.."unBasic"..OnID},{text = 'منشئ اساسي',callback_data=data.sender_user_id_.."unBasic"..OnID}},
{{text =Co,callback_data=data.sender_user_id_.."unConstructor"..OnID},{text = 'منشئ ',callback_data=data.sender_user_id_.."unConstructor"..OnID}},
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif BasicConstructor(data) then
datainline = {
{{text =Co,callback_data=data.sender_user_id_.."unConstructor"..OnID},{text = 'منشئ ',callback_data=data.sender_user_id_.."unConstructor"..OnID}},
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Constructor(data) then
datainline = {
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Owner(data) then
datainline = {
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Addictive(data) then
datainline = {
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
end
bb = {} 
bb.inline_keyboard = datainline
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('⋄︙ علامه ✅ تعني ان الشخص يمتلك رتبه ويمكنك تنزيلها')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(bb)) 
return false
end
if DAata and DAata:match("^(%d+)unAddictive(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('unmod',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if database:sismember(bot_id.."MeRo:Mod:User"..Chat_id,OnID) then
database:srem(bot_id.."MeRo:Mod:User"..Chat_id,OnID)
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape("تم تنزيله بنجاح ✅").."&show_alert=true")
Mo = "✖"
else
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape("بالفعل هو ليس بأدمن ✖").."&show_alert=true")
Mo = "✖"
end
if database:sismember(bot_id.."MeRo:Manager"..Chat_id,OnID) then
Ma = "✅"
else
Ma = "✖"
end
if database:sismember(bot_id.."MeRo:Basic:Constructor"..Chat_id,OnID) then
Ba = "✅"
else
Ba = "✖"
end
if database:sismember(bot_id.."MeRo:Constructor"..Chat_id,OnID) then
Co = "✅"
else
Co = "✖"
end
if database:sismember(bot_id.."MeRo:Special:User"..Chat_id,OnID) then
Sp = "✅"
else
Sp = "✖"
end
if DevMeRo(data) then
datainline = {
{{text =Ba,callback_data=data.sender_user_id_.."unBasic"..OnID},{text = 'منشئ اساسي',callback_data=data.sender_user_id_.."unBasic"..OnID}},
{{text =Co,callback_data=data.sender_user_id_.."unConstructor"..OnID},{text = 'منشئ ',callback_data=data.sender_user_id_.."unConstructor"..OnID}},
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif BasicConstructor(data) then
datainline = {
{{text =Co,callback_data=data.sender_user_id_.."unConstructor"..OnID},{text = 'منشئ ',callback_data=data.sender_user_id_.."unConstructor"..OnID}},
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Constructor(data) then
datainline = {
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Owner(data) then
datainline = {
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Addictive(data) then
datainline = {
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
end
bb = {} 
bb.inline_keyboard = datainline
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('⋄︙ علامه ✅ تعني ان الشخص يمتلك رتبه ويمكنك تنزيلها')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(bb)) 
return false
end
if DAata and DAata:match("^(%d+)unSpecial(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('unSpecial',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if database:sismember(bot_id.."MeRo:Special:User"..Chat_id,OnID) then
database:srem(bot_id.."MeRo:Special:User"..Chat_id,OnID)
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape("تم تنزيله بنجاح ✅").."&show_alert=true")
Sp = "✖"
else
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape("بالفعل هو ليس بمميز ✖").."&show_alert=true")
Sp = "✖"
end
if database:sismember(bot_id.."MeRo:Manager"..Chat_id,OnID) then
Ma = "✅"
else
Ma = "✖"
end
if database:sismember(bot_id.."MeRo:Basic:Constructor"..Chat_id,OnID) then
Ba = "✅"
else
Ba = "✖"
end
if database:sismember(bot_id.."MeRo:Constructor"..Chat_id,OnID) then
Co = "✅"
else
Co = "✖"
end
if database:sismember(bot_id.."MeRo:Mod:User"..Chat_id,OnID) then
Mo = "✅"
else
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape("بالفعل هو ليس بأدمن ✖").."&show_alert=true")
Mo = "✖"
end
if DevMeRo(data) then
datainline = {
{{text =Ba,callback_data=data.sender_user_id_.."unBasic"..OnID},{text = 'منشئ اساسي',callback_data=data.sender_user_id_.."unBasic"..OnID}},
{{text =Co,callback_data=data.sender_user_id_.."unConstructor"..OnID},{text = 'منشئ ',callback_data=data.sender_user_id_.."unConstructor"..OnID}},
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif BasicConstructor(data) then
datainline = {
{{text =Co,callback_data=data.sender_user_id_.."unConstructor"..OnID},{text = 'منشئ ',callback_data=data.sender_user_id_.."unConstructor"..OnID}},
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Constructor(data) then
datainline = {
{{text =Ma,callback_data=data.sender_user_id_.."unManager"..OnID},{text = 'مدير ',callback_data=data.sender_user_id_.."unManager"..OnID}},
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Owner(data) then
datainline = {
{{text =Mo,callback_data=data.sender_user_id_.."unmod"..OnID},{text = 'ادمن ',callback_data=data.sender_user_id_.."unmod"..OnID}},
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
elseif Addictive(data) then
datainline = {
{{text =Sp,callback_data=data.sender_user_id_.."unSpecial"..OnID},{text = 'مميز ',callback_data=data.sender_user_id_.."unSpecial"..OnID}},
{{text = 'رجوع',callback_data=data.sender_user_id_.."Bbk"..OnID}},
{{text = '- MeRo TeAm .', url="t.me/YYYDR"}},
}
end
bb = {} 
bb.inline_keyboard = datainline
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape('⋄︙ علامه ✅ تعني ان الشخص يمتلك رتبه ويمكنك تنزيلها')..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(bb)) 
return false
end
if DAata and DAata:match("^(%d+)Bbk(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('Bbk',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '⋄ حظر',callback_data=data.sender_user_id_.."been"..OnID},{text = '⋄ الغاء حظر',callback_data=data.sender_user_id_.."unbeen"..OnID}},
{{text = '⋄ كتم',callback_data=data.sender_user_id_.."Mut"..OnID},{text = '⋄ الغاء كتم',callback_data=data.sender_user_id_.."unMut"..OnID}},
{{text = '⋄ تقييد',callback_data=data.sender_user_id_.."restrict"..OnID},{text = '⋄ الغاء تقييد',callback_data=data.sender_user_id_.."unrestrict"..OnID}},
{{text = '⋄ رفع رتبه',callback_data=data.sender_user_id_.."UpS"..OnID},{text = '⋄ تنزيل رتبه',callback_data=data.sender_user_id_.."unUpS"..OnID}},
}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape("⋄︙اهلا بك يمكنك التحكم بالازرار اسفل .")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
if DAata and DAata:match("^(%d+)DelLsta(.*)$") then
local notId  = DAata:match("(%d+)")  
local OnID = DAata:gsub('DelLsta',''):gsub(notId,'')
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if OnID == "55" then
Vs = 'تم مسح المطورين'
database:del(bot_id..'Sudo:User')
elseif OnID == "77" then
Vs = 'تم مسح المالكين'
database:del(bot_id.."creator"..Chat_id)
elseif OnID == "99" then
Vs = 'تم مسح المنشئين الاساسيين'
database:del(bot_id.."MeRo:Basic:Constructor"..Chat_id)
elseif OnID == "120" then
Vs = 'تم مسح المنشئين'
database:del(bot_id.."MeRo:Constructor"..Chat_id)
elseif OnID == "140" then
Vs = 'تم مسح المدراء'
database:del(bot_id.."MeRo:Manager"..Chat_id)
elseif OnID == "160" then
Vs = 'تم مسح الادمنيه'
database:del(bot_id.."MeRo:Mod:User"..Chat_id)
elseif OnID == "180" then
Vs = 'تم مسح المميزين'
database:del(bot_id.."MeRo:Special:User"..Chat_id)
end
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '-- MeRo TeAm .', url="t.me/YYYDR"}},
}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Vs)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
return false
end
if DAata == 'EndAddarray'..data.sender_user_id_ then  
if database:get(bot_id..'Set:array'..data.sender_user_id_..':'..Chat_id) == 'true1' then
database:del(bot_id..'Set:array'..data.sender_user_id_..':'..Chat_id)
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'sᴏᴜʀᴄᴇ ᴍᴇʀᴏ',url='http://t.me/YYYDR'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" *⋄︙تم حفظ الردود بنجاح*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'sᴏᴜʀᴄᴇ ᴍᴇʀᴏ',url='http://t.me/YYYDR'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" *⋄︙تم تنفيذ الامر سابقا*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if DAata == 'noKikedMe'..data.sender_user_id_ then  
local Text ="*⋄ تم الغاء الطرد بنجاح .*"
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'sᴏᴜʀᴄᴇ ᴍᴇʀᴏ',url='http://t.me/YYYDR'}},
}
DeleteMessage(Chat_id, {[0] = Msg_id}) 
end
if DAata == 'OkKikedMe'..data.sender_user_id_ then  
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=Chat_id,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'sᴏᴜʀᴄᴇ ᴍᴇʀᴏ',url='http://t.me/YYYDR'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" *⋄︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if (data and data.code_ and data.code_ == 3) then 
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'sᴏᴜʀᴄᴇ ᴍᴇʀᴏ',url='http://t.me/YYYDR'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" *⋄︙البوت ليس ادمن يرجى ترقيتي !*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if data and data.code_ and data.code_ == 400 and data.message_ == "USER_ADMIN_INVALID" then 
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'sᴏᴜʀᴄᴇ ᴍᴇʀᴏ',url='http://t.me/YYYDR'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" *⋄︙عذرا لا استطيع طرد ادمنية الكروب*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if data and data.ID and data.ID == 'Ok' then
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'sᴏᴜʀᴄᴇ ᴍᴇʀᴏ',url='http://t.me/YYYDR'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" *⋄︙تم الطرد بنجاح*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end,nil)   
end
if DAata and DAata:match("^(%d+):searchVid(.*)$") then
id_from_user  = DAata:match("(%d+)")  
local OnVid = DAata:gsub(':searchVid',''):gsub(id_from_user,'')
msgidrp  = OnVid:match("(%d+)")
local id_from_vid = DAata:gsub(':',''):gsub('searchVid',''):gsub(id_from_user,''):gsub(msgidrp,'')
if tonumber(data.sender_user_id_) ~= tonumber(id_from_user) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
object = https.request('https://black-source.tk/Api/InfoVid.php?url=http://www.youtube.com/watch?v='..URL.escape(id_from_vid))
objectend = JSON.decode(object)
infovid = "*⋄︙ اختر صيغه التنزيل الان*\n"
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'فيديو', callback_data=id_from_user..":DownloadVid:"..msgidrp..":"..id_from_vid..":Mp4"},{text = 'صوت', callback_data=id_from_user..":DownloadVid:"..msgidrp..":"..id_from_vid..":mp3"},{text = 'بصمه', callback_data=id_from_user..":DownloadVid:"..msgidrp..":"..id_from_vid..":ogg"}},
{{text = 'sᴏᴜʀᴄᴇ ᴍᴇʀᴏ',url='http://t.me/YYYDR'}},
}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(infovid)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
InfoVid = https.request('https://black-source.tk/Api/BotYoutube.php?Id='..URL.escape(id_from_vid))
InfoVidend = JSON.decode(InfoVid)
if InfoVidend.Info.video == "not" then  
https.request("https://znmzal.ml/Do/searchinbot.php?V="..URL.escape(id_from_vid).."&ch=do")
end
end
if DAata and DAata:match("^(%d+):DownloadVid(.*)$") then
local notId  = DAata:match("(%d+)")  
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⋄︙عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
https.request("https://znmzal.ml/Do/searchinbot.php?token="..token.."&chat_id="..Chat_id.."&data="..URL.escape(DAata).."&n=do")
end
Ok_id  = DAata:match("(%d+)")  
if DAata == 'okCaptcha'..data.sender_user_id_ then  
DeleteMessage(Chat_id, {[0] = Msg_id}) 
return https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. Chat_id .. "&user_id="..Ok_id .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
end
if DAata and DAata:match("^animation(.*)$") and Addictive(data) then  
idch = DAata:match("-100(%d+)")
local idchci = "-100"..idch
local animation = DAata:match("^animation(.*)$"):gsub('chatid',''):gsub('chatid',''):gsub(idch,''):gsub('-100','')
local Text ="*⋄︙تم الغاء منعها بنجاح*"
inline = {
{{text = '⋄︙ sᴏᴜʀᴄᴇ ᴍᴇʀᴏ  .',url='http://t.me/YYYDR'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
database:srem(bot_id.."MeRo:List:Filter:Animation"..idchci,animation)  
end
if DAata and DAata:match("^pito(.*)$") and Addictive(data) then  
local idchci = database:get(bot_id.."MeRo:Filter:msg")
local photo = DAata:match("^pito(.*)$")
local Text ="*⋄︙تم الغاء منعها بنجاح*"
inline = {
{{text = '⋄︙ sᴏᴜʀᴄᴇ ᴍᴇʀᴏ  .',url='http://t.me/YYYDR'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
database:srem(bot_id.."MeRo:List:Filter:Photo"..idchci,photo)  
end
if DAata and DAata:match("^Sticker(.*)$") and Addictive(data) then  
idch = DAata:match("-100(%d+)")
local idchci = "-100"..idch
local Sticker = DAata:match("^Sticker(.*)$"):gsub('chatid',''):gsub('chatid',''):gsub(idch,''):gsub('-100','')
local Text ="*⋄︙تم الغاء منعه بنجاح*"
inline = {
{{text = '⋄︙ sᴏᴜʀᴄᴇ ᴍᴇʀᴏ  .',url='http://t.me/YYYDR'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
database:srem(bot_id.."MeRo:List:Filter:Sticker"..idchci,Sticker)  
end
if DAata and DAata:match("^delallSticker(.*)$") and Addictive(data) then  
local delallSticker = DAata:match("^delallSticker(.*)$")
local Text ="*⋄︙تم الغاء منع كل المتحركات*"
inline = {
{{text = '⋄︙ sᴏᴜʀᴄᴇ ᴍᴇʀᴏ  .',url='http://t.me/YYYDR'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
local listSticker = database:smembers(bot_id.."MeRo:List:Filter:Sticker"..delallSticker)  
for k,v in pairs(listSticker) do  
database:srem(bot_id.."MeRo:List:Filter:Sticker"..delallSticker,v)  
end  
end
if DAata and DAata:match("^delallanimation(.*)$") and Addictive(data) then  
local delallmation = DAata:match("^delallanimation(.*)$")
local Text ="*⋄︙تم الغاء منع كل المتحركات*"
inline = {
{{text = '⋄︙ sᴏᴜʀᴄᴇ ᴍᴇʀᴏ  .',url='http://t.me/YYYDR'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
local listAnimation = database:smembers(bot_id.."MeRo:List:Filter:Animation"..delallmation)  
for k,v in pairs(listAnimation) do  
database:srem(bot_id.."MeRo:List:Filter:Animation"..delallmation,v)  
end  
end
if DAata and DAata:match("^delallph(.*)$") and Addictive(data) then  
local delallph = DAata:match("^delallph(.*)$")
local Text ="*⋄︙تم الغاء منع كل الصور*"
inline = {
{{text = '⋄︙ sᴏᴜʀᴄᴇ ᴍᴇʀᴏ  .',url='http://t.me/YYYDR'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
local listPhoto = database:smembers(bot_id.."MeRo:List:Filter:Photo"..delallph)  
for k,v in pairs(listPhoto) do  
database:srem(bot_id.."MeRo:List:Filter:Photo"..delallph,v)  
end  
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
local text = msg.content_.text_
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print("OLD MESSAGE")
return false
end
if msg.sender_user_id_ and Muted_Groups(msg.chat_id_,msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
return false  
end
if msg.sender_user_id_ and MuAn_All_Groups(msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
return false  
end
--------------------------------------------------------------------------------------------------------------
if tonumber(msg.sender_user_id_) ~= tonumber(bot_id) then  
if msg.sender_user_id_ and Ban_Groups(msg.chat_id_,msg.sender_user_id_) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false  
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_Groups(msg.chat_id_,msg.content_.members_[0].id_) then 
Kick_Group(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Ban_All_Groups(msg.sender_user_id_) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_All_Groups(msg.content_.members_[0].id_) then 
Kick_Group(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
end 
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == "MessagePinMessage" or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatChangeTitle" or msg.content_.ID == "MessageChatDeleteMember" then   
if database:get(bot_id.."MeRo:Lock:tagservr"..msg.chat_id_) then  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false
end    
end   
if text and not database:sismember(bot_id..'MeRo:Spam:Group'..msg.sender_user_id_,text) then
database:del(bot_id..'MeRo:Spam:Group'..msg.sender_user_id_) 
end
------------------------------------------------------------------------
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
database:set(bot_id..'MeRo:User:Name'..msg.sender_user_id_,data.username_)
end;end,nil)   
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
database:set(bot_id.."MeRo:Who:Added:Me"..msg.chat_id_..":"..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."MeRo:Lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Addictive(msg) and Bots == "kick" then   
https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
Get_Info = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(Get_Info)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_Addictive(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."MeRo:Lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Addictive(msg) and Bots == "del" then   
Get_Info = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(Get_Info)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_Addictive(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
------------------------------------------------------------------------
if text and database:get(bot_id.."MeRo:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = database:get(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
database:del(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
database:del(bot_id.."MeRo:Set:Cmd:Group:New"..msg.chat_id_)
database:srem(bot_id.."MeRo:List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"*⋄︙تم ازالة الامر من المجموعه*")  
else
send(msg.chat_id_, msg.id_,"*⋄︙لا يوجد امر بهاذا الاسم تاكد من الامر واعد المحاوله*")  
end
database:del(bot_id.."MeRo:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
------------------------------------------------------------------------
if data.message_.content_.text_ then
local NewCmmd = database:get(bot_id.."MeRo:Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
local Name_Bot = (database:get(bot_id.."MeRo:Name:Bot") or "ميرو")
if not database:get(bot_id.."MeRo:Fun_Bots"..msg.chat_id_) then
if text ==  ""..Name_Bot..' شنو رئيك بهاذا' and tonumber(msg.reply_to_message_id_) > 0 then     
function FunBot(extra, result, success) 
local Fun = {'لوكي وزاحف من ساع زحفلي وحضرته 😒','خوش ولد و ورده مال الله 🙄','يلعب ع البنات 🙄', 'ولد زايعته الكاع 😶🙊','صاك يخبل ومعضل ','محلو وشواربه جنها مكناسه 😂🤷🏼‍♀️','اموت عليه 🌝','هوه غير الحب مال اني ❤️','مو خوش ولد صراحه ☹️','ادبسز وميحترم البنات  ', 'فد واحد قذر 🙄😒','ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷‍♀️','مو خوش ولد 🤓' } 
send(msg.chat_id_, result.id_,''..Fun[math.random(#Fun)]..'')   
end   
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end  
if text == ""..Name_Bot..' شنو رئيك بهاي' and tonumber(msg.reply_to_message_id_) > 0 then    
function FunBot(extra, result, success) 
local Fun = {'الكبد مال اني هيه ','ختولي ماحبها ','خانتني ويه صديقي 😔','بس لو الكفها اله اعضها 💔','خوش بنيه بس عده مكسرات زايده وناقصه منا ومنا وهيه تدري بنفسها 😒','جذابه ومنافقه سوتلي مشكله ويه الحب مالتي ','ئووووووووف اموت ع ربها ','ديرو بالكم منها تلعب ع الولد 😶 ضحكت ع واحد قطته ايفون 7 ','صديقتي وختي وروحي وحياتي ','فد وحده منحرفه 😥','ساكنه بالعلاوي ونته حدد بعد لسانها لسان دلاله 🙄🤐','ام سحوره سحرت اخويا وعلكته 6 سنوات 🤕','ماحبها 🙁','بله هاي جهره تسئل عليها ؟ ','بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئل ع بنات العالم ولي يله 🏼','ياخي بنيه حبوبه بس لبعرك معمي عليها تشرب هواي 😹' } 
send(msg.chat_id_,result.id_,''..Fun[math.random(#Fun)]..'') 
end  
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end    
end
if text and text:match('^'..Name_Bot..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..Name_Bot..' ','')
end
------------------------------------------------------------------------
MeRo_Started_Bot(msg,data)
MeRo_Files(msg)
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
database:incr(bot_id..'MeRo:message_edit'..result.chat_id_..result.sender_user_id_)
local Text = result.content_.text_
if database:get(bot_id.."MeRo:Lock:edit"..msg.chat_id_) and not Text and not BasicConstructor(result) then
local list = database:smembers(bot_id.."MeRo:Basic:Constructor"..msg.chat_id_)
t = "⋄︙ المنشئين الاساسين تعالو مخرب \n— — — — — — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."MeRo:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "⋄︙ماكو منششئين يشوفولك جاره"
end
Reply_Status(result,result.sender_user_id_,"reply","⋄︙قام بالتعديل على الميديا"..t)  
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
end
local text = result.content_.text_
if not Addictive(result) then
------------------------------------------------------------------------
if text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("[hH][tT][tT][pP][sT]") or text and text:match("[tT][eE][lL][eE][gG][rR][aA].[Pp][Hh]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa].[Pp][Hh]") then
if database:get(bot_id.."MeRo:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(@)(.*)") then
if database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("@") then
if database:get(bot_id.."MeRo:Lock:User:Name"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(#)(.*)") then
if database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("#") then
if database:get(bot_id.."MeRo:Lock:hashtak"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("/") then
if database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end 
if text and text:match("(.*)(/)(.*)") then
if database:get(bot_id.."MeRo:Lock:Cmd"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text then
local MeRo_Msg = database:sismember(bot_id.."MeRo:List:Filter:text"..result.chat_id_,text) 
if MeRo_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","⋄︙الكلمه ممنوعه من المجموعه")  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
if msg.content_.ID == 'MessageAnimation' then    
local Animation_Msg = database:sismember(bot_id.."MeRo:List:Filter:Animation"..result.chat_id_,result.content_.animation_.animation_.persistent_id_) 
if Animation_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","⋄︙المتحركه ممنوعه من المجموعه")  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
if msg.content_.ID == 'MessagePhoto' then    
local Photo_Msg = database:sismember(bot_id.."MeRo:List:Filter:Photo"..result.chat_id_,result.content_.photo_.sizes_[1].photo_.persistent_id_) 
if Photo_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","⋄︙الصوره ممنوعه من المجموعه")  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
if msg.content_.ID == 'MessageSticker' then    
local Sticker_Msg = database:sismember(bot_id.."MeRo:List:Filter:Sticker"..result.chat_id_,result.content_.sticker_.sticker_.persistent_id_) 
if Sticker_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","⋄︙الملصق ممنوع من المجموعه")  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
end
end,nil)
------------------------------------------------------------------------
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local Get_Msg_Pin = database:get(bot_id..'MeRo:Msg:Pin:Chat'..msg.chat_id_)
if Get_Msg_Pin ~= nil then
if text == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) if d.ID == 'Ok' then;database:del(bot_id..'MeRo:Msg:Pin:Chat'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if Get_Msg_Pin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'MeRo:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'MeRo:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'MeRo:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
end
end
if (data.ID == "UpdateOption" and data.value_.value_ == "Ready") then
print("\27[34m"..[[>> The Bot is Running]].."\27[m")
local list = database:smembers(bot_id..'MeRo:UsersBot')  
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local list = database:smembers(bot_id..'MeRo:Chek:Groups') 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
database:srem(bot_id..'MeRo:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'MeRo:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'MeRo:Chek:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'MeRo:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id..'MeRo:Chek:Groups',v)  
end end,nil)
end;CleangGroups();end;end