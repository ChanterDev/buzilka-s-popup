local _G = GLOBAL
local STRINGS = _G.STRINGS
local require = _G.require
local VisitURL = _G.VisitURL
local TheFrontEnd = _G.TheFrontEnd
local PopupDialogScreen = require("screens/popupdialog")

table.insert(STRINGS, "BSP_START_POPUP_TITLE")
table.insert(STRINGS, "BSP_START_POPUP_TEXT")
table.insert(STRINGS, "BSP_START_POPUP_DISCORD")
table.insert(STRINGS, "BSP_START_POPUP_YOUTUBE")
table.insert(STRINGS, "BSP_START_POPUP_CLOSE")

STRINGS.BSP_START_POPUP_TITLE = "󰀒Приветствуем всей Бузилкой!󰀒"
STRINGS.BSP_START_POPUP_TEXT = "Рекомендуем зайти на наш Discord сервер, а так же подписаться на наш YouTube канал."
STRINGS.BSP_START_POPUP_DISCORD = "󰀔Discord"
STRINGS.BSP_START_POPUP_YOUTUBE = "󰀍YouTube"
STRINGS.BSP_START_POPUP_CLOSE = "󰀊Закрыть"

local function CreateBuzilkaPopup(inst)
    local function OnDiscord()
        VisitURL("https://discord.gg/tHH9RyYTEB")
    end

    local function OnYoutube()
        VisitURL("https://www.youtube.com/@buzilka")
    end

    local function OnClose()
        TheFrontEnd:PopScreen()
    end

    local popup = PopupDialogScreen(STRINGS.BSP_START_POPUP_TITLE, STRINGS.BSP_START_POPUP_TEXT, {
        {
            text = STRINGS.BSP_START_POPUP_DISCORD,
            cb = OnDiscord
        },
        {
            text = STRINGS.BSP_START_POPUP_YOUTUBE,
            cb = OnYoutube
        },
        {
            text = STRINGS.BSP_START_POPUP_CLOSE,
            cb = OnClose
        }
    }, false, 300)

    TheFrontEnd:PushScreen(popup)
end

AddPlayerPostInit(CreateBuzilkaPopup)
