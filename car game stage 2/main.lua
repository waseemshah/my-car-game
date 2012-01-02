local physics = require "physics"
system.activate( "multitouch" )
physics.start()
display.setStatusBar( display.HiddenStatusBar )
--local variable
local angle=0;
local car_speed=50;
local car_angel=0;
local car2_speed=60;
local car2_angel=0;
local car2_round=0;
local car3_speed=75;
local car3_angel=0;
local car4_speed=100;
local car4_angel=0;
local car4_round=0;
local vx,vy=0,-35;
local speed=65;
local prevPoint = {x = 0, y = 0}
local collidehome=false;
local speedx =0;
local speedy=0;
local speedx1 =0;
local speedy1=0;
local colidergt=true
local stopmycar=false;
local turn=false;
local getspeed = {x = 0, y = 0}
local getspeedofcar1 = {x = 0, y = 0}
local getspeedofcar2 = {x = 0, y = 0}
local getspeedofcar3 = {x = 0, y = 0}
local getspeedofcar4 = {x = 0, y = 0}
local carmove1=true;
local carmove2=true;
local carmove3=true;
local carmove4=true;

local collisionFiltercar = { maskBits = 6  ,categoryBits = 1  }
local collisionFiltermycar = { maskBits = 5 ,categoryBits = 2   }
local collisionFilterhome = { maskBits = 3  ,categoryBits = 4  }

-- physics.addBody(object1, {bounce = .2, density = 1, filter = collisionFilter})
-- physics.addBody(object2, {bounce = .2, density = 1, filter = collisionFilter})


-- Camera
local camera = require ("camera")
camera = Camera:new()
--home boundry
local home1=display.newImage("gfx/homwlft.png",0,0);
home1.name="home"
local home2=display.newImage("gfx/homeup.png");
home2.name="home"
local home3=display.newImage("gfx/homergt1.png",1423,95);
home3.name="home"
local home4=display.newImage("gfx/homergt2.png",1859,231);
home4.name="home"
local home5=display.newImage("gfx/homedown1.png",1720,1075);
home5.name="home"
local home6=display.newImage("gfx/homedown2.png",1200,715);
home6.name="home"
local home7=display.newImage("gfx/homedown3.png",177,1077);
home7.name="home"
local home8=display.newImage("gfx/homecenter.png",1196,472);
home8.name="home"
local home9=display.newImage("gfx/homecenteruper.png",273,212);
home9.name="home"
local home10=display.newImage("gfx/lftcenter.png",323,619);
home10.name="home"
local home11=display.newImage("gfx/lftcenter2.png",376,892);
home10.name="home"
local home12=display.newImage("gfx/lftcenter3.png",850,720);
home10.name="home"
local home13=display.newImage("gfx/mid.png",291,350);
home13.name="home"
local home14=display.newImage("gfx/middown1.png",327,469);
home14.name="home"
local home15=display.newImage("gfx/middown2.png",678,470);
home15.name="home"
local home16=display.newImage("gfx/middown3.png",520,470);
home16.name="home"
local home17=display.newImage("gfx/middown4.png",520,470);
home17.name="home"
local home18=display.newImage("gfx/middown5.png",680,470);
home18.name="home"

--image load
local road=display.newImage("gfx/road2final2.png");
road.name="road"
local car_1=display.newImage("gfx/car1.png" ,335,255);
car_1.name="car1"
local car_2=display.newImage("gfx/car2.png" ,253,909);
car_2.name="car2"
local car_3=display.newImage("gfx/car3.png" ,1707,360);
car_3.name="car3"
local car_4=display.newImage("gfx/car4.png" ,1707,415);
car_4.name="car4"
local mycar=display.newImage("gfx/mycar.png" ,1755,935);
mycar.name="mycar"
local Finish=display.newImage("gfx/Finish.png" ,570,570);
Finish.name="Finish"
local lifeempty=display.newImage("gfx/lifeempty.png" ,50,10);
lifeempty.name="lifeempty"
lifeempty.isVisible=false
local lifefull1=display.newImage("gfx/lifefull.png" ,1607,750);
lifefull1.name="lifeempty"
local lifefull2=display.newImage("gfx/lifefull.png" ,1647,750);
lifefull2.name="lifeempty2"
local lifefull3=display.newImage("gfx/lifefull.png" ,1687,750);
lifefull3.name="lifefull3"




