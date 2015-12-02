--This is C0nW0nk's Script, I have modified it to allow easier manipulation of the variables--
--github.com/C0nw0nk--


--Anti Recoil. (Lets make you look up,down,horizontal,vertical when shooting.)
--Primary.Recoil
--Primary.KickDown
--Primary.KickUp
--Primary.KickHorizontal
--Primary.KickVertical
--Secondary.Recoil
--Secondary.KickDown
--Secondary.KickUp
--Secondary.KickHorizontal
--Secondary.KickVertical

hook.Add("StartCommand", "StartCommand-Anti-Recoil", function(pl, key)
	--If player is holding down their attack keys
	
    --Defines modifer to increase/decrease recoil 
    --Increase for more recoil, decrease for less
         modifer = 1
        
    --Change to 1 to enable advanced functions such as the ability to change
    --weapon recoils per type instead of global
    --Set to 0 by default to reduce server load
         advancedfunctions = 0
        
        
    --Checks to see if advanced functions are enabled    
if advancedfunctions = 1 then     
    --This allows you to fine-tune recoil if you felt the need to
    --Changing a value to something other than 0 will make it overwrite the global modifer (Only for the one changed, not all of them)
        
        --Primary Kickup Recoil (If the method is Kickup)
         recoilValuePrimaryKickUpModifer = 0
        
        --Primary KickDown Recoil (If the method is Kickdown)
         recoilValuePrimaryKickDownModifer = 0
        
        --Primary Recoil Recoil (If the method is recoil)
         recoilValuePrimaryRecoilModifer = 0
        
        --Secondary Kickup Recoil (If the method is Kickup)
         recoilValueSecondaryKickUpModifer = 0
        
         --Secondary KickDown Recoil (If the method is KickDown)
         recoilValueSecondaryKickDownModifer = 0
        
         --Secondary Recoil Recoil (If the method is Recoil)
         recoilValueSecondaryRecoilModifer = 0
            
        --Defining the values for primary weapon recoil
    if pl:GetActiveWeapon().Primary.KickUp then --If the method is KickUp
        if recoilValuePrimaryKickupModifer = 0 then -- If the modifer for this type was set above (if 0 then global modifier is used)
             recoilValuePrimaryKickUp = pl:GetActiveWeapon().Primary.KickUp * modifer
        else 
             recoilValuePrimaryKickUp = pl:GetActiveWeapon().Primary.KickUp * recoilValuePrimaryKickUpModifer
        end
     end
        
    if pl:GetActiveWeapon().Primary.KickDown then --If the method is KickDown
        if recoilValuePrimaryKickDownModifer = 0 then -- If the modifer for this type was set above (if 0 then global modifier is used)
             recoilValuePrimaryKickDown = pl:GetActiveWeapon().Primary.KickDown * modifer
        else 
             recoilValuePrimaryKickDown = pl:GetActiveWeapon().Primary.KickDown * recoilValuePrimaryKickDownModifer
        end
    end
        
    if pl:GetActiveWeapon().Primary.Recoil then --If the method is Recoil   
        if recoilValuePrimaryRecoilModifer = 0 then -- If the modifer for this type was set above (if 0 then global modifier is used)
             recoilValuePrimaryRecoil = pl:GetActiveWeapon().Primary.Recoil * modifer
        else 
             recoilValuePrimaryRecoil = pl:GetActiveWeapon().Primary.Recoil * recoilValuePrimaryRecoilModifer
        end
    end    
        --Defining the values for secondary weapon recoil
    if pl:GetActiveWeapon().Secondary.KickUp then --If the method is KickUp
                if recoilValueSecondaryKickupModifer = 0 then -- If the modifer for this type was set above (if 0 then global modifier is used)
             recoilValueSecondaryKickUp = pl:GetActiveWeapon().Secondary.KickUp * modifer
        else 
             recoilValueSecondaryKickUp = pl:GetActiveWeapon().Secondary.KickUp * recoilValueSecondaryKickUpModifer
        end
    end
        
    if pl:GetActiveWeapon().Secondary.KickDown then --If the method is KickDown
        if recoilValueSecondaryKickDownModifer = 0 then -- If the modifer for this type was set above (if 0 then global modifier is used)
             recoilValueSecondaryKickDown = pl:GetActiveWeapon().Secondary.KickDown * modifer
        else 
             recoilValueSecondaryKickDown = pl:GetActiveWeapon().Secondary.KickDown * recoilValueSecondaryKickDownModifer
        end
    end
        
    if pl:GetActiveWeapon().Secondary.Recoil then --If the method is Recoil
        if recoilValueSecondaryRecoilModifer = 0 then -- If the modifer for this type was set above (if 0 then global modifier is used)
             recoilValueSecondaryRecoil = pl:GetActiveWeapon().Secondary.Recoil * modifer
        else 
             recoilValueSecondaryRecoil = pl:GetActiveWeapon().Secondary.Recoil * recoilValueSecondaryRecoilModifer
        end
    end   
       
else
                    
     recoilValuePrimaryKickUp = pl:GetActiveWeapon().Primary.KickUp * modifer
     recoilValuePrimaryKickDown = pl:GetActiveWeapon().Primary.KickDown * modifer
     recoilValuePrimaryRecoil = pl:GetActiveWeapon().Primary.Recoil * modifer        
     recoilValueSecondaryKickUp = pl:GetActiveWeapon().Secondary.KickUp * modifer
     recoilValueSecondaryKickDown = pl:GetActiveWeapon().Secondary.KickDown * modifer
     recoilValueSecondaryRecoil = pl:GetActiveWeapon().Secondary.Recoil * modifer           
end
                 
             
	--If the player is using primary attack and the clip on their weapon is greater than 0 (not empty) and if the player is alive.
	if pl:KeyDown(IN_ATTACK) and pl:GetActiveWeapon():Clip1() > 0 and pl:Alive() then
		--If the weapon they are holding has a recoil method attached to it by the SWEP.
		--If the recoil method is kickup.
		if pl:GetActiveWeapon().Primary.KickUp then
			--Force the player to look up while primary firing.
			pl:SetEyeAngles( pl:EyeAngles() +  Angle(-recoilValueKickUp,0,0) ) --Angle (Up,Down | Left,Right | Screen rotate)
		end
		
		--If the recoil method is kickdown.
		if pl:GetActiveWeapon().Primary.KickDown then
			--Force the player to look down while primary firing.
			pl:SetEyeAngles( pl:EyeAngles() +  Angle(recoilValueKickDown,0,0) ) --Angle (Up,Down | Left,Right | Screen rotate)
		end
		
		--If the recoil method is recoil.
		if pl:GetActiveWeapon().Primary.Recoil then
			--Force the player to look down while primary firing.
			pl:SetEyeAngles( pl:EyeAngles() +  Angle(recoilValueKickRecoil,0,0) ) --Angle (Up,Down | Left,Right | Screen rotate)
		end
	end
       
            
            
            
            
	--If the player is using secondary attack and the clip on their weapon is greater than 0 (not empty) and if the player is alive.
	if pl:KeyDown(IN_ATTACK2) and pl:GetActiveWeapon():Clip1() > 0 and pl:Alive() then
		--If the weapon they are holding has a recoil method attached to it by the SWEP.
		--If the recoil method is kickup.
		if pl:GetActiveWeapon().Secondary.KickUp then
			--Force the player to look up secondary firing.
			pl:SetEyeAngles( pl:EyeAngles() +  Angle(-recoilValueSecondaryKickUp,0,0) ) --Angle (Up,Down | Left,Right | Screen rotate)
		end
		
		--If the recoil method is kickdown.
		if pl:GetActiveWeapon().Secondary.KickDown then
			--Force the player to look down while secondary firing.
			pl:SetEyeAngles( pl:EyeAngles() +  Angle(recoilValueSecondaryKickDown,0,0) ) --Angle (Up,Down | Left,Right | Screen rotate)
		end
		
		--If the recoil method is recoil.
		if pl:GetActiveWeapon().Secondary.Recoil then
			--Force the player to look down while secondary firing.
			pl:SetEyeAngles( pl:EyeAngles() +  Angle( recoilValueSecondaryKickRecoil,0,0) ) --Angle (Up,Down | Left,Right | Screen rotate)
		end
	end
end)

--End Anti Recoil.
