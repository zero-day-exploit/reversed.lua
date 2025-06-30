-- ░▒▓███████▓▒░░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░  
--░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
--░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
-- ░▒▓██████▓▒░░▒▓████████▓▒░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓████████▓▒░ 
--       ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
--       ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
--░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
                                                                                
--(pasted)--                                                                                


-- Required Workshop Libraries

local trace, csgo_weapons, ease, anti_aim, clipboard, images, base64 = require("gamesense/trace"), require("gamesense/csgo_weapons"), require("gamesense/easing"), require("gamesense/antiaim_funcs"), require("gamesense/clipboard"), require("gamesense/images"), require("gamesense/base64")

local vector = require("vector")

-- Global Variables

local em = {
    ui = {
        default_settings = "eyJEZWZhdWx0OmJ5byI6MCwiT24ga2V5OnlvbCI6MCwiT24ga2V5OnAiOiJPZmYiLCJBaXI6eW9yIjoyMywiQWlyIER1Y2s6ZmJ5IjpmYWxzZSwiU3RhbmRpbmc6ZmJ5IjpmYWxzZSwiQWlyIER1Y2s6eWpvIjo1MiwiQWlyIER1Y2s6eW9yIjozMiwiQWlyOnlqIjoiQ2VudGVyIiwiRHVja2luZzp5aiI6IkNlbnRlciIsIk1vdmluZzp5b3IiOjE4LCJEZWZhdWx0OnkiOiIxODAiLCJTdGFuZGluZzpmbGwiOjYwLCJNb3Zpbmc6eWpvIjo3NSwiU3RhbmRpbmc6ZSI6dHJ1ZSwiQWlyOnAiOiJEb3duIiwiQWlyIER1Y2s6YnlvIjoxNTgsIkFpcjpmYnkiOmZhbHNlLCJNb3Zpbmc6eWoiOiJDZW50ZXIiLCJBaXIgRHVjazp5IjoiMTgwIiwiTW92aW5nOnlvbCI6MTYsIlN0YW5kaW5nOnAiOiJEb3duIiwiU3RhbmRpbmc6eSI6IjE4MCIsIk9uIGtleTp5aiI6Ik9mZiIsIlN0YW5kaW5nOmJ5IjoiSml0dGVyIiwiU3RhbmRpbmc6eWpvIjotNDYsIk9uIGtleTp5am8iOjAsIkFpcjplIjp0cnVlLCJBaXIgRHVjazp5YiI6IkF0IHRhcmdldHMiLCJEdWNraW5nOnkiOiIxODAiLCJBaXI6eSI6IjE4MCIsIk1vdmluZzp5YiI6IkF0IHRhcmdldHMiLCJNb3Zpbmc6ZmxsIjo2MCwiRGVmYXVsdDpmYnkiOmZhbHNlLCJBaXIgRHVjazpmbGwiOjYwLCJTdGFuZGluZzp5aiI6IkNlbnRlciIsIkRlZmF1bHQ6eWIiOiJBdCB0YXJnZXRzIiwiU3RhbmRpbmc6eW9sIjoyMywiT24ga2V5OmZsbCI6NjAsIk9uIGtleTpmYnkiOmZhbHNlLCJBaXI6eWIiOiJBdCB0YXJnZXRzIiwiU2xvd3dhbGs6eWIiOiJBdCB0YXJnZXRzIiwicm9sbCI6MCwiU3RhbmRpbmc6ZmxyIjo2MCwiRHVja2luZzp5b2wiOjUsIk9uIGtleTp5YiI6IkxvY2FsIHZpZXciLCJPbiBrZXk6YnlvIjowLCJPbiBrZXk6YnkiOiJPZmYiLCJBaXIgRHVjazpwIjoiRG93biIsIk9uIGtleTp5b3IiOjAsIk9uIGtleTpmbHIiOjYwLCJEZWZhdWx0OnlvciI6NSwiT24ga2V5OnkiOiJPZmYiLCJEZWZhdWx0OmZsbCI6NTAsIlNsb3d3YWxrOmZieSI6ZmFsc2UsIlN0YW5kaW5nOmJ5byI6MTY1LCJNb3Zpbmc6eSI6IjE4MCIsIkR1Y2tpbmc6ZSI6dHJ1ZSwiRGVmYXVsdDpieSI6IkppdHRlciIsIlNsb3d3YWxrOmZsciI6NjAsIkFpcjpmbGwiOjYwLCJTbG93d2FsazpieW8iOjc3LCJNb3Zpbmc6ZmxyIjo2MCwiRHVja2luZzpmbGwiOjYwLCJTbG93d2Fsazp5aiI6IkNlbnRlciIsIlNsb3d3YWxrOnlvciI6MTIsIlNsb3d3YWxrOnAiOiJEb3duIiwiTW92aW5nOnAiOiJEb3duIiwiU2xvd3dhbGs6eW9sIjoxMiwiQWlyIER1Y2s6ZSI6dHJ1ZSwiU2xvd3dhbGs6eSI6IjE4MCIsIlNsb3d3YWxrOmUiOnRydWUsIkR1Y2tpbmc6ZmJ5IjpmYWxzZSwiRHVja2luZzpmbHIiOjYwLCJEdWNraW5nOmJ5IjoiSml0dGVyIiwiU2xvd3dhbGs6eWpvIjo5NywiRHVja2luZzpieW8iOjAsIkR1Y2tpbmc6eWpvIjotMTgsIk9uIGtleTplIjpmYWxzZSwiRHVja2luZzp5YiI6IkF0IHRhcmdldHMiLCJBaXI6ZmxyIjo2MCwiRHVja2luZzpwIjoiRG93biIsIkRlZmF1bHQ6cCI6IkRvd24iLCJEZWZhdWx0OnlvbCI6MTQsIkRlZmF1bHQ6ZmxyIjo2MCwiQWlyOmJ5IjoiSml0dGVyIiwiQWlyOmJ5byI6MTQ1LCJTdGFuZGluZzp5YiI6IkF0IHRhcmdldHMiLCJBaXI6eWpvIjo1NCwiTW92aW5nOmJ5byI6MTU4LCJEZWZhdWx0OnlqbyI6NjksIk1vdmluZzpieSI6IkppdHRlciIsIlN0YW5kaW5nOnlvciI6MjgsIlNsb3d3YWxrOmJ5IjoiSml0dGVyIiwiTW92aW5nOmUiOnRydWUsIk1vdmluZzpmYnkiOmZhbHNlLCJBaXIgRHVjazp5aiI6IkNlbnRlciIsIkFpcjp5b2wiOjIzLCJEZWZhdWx0OnlqIjoiQ2VudGVyIiwiU2xvd3dhbGs6ZmxsIjo2MCwiQWlyIER1Y2s6eW9sIjoyMywiQWlyIER1Y2s6YnkiOiJKaXR0ZXIiLCJBaXIgRHVjazpmbHIiOjYwLCJEdWNraW5nOnlvciI6MTB9",
        elements = {},
        meta_elements = {},
        aa = {
            states = {}
        },
        visuals = {},
        rage = {},
        misc = {}
    },
    util = {},
    aa = {
        states = {"Default", "Standing", "Moving", "Air", "Air Duck", "Ducking", "Slowwalk", "On key"},
        state = "Default",
        ground_ticks = 0,
        use = false,
    },
    misc = {
        kill_say = {
            list = {"而作为临时工和兼职人员权利拥护者的reversed先生则强调他们应该同工同酬。", "cant hit me :3", "ReversedSource-yaw just made you gay", "turn on desync next time :3", "get ReversedSource setts @ gg/Reversed", "1tap ft. ReversedSource-yaw" }
        },
        clantag = {
            tag = {" ", "R", "Re", "Re", "Rev", "Reve", "Rever", "Rever", "Revers", "Reverse", "Reversed", "ReversedSo", "ReversedSou", "ReversedSour ", "ReversedSourc ", "ReversedSource ", "ReversedSource ", "ReversedSource ", "ReversedSource ", "ReversedSource ", "ReversedSource ", "ReversedSource "},
            index = 1,
            last = 0,
            back = false
        }
    },
    visuals = {
        other = {},
        clantag = {},
        indicators = {
            em = {
                title_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                state_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                exploit_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                binds_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                dmg_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
            },
            ideal_yaw = {
                title_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                mode_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                exploit_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
            },
            chimera = {
                title_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                desync_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                exploit_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                left = { r = 255, g = 255, b = 255, a = 255 },
                right = { r = 255, g = 255, b = 255, a = 255 },
            },
            intellect = {
            },
            prediction = {
                title_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                desync_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                binds_pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                binds = {
                    ["DT"] = { 
                        pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2), 
                        ref = {ui.reference("rage", "Aimbot", "double tap")}
                    }, 
                    ["HS"] = { 
                        pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2), 
                        ref = {ui.reference("aa", "other", "on shot anti-aim")}
                    }, 
                    ["BAIM"] = { 
                        pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2), 
                        ref = ui.reference("rage", "Aimbot", "force body aim")
                    }, 
                    ["SP"] = { 
                        pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2), 
                        ref = ui.reference("rage", "aimbot", "force safe point")
                    },
                    ["DUCK"] = { 
                        pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2),
                        ref = ui.reference("rage", "other", "duck peek assist")
                    } 
                }
            },
            charge = 0,
            charge_col = { r = 255, g = 255, b = 255, a = 255 },
            fatality = {
                exploit = { charge = 0, opacity = 0, col = { r = 255, g = 255, b = 255, a = 255 } },
                refs = { ["DT"] = {ui.reference("rage", "Aimbot", "double tap")}, ["HS"] = {ui.reference("aa", "other", "on shot anti-aim")}, ["BAIM"] = ui.reference("rage", "Aimbot", "force body aim"), ["SP"] = ui.reference("rage", "aimbot", "force safe point"), ["DUCK"] = ui.reference("rage", "other", "duck peek assist"), ["PING"] = {ui.reference("misc", "miscellaneous", "ping spike")} }
            }
        },
        panels = {
            keybinds = {
                refs = { ["Double Tap"] = {ui.reference("rage", "Aimbot", "double tap")}, ["Hide Shots"] = {ui.reference("aa", "other", "on shot anti-aim")}, ["Quick peek assist"] = {ui.reference("rage", "other", "quick peek assist")}, ["Force body aim"] = ui.reference("rage", "Aimbot", "force body aim"), ["Force safe point"] = ui.reference("rage", "aimbot", "force safe point"), ["Fake Duck"] = ui.reference("rage", "other", "duck peek assist"), ["Ping Spike"] = {ui.reference("misc", "miscellaneous", "ping spike")} },
                list = {},
                modes = {"on", "on", "on", "on" },
                hovering = false,
                dragging = false,
                in_drag = false,
                drag_pos = vector(0, 0),
                pos = vector(500, 500),
                size = vector(0, 0),
                opacity = 0,
                icon = "iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAYAAAA4qEECAAAABmJLR0QA/wD/AP+gvaeTAAABpklEQVR4nO3cwUkDQRiG4W9EiKB2YAeKOdpEKtgCTE161w4swluCYgVWoOvBXMbDJjI7ukhi9lszvs8twwq/L0OiQxgJAAAAAAAAAAAA6wnfLcYYDyRNJVWSTiUdOofaQW+SHiXdSroKIbznD3wJHWM8kXQn6bz38co0lzQJITyni63Qy518LyL/1lzSRbqz97IHpiLyNowlXaYLeejKN0vxWi3zt45XSUfWccpVhxCOVy/y0NE/T7lCCJ9987cO9ITQJoQ2IbQJoU321/2B9JM01fUXy397vgs72oTQJoQ2IbQJoU046+gRZx0DILQJoU0IbUJok62ddXTZlTOKbf1eXdjRJoQ2IbQJoU0IbcJZR4846xgAoU0IbUJoE0KbDPa9jr+G73UUgtAmhDYhtAmhTTjr6BFnHQMgtAmhTQhtQmiTPHQ9yBRleklf5KGfjIOUrtUyD31jHKR0rZb5PywjNRejjJ0TFWim5mKUxWqhtaOXN6ZM1Nyggs3M1Fz1s0gXuw61R2puUKkknYk7PH5SS3pQc3nVdR4ZAAAAAAAAAAAAm/gATHl6VR/z5kIAAAAASUVORK5CYII="
            },
            spectators = {
                list = {},
                hovering = false,
                dragging = false,
                in_drag = false,
                drag_pos = vector(0, 0),
                pos = vector(700, 500),
                size = vector(0, 0),
                opacity = 0,
                default = "PHN2ZyB2ZXJzaW9uPSIxLjIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmlld0JveD0iMCAwIDUwMCA1MDAiIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj4KCTx0aXRsZT5OZXcgUHJvamVjdDwvdGl0bGU+Cgk8ZGVmcz4KCQk8aW1hZ2UgIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIiBpZD0iaW1nMSIgaHJlZj0iZGF0YTppbWFnZS9wbmc7YmFzZTY0LGlWQk9SdzBLR2dvQUFBQU5TVWhFVWdBQUFmUUFBQUgwQVFNQUFBRHhHRTNKQUFBQUFYTlNSMElCMmNrc2Z3QUFBQU5RVEZSRkFBQUFwM285MmdBQUFBRjBVazVUQUVEbTJHWUFBQUExU1VSQlZIaWM3Y0V4QVFBQUFNS2c5VS90WVEyZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRzU5QUFBQmhSTFk5Z0FBQUFCSlJVNUVya0pnZ2c9PSIvPgoJCTxpbWFnZSAgd2lkdGg9IjUxMiIgaGVpZ2h0PSI1MTIiIGlkPSJpbWcyIiBocmVmPSJkYXRhOmltYWdlL3BuZztiYXNlNjQsaVZCT1J3MEtHZ29BQUFBTlNVaEVVZ0FBQWdBQUFBSUFBUU1BQUFET3RrYTVBQUFBQVhOU1IwSUIyY2tzZndBQUFBTlFURlJGREFjTTZKY2VVZ0FBQURaSlJFRlVlSnp0d1FFQkFBQUFnaUQvcjI1SVFBRUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBZkJ1Q0FBQUIwbmlKOEFBQUFBQkpSVTVFcmtKZ2dnPT0iLz4KCTwvZGVmcz4KCTxzdHlsZT4KCQkuczAgeyBmaWxsOiAjZmY5MGY4IH0gCgk8L3N0eWxlPgoJPHVzZSBpZD0iQmFja2dyb3VuZCIgaHJlZj0iI2ltZzEiIHg9IjAiIHk9IjAiLz4KCTx1c2UgaWQ9IlNoYXBlIDEiIGhyZWY9IiNpbWcyIiB4PSItNyIgeT0iLTUiLz4KCTxwYXRoIGlkPSJFTSIgY2xhc3M9InMwIiBhcmlhLWxhYmVsPSJFTSIgIGQ9Im0yMTQuNSAyODkuMXYyNC45aC05My4xdi0xMjguN2g5My4xdjI0LjloLTYwLjF2MjIuMmg1NS44djI0LjloLTU1Ljh2MzEuOHptMTYyLjgtMTAzLjh2MTI4LjdoLTMzdi04Ni4ybC0yMy45IDU2aC0yMi45bC0yMy44LTU2djg2LjJoLTMxLjN2LTEyOC43aDM4LjVsMjkgNjQuNiAyOC44LTY0LjZ6Ii8+Cjwvc3ZnPg==",
                icon = "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAABmJLR0QA/wD/AP+gvaeTAAAER0lEQVR4nO2aS2xVRRjH/1MLJiyKFawN2sQHoVASrCILIWDizgfGgFEWIgtXPja6IWjiUkNNdK+RKOqaBF2YYBMfG5uYuCnWFqURXaihCQ1WinL7c3FOcTp3zrlnZqxNdH6rueec7/89Zu6cmblXymQymUwmk8lkMplMZlkBuoHHgPeB74DfgLmy/QHwONC90nEuC8BeYJrOTAMPrXS8/xiAAV5rkLjLCGBWOv5kIpO/WoSVjj8JimG/kFCABeDB5Yyx8RADhiTdL2mTpNWSZiWNSTpljDnveb5b0oSkjYkxTkkaMsa0PD6ul/SApLsk9Um6IGla0ofGmKlEv1edDAOjNb10CXgduM6x25fQ8y6PONq9wBvAfI3NKeCO1OQPlgk2YRIYtGyPpWTscMzSHQTONLS7BDwRm/x+oBUY6GHLfjzQto5xS/dwoG0LZwTZdFUk3y/prar7NfxitW8KtK1jQ4WPJnRJehfoq7rp4wVJvYGOJGmhop2KPQHG6PZIOuK70VYAisXHwQgnkrTOav8aqeHD1lofqXEAaMvXNwI2SeqPdDJktb+M1PBha22N1OiXtMW96CvAQKQDSdpltU8m6LjYWjsTdG52L/gKQIKDLcBw2T4p6WyC1iLfS/pIkoA7JW1O0GrbafoK8FOCA0l6WpLKldtziVqS9Ky1CnwmUetcxycodm8/J7yz/6RYNi/qvZqg9YqlM1RqxzIDXOPm2zYCjDFIeie+yOqWtMb6/KKkEYV9tZB0VNJL1rU18gzhAN7z7Sf83uEG4HxkpU9UaO4FphrYT1FxIAKciIxplmJx1xzgYeBKoKNzgPc9DfQBR4DLNfbzFEvdKo31wA+BMbWA/UHJWw4PUJzZNWECuN2jcS3wMvB7QNBzFMVa7dG7rfTVhHngyajkLYdbgY9rnFwGjgI9HtsB4OuAxF2+AjZ4dHsoJte67fAosK1TfrWbHYql405JbT1rsUrSsKRB+yLFaBgr78WyXdIYcItzfXN5r22EWAxI2k7suSLFRPhpQG9NLDqjOLD4NrzDKzkNrC21Dc2/AgCfAOvqs/UnPxkY5D7L/u1A2ya8aek/Gmj7DU2LAHQR1vMAk5b9PaQdhFaxAOywRkHTU6FFRmm4G3xK0r0BA0aSjlvt5xVw2BqAUXFOsbhYO17/eBv3STpU+wRF75+N6J1tpX0vacvVTvzB33PBcIT9GZxJ0R0BuyTdGljZi5JOl+09SluudmKVpN1le1zSXKD9RjnbabcAeyKCmrTW2HdH2IeyQ5KMMVckTXZ41sdu+4NbAPd924QZq31jhH0oto+ZyqeqWTLC3QK0reYacNFqr42wD8U+rJ2NsF/yA45bgJjZ297m/hu/5to+Yk6vaifB/x1uAX5M1Es9TmtCaoxLjsXcAoxI+lxLf4gIYUTSFwn2dbRUxBb7n4GWpM8S7DOZTCaTyWQymUwm85/hL3XrFvaAS2k/AAAAAElFTkSuQmCC"
            },
            watermark = {
                username = "unknown"
            }
        }
    },
    rage = {
        roll_resolver = { list = {} }
    },
}