-- add physics body
physics.addBody( car_1, "dynamic", { friction=0, bounce=0 , filter = collisionFiltercar} )
physics.addBody( car_2, "dynamic", { friction=0, bounce=0 , filter = collisionFiltercar} )
physics.addBody( car_3, "dynamic", { friction=0, bounce=0 , filter = collisionFiltercar} )
physics.addBody( car_4, "dynamic", { friction=0, bounce=0 , filter = collisionFiltercar} )
physics.addBody( mycar, "dynamic", { friction=0, bounce=0 , filter = collisionFiltermycar} )
physics.addBody( Finish, "static", { friction=0, bounce=0 } )
physics.addBody( home1, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home2, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home3, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home4, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home5, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home6, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home7, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home8, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home9, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home10, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home11, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home12, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home13, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home14, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home15, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home16, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home17, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( home18, "static", { friction=0, bounce=0 , filter = collisionFilterhome} )
physics.addBody( lifeempty, "static", { friction=0, bounce=0 , filter = collisionFiltercar} )
physics.addBody( lifefull1, "static", { friction=0, bounce=0 , filter = collisionFiltercar} )
physics.addBody( lifefull2, "static", { friction=0, bounce=0 , filter = collisionFiltercar} )
physics.addBody( lifefull3, "static", { friction=0, bounce=0 , filter = collisionFiltercar} )


physics.setGravity( 0, 0 )
car_1:setLinearVelocity( car_speed, 0 )
car_2:setLinearVelocity(  0,-car2_speed )
car_3:setLinearVelocity(  -car3_speed ,0)
car_4:setLinearVelocity(  -car4_speed ,0)

--Add Camera Object
camera:addObject(road)
camera:addObject(car_1)
camera:addObject(car_2)
camera:addObject(car_3)
camera:addObject(car_4)
camera:addObject(mycar)
camera:addObject(Finish)
camera:addObject(home1)
camera:addObject(home2)
camera:addObject(home3)
camera:addObject(home4)
camera:addObject(home5)
camera:addObject(home6)
camera:addObject(home7)
camera:addObject(home8)
camera:addObject(home9)
camera:addObject(home10)
camera:addObject(home11)
camera:addObject(home12)
camera:addObject(home13)
camera:addObject(home14)
camera:addObject(home15)
camera:addObject(home16)
camera:addObject(home17)
camera:addObject(home18)
camera:addObject(lifeempty)
camera:addObject(lifefull1)
camera:addObject(lifefull2)
camera:addObject(lifefull3)




local listenercar1 = function( obj )
      car_1 .bodyType="dynamic"
		car_1:setLinearVelocity( getspeedofcar1.x ,getspeedofcar1.y)
		carmove1=true
end

local listenercar2 = function( obj )
       car_2 .bodyType="dynamic"
		car_2:setLinearVelocity( getspeedofcar2.x ,getspeedofcar2.y)
		carmove2=true
end

local listenercar3 = function( obj )
       car_3 .bodyType="dynamic"
		car_3:setLinearVelocity( getspeedofcar3.x ,getspeedofcar3.y)
		carmove3=true
end

local listenercar4 = function( obj )
       car_4 .bodyType="dynamic"
		car_4:setLinearVelocity( getspeedofcar4.x ,getspeedofcar4.y)
		carmove4=true
		
end

local myListener = function( event )

		camera:setPosition(mycar.x,mycar.y)


		--car 1 set position
		if   (car_1.x  < 1370 and car_1.x > 1360 ) and car_angel == 0 then
			car_1:rotate(-90)
			car_1:setLinearVelocity( 0, -car_speed )
			car_angel=90
			getspeedofcar1.x ,getspeedofcar1.y = car_1:getLinearVelocity()
		else if   (car_1.y  < 175 and car_1.y > 165 ) and car_angel == 90  then 
					car_1:rotate(-90)
					car_1:setLinearVelocity(-car_speed, 0 )
					car_angel=180
					getspeedofcar1.x ,getspeedofcar1.y = car_1:getLinearVelocity()
				else if   (car_1.x  < 240 and car_1.x > 230 ) and car_angel == 180  then 
						car_1:rotate(-90)
						car_1:setLinearVelocity(0, car_speed )
						car_angel=270
						getspeedofcar1.x ,getspeedofcar1.y = car_1:getLinearVelocity()
						else if   (car_1.y  < 275 and car_1.y > 265 ) and car_angel == 270  then 
						car_1:rotate(-90)
						car_1:setLinearVelocity(car_speed, 0 )
						car_angel=0
						getspeedofcar1.x ,getspeedofcar1.y = car_1:getLinearVelocity()
		
		
						end
		
				end
		
			end
		end


		-- car 2 set position
		
		
		if  (car_2.y < 565   and car_2.y>555 ) and car2_angel==0 then
				car_2:rotate(90)
				car_2:setLinearVelocity(car2_speed, 0 )
				car2_angel=90
				getspeedofcar2.x ,getspeedofcar2.y = car_2:getLinearVelocity()
			else 	if  (car_2.x<425   and car_2.x>415 ) and car2_angel==90 then
						car_2:rotate(90)
						car_2:setLinearVelocity(0, car2_speed )
						car2_angel=180
						getspeedofcar2.x ,getspeedofcar2.y = car_2:getLinearVelocity()
					else 	if  (car_2.y<805   and car_2.y>795 ) and car2_angel==180 then
								car_2:rotate(-90)
								car_2:setLinearVelocity(car2_speed, 0 )
								car2_angel=270
								getspeedofcar2.x ,getspeedofcar2.y = car_2:getLinearVelocity()
								else 	if  (car_2.x<760   and car_2.x>750 ) and car2_angel==270 then
											car_2:rotate(-90)
											car_2:setLinearVelocity(0, -car2_speed )
											car2_angel=360
											getspeedofcar2.x ,getspeedofcar2.y = car_2:getLinearVelocity()
										else 	if  (car_2.y<670   and car_2.y>660 ) and car2_angel==360 then
													car_2:rotate(90)
													car_2:setLinearVelocity(car2_speed, 0 )
													car2_angel=450
													getspeedofcar2.x ,getspeedofcar2.y = car_2:getLinearVelocity()
												else 	if  (car_2.x<1095   and car_2.x>1085 ) and car2_angel==450 then
															car_2:rotate(90)
															car_2:setLinearVelocity(0, car2_speed )
															car2_angel=500
															getspeedofcar2.x ,getspeedofcar2.y = car_2:getLinearVelocity()
														else 	if  (car_2.y<1000   and car_2.y>990 ) and car2_angel==500 then
																
																if  car2_round==3 then   
																
																car_2:setLinearVelocity(-75, 0 )
																car2_round=0
																getspeedofcar2.x ,getspeedofcar2.y = car_2:getLinearVelocity()
																else
																car_2:setLinearVelocity(-car2_speed, 0 )
																print(car2_round);
																car2_round=car2_round + 1;
																getspeedofcar2.x ,getspeedofcar2.y = car_2:getLinearVelocity()
																end
																car_2:rotate(90)
																
																car2_angel=550
																else 	if  (car_2.x<270   and car_2.x>260 ) and car2_angel==550 then
																			car_2:rotate(90)
																			car_2:setLinearVelocity(0, -car2_speed )
																			car2_angel=0
																			getspeedofcar2.x ,getspeedofcar2.y = car_2:getLinearVelocity()
													
																		end
															end
													end
										end
										
										end
							end
				
					end
		end
		
		
		--car 3 set position
		
		if   (car_3.x  < 225 and car_3.x > 215 ) and car3_angel == 0  then 
						car_3:rotate(-90)
						car_3:setLinearVelocity(0, car3_speed )
						car3_angel=90
						getspeedofcar3.x ,getspeedofcar3.y = car_3:getLinearVelocity()
		else  if   (car_3.y  < 1045 and car_3.y > 1035 ) and car3_angel == 90  then 
						car_3:rotate(-90)
						car_3:setLinearVelocity( car3_speed ,0)
						car3_angel=180
						getspeedofcar3.x ,getspeedofcar3.y = car_3:getLinearVelocity()
				else  if   (car_3.x  < 1155 and car_3.x > 1145 ) and car3_angel == 180  then 
							car_3:rotate(-90)
							car_3:setLinearVelocity( 0,-car3_speed )
							car3_angel=270
							getspeedofcar3.x ,getspeedofcar3.y = car_3:getLinearVelocity()
						else  if   (car_3.y  < 670 and car_3.y > 660 ) and car3_angel == 270  then 
									car_3:rotate(90)
									car_3:setLinearVelocity( car3_speed,0 )
									car3_angel=360
									getspeedofcar3.x ,getspeedofcar3.y = car_3:getLinearVelocity()
								else  if   (car_3.x  < 1815 and car_3.x > 1805 ) and car3_angel == 360  then 
											car_3:rotate(-90)
											car_3:setLinearVelocity( 0,-car3_speed )
											car3_angel=450
											getspeedofcar3.x ,getspeedofcar3.y = car_3:getLinearVelocity()
										else  if   (car_3.y  < 385 and car_3.y > 375 ) and car3_angel == 450  then 
													car_3:rotate(-90)
													car_3:setLinearVelocity( -car3_speed ,0)
													car3_angel=0
													getspeedofcar3.x ,getspeedofcar3.y = car_3:getLinearVelocity()
													
											end
									
									end
								end
					end
		
			end
		
		end
		
		--car 4 position set
		if   (car_4.x  < 1085 and car_4.x > 1080 ) and car4_angel == 0  then 
				car_4:setLinearVelocity( 0,car4_speed )
				car_4:rotate(-90)
				car4_angel=90
				getspeedofcar4.x ,getspeedofcar4.y = car_4:getLinearVelocity()
				
		else if   (car_4.y  < 985 and car_4.y > 980 ) and car4_angel == 90  then 
					
					
					car_4:rotate(90)
					car_4:setLinearVelocity( -car4_speed,0 )
					car4_angel=180
					getspeedofcar4.x ,getspeedofcar4.y = car_4:getLinearVelocity()
			else if   (car_4.x  < 270 and car_4.x > 260 ) and car4_angel == 180  then 
						car_4:rotate(90)
						car_4:setLinearVelocity( 0,-car4_speed)
						car4_angel=270
						getspeedofcar4.x ,getspeedofcar4.y = car_4:getLinearVelocity()
				else if   (car_4.y  < 565 and car_4.y > 555 ) and car4_angel == 270  then 
						car_4:rotate(90)
						car_4:setLinearVelocity( car4_speed,0)
						car4_angel=360
						getspeedofcar4.x ,getspeedofcar4.y = car_4:getLinearVelocity()
					else 	if  (car_4.x<425   and car_4.x>415 ) and car4_angel==360 then
								car_4:rotate(90)
								car_4:setLinearVelocity(0, car4_speed )
								car4_angel=450
								getspeedofcar4.x ,getspeedofcar4.y = car_4:getLinearVelocity()
							else 	if  (car_4.y<805   and car_4.y>795 ) and car4_angel==450 then
										car_4:rotate(-90)
										car_4:setLinearVelocity(car4_speed, 0 )
										car4_angel=500
										getspeedofcar4.x ,getspeedofcar4.y = car_4:getLinearVelocity()
									else 	if  (car_4.x<760   and car_4.x>750 ) and car4_angel==500 then
													car_4:rotate(-90)
													car_4:setLinearVelocity(0, -car4_speed )
													car4_angel=550
													getspeedofcar4.x ,getspeedofcar4.y = car_4:getLinearVelocity()
											else 	if  (car_4.y<670   and car_4.y>660 ) and car4_angel==550 then
															car_4:rotate(90)
															car_4:setLinearVelocity(125, 0 )
															car4_angel=600
															getspeedofcar4.x ,getspeedofcar4.y = car_4:getLinearVelocity()
															else  if   (car_4.x  < 1815 and car_4.x > 1805 ) and car4_angel == 600  then 
																			car_4:rotate(-90)
																			car_4:setLinearVelocity( 0,-77 )
																			car4_angel=650
																			getspeedofcar4.x ,getspeedofcar4.y = car_4:getLinearVelocity()
																	else  if   (car_4.y  < 435 and car_4.y > 430 ) and car4_angel == 650  then 
																					car_4:rotate(-90)
																					car_4:setLinearVelocity( -car4_speed ,0)
																					car4_angel=0
																					getspeedofcar4.x ,getspeedofcar4.y = car_4:getLinearVelocity()
													
																			end
									
																	end
													end
											end
									end
							end
					end		
													
			end
		end
	end
	
	getspeed.x ,getspeed.y = mycar:getLinearVelocity( )
	if (car_1 .bodyType=="static" and (getspeed.x ~=0 or getspeed.y ~=0 ))then
		
		print("Speed  of x  "..getspeedofcar1.x )
		print("Speed  of y  "..getspeedofcar1.y )
	transition.to( car_1, { time=1200, onComplete=listenercar1 })
		
	
	else if (car_2 .bodyType=="static" and (getspeed.x ~=0 or getspeed.y ~=0 ))then
	
			
			print("Speed of  x  "..getspeedofcar2.x )
			print("Speed  of y  "..getspeedofcar2.y )
				transition.to( car_2, { time=1200, onComplete=listenercar2 })
			-- car_2:setLinearVelocity( getspeedofcar2.x ,getspeedofcar2.y)
		else if (car_3 .bodyType=="static" and (getspeed.x ~=0 or getspeed.y ~=0 ))then
					
					print("Speed of x  "..getspeedofcar3.x )
					print("Speed of y  "..getspeedofcar3.y )
						transition.to( car_3, { time=1200, onComplete=listenercar3 })
					-- car_3:setLinearVelocity(getspeedofcar3.x ,getspeedofcar3.y )
	
				else if (car_4 .bodyType=="static" and (getspeed.x ~=0 or getspeed.y ~=0 ))then
							
							print("Speed of  x  "..getspeedofcar4.x )
							print("Speed  of y  "..getspeedofcar4.y )
								transition.to( car_4, { time=1200, onComplete=listenercar4 })
							
	
				end	
			end
		end
	end
	--[[
			
			if  mycar.bodyType=="static" then
				if (angle == 90 or angle == -270 )then
						print("my car angle 90")
				else if (angle == 270 or angle == -90) then
							print("my car angle 270")
						else if (angle == 360 or angle == 0 or angle==-360 )then
						
								print("my car angle 0")
							else   if (angle == 180 or angle == -180) then
										print("my car angle 180")
									end
							end
							
					end
			end
				transition.to( mycar, { time=100, rotation =angle +180  }) 
			
			
			
			end
		]]	
			
			
end



local listener_rgt = function( obj )
        -- print( "Transition 2 completed on object: " .. tostring( obj ) )
				

		mycar:setLinearVelocity( speed, 0 )
		  if angle == 360 or angle== -360 then
		 angle = 0
		 -- print(angle)
		 end
		 -- print(angle)
end

local listener_lft = function( obj )
        -- print( "Transition 2 completed on object: " .. tostring( obj ) )
		
		 if angle == 360 or angle== -360 then
		 angle = 0
		 -- print(angle)
		 end
		mycar:setLinearVelocity( -speed, 0 )
		-- print(angle)
end

local listener_dwn = function( obj )
        -- print( "Transition 2 completed on object: " .. tostring( obj ) )
		
		
		
		mycar:setLinearVelocity( 0, speed )
		 if angle == 360 or angle== -360 then
		 angle = 0
		 -- print(angle)
		 end
		-- print(angle)
end

local listener_up = function( obj )
       -- print( "Transition 2 completed on object: " .. tostring( obj ) )


		mycar:setLinearVelocity( 0, -speed )
		 if angle == 360 or angle== -360 then
		 angle = 0
		-- print(angle)
		 end
		
end


local function onTouch( event )
		
--print(event.y)
	if  event.phase == "began" then
	
		prevPoint.x = event.x
		prevPoint.y = event.y
	
	
	else  if  event.phase == "moved"  then
			-- print("aliaaaa")
				speedx , speedy =mycar:getLinearVelocity()
				
			
	
		else   if  event.phase == "ended"   then
					speedx , speedy =mycar:getLinearVelocity()
					
					--print(speedx)
						--print(speedy)
						
						if  speedy < 0 then
							if event.x > prevPoint.x then
								if   speedy < 0 then
										angle = angle +90
								else
										angle = angle -90
								end
								transition.to( mycar, { time=100, rotation =angle   , onComplete=listener_rgt  }) 
								if angle == 360 or angle== -360 then
									angle = 0
									-- print(angle)
								end
							else if  event.x < prevPoint.x  then
									if   speedy < 0 then
											angle = angle  - 90
									else
											angle = angle +90
									end
									
									transition.to( mycar, { time=100, rotation =angle    , onComplete=listener_lft  }) 
									if angle == 360 or angle== -360 then
									angle = 0
									-- print(angle)
								end
								end
							end
						
						elseif speedy > 0 then
						
								if event.x > prevPoint.x then
										if   speedy < 0 then
												angle = angle +90
										else
												angle = angle -90
										end
										
									transition.to( mycar, { time=100, rotation =angle   , onComplete=listener_rgt  }) 
									if angle == 360 or angle== -360 then
									angle = 0
									-- print(angle)
								end
							else if  event.x < prevPoint.x  then
										if   speedy < 0 then
													angle = angle  - 90
										else
													angle = angle +90
										end
										
									transition.to( mycar, { time=100, rotation = angle    , onComplete=listener_lft  }) 
									if angle == 360 or angle== -360 then
									angle = 0
									-- print(angle)
								end
								end
							end
							
						end
						
						if  speedx < 0 then
							if event.y > prevPoint.y then
								if   speedx > 0 then
											angle = angle +90
								else
											angle = angle -90
								end
								
								transition.to( mycar, { time=100, rotation =angle   , onComplete=listener_dwn  }) 
								if angle == 360 or angle== -360 then
									angle = 0
									-- print(angle)
								end
								
							else if  event.y < prevPoint.y  then
									if   speedx > 0 then
											angle = angle -90
									else
											angle = angle +90
									end		
									
									transition.to( mycar, { time=100, rotation = angle   , onComplete=listener_up  }) 
									if angle == 360 or angle== -360 then
									angle = 0
									-- print(angle)
								end
								end
							end
						
						elseif speedx > 0 then
								if event.y > prevPoint.y then
									if   speedx > 0 then
				
										angle = angle +90
				
									else
				
										angle = angle -90
									end
									
								transition.to( mycar, { time=100, rotation =angle  , onComplete=listener_dwn  }) 
								if angle == 360 or angle== -360 then
									angle = 0
									-- print(angle)
								end
							else if  event.y < prevPoint.y  then
									if   speedx > 0 then
				
										angle = angle -90
				
									else
				
										angle = angle +90
									end		
									
									transition.to( mycar, { time=100, rotation = angle  , onComplete=listener_up  }) 
									if angle == 360 or angle== -360 then
									angle = 0
									-- print(angle)
								end
								end
							end
						
						end
					
 				end
		end
	end
 
 end
 
 
 
 
 local l_p = function( obj )
	angle= angle +180       
	  
		if angle >= 360 then
			angle=angle-360
		else if angle <= -360 then
				angle=angle+360
			else  
				angle=angle;
			end
		end
		if  ( angle ==0 or angle == 360 or angle== -360 )then
			
				mycar:setLinearVelocity( 0, -35 )
		else if (angle==90 or angle== -270  )then
		
				mycar:setLinearVelocity( 35, 0 )
			else if (angle==-90 or angle== 270) then
					
						mycar:setLinearVelocity( -35, 0 )
				else if( angle==180 or angle == -180 )then
						
							mycar:setLinearVelocity( 0, 35 )
					end
				end
			end
		end
 print(angle)
			collidehome = false
	stopmycar=false;
		
end
 
 
 
 local buttonListener = function( event )

	if  event.phase == "moved" then
			
	else if   event.phase == "ended" then
				if stopmycar== true and collidehome == true and mycar.bodyType=="static" then
				
					if   turn == true then
					print("KKKKKKKKKKKKKKKKKKKKKKKKKK")
					transition.to( mycar, { time=100, rotation =angle +180   }) 
					mycar:setLinearVelocity( -speedx, -speedy )
					turn = false
					else
					
					
						colidergt=true
						-- speedx=-speedx1
						-- speedy=-speedy1
						print("spedd x"..speedx)
						print("spedd y"..speedy)
						print("body type of car  "..mycar.bodyType)
						mycar.bodyType="dynamic" 
						transition.to( mycar, { time=100, rotation =angle +180    , onComplete=l_p }) 
						--mycar:setLinearVelocity( -speedx, -speedy )
					
					
			end
				else	if vx == 0 and vy == 0 then
							vx ,vy = mycar:getLinearVelocity();
							mycar:setLinearVelocity( 0, 0 )
								print("123456789123456789")
						else
							mycar:setLinearVelocity( vx, vy )
							vx=0;
							vy=0;
							print("ASDFGHJKL")
							
						end
					
						print("speed x   "..speedx)
						
						print("speed y    "..speedy)
						print("My ha")
				end
	end
end
end




 local function myBatPostCollisionFunction( self, event )
 speedx1 , speedy1 =mycar:getLinearVelocity()
 if (event.other.name == "home") then
		-- speedx1 , speedy1 =mycar:getLinearVelocity()
		
		-- mycar:setLinearVelocity(0,0)
				if (colidergt==true and collidehome ==false ) then 
						print("Colide")
					stopmycar=true
					collidehome = true
					colidergt=false;
					mycar.bodyType="static"
				end						
  else  if (event.other.name == "car1"  )  then
			
			turn =true
			if    carmove1==true  then
			mycar.bodyType="static"
			end
			
			car_1.bodyType="static"
			-- car_1:setLinearVelocity(0, 0 )
			carmove1=false;
			collidehome = true
			stopmycar=true
			else  if (event.other.name == "car2"  )  then
						turn =true
						
						-- getspeedofcar.x ,getspeedofcar.y = car_2:getLinearVelocity()
						-- car_2:setLinearVelocity( 0, 0 )
						car_2.bodyType="static"
						if    carmove2==true  then
								mycar.bodyType="static"
						end
						
						collidehome = true
						stopmycar=true
						carmove2=false;
					else  if (event.other.name == "car3" )  then
								turn =true
								
								-- getspeedofcar.x ,getspeedofcar.y = car_3:getLinearVelocity()
								-- car_3:setLinearVelocity( 0, 0 )
								car_3.bodyType="static"
							if    carmove3==true  then
								mycar.bodyType="static"
							end
								
								collidehome = true
								stopmycar=true
								carmove3=false;
							else  if (event.other.name == "car4" )  then
										turn =true
										
										-- getspeedofcar.x ,getspeedofcar.y = car_4:getLinearVelocity()
										-- car_4:setLinearVelocity( 0, 0 )
										car_4.bodyType="static"
										if    carmove4==true  then
											mycar.bodyType="static"
										end
									
										collidehome = true
									stopmycar=true
									carmove4=false;
								end
							end
				end
		end
 end
 
 
--[[	if (event.other.name == "Finish") then
	
		-- mycar.alpha=0.5
		car_1.alpha=0.5
		car_2.alpha=0.5
		car_3.alpha=0.5
		car_4.alpha=0.5
		
		road.alpha=0.5
		mycar.bodyType="static"
		car_1.bodyType="static"
		car_2.bodyType="static"
		car_3.bodyType="static"
		car_4.bodyType="static"
	
	-- myText.isVisible=true;
	-- myText.text="U Win ";
	
	
	
	else  
	    car_1.alpha=0.5
		car_2.alpha=0.5
		car_3.alpha=0.5
		car_4.alpha=0.5
		
		road.alpha=0.5
		mycar.bodyType="static"
	    car_1.bodyType="static"
	    car_2.bodyType="static"
	    car_3.bodyType="static"
	    car_4.bodyType="static"
		
	-- myText.isVisible=true;
	-- myText.text="Game Over";
	end
	]]     
end



-- event listener
mycar.postCollision = myBatPostCollisionFunction
mycar:addEventListener( "postCollision", mycar )
 
  Runtime:addEventListener( "touch", onTouch )
 mycar:addEventListener( "touch", buttonListener )
-- camera:setScale(0.17, 0.30)


 Runtime:addEventListener( "enterFrame", myListener )
