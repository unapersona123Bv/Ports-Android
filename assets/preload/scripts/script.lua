local EnableBFFrames = false
local EnableDadFrames = false
local EnabledCharacters = {
    'BF_IC_Cuphead',
    'BF_IC_Rain',
    'BF_Bendy_IC',
    'BF_Bendy_IC_Phase2',
    'BF_Bendy_IC_Phase3',
    'BF_Bendy_NM_Bendy',
    'BF_Sammy',
    'BF_Sans_BS',
    'BF_Sans_Chara',
    'BF_Sans_IC',
    'BF_Sans_WT',
    'BF_Christmas_IC',
    'BoyFriend_DA',
    'BoyFriend_DA - Black and White',
    'BoyFriend_NM',
    'UT-BF',
    'UT-BF_Chara',
    'Bendy_DA',
    'Bendy_DAPhase2',
    'Bendy_IC',
    'Cuphead Pissed',
    'Cuphead',
    'Devil_Cup',
    'Nightmare-Bendy',
    'Nightmare-Cuphead',
    'Nightmare-Sans',
    'Papyrus_IC',
    'Sammy',
    'Sans_IC',
    'Sans_IC_WT',
    'Sans_Phase2_IC',
    'Sans_Phase3',
    'Sans_Phase3_Tired',
    'UT-Sans'}

function onUpdate()
    for Characters = 0,#EnabledCharacters do
        if getProperty('boyfriend.curCharacter') == EnabledCharacters[Characters] then
            EnableBFFrames = true
        end
        if getProperty('dad.curCharacter') == EnabledCharacters[Characters] then
            EnableDadFrames = true
        end
    end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote and EnableBFFrames then
        setProperty('boyfriend.animation.curAnim.curFrame',2)
    end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote and EnableDadFrames then
        setProperty('dad.animation.curAnim.curFrame',2)
    end
end

local AlphaEffect = -1
local Timer = 2
local MaxValueEffect = 0.5
function onCreatePost()
    if songName == 'Last-Reel' or songName == 'Nightmare-Run' or songName == 'Despair' or songName == 'Terrible-Sin' or songName == 'imminent-demise' or songName == 'Devils-Gambit' or songName == 'Ritual' or songName == 'Burning-In-Hell' then
        BendyEffect = 1
        makeLuaSprite('BlackSubEffectBendyIC','',0,0)
        makeGraphic('BlackSubEffectBendyIC',screenWidth,screenHeight,'646464')
        setObjectCamera('BlackSubEffectBendyIC','other')
        setProperty('BlackSubEffectBendyIC.alpha',0)
        addLuaSprite('BlackSubEffectBendyIC',true)
        setBlendMode('BlackSubEffectBendyIC','SUBTRACT')
        runTimer('BackToBlackBendy',Timer)
    end
end
function onTimerCompleted(tag)
    if tag == 'BackToWhiteBendy' then
        doTweenAlpha('BlackLightEffect', 'BlackSubEffectBendyIC', 0, Timer,'linear')
        runTimer('BackToBlackBendy',Timer * 1.5)
    end
    if tag == 'BackToBlackBendy' then
        doTweenAlpha('BlackLightEffect', 'BlackSubEffectBendyIC', MaxValueEffect, Timer,'linear')
        runTimer('BackToWhiteBendy',Timer * 1.5)
    end
end

local DadX = 0
local DadY = 0

local BfX = 0
local BfY = 0

local GfX = 0
local GfY = 0

local BfOfs = 50
local GfOfs = 50
local DadOfs = 50

local curCameraState = nil
local cameraMoving = nil

local enableSystem = true

--[[If you want to know the credits:
i got a ideia of the script by Washo789, 
the script is made by BF Myt.]]--

function onUpdatePost()
    if enableSystem == true then
        if mustHitSection == false then
                if gfSection == false or gfSection == nil then
                    DadX = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
                    DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')
                    if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                        triggerEvent('Camera Follow Pos',DadX-DadOfs,DadY)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                        triggerEvent('Camera Follow Pos',DadX+(DadOfs/2),DadY)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                        triggerEvent('Camera Follow Pos',DadX,DadY-DadOfs)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                        triggerEvent('Camera Follow Pos',DadX,DadY+DadOfs)
                        cameraMoving = true
                    else
                        if cameraMoving == true then
                            triggerEvent('Camera Follow Pos',DadX,DadY)
                            cameraMoving = false
                        end
                    end
                else
                    -- The camera follows GF when she sings, only when the "GF Section" option in the chart editor is activated. 
                    GfX = getMidpointX('gf') + getProperty('gf.cameraPosition[0]') + getProperty('girlfriendCameraOffset[0]')
                    GfY = getMidpointY('gf') + getProperty('gf.cameraPosition[1]') + getProperty('girlfriendCameraOffset[1]')
                    if getProperty('gf.animation.curAnim.name') == 'singLEFT' or getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                        triggerEvent('Camera Follow Pos',GfX-ofs,GfOfs)
                        cameraMoving = true
                    elseif getProperty('gf.animation.curAnim.name') == 'singRIGHT' or getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                        triggerEvent('Camera Follow Pos',GfX+ofs,GfOfs)
                        cameraMoving = true
                    elseif getProperty('gf.animation.curAnim.name') == 'singUP' or getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                        triggerEvent('Camera Follow Pos',GfX,GfY-GfOfs)
                        cameraMoving = true
                    elseif getProperty('gf.animation.curAnim.name') == 'singDOWN' or getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                        triggerEvent('Camera Follow Pos',GfX,GfY+GfOfs)
                        cameraMoving = true
                    else
                        if cameraMoving == true then
                            triggerEvent('Camera Follow Pos',GfX,GfY)
                            cameraMoving = false
                        end
                    end
                end
        else

                BfX = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
                BfY = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',BfX-BfOfs,BfY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',BfX+BfOfs,BfY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',BfX,BfY-BfOfs)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',BfX,BfY+BfOfs)
            else
                if cameraMoving == true then
                    triggerEvent('Camera Follow Pos',BfX,BfY)
                    cameraMoving = false
                end
            end
        end
    end
end