function onCreate()
  BlackSansEffect = 0
  makeLuaSprite('Black','',0,0)
  makeGraphic('Black',screenWidth,screenHeight,'000000')
  setObjectCamera('Black','hud')

	makeLuaSprite('SansAltBG','sans/Waterfall',-450,-100)
	scaleObject('SansAltBG',1.55,1.5)

  makeLuaSprite('White','sans/white',-450,0)
  scaleObject('White',1.55,1.5)
  setScrollFactor('White',0,1)

  makeLuaSprite('BlackUp','sans/Black1',0,-150)
  makeGraphic('BlackUp',screenWidth,115,'000000')
  setObjectCamera('BlackUp','other')

  makeLuaSprite('BlackDown','',0,screenHeight)
  makeGraphic('BlackDown',screenWidth,115,'000000')
  setObjectCamera('BlackDown','other')
end

function onStepHit()

  if curStep == 767 or curStep == 1276 then
    
    playSound('sans/countdown')
    addLuaSprite('Black',false)
    BlackSansEffect = 1
  end

  if curStep >= 769 and BlackSansEffect  == 1 and curStep < 1276  or curStep >= 1278 and BlackSansEffect == 1 then
    
    playSound('sans/countdown')
    removeLuaSprite('Black',false)
    BlackSansEffect = 0
  end

  if curStep == 900 or curStep == 1791 then
    addLuaSprite('BlackUp',true)
    addLuaSprite('BlackDown',true)
    doTweenY('Black1FadeIn','BlackUp',0,2,'QuartOut')
    doTweenY('Black2FadeIn','BlackDown',screenHeight - 115,2,'QuartOut')
    for i = 0,7 do
      if not downscroll then
        noteTweenY('coolMoviment'..i, i, 120, 2, 'QuartOut')
       else
         noteTweenY('coolMoviment'..i, i, 490, 2, 'QuartOut')
       end
    triggerEvent('Set Cam Zoom',1.1,2)
    end
  end

  if curStep == 1152 then
    doTweenY('Black1FadeOut','BlackUp',-150,2,'QuartOut')
    doTweenY('Black2FadeOut','BlackDown',screenHeight,2,'QuartOut')
    for i = 0,7 do
      triggerEvent('Set Cam Zoom',0.9,2)
      if not downscroll then
       noteTweenY('coolMoviment'..i, i, 50, 2, 'QuartOut')
      else
        noteTweenY('coolMoviment'..i, i, screenHeight - 150, 2, 'QuartOut')
      end
    end
  end

  if curStep == 768 then
    removeLuaSprite('SansBG',false)
    addLuaSprite('SansAltBG',false)
  end
  if curStep == 1277 then
    removeLuaSprite('SansAltBG',false)
    addLuaSprite('SansBG',false)
  end

  if curStep == 1791 then
    addLuaSprite('White',false)
    setProperty('White.alpha',0)
    
    doTweenColor('bfColorTween', 'boyfriend', '000000', 1, 'linear')
    doTweenColor('dadColorTween', 'dad', '000000', 1, 'linear')
    triggerEvent('Set Cam Zoom',1.1,2)
  end

  if curStep == 2048 then

    removeLuaSprite('BlackUp',true)
    removeLuaSprite('BlackDown',true)
    removeLuaSprite('White',true)
  
    doTweenColor('bfColorTween', 'boyfriend', 'FFFFFF', 0.01, 'linear')
    doTweenColor('dadColorTween', 'dad', 'FFFFFF', 0.01, 'linear')
    for i = 0,7 do
      if not downscroll then
        noteTweenY('coolMoviment'..i, i, 50, 0.01, 'QuartOut')
       else
         noteTweenY('coolMoviment'..i, i, screenHeight - 150, 0.01, 'QuartOut')
       end
    end

    triggerEvent('Set Cam Zoom',0.9,'')
  end
end

function onUpdate(elapsed)
  if getProperty('White.alpha') < 1 then
    setProperty('White.alpha',getProperty('White.alpha') + 0.01)
  end
end

function onTweenCompleted(tag)
  if tag == 'Black1FadeOut' then
    removeLuaSprite('BlackUp',false)
  end

  if tag == 'Black2FadeOut' then
    removeLuaSprite('BlackDown',false)
  end
end