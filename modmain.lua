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

local function CreateBuzilkaStartPopup()
    local function ClosePopup()
        GLOBAL.TheFrontEnd:PopScreen()
    end
    local function OpenDiscord()
        GLOBAL.VisitURL("https://discord.gg/tHH9RyYTEB")
    end
    local function OpenYoutube()
        GLOBAL.VisitURL("https://www.youtube.com/@buzilka")
    end

    local popup = PopupDialogScreen(GLOBAL.STRINGS.BSP_START_POPUP_TITLE, GLOBAL.STRINGS.BSP_START_POPUP_TEXT,{
        {
            text = GLOBAL.STRINGS.BSP_START_POPUP_DISCORD,
            cb = OpenDiscord
        },
        {
            text = GLOBAL.STRINGS.BSP_START_POPUP_YOUTUBE,
            cb = OpenYoutube
        },
        {
            text = GLOBAL.STRINGS.BSP_START_POPUP_CLOSE,
            cb = ClosePopup
        }
    }, nil, "medium", "dark")

    GLOBAL.TheFrontEnd:PushScreen(popup)
end

AddPlayerPostInit(function(inst) inst:DoTaskInTime(0.5, function() CreateBuzilkaStartPopup() end) end)
