local T, C, L = unpack(ShestakUI)
if C.chat.enable ~= true or C.chat.spam ~= true then return end

T.ChatSpamList = {
	"золото",
	"з0л0т0",
	"з0л0то",
	"золота",
	"голд",
	"г0лд",
	"золотишко",
	"золатишко",
	"блестяшки",
	"блестяшkи",
	"блестяхи",
	"монетки",
	"м0нетки",
	"монеты",
	"visа",
	"mastercard",
	"webmoney",
	"вебмани",
	"qiwi",
	"qiwі",
	"яндекс",
	"skype",
	"skуpe",
	"skуpе",
	"скайп",
	"скаип",
	"sкайп",
	"портал",
	"анус",
	"анальное",
	"一组",
	"/组",
	"邮寄",
	"U寄",
	"大量",
	"带价",
	"代价",
	"位面",
	"支付",
	"VX",
	"免费",
	"ZFB",
	"收G",
	"无限收",
	"大米",
	"小米",
	"G收",
	"全区服",
	"双法",
	"导航",
	"收人",
	"招收",
	"一波",
	"经验",
	"荣誉",
	"一门",
	"爆本",
	"中转",
	"直飞",
	"米",
	"MC门",
	"霜狼",
	"工会",
	"紫门",
	-- "DKP",
	"宝宝",
	"飞行",
	"航空",
	"接送",
	"十字",
	"超级MLD",
	"人双",
	"超级玛拉顿"
}

for word in gmatch(C.chat.spam_list, "%S+") do
	tinsert(T.ChatSpamList, word)
end