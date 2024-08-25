local PopupDialogRedux = GLOBAL.require("screens/redux/popupdialog")

table.insert(GLOBAL.STRINGS, "BSP_START_POPUP_TITLE")
table.insert(GLOBAL.STRINGS, "BSP_START_POPUP_TEXT")
table.insert(GLOBAL.STRINGS, "BSP_START_POPUP_DISCORD")
table.insert(GLOBAL.STRINGS, "BSP_START_POPUP_YOUTUBE")
table.insert(GLOBAL.STRINGS, "BSP_START_POPUP_CLOSE")

GLOBAL.STRINGS.BSP_START_POPUP_TITLE = "󰀒Приветствуем всей Бузилкой!󰀒"
GLOBAL.STRINGS.BSP_START_POPUP_TEXT = "Рекомендуем зайти на наш Discord сервер, а так же подписаться на наш YouTube канал."
GLOBAL.STRINGS.BSP_START_POPUP_DISCORD = "󰀔Discord"
GLOBAL.STRINGS.BSP_START_POPUP_YOUTUBE = "󰀍YouTube"
GLOBAL.STRINGS.BSP_START_POPUP_CLOSE = "󰀊Закрыть"

local function CreateBuzilkaStartPopup(inst)
    local function ClosePopup()
        GLOBAL.TheFrontEnd:PopScreen()
    end
    local function OpenDiscord()
        GLOBAL.VisitURL("https://discord.gg/tHH9RyYTEB")
    end
    local function OpenYoutube()
        GLOBAL.VisitURL("https://www.youtube.com/@buzilka")
    end

    local popup = PopupDialogRedux(GLOBAL.STRINGS.BSP_START_POPUP_TITLE, GLOBAL.STRINGS.BSP_START_POPUP_TEXT,{
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
    }, false, 300)
end

AddPlayerPostInit(CreateBuzilkaStartPopup)
