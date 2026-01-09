--[[
    NEXUS OS v6.0 - TEMPLATE PROFISSIONAL
    Estrutura: Monolítica (Arquivo Único)
    Status: Pronta para Inserção de Lógica
    Nota: Os nomes já estão definidos. Basta colar seu código nas funções vazias.
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NEXUS OS v6.0 | Developer Edition",
    LoadingTitle = "Carregando Framework...",
    LoadingSubtitle = "Estrutura Pronta para Devs",
    ConfigurationSaving = { Enabled = true, FolderName = "NexusDev", FileName = "Config" },
    KeySystem = false,
})

local Services = {
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    Workspace = game:GetService("Workspace"),
    Lighting = game:GetService("Lighting")
}
local LocalPlayer = Services.Players.LocalPlayer
local Connections = {} -- Armazena conexões para desligar toggles

-- ==================================================================
-- TABELA MESTRA DE FUNCIONALIDADES (Onde você cola seus scripts)
-- ==================================================================
local Registry = {

    -- ================= [ABA: COMBAT] =================
    { ID = "aim_main", Name = "🎯 Aimbot Main", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- COLE O CÓDIGO DO AIMBOT AQUI
        print("Aimbot: " .. tostring(v))
    end},
    { ID = "aim_silent", Name = "🤫 Silent Aim", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- COLE O SILENT AIM AQUI
    end},
    { ID = "aim_fov", Name = "⭕ Draw FOV", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- COLE O DESENHO DO FOV AQUI
    end},
    { ID = "aura_main", Name = "⚔️ Kill Aura", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- COLE O KILL AURA AQUI
    end},
    { ID = "aura_range", Name = "📏 Aura Range", Cat = "Combat", Type = "Slider", Range = {1, 50}, Default = 15, Action = function(v)
        -- AJUSTE DE ALCANCE
    end},
    { ID = "trigger", Name = "🔫 TriggerBot", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- COLE O TRIGGERBOT AQUI
    end},
    { ID = "hitbox", Name = "📦 Hitbox Expander", Cat = "Combat", Type = "Slider", Range = {1, 20}, Default = 1, Action = function(v)
        -- COLE O HITBOX EXPANDER AQUI
    end},
    { ID = "recoil", Name = "🚫 No Recoil", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- COLE O NO RECOIL AQUI
    end},
    { ID = "rapid", Name = "🔥 Rapid Fire", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- COLE O RAPID FIRE AQUI
    end},
    { ID = "autoblock", Name = "🛡️ Auto Block", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- COLE O AUTO BLOCK AQUI
    end},
    { ID = "teamcheck", Name = "👥 Team Check", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- LÓGICA DE TEAM CHECK
    end},
    { ID = "wallcheck", Name = "🧱 Wall Check", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- LÓGICA DE WALL CHECK
    end},
    { ID = "autoclick", Name = "👆 Auto Clicker (Combat)", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- AUTO CLICKER PVP
    end},
    { ID = "reach", Name = "🥊 Reach Hack", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- REACH (EXTENSOR DE ESPADA/SOCO)
    end},
    { ID = "infammo", Name = "♾️ Infinite Ammo", Cat = "Combat", Type = "Toggle", Action = function(v)
        -- MUNIÇÃO INFINITA
    end},

    -- ================= [ABA: VISUALS] =================
    { ID = "esp_main", Name = "👁️ ESP Master Switch", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- LÓGICA PRINCIPAL DO ESP
    end},
    { ID = "esp_box", Name = "📦 ESP Boxes", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- DESENHAR CAIXAS 2D
    end},
    { ID = "esp_skel", Name = "💀 ESP Skeleton", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- DESENHAR ESQUELETO
    end},
    { ID = "esp_name", Name = "🏷️ ESP Names", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- MOSTRAR NOMES
    end},
    { ID = "esp_dist", Name = "📏 ESP Distance", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- MOSTRAR DISTÂNCIA
    end},
    { ID = "esp_health", Name = "❤️ ESP HealthBar", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- BARRA DE VIDA
    end},
    { ID = "esp_tracer", Name = "🔗 Tracers", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- LINHAS ATÉ O INIMIGO
    end},
    { ID = "esp_item", Name = "💎 Item ESP", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- ESP DE ITENS/DROPS
    end},
    { ID = "chams", Name = "👻 Chams (Highlight)", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- HIGHLIGHT ROBLOX
    end},
    { ID = "fullbright", Name = "💡 Fullbright", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- LUZ INFINITA
    end},
    { ID = "crosshair", Name = "❌ Custom Crosshair", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- MIRA NA TELA
    end},
    { ID = "fov_changer", Name = "📷 FOV Changer", Cat = "Visuals", Type = "Slider", Range = {70, 120}, Default = 70, Action = function(v)
        Services.Workspace.CurrentCamera.FieldOfView = v
    end},
    { ID = "nofog", Name = "🌫️ No Fog", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- REMOVER NEBLINA
    end},
    { ID = "ambience", Name = "🌑 Ambience (Time)", Cat = "Visuals", Type = "Slider", Range = {0, 24}, Default = 14, Action = function(v)
        Services.Lighting.ClockTime = v
    end},
    { ID = "xray", Name = "🔍 X-Ray", Cat = "Visuals", Type = "Toggle", Action = function(v)
        -- VISÃO ATRAVÉS DE PAREDES
    end},

    -- ================= [ABA: MOVEMENT] =================
    { ID = "fly", Name = "🕊️ Fly", Cat = "Movement", Type = "Toggle", Action = function(v)
        -- CÓDIGO DE VOO
    end},
    { ID = "flyspeed", Name = "💨 Fly Speed", Cat = "Movement", Type = "Slider", Range = {16, 500}, Default = 50, Action = function(v)
        -- VELOCIDADE DO VOO
    end},
    { ID = "speed", Name = "⚡ WalkSpeed", Cat = "Movement", Type = "Slider", Range = {16, 300}, Default = 16, Action = function(v)
        if LocalPlayer.Character then LocalPlayer.Character.Humanoid.WalkSpeed = v end
    end},
    { ID = "jump", Name = "🦘 JumpPower", Cat = "Movement", Type = "Slider", Range = {50, 500}, Default = 50, Action = function(v)
        if LocalPlayer.Character then LocalPlayer.Character.Humanoid.JumpPower = v end
    end},
    { ID = "noclip", Name = "👻 Noclip", Cat = "Movement", Type = "Toggle", Action = function(v)
        -- CÓDIGO DE NOCLIP
    end},
    { ID = "infjump", Name = "☁️ Infinite Jump", Cat = "Movement", Type = "Toggle", Action = function(v)
        -- PULO NO AR
    end},
    { ID = "wallwalk", Name = "🧗 Wall Walk", Cat = "Movement", Type = "Toggle", Action = function(v)
        -- ANDAR NA PAREDE
    end},
    { ID = "jesus", Name = "🌊 Jesus (Water Walk)", Cat = "Movement", Type = "Toggle", Action = function(v)
        -- ANDAR NA ÁGUA
    end},
    { ID = "safefall", Name = "🍂 No Fall Damage", Cat = "Movement", Type = "Toggle", Action = function(v)
        -- SEM DANO DE QUEDA
    end},
    { ID = "spinbot", Name = "😵 SpinBot", Cat = "Movement", Type = "Toggle", Action = function(v)
        -- GIRAR PERSONAGEM
    end},
    { ID = "clicktp", Name = "🖱️ Click TP (Tool)", Cat = "Movement", Type = "Button", Action = function()
        -- FERRAMENTA DE TELEPORTE
    end},
    { ID = "phase", Name = "🚪 Phase (Go Through)", Cat = "Movement", Type = "Button", Action = function()
        -- ATRAVESSAR PORTA (INSTANT)
    end},

    -- ================= [ABA: PLAYER] =================
    { ID = "respawn", Name = "💀 Respawn", Cat = "Player", Type = "Button", Action = function()
        LocalPlayer.Character:BreakJoints()
    end},
    { ID = "godmode", Name = "🛡️ God Mode (Remove Humanoid)", Cat = "Player", Type = "Button", Action = function()
        -- BUGAR HUMANOID
    end},
    { ID = "invis", Name = "👻 Invisible", Cat = "Player", Type = "Toggle", Action = function(v)
        -- FICAR INVISÍVEL
    end},
    { ID = "antiafk", Name = "⏰ Anti-AFK", Cat = "Player", Type = "Toggle", Action = function(v)
        -- EVITAR KICK
    end},
    { ID = "spectate", Name = "👀 Spectate Player", Cat = "Player", Type = "Button", Action = function()
        -- ESPIAR OUTRO JOGADOR
    end},
    { ID = "rejoin", Name = "🔄 Rejoin Server", Cat = "Player", Type = "Button", Action = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end},
    { ID = "serverhop", Name = "🔀 Server Hop", Cat = "Player", Type = "Button", Action = function()
        -- TROCAR DE SERVER
    end},
    { ID = "tools", Name = "🛠️ Get All Tools", Cat = "Player", Type = "Button", Action = function()
        -- PEGAR FERRAMENTAS DO SERVER
    end},
    { ID = "animations", Name = "🎭 Play Animation", Cat = "Player", Type = "Button", Action = function()
        -- TOCAR ANIMAÇÃO
    end},
    { ID = "copyoutfit", Name = "👕 Copy Outfit", Cat = "Player", Type = "Button", Action = function()
        -- COPIAR ROUPA DO TARGET
    end},

    -- ================= [ABA: SERVER] =================
    { ID = "lag", Name = "📶 Lag Switch", Cat = "Server", Type = "Toggle", Action = function(v)
        -- SIMULAR LAG
    end},
    { ID = "chatspy", Name = "🕵️ Chat Spy", Cat = "Server", Type = "Toggle", Action = function(v)
        -- VER CHAT PRIVADO
    end},
    { ID = "removetex", Name = "📉 Low GFX (Remove Textures)", Cat = "Server", Type = "Button", Action = function()
        -- REMOVER TEXTURAS (FPS BOOST)
    end},
    { ID = "fullbright_s", Name = "☀️ Server Fullbright", Cat = "Server", Type = "Button", Action = function()
        -- LUZ NO CLIENTE
    end},
    { ID = "dex", Name = "📂 Open Dex Explorer", Cat = "Server", Type = "Button", Action = function()
        -- ABRIR EXPLORER (Loadstring)
    end},
    { ID = "remote", Name = "📡 Remote Spy", Cat = "Server", Type = "Button", Action = function()
        -- ABRIR REMOTE SPY
    end},
    { ID = "console", Name = "💻 Developer Console", Cat = "Server", Type = "Button", Action = function()
        game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
    end},
    
    -- ================= [ABA: AUTOMATION] =================
    { ID = "autofarm_main", Name = "🌾 Auto Farm Main", Cat = "Automation", Type = "Toggle", Action = function(v)
        -- FARM PRINCIPAL
    end},
    { ID = "autocollect", Name = "💰 Auto Collect Drops", Cat = "Automation", Type = "Toggle", Action = function(v)
        -- PEGAR ITENS DO CHÃO
    end},
    { ID = "autoquest", Name = "📜 Auto Quest", Cat = "Automation", Type = "Toggle", Action = function(v)
        -- PEGAR MISSÕES
    end},
    { ID = "antistun", Name = "⚡ Anti Stun/Knockback", Cat = "Automation", Type = "Toggle", Action = function(v)
        -- REMOVER STUN
    end},
    { ID = "bhop", Name = "🐇 Bunny Hop", Cat = "Automation", Type = "Toggle", Action = function(v)
        -- PULAR AUTOMATICAMENTE
    end},

    -- ================= [ABA: FUN/TROLL] =================
    { ID = "fling", Name = "🌪️ Fling Player", Cat = "Fun", Type = "Toggle", Action = function(v)
        -- FLING (GIRAR E BATER)
    end},
    { ID = "spamjump", Name = "🦘 Spam Jump", Cat = "Fun", Type = "Toggle", Action = function(v)
        -- PULAR SEM PARAR
    end},
    { ID = "spamchat", Name = "💬 Chat Spam", Cat = "Fun", Type = "Toggle", Action = function(v)
        -- FLOODAR CHAT
    end},
    { ID = "walkfling", Name = "🚶 Walk Fling", Cat = "Fun", Type = "Toggle", Action = function(v)
        -- FLING ANDANDO
    end},
    
}

