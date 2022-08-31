function onCreate()
	-- background shit

	makeLuaSprite('NM_BG', 'bendy/inky depths',-150, -500);
	scaleObject('NM_BG',1.8,1.8)
	precacheImage('bendy/inky depths')
	addLuaSprite('NM_BG',false)

	makeAnimatedLuaSprite('Fire','bendy/Fyre',600,800)
	addAnimationByPrefix('Fire','FireDance','Penis instance 1',24,true)
	objectPlayAnimation('Fire','FireDance',false)
	precacheImage('bendy/Fyre')
	scaleObject('Fire',2.2, 2.2)
	addLuaSprite('Fire',false)
	
	makeLuaSprite('BendyGround', 'bendy/nightmareBendy_foreground',-220, -100);
	precacheImage('bendy/nightmareBendy_foreground')
	scaleObject('BendyGround',2,2)




	addLuaSprite('BendyGround', false);

	BGFade = 0
	BGFadeIn = false
	if not lowQuality then
	end
end
function onUpdate()

	setProperty('NM_BG.alpha',BGFade)
	 if BGFade < 1 and BGFadeIn == true then
		BGFade = BGFade + 0.05
	end
	if BGFade > 0 and BGFadeIn == false then
		BGFade = BGFade - 0.05
	end
end
function onStepHit()
	if curStep == 1297 or curStep == 2064 then

	 BGFadeIn = true
	end
	if curStep == 1860 then
	 BGFadeIn = false
	end
	if curStep == 3216 then
		doTweenY('FireUp', 'Fire',-100, 10, 'QuartOut')

	end
end