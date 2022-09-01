local AnotherEnemyBendyFrames = 0
local AnotherEnemyBendyFrameSpeed = 0
local AnotherEnemyBendyDirection = 1
local AnotherEnemyMaxSpeed = 0.4
local EnableAnotherEnemy = false
local AnotherEnemyBendyTime = 0
local AnotherEnemyBendyMaxTime = 1
function onCreate()

	makeAnimatedLuaSprite('PiperJumpscare','bendy/images/jumpscares/PiperJumpscare',0,0)
	addAnimationByPrefix('PiperJumpscare','Piper','Fuck uuuu instance 1',20,false)
	objectPlayAnimation('PiperJumpscare','Piper',false)
    setObjectCamera('PiperJumpscare','hud')
    addLuaSprite('PiperJumpscare',true)
    removeLuaSprite('PiperJumpscare',false)
    scaleObject('PiperJumpscare', 1.9, 1.9);
    
    
    makeAnimatedLuaSprite('AnotherEnemyBendy', 'bendy/images/jumpscares/DontmindmeImmajustwalkby',-850,-50)
    setObjectCamera('AnotherEnemyBendy','hud')
    scaleObject('AnotherEnemyBendy', 3.8, 3.8);
    addAnimationByPrefix('AnotherEnemyBendy','boo','WalkinFhis',0,true)
    addLuaSprite('AnotherEnemyBendy',true)
    setProperty('AnotherEnemyBendy.alpha',0)

end

function onUpdate()
    if EnableAnotherEnemy then
        
        setProperty('AnotherEnemyBendy.animation.curAnim.curFrame',AnotherEnemyBendyFrames)
        setProperty('AnotherEnemyBendy.alpha',1)
        AnotherEnemyBendyFrames = AnotherEnemyBendyFrames + AnotherEnemyBendyFrameSpeed 


        if AnotherEnemyBendyDirection == 1 and AnotherEnemyBendyFrameSpeed < AnotherEnemyMaxSpeed then
            AnotherEnemyBendyFrameSpeed = AnotherEnemyBendyFrameSpeed + 0.01

        elseif AnotherEnemyBendyDirection == -1 and AnotherEnemyBendyFrameSpeed > -AnotherEnemyMaxSpeed then 
            AnotherEnemyBendyFrameSpeed = AnotherEnemyBendyFrameSpeed - 0.01

        end

        if AnotherEnemyBendyDirection == 1 and AnotherEnemyBendyFrames >= 100 and AnotherEnemyBendyTime < AnotherEnemyBendyMaxTime then
            AnotherEnemyBendyDirection = -1

        elseif AnotherEnemyBendyDirection == -1 and AnotherEnemyBendyFrames <= 27 then
            AnotherEnemyBendyDirection = 1
            AnotherEnemyBendyTime = AnotherEnemyBendyTime + 1

        end
        if AnotherEnemyBendyTime >= AnotherEnemyBendyMaxTime and AnotherEnemyBendyFrames >= 130 then
            removeLuaSprite('AnotherEnemyBendy',false)
            EnableAnotherEnemy = false
        end
    end


    if AnotherEnemyBendyFrames < -AnotherEnemyMaxSpeed then
        AnotherEnemyMaxSpeed = -AnotherEnemyMaxSpeed
    elseif AnotherEnemyMaxSpeed > AnotherEnemyMaxSpeed then
        AnotherEnemyMaxSpeed = AnotherEnemyMaxSpeed
    end
end
    

function onStepHit()
    if curStep == 1023 then
        playSound('bendy/boo')
		addLuaSprite('PiperJumpscare', true);
	end
    if curStep == 2000 and not EnableAnotherEnemy then
        EnableAnotherEnemy = true
        addLuaSprite('AnotherEnemyBendy',true)
    end
end