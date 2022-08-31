local keepScroll = false
function onStepHit()
    if curStep == 48 then
     doTweenAlpha('luz','light',1,1,'linear')
     end
    if curStep == 122 then
	doTweenAlpha('hello','camHUD',1, 0.3,'linear')
	end
if curStep == 126 then
setProperty('defaultCamZoom',0.9);
end
if curStep == 272 then
removeLuaSprite('light',false)
end
if curStep == 464 then
addLuaSprite('light',true)
end
if curStep == 472 then
removeLuaSprite('light',false)
end
if curStep == 728 then
addLuaSprite('light',true)
end
if curStep == 856 then
removeLuaSprite('light',false)
end
if curStep == 1112 then
addLuaSprite('light',true)
end
	if curStep == 1127 then
	doTweenAlpha('spookyexit', 'dad', 0, 1, 'quartOut');
	doTweenAlpha('lightadiusss', 'light', 0, 1, 'quartOut');
	end
end

function onSongStart()

	doTweenAlpha('spookyenter', 'dad', 1, 20, 'linear');

end

function onCreate()
setProperty('camHUD.alpha', 0);
	makeAnimatedLuaSprite('ScribbleBGWhite', 'tailsdoll/ScribbleBGWhite', -70, -40);
	scaleObject('ScribbleBGWhite', 1.42, 1.42);
	addAnimationByPrefix('ScribbleBGWhite', 'White', 'White', 25, true);
	setScrollFactor('ScribbleBGWhite', -3.19189119579733E-16, -3.19189119579733E-16);
	setProperty('ScribbleBGWhite.antialiasing', false);
	setObjectOrder('ScribbleBGWhite', 0);
	setProperty('ScribbleBGWhite.visible', false);

	makeAnimatedLuaSprite('ScribbleBGBlack', 'tailsdoll/ScribbleBGBlack', -70, -40);
	scaleObject('ScribbleBGBlack', 1.42, 1.42);
	addAnimationByPrefix('ScribbleBGBlack', 'White', 'White', 24, true);
	setScrollFactor('ScribbleBGBlack', -3.19189119579733E-16, -3.19189119579733E-16);
	setProperty('ScribbleBGBlack.antialiasing', false);
	setObjectOrder('ScribbleBGBlack', 1);
	setProperty('ScribbleBGBlack.visible', false);

	makeAnimatedLuaSprite('Bsod', 'tailsdoll/fakebsod', -70, -40);
	scaleObject('Bsod', 1.42, 1.42);
	addAnimationByPrefix('Bsod', 'BSOD', 'BSOD', 1, true);
	setScrollFactor('Bsod', -3.19189119579733E-16, -3.19189119579733E-16);
	setProperty('Bsod.antialiasing', false);
	setObjectOrder('Bsod', 7);
	setObjectCamera('Bsod', 'other');
	setProperty('Bsod.visible', false);

	makeLuaSprite('Border', 'tailsdoll/2010moment', -70, -40);
	scaleObject('Border', 1.42, 1.42);
	setObjectCamera('Border', 'other');
	setObjectOrder('Border', 5);

	makeLuaSprite('Grain', 'tailsdoll/grain', -70, -40);
	scaleObject('Grain', 1.42, 1.42);
	setObjectCamera('Grain', 'other');
	setObjectOrder('Grain', 6);

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.visible', false);
	setObjectOrder('gfGroup', 2);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', false);
	setProperty('dadGroup.alpha', 0);
	setObjectOrder('dadGroup', 3);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.visible', false);
	setObjectOrder('boyfriendGroup', 4);
	
	makeLuaSprite('light', 'light', 580, 400);
	scaleObject('light', 0.8, 0.8);
	addLuaSprite('light',true)
	setProperty('light.alpha', 0);
	
	if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
		keepScroll = true;
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
	end
end
function onEvent(name, value1, value2)
	if name == 'WhiteBG' then
		cameraFlash('camgame', 'ffffff', '0.5', 'true')
		setProperty('ScribbleBGWhite.visible', true)
		setProperty('ScribbleBGBlack.visible', false)
	end
	if name == 'BlackBG' then
		cameraFlash('camgame', '000000', '0.5', 'true')
		setProperty('ScribbleBGWhite.visible', false)
		setProperty('ScribbleBGBlack.visible', true)
	end
	if name == 'NoBG' then
		cameraFlash('camgame', '000000', '0.5', 'true')
		setProperty('ScribbleBGWhite.visible', false)
		setProperty('ScribbleBGBlack.visible', false)
	end
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.02);
    end
end

function onUpdatePost()
	setPropertyFromGroup('opponentStrums',0,'alpha',0)
	setPropertyFromGroup('opponentStrums',1,'alpha',0)
	setPropertyFromGroup('opponentStrums',2,'alpha',0)
	setPropertyFromGroup('opponentStrums',3,'alpha',0)
	end

function onDestroy()
	if keepScroll == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
	elseif keepScroll == true then
		keepScroll = false;
	end
end
