local _G = GLOBAL
local require = _G.require
local VisitURL = _G.VisitURL
local PopupDialogScreen = require("screens/popupdialog")

table.insert(_G.STRINGS, "BSP_START_POPUP_TITLE")
table.insert(_G.STRINGS, "BSP_START_POPUP_TEXT")
table.insert(_G.STRINGS, "BSP_START_POPUP_DISCORD")
table.insert(_G.STRINGS, "BSP_START_POPUP_YOUTUBE")
table.insert(_G.STRINGS, "BSP_START_POPUP_CLOSE")

_G.STRINGS.BSP_START_POPUP_TITLE = "󰀒Приветствуем всей Бузилкой!󰀒"
_G.STRINGS.BSP_START_POPUP_TEXT = "Рекомендуем зайти на наш Discord сервер, а так же подписаться на наш YouTube канал."
_G.STRINGS.BSP_START_POPUP_DISCORD = "󰀔Discord"
_G.STRINGS.BSP_START_POPUP_YOUTUBE = "󰀍YouTube"
_G.STRINGS.BSP_START_POPUP_CLOSE = "󰀊Закрыть"

local function CreateBuzilkaPopup(inst)
    local function OnDiscord()
        VisitURL("https://discord.gg/tHH9RyYTEB")
    end

    local function OnYoutube()
        VisitURL("https://www.youtube.com/@buzilka")
    end

    local function OnClose()
        _G.TheFrontEnd:PopScreen()
    end

    local popup = PopupDialogScreen(_G.STRINGS.BSP_START_POPUP_TITLE, _G.STRINGS.BSP_START_POPUP_TEXT, {
        {
            text = _G.STRINGS.BSP_START_POPUP_DISCORD,
            cb = OnDiscord
        },
        {
            text = _G.STRINGS.BSP_START_POPUP_YOUTUBE,
            cb = OnYoutube
        },
        {
            text = _G.STRINGS.BSP_START_POPUP_CLOSE,
            cb = OnClose
        }
    }, false, 300)

    _G.TheFrontEnd:PushScreen(popup)
end

AddPlayerPostInit(CreateBuzilkaPopup)
