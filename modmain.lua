local PopupDialogScreen = GLOBAL.require("screens/redux/popupdialog")

table.insert(GLOBAL.STRINGS, "BSP_START_POPUP_TITLE")
table.insert(GLOBAL.STRINGS, "BSP_START_POPUP_TEXT")
table.insert(GLOBAL.STRINGS, "BSP_START_POPUP_DISCORD")
table.insert(GLOBAL.STRINGS, "BSP_START_POPUP_YOUTUBE")
table.insert(GLOBAL.STRINGS, "BSP_START_POPUP_CLOSE")

GLOBAL.STRINGS.BSP_START_POPUP_TITLE = "󰀒Приветствуем всей Бузилкой!󰀒"
GLOBAL.STRINGS.BSP_START_POPUP_TEXT = "Рекомендуем зайти на наш\nDiscord сервер, а так же подписаться\nна наш YouTube канал."
GLOBAL.STRINGS.BSP_START_POPUP_DISCORD = "󰀔Discord"
GLOBAL.STRINGS.BSP_START_POPUP_YOUTUBE = "󰀍YouTube"
GLOBAL.STRINGS.BSP_START_POPUP_CLOSE = "󰀊Закрыть"

local popupShowed = false

function CreateBuzilkaStartPopup()
    GLOBAL.TheFrontEnd:PushScreen(PopupDialogScreen(GLOBAL.STRINGS.BSP_START_POPUP_TITLE, GLOBAL.STRINGS.BSP_START_POPUP_TEXT,{
        {
            text = GLOBAL.STRINGS.BSP_START_POPUP_DISCORD,
            cb = function() GLOBAL.VisitURL("https://discord.gg/tHH9RyYTEB") end
        },
        {
            text = GLOBAL.STRINGS.BSP_START_POPUP_YOUTUBE,
            cb = function() GLOBAL.VisitURL("https://www.youtube.com/@buzilka") end
        },
        {
            text = GLOBAL.STRINGS.BSP_START_POPUP_CLOSE,
            cb = function() GLOBAL.TheFrontEnd:PopScreen() end
        }
    }, nil, "medium", "dark"))
end

local function ShowPopup(player)
    if popupShowed then return nil end
    player:DoTaskInTime(0.5, CreateBuzilkaStartPopup)
    popupShowed = true
end

AddPlayerPostInit(ShowPopup)