-- ==================================================================
-- GERADOR DE SLOTS EXTRAS (Para chegar a 255)
-- ==================================================================
-- Cria botões numerados para você usar depois se precisar
local Cats = {"Combat", "Visuals", "Movement", "Player", "Server", "Automation", "Fun"}
local CurrentCount = #Registry

for i = 1, (255 - CurrentCount) do
    local cat = Cats[(i % #Cats) + 1]
    table.insert(Registry, {
        ID = "custom_" .. i,
        Name = "Custom Feature " .. i,
        Cat = cat,
        Type = "Button",
        Action = function()
            print("Slot vazio número " .. i .. ". Cole seu código aqui.")
        end
    })
end

-- ==================================================================
-- CONSTRUTOR AUTOMÁTICO DA INTERFACE
-- ==================================================================
local Tabs = {}
local TabNames = {"Combat", "Visuals", "Movement", "Player", "Automation", "Server", "Fun", "Settings"}

-- Criar Abas
for _, name in ipairs(TabNames) do
    Tabs[name] = Window:CreateTab(name, 4483362458)
end

-- Criar Botões Baseado na Tabela Registry
for _, feat in ipairs(Registry) do
    local tab = Tabs[feat.Cat]
    if tab then
        if feat.Type == "Button" then
            tab:CreateButton({ Name = feat.Name, Callback = feat.Action })
        elseif feat.Type == "Toggle" then
            tab:CreateToggle({ Name = feat.Name, CurrentValue = false, Flag = feat.ID, Callback = feat.Action })
        elseif feat.Type == "Slider" then
            tab:CreateSlider({ Name = feat.Name, Range = feat.Range, Increment = 1, Suffix = "", CurrentValue = feat.Default, Flag = feat.ID, Callback = feat.Action })
        end
    end
end

Rayfield:Notify({Title = "Nexus OS v6.0", Content = "Template Carregado!", Duration = 5})