function em.visuals.panels:init_from_database()
    local data = database.read("😍ReversedSource🤪") or {}

    if data.loc == nil then
        return
    end

    local keybinds = vector(data.loc.keybinds.x, data.loc.keybinds.y)
    local spectators = vector(data.loc.spectators.x, data.loc.spectators.y)

    self.keybinds.pos = keybinds
    self.spectators.pos = spectators
end



em.ui.meta_elements.__index = em.ui.meta_elements

-- Roger UI Library
em.ui.new = function(uid, item)
    
    if item == nil then print("[Reversed] Item cannot be nil") return end

    local element = setmetatable({uid = uid, item = item, callback = function() end, conditions = {} }, em.ui.meta_elements)

    table.insert(em.ui.elements, element)

    ui.set_callback(item, function(val)
        element.callback(val)
    end)

    return element
end

function em.ui.meta_elements:get_parents()
    local parents = {}
    local parent = self.parent

    while parent ~= nil do
        table.insert(parents, parent)
        parent = parent.parent
    end

    return parents
end

function em.ui.meta_elements:add_condition(condition)
    if type(condition) ~= "function" then
        print("[Reversed] Condition must be a function")
        return
    end

    table.insert(self.conditions, condition)

    return self
end

function em.ui.meta_elements:set_callback(callback)
    if type(callback) ~= "function" then
        print("[Reversed] Callback must be a function")
        return
    end
    self.callback = callback

    return self
end

function em.ui.meta_elements:get()
    return ui.get(self.item)
end

function em.ui.meta_elements:set(value)
    ui.set(self.item, value)
end

function em.ui.meta_elements:handle_visibility()
    for _, element in pairs(em.ui.elements) do
        local visible = true
        for _, condition in pairs(element.conditions) do
            if not condition() then
                visible = false
                break
            end
        end

        for _, parent in pairs(element:get_parents()) do
            if not ui.get(parent.item) then
                visible = false
                break
            end
        end
        ui.set_visible(element.item, visible)
    end
end

function em.ui.meta_elements:init()
    table.insert(em.ui.elements, self)

    self.parent:handle_visibility()
    
    ui.set_callback(self.parent.item, function(val)
        self.parent:handle_visibility()
        self.parent.callback(val)
    end)

    ui.set_callback(self.item, function(val)
        self.parent:handle_visibility()
        self.callback(val)
    end)
end

function em.ui.meta_elements:checkbox(uid, tab, container, name)
    local item = ui.new_checkbox(tab, container, name)
    local element = setmetatable({uid = uid, item = item, parent = self, callback = function() end, conditions = {}, config = uid ~= nil }, em.ui.meta_elements)

    element:init()

    return element
end

function em.ui.meta_elements:slider(uid, ...)
    local item = ui.new_slider(...)
    local element = setmetatable({uid = uid, item = item, parent = self, callback = function() end, conditions = {}, config = uid ~= nil }, em.ui.meta_elements)

    element:init()

    return element
end

function em.ui.meta_elements:color_picker(uid, ...)
    local item = ui.new_color_picker(...)
    local element = setmetatable({uid = uid, item = item, parent = self, callback = function() end, conditions = {}, config = uid ~= nil }, em.ui.meta_elements)

    element:init()

    return element
end

function em.ui.meta_elements:combo(uid, ...)
    local item = ui.new_combobox(...)
    local element = setmetatable({uid = uid, item = item, parent = self, callback = function() end, conditions = {}, config = uid ~= nil }, em.ui.meta_elements)

    element:init()

    return element
end

function em.ui.meta_elements:hotkey(uid, ...)
    local item = ui.new_hotkey(...)
    local element = setmetatable({uid = uid, item = item, parent = self, callback = function() end, conditions = {}, config = uid ~= nil }, em.ui.meta_elements)

    element:init()

    return element
end

function em.ui.meta_elements:label(uid, ...)
    local item = ui.new_label(...)
    local element = setmetatable({uid = uid, item = item, parent = self, callback = function() end, conditions = {}, config = uid ~= nil }, em.ui.meta_elements)

    element:init()

    return element
end

function em.ui.meta_elements:listbox(uid, ...)
    local item = ui.new_listbox(...)
    local element = setmetatable({uid = uid, item = item, parent = self, callback = function() end, conditions = {}, config = uid ~= nil }, em.ui.meta_elements)

    element:init()

    return element
end

function em.ui.meta_elements:multiselect(uid, ...)
    local item = ui.new_multiselect(...)
    local element = setmetatable({uid = uid, item = item, parent = self, callback = function() end, conditions = {}, config = uid ~= nil }, em.ui.meta_elements)

    element:init()

    return element
end

function em.ui.meta_elements:textbox(uid, ...)
    local item = ui.new_textbox(...)
    local element = setmetatable({uid = uid, item = item, parent = self, callback = function() end, conditions = {}, config = uid ~= nil }, em.ui.meta_elements)

    element:init()

    return element
end

function em.ui.meta_elements:button(...)
    local item = ui.new_button(...)
    local element = setmetatable({uid = nil, item = item, parent = self, callback = function() end, conditions = {}, config = uid ~= nil }, em.ui.meta_elements)

    element:init()

    return element
end

-- Gamesense References

local refs = {
    aa = {
        master = ui.reference("AA", "Anti-aimbot angles", "Enabled"),
        yaw_base = ui.reference("AA", "Anti-aimbot angles", "Yaw base"),
        pitch = ui.reference("AA", "Anti-aimbot angles", "Pitch"),
        yaw = select(1, ui.reference("AA", "Anti-aimbot angles", "Yaw")),
        yaw_offset = select(2, ui.reference("AA", "Anti-aimbot angles", "Yaw")),
        yaw_jitter = select(1, ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")),
        yaw_jitter_offset = select(2, ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")),
        body_yaw = select(1, ui.reference("AA", "Anti-aimbot angles", "Body yaw")),
        body_yaw_offset = select(2, ui.reference("AA", "Anti-aimbot angles", "Body yaw")),
        freestanding_body_yaw = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw"),
        edge_yaw = ui.reference("AA", "Anti-aimbot angles", "Edge yaw"),
        freestanding = select(1, ui.reference("AA", "Anti-aimbot angles", "Freestanding")),
        freestanding_key = select(2, ui.reference("AA", "Anti-aimbot angles", "Freestanding")),
        roll = ui.reference("AA", "Anti-aimbot angles", "Roll")
    },
    misc = {
        hide_shots = select(1, ui.reference("AA", "Other", "On shot anti-aim")),
        hide_shots_key = select(2, ui.reference("AA", "Other", "On shot anti-aim")),
        fakeducking = ui.reference("RAGE", "Other", "Duck peek assist"),
        legs = ui.reference("AA", "Other", "Leg movement"),
        slow_motion = select(1, ui.reference("AA", "Other", "Slow motion")),
        slow_motion_key = select(2, ui.reference("AA", "Other", "Slow motion")),
        menu_color = ui.reference("Misc", "Settings", "Menu color"),
        thirdperson = select(1, ui.reference("Visuals", "Effects", "Force third person (alive)")),
        thirdperson_key = select(2, ui.reference("Visuals", "Effects", "Force third person (alive)")),
        clantag = ui.reference("MISC", "Miscellaneous", "Clan tag spammer")
    },
    rage = {
        double_tap = select(1, ui.reference("RAGE", "Aimbot", "Double tap")),
        double_tap_key = select(2, ui.reference("RAGE", "Aimbot", "Double tap")),
        sv_maxusrcmdprocessticks = ui.reference("MISC", "Settings", "sv_maxusrcmdprocessticks2"),
        baim = ui.reference("RAGE", "Aimbot", "Force body aim"),
        prefer_bodyaim = ui.reference("RAGE", "Aimbot", "Prefer body aim"),
        prefer_safepoint = ui.reference("RAGE", "Aimbot", "Prefer safe point"),
        sp = ui.reference("RAGE", "Aimbot", "Force safe point")
    },
    fakelag = {
        enable = select(1, ui.reference("AA", "Fake lag", "Enabled")),
        enable_key = select(2, ui.reference("AA", "Fake lag", "Enabled")),
        limit = ui.reference("AA", "Fake lag", "Limit"),
        type = ui.reference("AA", "Fake lag", "Amount"),
        variance = ui.reference("AA", "Fake lag", "Variance")
    }
}

function em:save_database()
    local data = database.read("😍ReversedSource🤪") or {}

    if data.loc == nil then
        data.loc = {}
    end

    local keybinds, spectators = self.visuals.panels.keybinds.pos, self.visuals.panels.spectators.pos

    data.loc.keybinds = { x = keybinds.x, y = keybinds.y }
    data.loc.spectators = { x = spectators.x, y = spectators.y }

    database.write("😍ReversedSource🤪", data)
end

-- Sakura Utils

function em.util:fade_col(col1, col2, speed)
    local r = math.floor(col1.r + (col2.r - col1.r) * speed)
    local g = math.floor(col1.g + (col2.g - col1.g) * speed)
    local b = math.floor(col1.b + (col2.b - col1.b) * speed)
    local a = math.floor(col1.a + (col2.a - col1.a) * speed)

    return { r = r, g = g, b = b, a = a }
end


renderer_rounded_rectangle = function(x, y, w, h, r, g, b, a, radius)
	y = y + radius
	local datacircle = {
		{x + radius, y, 180},
		{x + w - radius, y, 90},
		{x + radius, y + h - radius * 2, 270},
		{x + w - radius, y + h - radius * 2, 0},
	}

	local data = {
		{x + radius, y, w - radius * 2, h - radius * 2},
		{x + radius, y - radius, w - radius * 2, radius},
		{x + radius, y + h - radius * 2, w - radius * 2, radius},
		{x, y, radius, h - radius * 2},
		{x + w - radius, y, radius, h - radius * 2},
	}

	for _, data in pairs(datacircle) do
		renderer.circle(data[1], data[2], r, g, b, a, radius, data[3], 0.25)
	end

	for _, data in pairs(data) do
	   renderer.rectangle(data[1], data[2], data[3], data[4], r, g, b, a)
	end
end

renderer_glow = function(x, y, w, h, r, g, b, a, size, g_w, rounding)
    for i = 1, size, 0.3 do
        local fixpositon = (i  - 1) * 2	 
        local fixi = i  - 1
        renderer_rounded_rectangle(x - fixi, y - fixi, w + fixpositon, h + fixpositon, r, g, b, math.max(0, (a -  i * g_w)), rounding)	
    end
end

function em.util:to12(hour)
    if hour == 0 then
        return 12
    elseif hour > 12 then
        return hour - 12
    else
        return hour
    end
end

function em.util:hide_aa(bool)
    for _, v in pairs(refs.aa) do
        ui.set_visible(v, not bool)
    end
end

function em.util:to_hex(r, g, b, a)
    return string.format("%02x%02x%02x%02x", r, g, b, a)
end

function contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function color(r, g, b, a)
    return {r = r, g = g, b = b, a = a}
end

function em.util:pulsate(speed)
    return math.sin(math.abs(-math.pi + (globals.curtime() * speed) % (math.pi * 2))) * 255
end

function em.util:handle_state(cmd)
    local me = entity.get_local_player()

    if not me or not entity.is_alive(me) then
        return
    end

    local flags = entity.get_prop(me, "m_fFlags")
    local vel1, vel2, vel3 = entity.get_prop(me, 'm_vecVelocity')
    local speed = math.floor(math.sqrt(vel1 * vel1 + vel2 * vel2))

    local ducking       = cmd.in_duck == 1
    local air           = em.aa.ground_ticks < 5
    local walking       = speed >= 2
    local standing      = speed <= 1
    local slow_motion   = ui.get(refs.misc.slow_motion) and ui.get(refs.misc.slow_motion_key)
    local fakeducking   = ui.get(refs.misc.fakeducking)
    local on_key = em.ui.aa.on_key_key:get()
    em.aa.ground_ticks = bit.band(flags, 1) == 0 and 0 or (em.aa.ground_ticks < 5 and em.aa.ground_ticks + 1 or em.aa.ground_ticks)

    local state = "Default"
    
    if on_key then
        state = "On key"
    elseif air and not ducking then
        state = "Air"
    elseif air and ducking then
        state = "Air Duck"
    elseif slow_motion then
        state = "Slowwalk"
    elseif walking then
        state = "Moving"
    elseif fakeducking or ducking then
        state = "Ducking"
    elseif standing and not ducking or not fakeducking then
        state = "Standing"
    else
        state = "Default"
    end

    if state ~= "Default" and state ~= "On key" then
        if not em.ui.aa.states[state].master:get() then
            state = "Default"
        end
    end

    

    em.aa.state = state
end

-- Sakura Menu Items
em.ui.master = em.ui.new(nil, ui.new_checkbox("aa", "anti-aimbot angles", "[\ac685ffffReversed\aCDCDCDFF] Enabled")):set_callback(function(val)
    if ui.get(val) then
        ui.set(refs.aa.master, true)
    end
end)

em.ui.tab = em.ui.master:combo(nil, "aa", "anti-aimbot angles", "\n[\ac685ffffReversed\aCDCDCDFF] Tab", {"\ac685ffffAntiaim", "\ac685ffffVisuals", "\ac685ffffMisc", "\ac685ffffRage"})

em.ui.aa.state = em.ui.master:combo(nil, "aa", "anti-aimbot angles", "[\ac685ffffAntiaim\aCDCDCDFF] State", em.aa.states):add_condition(function()
    return em.ui.tab:get():find("Antiaim")
end)


for _, state in pairs(em.aa.states) do
    em.ui.aa.states[state] = {}

    if state ~= "Default" then
        em.ui.aa.states[state].master = em.ui.master:checkbox(state..":e", "AA", "Anti-aimbot angles", "Enable \ac685ffff" .. state, false):add_condition(function() return em.ui.tab:get():find("Antiaim") and em.ui.aa.state:get() == state end)
    end

    local x = state == "Default" and em.ui.master or em.ui.aa.states[state].master

    local con = function() return em.ui.aa.state:get() == state and em.ui.master:get() and em.ui.tab:get():find("Antiaim") and (state == "Default" and true or em.ui.aa.states[state].master:get()) end

    em.ui.aa.states[state].pitch                 = x:combo      (state..":p", "AA", "Anti-aimbot angles", "[\ac685ffff" .. state .. "\aCDCDCDFF] Pitch", {"Off", "Default", "Up", "Down", "Minimal", "Random"}):add_condition(function() return con() end)
    em.ui.aa.states[state].yaw_base              = x:combo      (state..":yb", "AA", "Anti-aimbot angles", "[\ac685ffff" .. state .. "\aCDCDCDFF] Yaw base", {"Local view", "At targets"}):add_condition(function() return con() end)
    em.ui.aa.states[state].yaw                   = x:combo      (state..":y", "AA", "Anti-aimbot angles", "[\ac685ffff" .. state .. "\aCDCDCDFF] Yaw", {"Off", "180", "Spin", "Static", "180 Z", "Crosshair"}):add_condition(function() return con() end)
    em.ui.aa.states[state].yaw_offset_left       = x:slider     (state..":yol", "AA", "Anti-aimbot angles", "\n[\ac685ffff" .. state .. "\aCDCDCDFF] Yaw offset left", -180, 180, 0, true, "°L"):add_condition(function() return con() and em.ui.aa.states[state].yaw:get() ~= "Off" end)
    em.ui.aa.states[state].yaw_offset_right      = x:slider     (state..":yor", "AA", "Anti-aimbot angles", "\n[\ac685ffff" .. state .. "\aCDCDCDFF] Yaw offset right", -180, 180, 0, true, "°R"):add_condition(function() return con() and em.ui.aa.states[state].yaw:get() ~= "Off" end)
    em.ui.aa.states[state].yaw_jitter            = x:combo      (state..":yj", "AA", "Anti-aimbot angles", "[\ac685ffff" .. state .. "\aCDCDCDFF] Yaw jitter", {"Off", "Offset", "Center", "Random"}):add_condition(function() return con() end)
    em.ui.aa.states[state].yaw_jitter_offset     = x:slider     (state..":yjo", "AA", "Anti-aimbot angles", "\n" .. state .. "\aCDCDCDFF] Yaw jitter", -180, 180, 0, true, "°"):add_condition(function() return con() and em.ui.aa.states[state].yaw_jitter:get() ~= "Off" end)
    em.ui.aa.states[state].body_yaw              = x:combo      (state..":by", "AA", "Anti-aimbot angles", "[\ac685ffff" .. state .. "\aCDCDCDFF] Body yaw", {"Off", "Opposite", "Jitter", "Static"}):add_condition(function() return con() end)
    em.ui.aa.states[state].body_yaw_offset       = x:slider     (state..":byo", "AA", "Anti-aimbot angles", "\n" .. state .. "\aCDCDCDFF] Body yaw offset", -180, 180, 0, true, "°"):add_condition(function() return con() and em.ui.aa.states[state].body_yaw:get() ~= "Off" and em.ui.aa.states[state].body_yaw:get() ~= "Opposite" end)
    em.ui.aa.states[state].freestanding_body_yaw = x:checkbox   (state..":fby", "AA", "Anti-aimbot angles", "[\ac685ffff" .. state .. "\aCDCDCDFF] Freestanding body yaw", false):add_condition(function() return con() and em.ui.aa.states[state].body_yaw:get() ~= "Off" end)
end

em.ui.aa.roll = em.ui.master:slider("roll", "AA", "Anti-aimbot angles", "[\ac685ffffAntiaim\aCDCDCDFF] Roll", -50, 50, 0, true, "°"):add_condition(function()
    return em.ui.tab:get():find("Antiaim")
end)

em.ui.aa.freestand_key = em.ui.master:hotkey(nil, "aa", "anti-aimbot angles", "[\ac685ffffAntiaim\aCDCDCDFF] Freestanding"):add_condition(function()
    return em.ui.tab:get():find("Antiaim")
end)

em.ui.aa.on_key_key = em.ui.master:hotkey(nil, "aa", "anti-aimbot angles", "[\ac685ffffAntiaim\aCDCDCDFF] On key"):add_condition(function()
    return em.ui.tab:get():find("Antiaim")
end)

em.ui.aa.break_nl = em.ui.master:hotkey(nil, "aa", "anti-aimbot angles", "[\ac685ffffAntiaim\aCDCDCDFF] Break NL"):add_condition(function()
    return em.ui.tab:get():find("Antiaim")
end)

em.ui.aa.import = em.ui.master:button("aa", "anti-aimbot angles", "\ac685ffffImport", function() end):add_condition(function()
    return em.ui.tab:get():find("Antiaim")
end)

em.ui.aa.export = em.ui.master:button("aa", "anti-aimbot angles", "\ac685ffffExport", function() end):add_condition(function()
    return em.ui.tab:get():find("Antiaim")
end)

em.ui.aa.load_default = em.ui.master:button("aa", "anti-aimbot angles", "\ac685ffffLoad Default", function() end):add_condition(function()
    return em.ui.tab:get():find("Antiaim")
end)

em.ui.visuals.indicator_type = em.ui.master:combo(nil, "aa", "anti-aimbot angles", "[\ac685ffffIndicators\aCDCDCDFF] Indicators", {"Disabled", "Reversed", "Ideal Yaw", "Old Chimera", "Prediction"}):add_condition(function()
    return em.ui.tab:get():find("Visuals")
end)

em.ui.visuals.indicators_color = em.ui.master:color_picker(nil, "aa", "anti-aimbot angles", "[\ac685ffffVisuals\aCDCDCDFF] Indicators", 255, 255, 255, 255):add_condition(function()
    return em.ui.tab:get():find("Visuals")
end)

em.ui.visuals.panels = em.ui.master:multiselect(nil, "aa", "anti-aimbot angles", "[\ac685ffffVisuals\aCDCDCDFF] Panels", {"Watermark", "Keybinds", "Spectators"}):add_condition(function()
    return em.ui.tab:get():find("Visuals")
end)

em.ui.visuals.panel_color = em.ui.master:color_picker(nil, "aa", "anti-aimbot angles", "[\ac685ffffVisuals\aCDCDCDFF] Panel color", 255, 255, 255, 255):add_condition(function()
    return em.ui.tab:get():find("Visuals")
end)

em.ui.visuals.panel_bg_color = em.ui.master:color_picker(nil, "aa", "anti-aimbot angles", "[\ac685ffffVisuals\aCDCDCDFF] Panel bg color", 255, 255, 255, 255):add_condition(function()
    return em.ui.tab:get():find("Visuals")
end)

em.ui.visuals.fatality = em.ui.master:multiselect(nil, "aa", "anti-aimbot angles", "[\ac685ffffVisuals\aCDCDCDFF] Fatality Indicators", {"DT", "HS", "DUCK", "FS", "RESOLVER", "ROLL RESOLVER", "BREAK NL", "BAIM", "SP", "PING"}):add_condition(function()
    return em.ui.tab:get():find("Visuals")
end)

em.ui.visuals.other = em.ui.master:multiselect(nil, "aa", "anti-aimbot angles", "[\ac685ffffVisuals\aCDCDCDFF] Other", {"Charge Bar", "Visualize Target"}):add_condition(function()
    return em.ui.tab:get():find("Visuals")
end)
em.ui.misc.clantag = em.ui.master:checkbox(nil, "aa", "anti-aimbot angles", "[\ac685ffffMisc\aCDCDCDFF] Clantag", false):add_condition(function()
    return em.ui.tab:get():find("Misc")
end)

em.ui.misc.kill_say = em.ui.master:checkbox(nil, "aa", "anti-aimbot angles", "[\ac685ffffMisc\aCDCDCDFF] Kill say", false):add_condition(function()
    return em.ui.tab:get():find("Misc")
end)

em.ui.rage.resolver = em.ui.master:hotkey(nil, "aa", "anti-aimbot angles", "[\ac685ffffRage\aCDCDCDFF] Reversed Resolver v1"):add_condition(function()
    return em.ui.tab:get():find("Rage")
end)

em.ui.rage.roll_resolver = em.ui.master:hotkey(nil, "aa", "anti-aimbot angles", "[\ac685ffffRage\aCDCDCDFF] Reversed Roll Resolver v1"):add_condition(function()
    return em.ui.tab:get():find("Rage")
end)


function em.ui:get_config_elements()
    local config = {}

    for _, element in pairs(em.ui.elements) do
        if element.uid ~= nil then
            table.insert(config, element)
        end
    end

    return config
end

function em.ui:generate_settings()
    local config_elements = em.ui:get_config_elements()
    local settings = {}

    for i, element in pairs(config_elements) do
        settings[element.uid] = element:get()
    end

    return json.stringify(settings)
end

function em.ui:load_settings(settings)
    local config_elements = em.ui:get_config_elements()

    local parsed = json.parse(settings)

    for i, element in pairs(config_elements) do
        for uid, value in pairs(parsed) do
            if uid == element.uid then
                ui.set(element.item, value)
            end
        end
    end
end

function em.ui:load_default()
    local protected = function()
        local settings = em.ui.default_settings
        local decoded = base64.decode(settings)
        em.ui:load_settings(decoded)
    end

    if not pcall(protected) then
        print("Failed to load default settings")
        return
    end

    print("Loaded default settings")
end

function em.ui:import()
    local protected = function()
        local settings = clipboard.get()
        local decoded = base64.decode(settings)
        em.ui:load_settings(decoded)
    end

    if not pcall(protected) then
        print("Failed to import settings")
        return
    end

    print("Imported settings")
end

function em.ui:export()
    local protected = function()
        local settings = em.ui:generate_settings()
        local encoded = base64.encode(settings)
        clipboard.set(encoded)
    end

    if not pcall(protected) then
        print("Failed to export settings")
        return
    end

    print("Exported settings")
end

-- Use Fix On key
function em.aa:handle_use(cmd)
    if not em.ui.aa.on_key_key:get() then return end

    local in_use = cmd.in_use == 1

    em.aa.use = false
    
    local me = entity.get_local_player()
    
    if not me or not entity.is_alive(me) then return end

    local weapon_ent = entity.get_player_weapon(me)

    if weapon_ent == nil then return end

    local weapon = csgo_weapons(weapon_ent)

    if weapon == nil then return end


    local local_pos     = vector(entity.get_origin(me))
    local in_bombzone   = entity.get_prop(me, "m_bInBombZone") > 0
    local holding_bomb  = weapon.type == "c4"

    local bomb_table    = entity.get_all("CPlantedC4")
    local bomb_planted  = #bomb_table > 0
    local bomb_distance = 100

    if bomb_planted then
        local bomb_entity = bomb_table[#bomb_table]
        local bomb_pos = vector(entity.get_origin(bomb_entity))
        bomb_distance = local_pos:dist(bomb_pos)
    end

    local defusing = bomb_distance < 62 and entity.get_prop(me, "m_iTeamNum") == 3

    if in_bombzone and holding_bomb or defusing then return end


	local from = vector(client.eye_position())
	local to = from + vector():init_from_angles(client.camera_angles()) * 1024

	local ray = trace.line(from, to, { skip = me, mask = "MASK_SHOT" })

    if not ray or ray.fraction > 1 or not ray.entindex then return end


    local ray_ent = pcall(function() entity.get_classname(ray.entindex) end) and entity.get_classname(ray.entindex) or nil

    if not ray_ent or ray_ent == nil then return end

    if ray_ent ~= "CWorld" and ray_ent ~= "CFuncBrush" and ray_ent ~= "CCSPlayer" then return end

    if in_use then
        if em.ui.aa.states["On key"].master:get() then
            cmd.in_use = 0
        end
        em.aa.use = true
    end
end

-- Set antiaim
function em.aa:set(cmd)
    if not em.ui.master:get() then return end

    local state = em.aa.state
    local break_nl = em.ui.aa.break_nl:get()

    inverted = (math.floor(math.min(60, (entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11) * 120 - 60)))) > 0

    ui.set(refs.aa.pitch, em.ui.aa.states[state].pitch:get())
    ui.set(refs.aa.yaw_base, em.ui.aa.states[state].yaw_base:get())
    ui.set(refs.aa.yaw, em.ui.aa.states[state].yaw:get())
    ui.set(refs.aa.yaw_jitter, break_nl and "Off" or em.ui.aa.states[state].yaw_jitter:get())
    ui.set(refs.aa.yaw_jitter_offset, em.ui.aa.states[state].yaw_jitter_offset:get())
    ui.set(refs.aa.body_yaw, break_nl and "Static" or em.ui.aa.states[state].body_yaw:get())
    ui.set(refs.aa.body_yaw_offset, em.ui.aa.states[state].body_yaw_offset:get())
    ui.set(refs.aa.freestanding_body_yaw, em.ui.aa.states[state].freestanding_body_yaw:get())

    if cmd.chokedcommands == 0 then
        ui.set(refs.aa.yaw_offset, break_nl and 0 or (inverted and em.ui.aa.states[state].yaw_offset_left:get() or em.ui.aa.states[state].yaw_offset_right:get()))
    end

    local freestanding = em.ui.aa.freestand_key:get()

    ui.set(refs.aa.freestanding_key, freestanding and "Always on" or "On hotkey")
    ui.set(refs.aa.freestanding, freestanding and true or false)
end


-- Render Indicators
em.visuals.indicators.fatality.refs["FS"] = em.ui.aa.freestand_key.item
em.visuals.indicators.fatality.refs["Break NL"] = em.ui.aa.break_nl.item
em.visuals.indicators.fatality.refs["ROLL RESOLVER"] = em.ui.rage.roll_resolver.item
em.visuals.indicators.fatality.refs["RESOLVER"] = em.ui.rage.resolver.item

em.visuals.indicators.prediction.binds["FS"] = { pos = vector(select(1, client.screen_size())/2, select(2, client.screen_size())/2), ref = em.ui.aa.freestand_key.item }

function em.visuals.indicators:render()
    if not em.ui.master:get() then return end

    local me = entity.get_local_player()

    if not me or not entity.is_alive(me) then return end

    local scoped = entity.get_prop(me, "m_bIsScoped") == 1
    local screen = vector(client.screen_size())
    local r, g, b, a = em.ui.visuals.indicators_color:get()
    local alpha = em.util:pulsate(4)
    local charge = anti_aim.get_tickbase_shifting() ~= 0
    local exploiting = (ui.get(refs.rage.double_tap) and ui.get(refs.rage.double_tap_key)) or (ui.get(refs.misc.hide_shots) and ui.get(refs.misc.hide_shots_key))
    local inverted = (math.floor(math.min(60, (entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11) * 120 - 60)))) > 0
    local delta = math.floor(anti_aim.get_desync(1))

    self.charge = ease.linear(globals.frametime() * 22, self.charge, (charge and 1 or 0) - self.charge, 1)
    self.chimera.left = em.util:fade_col(self.chimera.left, inverted and {r = r, g = g, b = b, a = a} or {r = 255, g = 255, b = 255, a = 255}, globals.frametime() * 12)
    self.chimera.right = em.util:fade_col(self.chimera.right, inverted and {r = 255, g = 255, b = 255, a = 255} or {r = r, g = g, b = b, a = a}, globals.frametime() * 12)
    self.charge_col = em.util:fade_col(self.charge_col, charge and {r = 50, g = 255, b = 50, a = 255} or {r = 255, g = 50, b = 50, a = em.util:pulsate(8)}, globals.frametime() * 12)
    self.fatality.exploit.col = em.util:fade_col(self.fatality.exploit.col, charge and {r = 0, g = 197, b = 255, a = 255} or {r = 255, g = 50, b = 50, a = 255}, globals.frametime() * 12)
    
    local col = {
        on = { r = 50, g = 255, b = 50, a = 255 },
        off = { r = 255, g = 255, b = 255, a = 100 },
        main = { r = r, g = g, b = b, a = alpha },
    }

    local hex = {
        on = "\a" .. em.util:to_hex(r, g, b, a),
        off = "\a" .. em.util:to_hex(col.off.r, col.off.g, col.off.b, col.off.a),
        main = "\a" .. em.util:to_hex(col.main.r, col.main.g, col.main.b, col.main.a),
        charge = "\a" .. em.util:to_hex(self.charge_col.r, self.charge_col.g, self.charge_col.b, self.charge_col.a),
        left = "\a" .. em.util:to_hex(self.chimera.left.r, self.chimera.left.g, self.chimera.left.b, self.chimera.left.a),
        right = "\a" .. em.util:to_hex(self.chimera.right.r, self.chimera.right.g, self.chimera.right.b, self.chimera.right.a),
        fatality_charge = "\a" .. em.util:to_hex(self.fatality.exploit.col.r, self.fatality.exploit.col.g, self.fatality.exploit.col.b, self.fatality.exploit.col.a),
    }

    if em.ui.visuals.indicator_type:get() == "Reversed" then
        local baim, sp, fs = ui.get(refs.rage.baim) and hex.on .. "BAIM  " or hex.off .. "BAIM  ", ui.get(refs.rage.sp) and hex.on .."SAFE" or hex.off .."SAFE", em.ui.aa.freestand_key:get() and hex.on .."  FS" or hex.off .."  FS"
        local title, binds, exploit = "Reversed " .. hex.main .. "YAW", baim .. sp .. fs, ((ui.get(refs.rage.double_tap_key) and ui.get(refs.misc.hide_shots_key)) and hex.charge .."DT" or (ui.get(refs.rage.double_tap_key) and hex.charge .."DT") or (ui.get(refs.misc.hide_shots_key) and "OS") or hex.charge .."DT")
        local title_size = vector(renderer.measure_text("-c", title))
        local state_size = vector(renderer.measure_text("-c", em.aa.state:upper()))
        local exploit_size = vector(renderer.measure_text("-c", exploit))
        local binds_size = vector(renderer.measure_text("-c", binds))

        self.em.title_pos = ease.linear(globals.frametime()*15, self.em.title_pos, vector(screen.x/2 + (scoped and title_size.x/2 + 5 or 0), screen.y/2 + 20) - self.em.title_pos, 1)
        self.em.state_pos = ease.linear(globals.frametime()*15, self.em.state_pos, vector(screen.x/2 + (scoped and state_size.x/2 + 5 or 0), screen.y/2 + 30) - self.em.state_pos, 1)
        self.em.exploit_pos = ease.linear(globals.frametime()*15, self.em.exploit_pos, vector(screen.x/2 + (scoped and exploit_size.x/2 + 5 or 0), screen.y/2 + 40) - self.em.exploit_pos, 1)
        self.em.binds_pos = ease.linear(globals.frametime()*15, self.em.binds_pos, vector(screen.x/2 + (scoped and binds_size.x/2 + 5 or 0), screen.y/2 + (exploiting and 50 or 40)) - self.em.binds_pos, 1)

        renderer.text(self.em.title_pos.x, self.em.title_pos.y, 255, 255, 255, 255, "-c", 0, title)
        renderer.text(self.em.state_pos.x, self.em.state_pos.y, 255, 255, 255, 255, "-c", 0, em.aa.state:upper())
        if exploiting then
            renderer.text(self.em.exploit_pos.x, self.em.exploit_pos.y, 50, 255, 50, 255, "-c", 0, exploit)
        end
        renderer.text(self.em.binds_pos.x, self.em.binds_pos.y, 255, 255, 255, 255, "-c", 0, binds)
    end
    
    if em.ui.visuals.indicator_type:get() == "Ideal Yaw" then
        local title, mode, exploit = "Reversed Source", em.ui.aa.freestand_key:get() and "FREESTAND" or "DYNAMIC", ((ui.get(refs.rage.double_tap_key) and ui.get(refs.misc.hide_shots_key)) and hex.charge .."DT" or (ui.get(refs.rage.double_tap_key) and hex.charge .."DT") or (ui.get(refs.misc.hide_shots_key) and "OS") or hex.off .."DT")
        local title_size = vector(renderer.measure_text("", title))
        local mode_size = vector(renderer.measure_text("", mode))
        local exploit_size = vector(renderer.measure_text("", exploit))

        self.ideal_yaw.title_pos = ease.linear(globals.frametime()*12, self.ideal_yaw.title_pos, vector(screen.x/2 + 5, screen.y/2 + 20) - self.ideal_yaw.title_pos, 1)
        self.ideal_yaw.mode_pos = ease.linear(globals.frametime()*12, self.ideal_yaw.mode_pos, vector(screen.x/2 + 5, screen.y/2 + 30) - self.ideal_yaw.mode_pos, 1)
        self.ideal_yaw.exploit_pos = ease.linear(globals.frametime()*12, self.ideal_yaw.exploit_pos, vector(screen.x/2 + 5, screen.y/2 + 40) - self.ideal_yaw.exploit_pos, 1)

        renderer.text(self.ideal_yaw.title_pos.x, self.ideal_yaw.title_pos.y, 218, 118, 0, 255, "", 0, title)
        renderer.text(self.ideal_yaw.mode_pos.x, self.ideal_yaw.mode_pos.y, 209, 139, 230, 255, "", 0, mode)
        renderer.text(self.ideal_yaw.exploit_pos.x, self.ideal_yaw.exploit_pos.y, 50, 255, 50, 255, "", 0, exploit)
    end

    if em.ui.visuals.indicator_type:get() == "Old Chimera" then
        local title, desync, exploit = hex.left .. "Reversed " .. hex.right .. "YAW", tostring(delta) .. "°", ((ui.get(refs.rage.double_tap_key) and ui.get(refs.misc.hide_shots_key)) and hex.charge .."DT" or (ui.get(refs.rage.double_tap_key) and hex.charge .."DT") or (ui.get(refs.misc.hide_shots_key) and "OS") or hex.charge .."DT")
        local title_size = vector(renderer.measure_text("c", title))
        local desync_size = vector(renderer.measure_text("c", desync))
        local exploit_size = vector(renderer.measure_text("c", exploit))
        
        self.chimera.desync_pos = ease.linear(globals.frametime()*12, self.chimera.desync_pos, vector(screen.x/2, screen.y/2 + 20) - self.chimera.desync_pos, 1)
        self.chimera.title_pos = ease.linear(globals.frametime()*12, self.chimera.title_pos, vector(screen.x/2, screen.y/2 + 40) - self.chimera.title_pos, 1)
        self.chimera.exploit_pos = ease.linear(globals.frametime()*12, self.chimera.exploit_pos, vector(screen.x/2, screen.y/2 + 50) - self.chimera.exploit_pos, 1)

        renderer.text(self.chimera.desync_pos.x, self.chimera.desync_pos.y, 255, 255, 255, 255, "c", 0, desync)
        renderer.gradient(self.chimera.desync_pos.x, self.chimera.desync_pos.y + 10, delta, 1, r, g, b, 255, r, g, b, 0, true)
        renderer.gradient(self.chimera.desync_pos.x - delta, self.chimera.desync_pos.y + 10, delta, 1, r, g, b, 0, r, g, b, 255, true)
        renderer.text(self.chimera.title_pos.x, self.chimera.title_pos.y, 255, 255, 255, 255, "c", 0, title)
        
        if ui.get(refs.rage.double_tap_key) and ui.get(refs.rage.double_tap) then
            renderer.text(self.chimera.exploit_pos.x, self.chimera.exploit_pos.y, 50, 255, 50, 255, "c", 0, exploit)
            renderer.circle_outline(self.chimera.exploit_pos.x - exploit_size.x, self.chimera.exploit_pos.y, self.charge_col.r, self.charge_col.g, self.charge_col.b, 255, 4, 0, self.charge, 1.5)
        end

    end
	
    if em.ui.visuals.indicator_type:get() == "Prediction" then
        local title = hex.left .. "Sak" .. hex.right .. "ura°"
        local title_size = vector(renderer.measure_text("cb", title))

        self.prediction.desync_pos = ease.linear(globals.frametime()*12, self.prediction.desync_pos, vector(screen.x/2 + (scoped and 6 or 0), screen.y/2 + 20) - self.prediction.desync_pos, 1)
        self.prediction.title_pos = ease.linear(globals.frametime()*12, self.prediction.title_pos, vector(screen.x/2 + (scoped and title_size.x/2 + 5 or 0), screen.y/2 + 30) - self.prediction.title_pos, 1)

        renderer.rectangle(self.prediction.desync_pos.x - (scoped and 0 or ((math.abs(delta)/60) * 25)), self.prediction.desync_pos.y, (math.abs(delta)/60) * 50, 2, r, g, b, a)

        renderer.text(self.prediction.title_pos.x, self.prediction.title_pos.y, 255, 255, 255, 255, "cb", 0, title)

        local count = 0
        for name, bind in pairs(self.prediction.binds) do
            ref = type(bind.ref) == "table" and bind.ref[2] or bind.ref
            bind_size = vector(renderer.measure_text("c-", name))

            bind.pos = ease.linear(globals.frametime()*22, bind.pos, vector(screen.x/2 + (scoped and bind_size.x/2 + 5 or 0), screen.y/2 + 40 + (10 * count)) - bind.pos, 1)

            if not ui.get(ref) then goto skip end


            if name == "DT" then
                bind.pos.x = ease.linear(globals.frametime()*22, bind.pos.x, (screen.x/2 + (scoped and bind_size.x/2 + 7.8 or 0) - 2.8) - bind.pos.x, 1)
                renderer.circle_outline(bind.pos.x + 12, bind.pos.y, 255, 255, 255, 255, 2.8, 0, self.charge, 1.3)
            end

            renderer.text(bind.pos.x, bind.pos.y, r, g, b, 255, "c-", 0, name)
            count = count + 1
            ::skip::
        end
    end

    -- fatality
    if #em.ui.visuals.fatality:get() > 0 then
        for i = 0, 20 do
            renderer.indicator(255, 255, 255, 0, " ")
        end
    end
    local count = 0
    local last_gap = 0
    for name, ref in pairs(em.visuals.indicators.fatality.refs) do
        ref = type(ref) == "table" and ref[2] or ref

        if not ui.get(ref) or not contains(em.ui.visuals.fatality:get(), name) then
            goto skip
        end

        local size = vector(renderer.measure_text("+d", name))

        last_gap = size.y + 5

        if name == "DT" then

            last_gap = size.y + 5 + 3

            self.fatality.exploit.charge = ease.linear(globals.frametime()*12, self.fatality.exploit.charge, (charge and size.x or 0) - self.fatality.exploit.charge, 1)
            self.fatality.exploit.opacity = ease.linear(globals.frametime()*12, self.fatality.exploit.opacity, (charge and 255 or 0) - self.fatality.exploit.opacity, 1)

            renderer.rectangle(10, screen.y*0.679 - (last_gap * count) + size.y, size.x, 3, 0, 0, 0, 100)
            renderer.rectangle(10, screen.y*0.679 - (last_gap * count) + size.y, self.fatality.exploit.charge, 3, 0, 197, 255, self.fatality.exploit.opacity)
            name = hex.fatality_charge .. name
        end

        renderer.text(10, screen.y*0.679 - (last_gap * count), 0, 197, 255, 255, "+d", 0, name)

        count = count + 1
        ::skip::
    end

    -- intellect
    if contains(em.ui.visuals.other:get(), "Charge Bar") and ui.get(refs.rage.double_tap_key) then
        renderer.rectangle(screen.x/2 - 75, screen.y - 20, 150, 10, 0, 0, 0, 255)
        renderer.gradient(screen.x/2 - 74, screen.y - 19, math.min(148, ((self.charge < 1 and self.charge >= 0.99) and 1 or self.charge) * 148), 8, 50, 85, 223, 255, 56, 196, 227, 255, true)
        renderer.text(screen.x/2, screen.y - 27, 255, 255, 255, 255, "c", 0, "CHARGE")
    end
end

function em.visuals.other:render()
    if not em.ui.visuals.other:get() then
        return
    end

    if entity.get_local_player() == nil then
        return
    end

    if not entity.is_alive(entity.get_local_player()) then
        return
    end

    if contains(em.ui.visuals.other:get(), "Visualize Target") then
        local target = client.current_threat()
        local local_pos = vector(renderer.world_to_screen(entity.get_origin(entity.get_local_player())))
        if target ~= nil and entity.is_alive(target) and not entity.is_dormant(target) then
            local pos = vector(renderer.world_to_screen(entity.get_origin(target)))
            renderer.line(local_pos.x, local_pos.y, pos.x, pos.y, 255, 255, 255, 255)
        end
    end
end

-- Keybinds

em.visuals.panels.keybinds.refs["Freestanding"] = em.ui.aa.freestand_key.item
em.visuals.panels.keybinds.refs["Break NL"] = em.ui.aa.break_nl.item
em.visuals.panels.keybinds.refs["Roll Resolver"] = em.ui.rage.roll_resolver.item

for bind, ref in pairs(em.visuals.panels.keybinds.refs) do
    em.visuals.panels.keybinds.list[bind] = {
        ["pos"] = vector(em.visuals.panels.keybinds.pos),
        ["opacity"] = 0,
        ["ref"] = type(ref) == "table" and ref[2] or ref
    }
end

function em.visuals.panels.keybinds:get_width()
    local size = vector(0, 25)
    for name, bind in pairs(self.list) do
        local mode = self:get_mode(bind.ref)
        local text_size = vector(renderer.measure_text("b", name))
        local mode_size = vector(renderer.measure_text("b", mode))
        if not ui.get(bind.ref) and not ui.is_menu_open() then goto skip end
        size.x = math.max(size.x, text_size.x + mode_size.x + 50)
        size.y = size.y + 15
        ::skip::
    end

    return size.x == 0 and vector(renderer.measure_text("b", "Binds"), size.y) or size
end

function em.visuals.panels.keybinds:get_mode(ref)
    local key = { ui.get(ref) }
    local mode = key[2]
    
    if mode == nil then
        return "nil"
    end
    
    return self.modes[mode + 1]
end

function em.visuals.panels.keybinds:active()
    for name, bind in pairs(self.list) do
        if ui.get(bind.ref) or ui.is_menu_open() then
            return true
        end
    end

    return false
end

function em.visuals.panels.keybinds:render()
    if not contains(em.ui.visuals.panels:get(), "Keybinds") then
        return
    end

    local screen = vector(client.screen_size())
    local col = color(em.ui.visuals.panel_color:get())
    local bg = color(em.ui.visuals.panel_bg_color:get())
    local mouse = vector(ui.mouse_position())
    local mouse_down = client.key_state(0x01)
    local menu_open = ui.is_menu_open()
    local max_size = self:get_width()
    local padding = 10
    
    self.hovering = mouse.x >= self.pos.x and mouse.x <= self.pos.x + self.size.x and mouse.y >= self.pos.y and mouse.y <= self.pos.y + self.size.y

    self.size = ease.linear(globals.frametime()*30, self.size, vector(max_size.x + padding*2, max_size.y) - self.size, 1)

    --drag
    if self.hovering then
        self.dragging = mouse_down
    end

    if self.dragging then
        if not self.in_drag then
            self.drag_pos = vector(self.pos.x - mouse.x, self.pos.y - mouse.y)
            self.in_drag = true
        end
        self.pos = vector(math.max(0, math.min(screen.x - self.size.x, mouse.x + self.drag_pos.x)), math.max(0, math.min(screen.y - self.size.y, mouse.y + self.drag_pos.y)))
    else
        self.in_drag = false
    end

    self.opacity = ease.linear(globals.frametime()*30, self.opacity, ((self:active() or menu_open) and 255 or 0) - self.opacity, 1)
    
    local img = images.load(base64.decode(self.icon))

    if self.opacity >= 30 then
        renderer.blur(self.pos.x, self.pos.y, self.size.x, max_size.y)
    end

    if self:active() then
        renderer_glow(self.pos.x, self.pos.y, self.size.x, 20, col.r, col.g, col.b, math.min(8, self.opacity), 4, 1, 3)
    end
    renderer.rectangle(self.pos.x, self.pos.y-3, self.size.x, 23, bg.r, bg.g, bg.b, math.min(bg.a, self.opacity))
    renderer.rectangle(self.pos.x, self.pos.y-1.33, self.size.x, 2, bg.r, bg.g, bg.b, math.min(bg.a+255, self.opacity))
    img:draw(self.pos.x + padding/2, self.pos.y + 2.5, 15, 15, col.r, col.g, col.b, self.opacity)
    renderer.text(self.pos.x + padding + 15, self.pos.y - select(2, renderer.measure_text("b", "Binds"))/2 + 20/2, 255, 255, 255, self.opacity, "b", 0, "Binds")

    local count = 0
    for name, bind in pairs(self.list) do
        local ref = bind.ref
        local state = menu_open and true or ui.get(ref)
        local mode = self:get_mode(ref)

        if not menu_open then
            bind.pos = ease.linear(globals.frametime()*22, bind.pos, vector(self.pos.x, self.pos.y + 25 + (count*15)) - bind.pos, 1)
        else
            bind.pos = vector(self.pos.x, self.pos.y + 25 + (count*15))
        end

        bind.opacity = ease.linear(globals.frametime()*30, bind.opacity, (state and 255 or 0) - bind.opacity, 1)
        
        if bind.opacity <= 5 then
            goto skip
        end

        renderer.text(bind.pos.x + padding/2, bind.pos.y, 255, 255, 255, bind.opacity, "b", 0, name)
        renderer.text(bind.pos.x + self.size.x - renderer.measure_text("b", mode) - padding/2, bind.pos.y, 255, 255, 255, bind.opacity, "b", 0, mode)
        count = count + 1

        ::skip::
    end
end

-- Spectators
function em.visuals.panels.spectators:active()
    for i, opts in pairs(self.list) do
        if opts.spec or ui.is_menu_open() then
            if entity.get_prop(i, "m_hObserverTarget") == entity.get_local_player() or ui.is_menu_open() then
                return true
            end
        end
    end

    return false
end

function em.visuals.panels.spectators:get_width()
    local size = vector(0, 20)
    for i, opts in pairs(self.list) do
        if not opts.spec then goto skip end
        if entity.get_prop(i, "m_hObserverTarget") ~= entity.get_local_player() then goto skip end
        local text_size = vector(renderer.measure_text("b", entity.get_player_name(i)))
        size.x = math.max(size.x, text_size.x + 25)
        size.y = size.y + 20
        ::skip::
    end

    return size.x == 0 and vector(renderer.measure_text("b", "Spectators") + 100, size.y) or vector(math.max(renderer.measure_text("b", "Spectators") + 100, size.x), size.y)
end

function em.visuals.panels.spectators:render()
    if not contains(em.ui.visuals.panels:get(), "Spectators") then
        return  
    end

    local screen = vector(client.screen_size())
    local col = color(em.ui.visuals.panel_color:get())
    local bg = color(em.ui.visuals.panel_bg_color:get())
    local mouse = vector(ui.mouse_position())
    local mouse_down = client.key_state(0x01)
    local menu_open = ui.is_menu_open()
    local max_size = self:get_width()
    local padding = 10

    self.hovering = mouse.x >= self.pos.x and mouse.x <= self.pos.x + self.size.x and mouse.y >= self.pos.y and mouse.y <= self.pos.y + self.size.y

    self.size = ease.linear(globals.frametime()*30, self.size, vector(max_size.x, max_size.y) - self.size, 1)

    --drag
    if self.hovering then
        self.dragging = mouse_down
    end

    if self.dragging then
        if not self.in_drag then
            self.drag_pos = vector(self.pos.x - mouse.x, self.pos.y - mouse.y)
            self.in_drag = true
        end
        self.pos = vector(math.max(0, math.min(screen.x - self.size.x, mouse.x + self.drag_pos.x)), math.max(0, math.min(screen.y - self.size.y, mouse.y + self.drag_pos.y)))
    else
        self.in_drag = false
    end

    self.opacity = ease.linear(globals.frametime()*30, self.opacity, ((self:active()) and 255 or 0) - self.opacity, 1)

    local img = images.load(base64.decode(self.icon))

    if self.opacity >= 30 then
        renderer.blur(self.pos.x, self.pos.y, self.size.x, max_size.y)
    end

    if self:active() then
        renderer_glow(self.pos.x, self.pos.y, self.size.x, 20, col.r, col.g, col.b, math.min(7, self.opacity), 255, 255, 255)
    end

    renderer.rectangle(self.pos.x, self.pos.y-3, self.size.x, 2, bg.r, bg.g, bg.b, math.min(bg.a+255, self.opacity))
    renderer.rectangle(self.pos.x, self.pos.y, self.size.x, 20, bg.r, bg.g, bg.b, math.min(bg.a, self.opacity))
    img:draw(self.pos.x + padding/2, self.pos.y + 2.5, 15, 15, col.r, col.g, col.b, self.opacity)
    renderer.text(self.pos.x + padding + 15, self.pos.y - select(2, renderer.measure_text("b", "Spectators"))/2 + 20/2, 255, 255, 255, self.opacity, "b", 0, "Spectators")

    local players = globals.maxplayers()

    for i = 1, players do
        if self.list[i] == nil then
            self.list[i] = {
                spec = entity.get_prop(i, "m_hObserverTarget") ~= nil and not entity.is_alive(i),
                pos = em.visuals.panels.spectators.pos,
                opacity = 0
            }
        else
            self.list[i].spec = entity.get_prop(i, "m_hObserverTarget") ~= nil and not entity.is_alive(i)
        end
    end

    local count = 0
    for player, opts in pairs(self.list) do
        local target = entity.get_prop(player, "m_hObserverTarget")

        local name = entity.get_player_name(player)

        local steam = entity.get_steam64(player)
        local avatar = images.get_steam_avatar(steam)

        opts.pos = menu_open and vector(self.pos.x, self.pos.y + 25 + (count*20)) or ease.linear(globals.frametime()*22, opts.pos, vector(self.pos.x, self.pos.y + 25 + (count*20)) - opts.pos, 1)

        opts.opacity = ease.linear(globals.frametime()*30, opts.opacity, ((opts.spec and target == entity.get_local_player() and self:active()) and 255 or 0) - opts.opacity, 1)

        if opts.opacity <= 5 then
            goto skip
        end

        if avatar == nil then
            renderer.gradient(opts.pos.x + padding/2, opts.pos.y, 15, 15, 15, 12, 15, opts.opacity, 35, 32, 35, opts.opacity, true)
        else
            avatar:draw(opts.pos.x + padding/2, opts.pos.y, 15, 15, 255, 255, 255, opts.opacity)
        end

        renderer.text(opts.pos.x + 15 + padding, opts.pos.y, 255, 255, 255, opts.opacity, "b", 0, name)
        count = count + 1
        ::skip::
    end
end

-- Watermark
function em.visuals.panels.watermark:render()
    if not contains(em.ui.visuals.panels:get(), "Watermark") then
        return
    end

    local col = color(em.ui.visuals.panel_color:get())
    local bg = color(em.ui.visuals.panel_bg_color:get())
	local screen = vector(client.screen_size())
	local latency = math.floor(client.latency()*1000+0.5)
	local hours, minutes, seconds = client.system_time()
    local hex = em.util:to_hex(col.r, col.g, col.b, 255)
    local suffix = hours >= 12 and "PM" or "AM"
    self.username = self.username == "unknown" and entity.get_player_name(entity.get_local_player()) or self.username

	local text = string.format("\a" .. hex .. "Reversed \affffffb3|\affffffff %s \affffffb3| \affffffff%dms \affffffb3| \affffffff%d:%2d %s", self.username, latency, em.util:to12(hours), minutes, suffix)

	local margin, padding = 15, 5

	local text_size = vector(renderer.measure_text("b", text))
    local lerp = function(a, b, t)
        return a + (b - a) * t
    end
    renderer_glow(screen.x-text_size.x-margin-padding, margin-padding, text_size.x+padding*2, text_size.y+padding*2, col.r, col.g, col.b, 7, 4, 1, 2)
    renderer.blur(screen.x-text_size.x-margin-padding, margin-padding, text_size.x+padding*2, text_size.y+padding*2)
    renderer.rectangle(screen.x-text_size.x-margin-padding, margin-padding, text_size.x+padding*2, text_size.y+padding*2, bg.r, bg.g, bg.b, bg.a)
    renderer.rectangle(screen.x-text_size.x-margin-padding, margin-padding, text_size.x+padding*2, text_size.y-padding*2, bg.r, bg.g, bg.b, bg.a+255)
	renderer.text(screen.x-text_size.x-margin, margin, 235, 235, 235, 255, "b", 0, text)
end

function em.visuals.panels:drag_fix(cmd)
    if ui.is_menu_open() then
        cmd.in_attack = 0
    end
end

function em.rage.roll_resolver:handle()
    local players = globals.maxplayers()

    for ent = 1, players do
        if not entity.is_alive(ent) or ent == entity.get_local_player() then
            goto skip
        end

        

        if self.list[ent] == nil then
            self.list[ent] = {
                side = 50
            }
        end

        local pitch = 89 * ((2*entity.get_prop(ent, "m_flPoseParameter",12))-1)
        local yaw = select(2, entity.get_prop(ent, "m_angRotation"))
        local roll = em.ui.rage.roll_resolver:get() and self.list[ent].side or 0

        entity.set_prop(ent, "m_angEyeAngles", pitch, yaw, roll)
        ::skip::
    end
end

function em.rage.roll_resolver:on_missed_shot(ent)
    if not em.ui.rage.roll_resolver:get() then
        return
    end

    if not entity.is_alive(ent) or ent == entity.get_local_player() then
        return
    end

    self.list[ent].side = self.list[ent].side == 50 and -50 or 50
end

function em.misc.kill_say:call(e)
    if not em.ui.misc.kill_say:get() then
        return
    end

    local attacker = client.userid_to_entindex(e.attacker)
    local victim = client.userid_to_entindex(e.userid)
    local lp = entity.get_local_player()

    if attacker ~= lp or victim == lp then
        return
    end

    client.exec(string.format("say %s", em.misc.kill_say.list[math.random(1, #em.misc.kill_say.list)]))
end

function em.misc.clantag:call_runcmd(cmd)
    if em.ui.misc.clantag:get() then

        if cmd.chokedcommands ~= 0 then
            return
        end

        local local_player = entity.get_local_player()

        if local_player == nil then
            return
        end

        if self.index >= #self.tag then
            self.back = true
        elseif self.index <= 1 then
            self.back = false
        end

        if globals.realtime() - self.last >= 0.2 then
            self.last = globals.realtime()
            local tag = self.tag[self.index]
            client.set_clan_tag(tag)
            self.index = self.back and self.index - 1 or self.index + 1
        end
    end
end

function em.misc.clantag:call_paint()
    if em.ui.misc.clantag:get() then

        if globals.tickcount() % 2 ~= 0 then
            return
        end

        local local_player = entity.get_local_player()

        if local_player == nil then
            return
        end

        if self.index >= #self.tag then
            self.back = true
        elseif self.index <= 1 then
            self.back = false
        end

        if not entity.is_alive(local_player) and globals.realtime() - self.last >= 0.2 then
            self.last = globals.realtime()
            local tag = self.tag[self.index]
            client.set_clan_tag(tag)
            self.index = self.back and self.index - 1 or self.index + 1
        end
    end
end


-- Callbacks
em.visuals.panels:init_from_database()

em.ui.aa.import:set_callback(function()
    em.ui:import()
end)

em.ui.aa.load_default:set_callback(function()
    em.ui:load_default()
end)

em.ui.aa.export:set_callback(function()
    em.ui:export()
end)

em.ui.misc.clantag:set_callback(function(val)

    if not ui.get(val) then
        client.delay_call(1, function()
            client.set_clan_tag("")
        end)
    end
end)

client.set_event_callback("player_death", function(e)
    em.misc.kill_say:call(e)
end)

client.set_event_callback("aim_miss", function(e)
    if not em.ui.rage.roll_resolver:get() then
        return
    end

    if e.reason == "?" then
        em.rage.roll_resolver:on_missed_shot(e.target)
    end
end)

client.set_event_callback("paint_ui", function()
    em.util:hide_aa(em.ui.master:get())
end)

gradienttext2 = function(text, speed)
    local base = color(0, 0, 0, 255)
    local highlight = color(255, 255, 255, 255)
    local highlight_frac = ((globals.realtime() % speed)) - 1.2

    local output = ""
    for i = 1, #text do
        local char = text:sub(i, i)
        local char_frac = i / #text
        local highlight_delta = (char_frac - highlight_frac)
        
        local col = base
        
        if highlight_delta >= 0 and highlight_delta <= 1.4 then
            if highlight_delta > 0.7 then
                highlight_delta = 1.4 - highlight_delta
            end
            local r, g, b, a = highlight.r - base.r, highlight.g - base.g, highlight.b - base.b, highlight.a - base.a
            col = color(
                base.r + r * highlight_delta / 0.8, 
                base.g + g * highlight_delta / 0.8, 
                base.b + b * highlight_delta / 0.8, 
                255
            )
        end

        output = output .. ('\a%02x%02x%02x%02x%s'):format(col.r, col.g, col.b, col.a, text:sub(i, i))
    end
    
    return output
end

client.set_event_callback("paint", function()
    em.visuals.indicators:render()
    em.visuals.panels.keybinds:render()
    em.visuals.panels.spectators:render()
    em.visuals.panels.watermark:render()
    em.rage.roll_resolver:handle()
    em.misc.clantag:call_paint()
    em.visuals.other:render()
end)

client.set_event_callback("setup_command", function(cmd)
    em.aa:set(cmd)
    em.aa:handle_use(cmd)
    em.util:handle_state(cmd)
    em.misc.clantag:call_runcmd(cmd)
    em.visuals.panels:drag_fix(cmd)
end)

client.set_event_callback("shutdown", function()
    em.util:hide_aa(false)

    em:save_database()
end)



local uilib = require("gamesense/uilib")
local http = require("gamesense/http")
local ffi = require("ffi")
local bit = require("bit")
local color = require("gamesense/color")
local filesystem_interface = ffi.cast(ffi.typeof("void***"), client.create_interface("filesystem_stdio.dll", "VFileSystem017"))
local filesystem_remove_file = ffi.cast("void (__thiscall*)(void*, const char*, const char*)", filesystem_interface[0][20])
local filesystem_create_directories = ffi.cast("void (__thiscall*)(void*, const char*, const char*)", filesystem_interface[0][22])
local filesystem_find = ffi.cast("const char* (__thiscall*)(void*, const char*, int*)", filesystem_interface[0][32])

local function remove_file(file, path_id)
    filesystem_remove_file(filesystem_interface, file, path_id)
end

local function create_directories(file, path_id)
    filesystem_create_directories(filesystem_interface, file, path_id)
end

local exists = function(file)
    local int_ptr = ffi.new("int[1]")
    local res = filesystem_find(filesystem_interface, file, int_ptr)
    if res == ffi.NULL then
        return nil
    end

    return int_ptr, ffi.string(res)
end

if not exists("materials\\panorama\\images\\icons\\revealer") then
    create_directories("materials\\panorama\\images\\icons\\revealer", "revealer")
    create_directories("materials\\panorama\\images\\icons\\revealer\\multicolored", "multicolored")
    create_directories("materials\\panorama\\images\\icons\\revealer\\unicolored", "unicolored")
    create_directories("materials\\panorama\\images\\icons\\revealer\\nadoryha", "nadoryha")
end

local missing_icons = {}
local downloaded_icons = {}

local function download_icon(path, cheat)
    local file_path = ("csgo/materials/panorama/images/icons/revealer/%s/%s.png"):format(path, cheat)

    http.get(("https://ghproxy.com/https://raw.githubusercontent.com/dave3x8/revealer-icons/main/%s/%s.png"):format(path, cheat), function(status, response)
        if not status then
            return error("Revealer: Couldn't retrieve " .. path .. " " .. cheat:upper() .. " icon due to " .. response.status_message:lower())
        end

        writefile(file_path, response.body)

        downloaded_icons[#downloaded_icons + 1] = path .. " " .. cheat:upper()
    end)
end

for path, cheats in pairs({
    multicolored = {
        "nl1",
        "nl2",
        "gs",
        "ft",
        "nw",
        "ev",
        "ot",
        "pd",
        "pl",
        "r7",
        "af",
        "wh"
    },
    unicolored = {
        "nl1",
        "nl2",
        "gs",
        "ft",
        "nw",
        "ev",
        "ot",
        "pd",
        "pl",
        "r7",
        "af",
        "wh"
    },
    nadoryha = {
        "nl",
        "gs",
        "ft",
        "nw",
        "ev",
        "ot",
        "pd",
        "pl",
        "r7",
        "af",
        "wh"
    }
}) do
    for _, cheat in ipairs(cheats) do
        local old_file = readfile("csgo/materials/panorama/images/icons/achievements/" .. path .. "_" .. cheat .. ".png")
        if not old_file and not readfile("csgo/materials/panorama/images/icons/revealer/" .. path .. "/" .. cheat .. ".png") then
            missing_icons[#missing_icons + 1] = path .. " " .. cheat:upper()
            download_icon(path, cheat)
        elseif old_file then
            writefile("csgo/materials/panorama/images/icons/revealer/" .. path .. "/" .. cheat .. ".png", old_file)
            remove_file(("materials\\panorama\\images\\icons\\achievements\\%s_%s.png"):format(path, cheat), "")
        end
    end
end

if #missing_icons > 0 then
    print("Revealer: Missing icons: " .. table.concat(missing_icons, ", "))
end

local voice_data_t = ffi.typeof([[
	struct {
		char		 pad_0000[8];
		int32_t	client;
		int32_t	audible_mask;
		uint32_t xuid_low;
		uint32_t xuid_high;
		void*		voice_data;
		bool		 proximity;
		bool		 caster;
		char		 pad_001E[2];
		int32_t	format;
		int32_t	sequence_bytes;
		uint32_t section_number;
		uint32_t uncompressed_sample_offset;
		char		 pad_0030[4];
		uint32_t has_bits;
	} *
]])

local js = panorama.loadstring([[
// @ the guy trying to see what panorama i got (again?), chill bruh
let entity_panels = {}
let entity_data = {}
let event_callbacks = {}
	let SLOT_LAYOUT = `
		<root>
			<Panel style="min-width: 3px; padding-top: 2px; padding-left: 0px;" scaling='stretch-to-fit-y-preserve-aspect'>
				<Image id="smaller" textureheight="15" style="horizontal-align: center; opacity: 0.01; transition: opacity 0.1s ease-in-out 0.0s, img-shadow 0.12s ease-in-out 0.0s; overflow: noclip; padding: 3px 5px; margin: -3px -5px;"	/>
				<Image id="small" textureheight="17" style="horizontal-align: center; opacity: 0.01; transition: opacity 0.1s ease-in-out 0.0s, img-shadow 0.12s ease-in-out 0.0s; overflow: noclip; padding: 3px 5px; margin: -3px -5px;" />
				<Image id="image" textureheight="21" style="opacity: 0.01; transition: opacity 0.1s ease-in-out 0.0s, img-shadow 0.12s ease-in-out 0.0s; padding: 3px 5px; margin: -3px -5px; margin-top: -5px;" />
			</Panel>
		</root>
	`
	let _DestroyEntityPanel = function (key) {
		let panel = entity_panels[key]
		if(panel != null && panel.IsValid()) {
			var parent = panel.GetParent()
			let musor = parent.GetChild(0)
			musor.visible = true
			if(parent.FindChildTraverse("id-sb-skillgroup-image") != null) {
				parent.FindChildTraverse("id-sb-skillgroup-image").style.margin = "0px 0px 0px 0px"
			}
			panel.DeleteAsync(0.0)
		}
		delete entity_panels[key]
	}
	let _DestroyEntityPanels = function() {
		for(key in entity_panels){
			_DestroyEntityPanel(key)
		}
	}
	let _GetOrCreateCustomPanel = function(xuid) {
		if(entity_panels[xuid] == null || !entity_panels[xuid].IsValid()){
			entity_panels[xuid] = null
			let scoreboard_context_panel = $.GetContextPanel().FindChildTraverse("ScoreboardContainer").FindChildTraverse("Scoreboard") || $.GetContextPanel().FindChildTraverse("id-eom-scoreboard-container").FindChildTraverse("Scoreboard")
			if(scoreboard_context_panel == null){
				_Clear()
				_DestroyEntityPanels()
				return
			}
			scoreboard_context_panel.FindChildrenWithClassTraverse("sb-row").forEach(function(el){
				let scoreboard_el
				if(el.m_xuid == xuid) {
					el.Children().forEach(function(child_frame){
						let stat = child_frame.GetAttributeString("data-stat", "")
						if(stat == "rank")
							scoreboard_el = child_frame.GetChild(0)
					})
					if(scoreboard_el) {
						let scoreboard_el_parent = scoreboard_el.GetParent()
						let custom_icons = $.CreatePanel("Panel", scoreboard_el_parent, "revealer-icon", {
						})
						if(scoreboard_el_parent.FindChildTraverse("id-sb-skillgroup-image") != null) {
							scoreboard_el_parent.FindChildTraverse("id-sb-skillgroup-image").style.margin = "0px 0px 0px 0px"
						}
						scoreboard_el_parent.MoveChildAfter(custom_icons, scoreboard_el_parent.GetChild(1))
						let prev_panel = scoreboard_el_parent.GetChild(0)
						prev_panel.visible = false
						let panel_slot_parent = $.CreatePanel("Panel", custom_icons, `icon`)
						panel_slot_parent.visible = false
						panel_slot_parent.BLoadLayoutFromString(SLOT_LAYOUT, false, false)
						entity_panels[xuid] = custom_icons
						return custom_icons
					}
				}
			})
		}
		return entity_panels[xuid]
	}
	let _UpdatePlayer = function(entindex, path_to_image) {
		if(entindex == null || entindex == 0)
			return
		entity_data[entindex] = {
			applied: false,
			image_path: path_to_image
		}
	}
	let _ApplyPlayer = function(entindex) {
		let xuid = GameStateAPI.GetPlayerXuidStringFromEntIndex(entindex)
		let panel = _GetOrCreateCustomPanel(xuid)
		if(panel == null)
			return
		let panel_slot_parent = panel.FindChild(`icon`)
		panel_slot_parent.visible = true
		let panel_slot = panel_slot_parent.FindChild("image")
		panel_slot.visible = true
		panel_slot.style.opacity = "1"
		panel_slot.SetImage(entity_data[entindex].image_path)
		return true
	}
	let _ApplyData = function() {
		for(entindex in entity_data) {
			entindex = parseInt(entindex)
			let xuid = GameStateAPI.GetPlayerXuidStringFromEntIndex(entindex)
			if(!entity_data[entindex].applied || entity_panels[xuid] == null || !entity_panels[xuid].IsValid()) {
				if(_ApplyPlayer(entindex)) {
					entity_data[entindex].applied = true
				}
			}
		}
	}
	let _Create = function() {
		event_callbacks["OnOpenScoreboard"] = $.RegisterForUnhandledEvent("OnOpenScoreboard", _ApplyData)
		event_callbacks["Scoreboard_UpdateEverything"] = $.RegisterForUnhandledEvent("Scoreboard_UpdateEverything", function(){
			_ApplyData()
		})
		event_callbacks["Scoreboard_UpdateJob"] = $.RegisterForUnhandledEvent("Scoreboard_UpdateJob", _ApplyData)
	}
	let _Clear = function() { entity_data = {} }
	let _Destroy = function() {
		// clear entity data
		_Clear()
		_DestroyEntityPanels()
		for(event in event_callbacks){
			$.UnregisterForUnhandledEvent(event, event_callbacks[event])
			delete event_callbacks[event]
		}
	}
	return {
		create: _Create,
		destroy: _Destroy,
		clear: _Clear,
		update: _UpdatePlayer,
		destroy_panel: _DestroyEntityPanels
	}
]], "CSGOHud")()

js.create()

local tab = "AA"
local container = "Fake lag"
local images_path = "file://{images}/icons/revealer/multicolored/%s.png"

local main_data_table

local function get_players()
    local players = {}
    local player_resource = entity.get_player_resource()

    for i = 1, globals.maxplayers() do
        repeat
            if entity.get_prop(player_resource, "m_bConnected", i) == 0 then
                if main_data_table.users[i] then
                    main_data_table.users[i] = nil
                end

                break
            else
                local flags = entity.get_prop(i, "m_fFlags")
                if not flags then
                    break
                end

                if bit.band(flags, 512) == 512 then
                    break
                end
            end

            players[#players + 1] = i
        until true
    end

    return players
end

local function find_duplicate_element(array, divisor)
    local visited_elements = {}

    for current_index = 1, #array do
        local current_element = array[current_index]

        if not visited_elements[current_element] then
            visited_elements[current_element] = true

            for next_index = current_index + 4, #array do
                if current_index % divisor == 0 then
                    if array[next_index] == current_element then
                        return true
                    end
                elseif array[next_index] == current_element then
                    return false
                end
            end
        end
    end

    return false
end


main_data_table = {
    main = uilib.new_checkbox(tab, container, "Cheat revealer"),
    display_method = uilib.new_multiselect(tab, container, "\nCheat revealer display options", {
        "Scoreboard icon",
        "Flag"
    }),
    icon_type = uilib.new_multiselect(tab, container, "\nCheat revealer icon set", {
        "Multicolored",
        "Unicolored",
        "Nado & Ryha",
        "Alternative NL icon"
    }),
    plist_handler = uilib.create_plist(),
    yeah = {
        names = {
            gs = {
                long = "gamesense",
                color = color.hex("95B80CFF")
            },
            nl = {
                long = "neverlose",
                color = color.hex("037696FF")
            },
            nw = {
                long = "nixware",
                color = color.hex("FFFFFFFF")
            },
            pd = {
                long = "pandora",
                color = color.hex("D4A9FFFF")
            },
            pr = {
                long = "primordial",
                color = color.hex("E2B6C7FF")
            },
            ot = {
                long = "onetap",
                color = color.hex("f7a414FF")
            },
            ft = {
                long = "fatality",
                color = color.hex("f00657FF")
            },
            pl = {
                long = "plaguecheat",
                color = color.hex("6BFF87FF")
            },
            ev = {
                long = "ev0lve",
                color = color.hex("42B7FFFF")
            },
            r7 = {
                long = "rifk7",
                color = color.hex("FF00FFFF")
            },
            af = {
                long = "airflow",
                color = color.hex("8E76C0FF")
            },
            wh = {
                long = "unknown",
                color = color.hex("9F9F9FFF")
            }
        },
        colored_names = {
            gs = {
                short = "\aEAEAEAFFG\a95B80CFFS",
                long = "\aEAEAEAFFgame\a95B80CFFsense"
            },
            nl = {
                short = "\a037696FFNL",
                long = "\aEAEAEAFFnever\a037696FFlose"
            },
            nw = {
                short = "\aFFFFFFFFNW",
                long = "\aFFFFFFFFnixware"
            },
            pd = {
                short = "\aD4A9FFFFPD",
                long = "\aD4A9FFFFpandora"
            },
            pr = {
                short = "\aE2B6C7FFPR",
                long = "\aE2B6C7FFprimordial"
            },
            ot = {
                short = "\aEAEAEAFFO\af7a414FFT",
                long = "\aEAEAEAFFone\af7a414FFtap"
            },
            ft = {
                short = "\af00657FFFT",
                long = "\aF00657FFfatality"
            },
            pl = {
                short = "\a6BFF87FFPLG",
                long = "\a6BFF87FFplaguecheat"
            },
            ev = {
                short = "\a42B7FFFFEV0",
                long = "\a42B7FFFFev0\aFFFFFFFFlve"
            },
            r7 = {
                short = "\a00F600FFR\aFF00FFFF7",
                long = "\a00F600FFrifk\aFF00FFFF7"
            },
            af = {
                short = "\a8E76C0FFAF",
                long = "\a8E76C0FFairflow"
            },
            wh = {
                short = false,
                long = "\a515364FFunknown"
            }
        },
    },
    users = {}
}

main_data_table.list_label = main_data_table.plist_handler:add(ui.new_label, "Cheat: " .. main_data_table.yeah.colored_names.wh.long)

local scoreboard_icon_enabled = false

main_data_table.display_method:add_callback(function(method)
    if method:contains("Scoreboard icon") then
        js.create()
    else
        js.destroy()
    end

    scoreboard_icon_enabled = method:contains("Scoreboard icon")
end)

local esp_flag_enabled = false

local last_scoreboard_icon_enabled = false
local last_esp_flag_enabled = false

local nl_path = nil

local is_multicolored = false
local is_unicolored = false
local is_nadoryha = false
local is_alternate_nl_icon = false

local icon_changed = false

main_data_table.icon_type:add_callback(function(icon_type)
    icon_changed = true
    if icon_type:contains("Unicolored") and (is_multicolored or is_nadoryha) then
        icon_type:remove("Multicolored")
        icon_type:remove("Nado & Ryha")
    elseif icon_type:contains("Multicolored") and (is_unicolored or is_nadoryha) then
        icon_type:remove("Unicolored")
        icon_type:remove("Nado & Ryha")
    elseif icon_type:contains("Nado & Ryha") and (is_multicolored or is_unicolored) then
        icon_type:remove("Unicolored")
        icon_type:remove("Multicolored")
        icon_type:remove("Alternative NL icon")
    elseif icon_type:contains("Alternative NL icon") and is_nadoryha then
        icon_type:remove("Alternative NL icon")
    else
        icon_type:add(is_multicolored and "Multicolored" or is_unicolored and "Unicolored" or is_nadoryha and "Nado & Ryha" or "Multicolored")
    end

    is_nadoryha = icon_type:contains("Nado & Ryha")
    is_unicolored = icon_type:contains("Unicolored")
    is_multicolored = icon_type:contains("Multicolored")
    nl_path = not is_nadoryha and (icon_type:contains("Alternative NL icon") and "nl2" or "nl1") or "nl"
    images_path = "file://{images}/icons/revealer/" .. (is_multicolored and "multicolored" or is_unicolored and "unicolored" or is_nadoryha and "nadoryha") .. "/%s.png"

    for _, user in pairs(main_data_table.users) do
        user.icon_set = false
    end
end)
main_data_table.icon_type:add("Multicolored")

local detection_storage_table = {
    nl = {
        sig_count = {},
        found = {}
    },
    nw = {},
    pd = {},
    ot = {},
    ft = {},
    pl = {},
    ev = {},
    r7 = {},
    af = {},
    gs = {}
}
local detector_table = {
    nl = function(packet, target)
        if packet.xuid_high == 0 then
            return
        end

        local sig = ("%.02X"):format(ffi.cast("uint16_t*", ffi.cast("uintptr_t", packet) + 22)[0])

        if sig == detection_storage_table.current_signature then
            detection_storage_table.nl.sig_count[target] = (detection_storage_table.nl.sig_count[target] or 0) + 1

            if detection_storage_table.nl.sig_count[target] > 24 then
                detection_storage_table.nl.found[target] = 1

                return true
            else
                detection_storage_table.nl.sig_count[target] = nil
            end
        end

        if #detection_storage_table.nl.found > 3 then
            return false
        end

        if not detection_storage_table.nl[target] then
            detection_storage_table.nl[target] = {}
        end

        detection_storage_table.nl[target][#detection_storage_table.nl[target] + 1] = packet.xuid_high

        if #detection_storage_table.nl[target] > 24 then
            if find_duplicate_element(detection_storage_table.nl[target], 4) and packet.xuid_high ~= 0 then
                detection_storage_table.current_signature = sig
                detection_storage_table.nl[target] = {}

                return true
            end

            table.remove(detection_storage_table.nl[target], 1)
        end

        return false
    end,
    nw = function(packet, target)
        if not detection_storage_table.nw[target] then
            detection_storage_table.nw[target] = 0
        end

        if detection_storage_table.nw[target] > 34 then
            detection_storage_table.nw[target] = nil

            return true
        elseif packet.xuid_high == 0 then
            detection_storage_table.nw[target] = detection_storage_table.nw[target] + 1
        else
            detection_storage_table.nw[target] = 0
        end

        return false
    end,
    pd = function(packet, target)
        if not detection_storage_table.pd[target] then
            detection_storage_table.pd[target] = 0
        end

        local sig = ("%.02X"):format(ffi.cast("uint16_t*", ffi.cast("uintptr_t", packet) + 16)[0])

        if detection_storage_table.pd[target] > 24 then
            return true
        elseif sig == "695B" or sig == "1B39" then
            detection_storage_table.pd[target] = detection_storage_table.pd[target] + 1
        else
            detection_storage_table.pd[target] = 0
        end

        return false
    end,
    ot = function(packet, target)
        if not detection_storage_table.ot[target] then
            detection_storage_table.ot[target] = {}
        end

        detection_storage_table.ot[target][#detection_storage_table.ot[target] + 1] = {
            sequence_bytes = packet.sequence_bytes,
            xuid_low = packet.xuid_low,
            section_number = packet.section_number,
            umcompressed_sample_offset = packet.uncompressed_sample_offset
        }

        if #detection_storage_table.ot[target] > 16 then
            local oldest_packet = detection_storage_table.ot[target][1]

            for i = 2, #detection_storage_table.ot[target] do
                local loop_packet = detection_storage_table.ot[target][i]
                if loop_packet.xuid_low ~= oldest_packet.xuid_low or loop_packet.section_number ~= oldest_packet.section_number or loop_packet.uncompressed_sample_offset ~= oldest_packet.uncompressed_sample_offset then
                    table.remove(detection_storage_table.ot[target], 1)

                    return false
                end
            end

            table.remove(detection_storage_table.ot[target], 1)

            return true
        end

        return false
    end,
    ft = function(packet, target)
        if not detection_storage_table.ft[target] then
            detection_storage_table.ft[target] = 0
        end

        local sig = ("%.02X"):format(ffi.cast("uint16_t*", ffi.cast("uintptr_t", packet) + 16)[0])

        if detection_storage_table.ft[target] > 36 then
            return true
        elseif sig == "7FFA" or sig == "7FFB" then
            detection_storage_table.ft[target] = detection_storage_table.ft[target] + 1
        end

        return false
    end,
    pl = function(packet, target)
        if not detection_storage_table.pl[target] then
            detection_storage_table.pl[target] = 0
        end

        if detection_storage_table.pl[target] > 24 then
            return true
        elseif ("%.02X"):format(ffi.cast("uint16_t*", ffi.cast("uintptr_t", packet) + 44)[0]) == "7275" then
            detection_storage_table.pl[target] = detection_storage_table.pl[target] + 1
        else
            detection_storage_table.pl[target] = 0
        end

        return false
    end,
    ev = function(packet, target)
        if not detection_storage_table.ev[target] then
            detection_storage_table.ev[target] = {}
        end

        detection_storage_table.ev[target][#detection_storage_table.ev[target] + 1] = packet.xuid_high

        if #detection_storage_table.ev[target] > 44 then
            for i = 1, #detection_storage_table.ev[target] - 4 do
                local loop_info = detection_storage_table.ev[target][i]
                if detection_storage_table.ev[target][i + 1] + detection_storage_table.ev[target][i + 2] == detection_storage_table.ev[target][i] * 2 and detection_storage_table.ev[target][i + 4] == loop_info + 1 then
                    detection_storage_table.ev[target] = {}

                    return true
                end
            end

            table.remove(detection_storage_table.ev[target], 1)
        end

        return false
    end,
    r7 = function(packet, target)
        if not detection_storage_table.r7[target] then
            detection_storage_table.r7[target] = 0
        end

        local sig = ("%.02X"):format(ffi.cast("uint16_t*", ffi.cast("uintptr_t", packet) + 16)[0])

        if detection_storage_table.r7[target] > 24 then
            return true
        elseif sig == "234" or sig == "134" then
            detection_storage_table.r7[target] = detection_storage_table.r7[target] + 1
        else
            detection_storage_table.r7[target] = 0
        end

        return false
    end,
    af = function(packet, target)
        if not detection_storage_table.af[target] then
            detection_storage_table.af[target] = 0
        end

        if detection_storage_table.af[target] > 24 then
            return true
        elseif ("%.02X"):format(ffi.cast("uint16_t*", ffi.cast("uintptr_t", packet) + 16)[0]) == "AFF1" then
            detection_storage_table.af[target] = detection_storage_table.af[target] + 1
        else
            detection_storage_table.af[target] = 0
        end

        return false
    end,
    gs = function(packet, target)
        local sig = ("%.02X"):format(ffi.cast("uint16_t*", ffi.cast("uintptr_t", packet) + 22)[0])
        local sequence_bytes = string.sub(packet.sequence_bytes, 1, 4)

        if not detection_storage_table.gs[target] then
            detection_storage_table.gs[target] = {
                repeated = 0,
                packet = sig,
                bytes = sequence_bytes
            }
        end

        if sequence_bytes ~= detection_storage_table.gs[target].bytes and sig ~= detection_storage_table.gs[target].packet then
            detection_storage_table.gs[target].packet = sig
            detection_storage_table.gs[target].bytes = sequence_bytes
            detection_storage_table.gs[target].repeated = detection_storage_table.gs[target].repeated + 1
        else
            detection_storage_table.gs[target].repeated = 0
        end

        if detection_storage_table.gs[target].repeated >= 36 then
            detection_storage_table.gs[target] = {
                repeated = 0,
                packet = sig,
                bytes = sequence_bytes
            }

            return true
        end

        return false
    end
}

client.register_esp_flag("", 220, 220, 220, function(target)
    if not main_data_table.main.value then
        return false
    end

    if not main_data_table.users[target] or not main_data_table.users[target].cheat then
        return false
    end

    local cheat = main_data_table.users[target].cheat or "wh"

    if not esp_flag_enabled or not cheat or cheat == "wh" then
        return false
    end

    return true, (entity.is_dormant(target) and cheat or main_data_table.yeah.colored_names[cheat].short or ""):upper()
end)

local function info_update_callback()
    main_data_table.icon_type.vis = main_data_table.main.value
    main_data_table.display_method.vis = main_data_table.main.value
    scoreboard_icon_enabled = main_data_table.display_method:contains("Scoreboard icon") and main_data_table.main.value
    esp_flag_enabled = main_data_table.display_method:contains("Flag") and main_data_table.main.value

    if icon_changed then
        icon_changed = false
        for _, user in pairs(main_data_table.users) do
            user.icon_set = false
        end
    end

    if scoreboard_icon_enabled and not last_scoreboard_icon_enabled then
        last_scoreboard_icon_enabled = true

        js.create()
    elseif not scoreboard_icon_enabled and last_scoreboard_icon_enabled then
        last_scoreboard_icon_enabled = false

        for _, user in pairs(main_data_table.users) do
            user.icon_set = false
        end

        js.destroy()
    end
end

main_data_table.main:add_event_callback("paint", function()
    if not scoreboard_icon_enabled then
        return
    end

    if (not is_multicolored) and (not is_unicolored) and (not is_nadoryha) then
        return
    end

    for _, target in pairs(get_players()) do
        local user = main_data_table.users[target]
        if user then
            if not user.icon_set then
                js.update(target, images_path:format(user.cheat and (user.cheat == "nl" and nl_path or user.cheat) or target == entity.get_local_player() and "gs" or "wh"))

                user.icon_set = true
            end
        else
            main_data_table.users[target] = {}
        end
    end
end)

main_data_table.main:add_event_callback("voice", function(event)
    local packet = ffi.cast(voice_data_t, event.data)
    local target = (ffi.cast("char*", packet) + 8)[0] + 1
    if not main_data_table.users[target] then
        main_data_table.users[target] = {}
    end

    local user = main_data_table.users[target]

    for cheat_identifier, cheat_detection_function in pairs(detector_table) do
        repeat
            local cheat = user.cheat
            if user.cheat ~= cheat_identifier and (cheat_identifier ~= "nl" or user.cheat ~= "ev" and user.cheat ~= "gs" and user.cheat ~= "pl" and user.cheat ~= "pd" and user.cheat ~= "r7" and user.cheat ~= "af" and user.cheat ~= "ft") and (cheat_identifier ~= "nw" or user.cheat ~= "nl") and (cheat_identifier ~= "ev" or user.cheat ~= "pd" and user.cheat ~= "nl" and user.cheat ~= "ft") and (cheat_identifier ~= "gs" or user.cheat ~= "ev" and user.cheat ~= "ot" and user.cheat ~= "pl" and user.cheat ~= "pd" and user.cheat ~= "r7" and user.cheat ~= "ft") and (cheat_identifier ~= "ot" or user.cheat ~= "nw" and user.cheat ~= "ft" and user.cheat ~= "pd" and user.cheat ~= "pl") then
                if cheat_identifier == "ft" and (user.cheat == "nw" or user.cheat == "pd") then
                    break
                end

                if cheat_detection_function(packet, target) then
                    user.cheat = cheat_identifier
                    user.icon_set = false

                    main_data_table.plist_handler:set_state(main_data_table.list_label, target, ("Cheat: %s"):format(main_data_table.yeah.colored_names[cheat_identifier].long) or main_data_table.yeah.colored_names.wh.long)

                    if (user.cheat or "wh") == "wh" or cheat ~= cheat_identifier then
                        client.fire_event("cheat_detected", {
                            player = target,
                            cheat_id = cheat_identifier,
                            cheat_long = main_data_table.yeah.names[cheat_identifier].long,
                            cheat_color = main_data_table.yeah.names[cheat_identifier].color
                        })
                    end
                end
            end
        until true
    end
end)
main_data_table.main:add_event_callback("player_connect_full", function(event)
    local target = client.userid_to_entindex(event.userid)
    if target == entity.get_local_player() then
        main_data_table.users = {}

        js.clear()
        js.destroy()
        client.delay_call(0.5, function()
            js.create()
        end)
    else
        for _, user in pairs(main_data_table.users) do
            user[target] = {}
        end
    end
end)
main_data_table.main:add_event_callback("game_start", function()
    for _, user in pairs(main_data_table.users) do
        user.icon_set = false
    end
end)
main_data_table.main:add_callback(info_update_callback)
main_data_table.display_method:add_callback(info_update_callback)
main_data_table.icon_type:add_callback(info_update_callback)
main_data_table.main:invoke()
client.set_event_callback("shutdown", function()
    js.clear()
    js.destroy()
end)

package.preload["gamesense/cheat_revealer"] = function()
    return {
        get_cheat = function(target)
            local cheat = main_data_table.users[target].cheat or "wh"

            return {
                cheat_id = cheat,
                cheat_long = main_data_table.yeah.names[cheat].long or "unknown",
                cheat_color = main_data_table.yeah.names[cheat].color or color.hex("9F9F9FFF")
            }
        end,
        has_data = function(target)
            return main_data_table.users[target] ~= nil
        end,
        clear_data = function(target)
            if main_data_table.users[target] == nil then
                return false
            end

            main_data_table.users[target] = nil

            for _, detection in pairs(detection_storage_table) do
                detection[target] = nil
            end

            return true
        end
    }
end

--local variables for API. Automatically generated by https://github.com/simpleavaster/gslua/blob/master/authors/sapphyrus/generate_api.lua 
local client_latency, client_log, client_draw_rectangle, client_draw_circle_outline, client_userid_to_entindex, client_draw_gradient, client_set_event_callback, client_screen_size, client_draw_text, client_visible = client.latency, client.log, client.draw_rectangle, client.draw_circle_outline, client.userid_to_entindex, client.draw_gradient, client.set_event_callback, client.screen_size, client.draw_text, client.visible 
local client_visible, client_exec, client_draw_circle, client_delay_call, client_world_to_screen, client_draw_hitboxes, client_get_cvar, client_draw_line, client_camera_angles, client_draw_debug_text, client_random_int, client_random_float = client.visible, client.exec, client.draw_circle, client.delay_call, client.world_to_screen, client.draw_hitboxes, client.get_cvar, client.draw_line, client.camera_angles, client.draw_debug_text, client.random_int, client.random_float 
local entity_get_local_player, entity_is_enemy, entity_get_player_name, entity_get_all, entity_set_prop, entity_get_player_weapon, entity_hitbox_position, entity_get_prop, entity_get_players, entity_get_classname = entity.get_local_player, entity.is_enemy, entity.get_player_name, entity.get_all, entity.set_prop, entity.get_player_weapon, entity.hitbox_position, entity.get_prop, entity.get_players, entity.get_classname 
local globals_mapname, globals_tickcount, globals_realtime, globals_absoluteframetime, globals_tickinterval, globals_curtime, globals_frametime, globals_maxplayers = globals.mapname, globals.tickcount, globals.realtime, globals.absoluteframetime, globals.tickinterval, globals.curtime, globals.frametime, globals.maxplayers 
local ui_new_slider, ui_new_combobox, ui_reference, ui_set_visible, ui_set_callback, ui_set, ui_new_checkbox, ui_new_hotkey, ui_new_button, ui_new_multiselect, ui_get = ui.new_slider, ui.new_combobox, ui.reference, ui.set_visible, ui.set_callback, ui.set, ui.new_checkbox, ui.new_hotkey, ui.new_button, ui.new_multiselect, ui.get 
--end of local variables 

local table_concat = table.concat
local table_insert = table.insert
local to_number = tonumber
local math_floor = math.floor
local math_min = math.min
local math_max = math.max
local table_remove = table.remove
local string_format = string.format

local delay = 0.03
local buy_at, buy_as_600ms_at
local buy_command = ""

local primary_weapons = {
	{name='-', command=""},
	{name='AWP', command="buy awp; "},
	{name='Auto-Sniper', command="buy scar20; buy g3sg1; "},
	{name='Scout', command="buy ssg08; "},
	{name='Negev', command="buy negev; "},
	{name='SG553 / AUG', command="buy sg553; buy aug; "}
}

local secondary_weapons = {
	{name='-', command=""},
	{name='R8 Revolver / Deagle', command="buy deagle; "},
	{name='Dual Berettas', command="buy elite; "},
	{name='FN57 / Tec9 / CZ75-Auto', command="buy fn57; "},
	{name='P250', command="buy p250;"}
}

local gear_weapons = {
	{name='Kevlar', command="buy vest; "},
	{name='Helmet', command="buy vesthelm; "},
	{name='Defuse Kit', command="buy defuser; "},
	{name='Grenade', command="buy hegrenade; "},
	{name='Molotov', command="buy incgrenade; "},
	{name='Smoke', command="buy smokegrenade; "},
	{name='Flashbang (x2)', command="buy flashbang; "},
	{name='Taser', command="buy taser; "},
}

local function get_names(table)
	local names = {}
	for i=1, #table do
		table_insert(names, table[i]["name"])
	end
	return names
end

local function get_command(table, name)
	for i=1, #table do
		if table[i]["name"] == name then
			return table[i]["command"]
		end
	end
end

local function get_weapons(player)
	local weapons = {}
	for i=0, 64 do
		local weapon = entity_get_prop(player, "m_hMyWeapons", i)
		if weapon ~= nil then
			table_insert(weapons, weapon)
		end
	end
	return weapons
end

local function has_weapon(player, weapon_name)
	for i=0, 64 do
		local weapon = entity_get_prop(player, "m_hMyWeapons", i)
		if weapon ~= nil and entity_get_classname(weapon) == weapon_name then
			return true
		end
	end
	return false
end

local buybot_enabled = ui_new_checkbox("AA", "Fake lag", "Auto-Buy")
local buybot_primary = ui_new_combobox("AA", "Fake lag", "Auto-Buy: Primary", get_names(primary_weapons))
local buybot_pistol = ui_new_combobox("AA", "Fake lag", "Auto-Buy: Secondary", get_names(secondary_weapons))
local buybot_gear = ui_new_multiselect("AA", "Fake lag", "Auto-Buy: Gear", get_names(gear_weapons))

local function on_enabled_change()
	local enabled = ui_get(buybot_enabled)
	ui_set_visible(buybot_primary, enabled)
	ui_set_visible(buybot_pistol, enabled)
	ui_set_visible(buybot_gear, enabled)
end
ui.set_callback(buybot_enabled, on_enabled_change)
on_enabled_change()

local function buy(command)
	--client.log("BUYING AT ", globals_tickcount())
	client_exec(command)
end

local function buy_as_600ms(e)
	--right now we would have 600ms ping, we need to wait 600-ping to be able to buy

	if not ui_get(buybot_enabled) then
		return
	end

	local primary = ui_get(buybot_primary)
	local pistol = ui_get(buybot_pistol)
	local gear = ui_get(buybot_gear)

	local commands = {}
	local primary_command = ""

	if not (primary == "Auto-Sniper" and has_weapon(entity_get_local_player(), "CWeaponSCAR20")) then
		table_insert(commands, get_command(primary_weapons, primary))
		primary_command = get_command(primary_weapons, primary)
	end
	table_insert(commands, get_command(secondary_weapons, pistol))
	
	for i=1, #gear do
		table_insert(commands, get_command(gear_weapons, gear[i]))
	end

	table_insert(commands, "use weapon_knife;")

	local command = table_concat(commands, "")
	local delay = 0.6 - client_latency() + 0.1

	--client.log("BUY AS 600MS")
	--client.log("TOTAL   ", delay)

	buy_at = globals_realtime() + delay
	buy_command = command
	--client_delay_call(delay-0.25, buy, get_command(primary_weapons, primary))
	--client_delay_call(delay-0.20, buy, get_command(primary_weapons, primary))
	client_delay_call(delay-0.15, buy, command)
	client_delay_call(delay-0.10, buy, primary_command)
	client_delay_call(delay-0.05, buy, primary_command)
	--client_delay_call(delay+0.01, buy, command)
end

local function run_buybot()
	local delay = tonumber(client_get_cvar("mp_round_restart_delay")) - 0.6
	delay = math_max(0, delay)
	--client.log("buy as 600 ms in ", delay)
	buy_as_600ms_at = globals_realtime() + delay
end

local function on_paint(ctx)
	local realtime = globals_realtime()
	if buy_as_600ms_at ~= nil and buy_as_600ms_at <= realtime then
		buy_as_600ms()
		buy_as_600ms_at = nil
	end
	if buy_at ~= nil and buy_at <= realtime then
		buy(buy_command)
		buy_at = nil
	end
end

client_set_event_callback("round_end", run_buybot)
client_set_event_callback("paint", on_paint)

--client_set_event_callback("player_spawn", run_buybot)

--------------------------------------------------------------------------------
-- Caching common functions
--------------------------------------------------------------------------------
local client_set_event_callback, ui_get, ui_new_checkbox, ui_new_slider, ui_set_callback, ui_set_visible = client.set_event_callback, ui.get, ui.new_checkbox, ui.new_slider, ui.set_callback, ui.set_visible

--------------------------------------------------------------------------------
-- Constants and variables
--------------------------------------------------------------------------------
local cvar_fov      = cvar.viewmodel_fov
local cvar_offset_x = cvar.viewmodel_offset_x
local cvar_offset_y = cvar.viewmodel_offset_y     
local cvar_offset_z = cvar.viewmodel_offset_z

local default_fov       = 680
local default_offset_x  = 25 
local default_offset_y  = 0
local default_offset_z  = -15

--------------------------------------------------------------------------------
-- Viewmodel functions
--------------------------------------------------------------------------------
local function set_viewmodel(fov, x, y, z)
    cvar_fov:set_raw_float(fov * 0.1)
    cvar_offset_x:set_raw_float(x * 0.1)
    cvar_offset_y:set_raw_float(y * 0.1)
    cvar_offset_z:set_raw_float(z * 0.1)
end

--------------------------------------------------------------------------------
-- Menu
--------------------------------------------------------------------------------
local viewmodel_changer     = ui_new_checkbox("AA", "Fake lag", "Viewmodel changer")
local viewmodel_fov         = ui_new_slider("AA", "Fake lag", "Offset fov", -1800, 1800, default_fov, true, nil, 0.1)
local viewmodel_offset_x    = ui_new_slider("AA", "Fake lag", "Offset x", -1800, 1800, default_offset_x, true, nil, 0.1)
local viewmodel_offset_y    = ui_new_slider("AA", "Fake lag", "Offset y", -1800, 1800, default_offset_y, true, nil, 0.1)
local viewmodel_offset_z    = ui_new_slider("AA", "Fake lag", "Offset z", -1800, 1800, default_offset_z, true, nil, 0.1)

local function handle_viewmodel()
    local offset_fov    = ui_get(viewmodel_fov)
    local offset_x      = ui_get(viewmodel_offset_x)
    local offset_y      = ui_get(viewmodel_offset_y)
    local offset_z      = ui_get(viewmodel_offset_z)
    set_viewmodel(offset_fov, offset_x, offset_y, offset_z)
end

ui_set_callback(viewmodel_fov, handle_viewmodel)
ui_set_callback(viewmodel_offset_x, handle_viewmodel)
ui_set_callback(viewmodel_offset_y, handle_viewmodel)
ui_set_callback(viewmodel_offset_z, handle_viewmodel)

local function handle_menu()
    local state = ui_get(viewmodel_changer)
    ui_set_visible(viewmodel_fov, state)
    ui_set_visible(viewmodel_offset_x, state)
    ui_set_visible(viewmodel_offset_y, state)
    ui_set_visible(viewmodel_offset_z, state)
    if not state then
        set_viewmodel(default_fov, default_offset_x, default_offset_y, default_offset_z)
    else
        handle_viewmodel()
    end
end

handle_menu()
ui_set_callback(viewmodel_changer, handle_menu)

--------------------------------------------------------------------------------
-- Event handling
--------------------------------------------------------------------------------
local function shutdown()
    set_viewmodel(default_fov, default_offset_x, default_offset_y, default_offset_z)
end

client_set_event_callback("shutdown", shutdown)

-- local variables for API functions. any changes to the line below will be lost on re-generation
local client_screen_size, entity_get_local_player, entity_get_player_weapon, entity_get_prop, entity_is_alive, globals_frametime, renderer_gradient, ui_get, ui_new_checkbox, ui_new_color_picker, ui_new_slider, ui_reference, ui_set, ui_set_callback, ui_set_visible = client.screen_size, entity.get_local_player, entity.get_player_weapon, entity.get_prop, entity.is_alive, globals.frametime, renderer.gradient, ui.get, ui.new_checkbox, ui.new_color_picker, ui.new_slider, ui.reference, ui.set, ui.set_callback, ui.set_visible
local clamp = function(v, min, max) local num = v; num = num < min and min or num; num = num > max and max or num; return num end

local easing = require "gamesense/easing"
local m_alpha = 0

local scope_overlay = ui_reference('Visuals', 'Effects', 'Remove scope overlay')
local master_switch = ui_new_checkbox('AA', 'Fake lag', 'Custom scope lines')
local color_picker = ui_new_color_picker('AA', 'Fake lag', '\n scope_lines_color_picker', 0, 0, 0, 255)
local overlay_position = ui_new_slider('AA', 'Fake lag', '\n scope_lines_initial_pos', 0, 500, 190)
local overlay_offset = ui_new_slider('AA', 'Fake lag', '\n scope_lines_offset', 0, 500, 15)
local fade_time = ui_new_slider('AA', 'Fake lag', 'Fade animation speed', 3, 20, 12, true, 'fr', 1, { [3] = 'Off' })

local g_paint_ui = function()
    ui_set(scope_overlay, true)
end

local g_paint = function()
    ui_set(scope_overlay, false)

    local width, height = client_screen_size()
    local offset, initial_position, speed, color =
        ui_get(overlay_offset) * height / 1080, 
        ui_get(overlay_position) * height / 1080, 
        ui_get(fade_time), { ui_get(color_picker) }

    local me = entity_get_local_player()
    local wpn = entity_get_player_weapon(me)

    local scope_level = entity_get_prop(wpn, 'm_zoomLevel')
    local scoped = entity_get_prop(me, 'm_bIsScoped') == 1
    local resume_zoom = entity_get_prop(me, 'm_bResumeZoom') == 1

    local is_valid = entity_is_alive(me) and wpn ~= nil and scope_level ~= nil
    local act = is_valid and scope_level > 0 and scoped and not resume_zoom

    local FT = speed > 3 and globals_frametime() * speed or 1
    local alpha = easing.linear(m_alpha, 0, 1, 1)

    renderer_gradient(width/2 - initial_position, height / 2, initial_position - offset, 1, color[1], color[2], color[3], 0, color[1], color[2], color[3], alpha*color[4], true)
    renderer_gradient(width/2 + offset, height / 2, initial_position - offset, 1, color[1], color[2], color[3], alpha*color[4], color[1], color[2], color[3], 0, true)

    renderer_gradient(width / 2, height/2 - initial_position, 1, initial_position - offset, color[1], color[2], color[3], 0, color[1], color[2], color[3], alpha*color[4], false)
    renderer_gradient(width / 2, height/2 + offset, 1, initial_position - offset, color[1], color[2], color[3], alpha*color[4], color[1], color[2], color[3], 0, false)
    
    m_alpha = clamp(m_alpha + (act and FT or -FT), 0, 1)
end

local ui_callback = function(c)
    local master_switch, addr = ui_get(c), ''

    if not master_switch then
        m_alpha, addr = 0, 'un'
    end
    
    local _func = client[addr .. 'set_event_callback']

    ui_set_visible(scope_overlay, not master_switch)
    ui_set_visible(overlay_position, master_switch)
    ui_set_visible(overlay_offset, master_switch)
    ui_set_visible(fade_time, master_switch)

    _func('paint_ui', g_paint_ui)
    _func('paint', g_paint)
end

ui_set_callback(master_switch, ui_callback)
ui_callback(master_switch)
