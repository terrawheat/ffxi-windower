include('lib.lua')

SCMode = false
function user_setup()



end
-- Get Sets: Everything in this section is run as soon as you change jobs.
function get_sets()
    send_command('bind f8 gs c Skillchain')
	sets = {}
	petcast = false
	
	sets.FC = {    body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+4',}},
    neck="Orunmila's Torque",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    right_ring="Prolix Ring",
	}
	
	-- Regular Sets --
	sets.Idle = {ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+28','"Store TP"+6','DEX+9','Attack+6',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Bathy choker +1",
    waist="Ioskeha Belt",
    left_ear="Infused Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','Latent effect: "Regain"+1',}},
    left_ring="Paguroidea Ring",
    right_ring="Defending Ring",
    back="Aptitude Mantle +1",}
	
	sets.TP = {}
	sets.TP.index = {'Standard', 'Accuracy', 'Physical DT', 'Magic DT'}
	--1=Standard, 2=TPAcc, 3=PDT, 4=MDT--
	TP_ind = 1 -- Standard set is the Default

	sets.TP['Standard'] = {main="Shining One",
    sub="Tzacab Grip",
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+28','"Store TP"+6','DEX+9','Attack+6',}},
    hands={ name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
    legs={ name="Valorous Hose", augments={'Attack+14','"Store TP"+5','DEX+13','Accuracy+11',}},
    feet="Flam. Gambieras +2",
    neck="Ganesha's Mala",
    waist="Ioskeha Belt",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},}
	
	sets.TP['Accuracy'] = {}
	
	sets.TP.PDT = {
    ammo="Ginsen",
    head="Hjarrandi Helm",
    body="Emet Harness +1",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +1",
    neck="Sanctity Necklace",
    waist="Flume Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','Latent effect: "Regain"+1',}},
    right_ring="Defending Ring",
    back="Shadow Mantle", }
	
	sets.TP.MDT = {
    ammo="Ginsen",
    head="Hjarrandi Helm",
    body="Emet Harness +1",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +1",
    neck="Sanctity Necklace",
    waist="Flume Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','Latent effect: "Regain"+1',}},
    right_ring="Defending Ring",
	left_ring="Shadow Ring",}
							  
	sets.TP.Hybrid = {
    ammo="Ginsen",
    head="Hjarrandi Helm",
    body="Emet Harness +1",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Sulev. Leggings +1",
    neck="Sanctity Necklace",
    waist="Flume Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','Latent effect: "Regain"+1',}},
    right_ring="Defending Ring",
    }						  
	
	sets.TP.PetDT = set_combine(sets.TP['Standard'],  {   head="Hjarrandi Helm",
    body="Vishap Mail +2",
    hands="Sulev. Gauntlets +2",
    legs={ name="Ptero. Brais +1", augments={'Enhances "Strafe" effect',}},
    feet="Sulev. Leggings +1",
    neck="Dragoon's Collar",
    waist="Ioskeha Belt",
    left_ear="Anastasi Earring",
    right_ear="Handler's Earring +1",
    right_ring="Defending Ring",
    back="Shadow Mantle",
})
	
	
	
	sets.WS = {}						  
	-- Can add a set for each WS by making a new set: sets.WS["Raiden Thrust"] or sets.WS["Geirskogul"] for example
	sets.WS["Default"] = {ammo="Ginsen",
        head={ name="Valorous Mask", augments={'Attack+12','Weapon skill damage +2%','STR+11','Accuracy+8',}}, 
        neck="Fotia Gorget",
        ear1="Thrud Earring",
        ear2="Ishvara Earring",
		body={ name="Valorous Mail", augments={'Accuracy+28','"Store TP"+6','DEX+9','Attack+6',}},
        hands={ name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
        left_ring="Petrov Ring",
        right_ring="Karieyh Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
        waist="Ioskeha Belt",
        legs={ name="Valorous Hose", augments={'Attack+14','"Store TP"+5','DEX+13','Accuracy+11',}},
        feet={ name="Valorous Greaves", augments={'Accuracy+12 Attack+12','Crit. hit damage +2%','VIT+3','Accuracy+1',}},}
	sets.WS["Leg Sweep"] = {head="Flam. Zucchetto +2",neck="Fotia Gorget", body="Flamma Korazin +2",hands="Flam. Manopolas +2",left_ring="Rufescent Ring",right_ring="Etana Ring",waist="Fotia Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	sets.WS["Drakesbane"] = set_combine(sets.WS["Default"], {    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+28','"Store TP"+6','DEX+9','Attack+6',}},
    hands="Flam. Manopolas +1",
    legs="Peltast's cuissots +1",
    feet={ name="Valorous Greaves", augments={'Accuracy+12 Attack+12','Crit. hit damage +2%','VIT+3','Accuracy+1',}},
    neck="Dragoon's Collar",
    waist="Sailfi belt +1",
    left_ear="Brutal Earring",
    right_ear="Thrud Earring",
    left_ring="Petrov Ring",
    right_ring="Tyrant's Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
    })
	sets.WS["Stardiver"] =  {ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+28','"Store TP"+6','DEX+9','Attack+6',}},
    hands="Sulev. Gauntlets +2",
    legs="Vishap Brais +2",
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Tyrant's Ring",
    right_ring="K'ayres Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},}

	sets.WS["Camlann's Torment"]  = {    ammo="Ginsen",
    head={ name="Valorous Mask", augments={'Attack+12','Weapon skill damage +2%','STR+11','Accuracy+8',}},
    body={ name="Valorous Mail", augments={'Accuracy+28','"Store TP"+6','DEX+9','Attack+6',}},
    hands={ name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+7 DEX+7',}},
    legs="Vishap Brais +2",
    feet={ name="Valorous Greaves", augments={'Accuracy+12 Attack+12','Crit. hit damage +2%','VIT+3','Accuracy+1',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear="Thrud Earring",
    left_ring="Rufescent Ring",
    right_ring="Karieyh Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }
	sets.WS["Sonic Thrust"] = sets.WS["Camlann's Torment"]
	sets.WS["Impulse Drive"] = sets.WS["Camlann's Torment"]
	sets.WS["Accuracy"] = {}
	sets.WS["Sanguine Blade"] = {} 
	
	sets.WS.SkillChain = set_combine(sets.WS['Default'], {left_ring="Mujin band"})
			  
    -- Job Ability Sets --
	sets.JA = {}
	sets.JA["Jump"] = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Ptero. Mail +1", augments={'Enhances "Spirit Surge" effect',}},
    hands="Vis. Fng. Gaunt. +2",
    legs={ name="Ptero. Brais +1", augments={'Enhances "Strafe" effect',}},
    feet="Vishap Greaves +1",
    neck="Ganesha's Mala",
    waist="Ioskeha Belt",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
    }
	sets.JA['Jump Accuracy'] = sets.JA["Jump"]
	
	
    sets.TreasureHunter = { 
        head="White rarab cap +1", 
        waist="Chaac Belt",}

    sets.JA["High Jump"] = sets.JA.Jump
    
	sets.JA["Soul Jump"] = set_combine(sets.JA["Jump"], {
		body="Vishap Mail +2",
            legs={ name="Valorous Hose", augments={'Attack+14','"Store TP"+5','DEX+13','Accuracy+11',}},
    })
	sets.JA["Spirit Jump"] = set_combine(sets.JA["Jump"], {
        legs={ name="Ptero. Brais +1", augments={'Enhances "Strafe" effect',}},
        feet="Pelt. Schynbalds +1",
    })
	sets.JA["Super Jump"] = sets.JA["Jump"]

	sets.JA["Spirit Link"] = {
        hands="Pel. Vambraces +1", 
        head="Vishap Armet +2"
    }
	sets.JA["Call Wyvern"] = {body="Pteroslaver Mail +1"}
	sets.JA["Deep Breathing"] = {head="Petroslaver Armet +1"}
    
    sets.JA["Spirit Surge"] = { --body="Wyrm Mail +2"
        body="Pteroslaver Mail +1"
    }

    sets.JA.Angon = {ammo="Angon"}
	
	sets.JA["Steady Wing"] = {} 
	-- Wyvern Max HP strongly affects Steady Wing's Stoneskin effect
	
	-- Casting Sets --
	sets.FastCast = {head="Vishap Armet +2",
	ear1="Etiolation Earring",ear2="Loquac. Earring",
					 hands="Leyline Gloves",	ring1="Prolix Ring",}
	-- Can add more FC and Quick Magic here for spells; AF1 Head recommended in case of GearSwap error, at least for faster spells
	
	sets.Midcast = {ammo="Staunch Tathlum", 
					head="Vishap Armet +2",ear1="Etiolation Earring",ear2="Ethereal Earring",waist="Glassblower's Belt",}
	-- AF1 Head strongly advised for Healing Breath trigger
	-- HP or defensive stuff for Healing Breath; can use Fast Cast or Magic Acc. or whatever if you want too
	
	sets.HealingBreath = {
    head={ name="Ptero. Armet +1", augments={'Enhances "Deep Breathing" effect',}},
    body={ name="Acro Surcoat", augments={'Pet: Mag. Acc.+25','Pet: Breath+8',}},
    hands={ name="Acro Gauntlets", augments={'Pet: Mag. Acc.+25','Pet: Breath+8',}},
    legs="Vishap Brais +2",
    feet={ name="Acro Leggings", augments={'Pet: Mag. Acc.+24','Pet: Breath+8',}},
    neck="Dragoon's Collar",
	right_ear="Anastasi earring",	
    waist="Glassblower's Belt",}
	sets.ElementalBreath = {
    body={ name="Acro Surcoat", augments={'Pet: Mag. Acc.+25','Pet: Breath+8',}},
    hands={ name="Acro Gauntlets", augments={'Pet: Mag. Acc.+25','Pet: Breath+8',}},
    legs={ name="Acro Breeches", augments={'Pet: Mag. Acc.+24','Pet: Breath+8',}},
    feet={ name="Acro Leggings", augments={'Pet: Mag. Acc.+24','Pet: Breath+8',}},}
	Breath = sets.HealingBreath
	-- Healing Breath is modified by Wyvern Max HP and Wyvern: Breath+
	-- Elemental Breaths are modified by Wyvern Current HP, Wyvern: Breath+, and Pet: Magic Accuracy
	-- Remove Status Breaths are presumably affected by nothing
end

SkillchainPending = false 
AllowSkillchainGear = false   --Whether or not hte skillchainPending system should be active upon loading the lua
PetBreathFailover = false
SkillchainTimer = 0



-- Precast: JA and WS should be defined here, Fast Cast and such for magic. 
function precast(spell)
	if spell.type == "WeaponSkill" then
		if TP_ind == 2 then -- If using your Accuracy set, use the Accuracy WS set
		equip(sets.WS['Accuracy'])
				else
		equip(sets.WS["Default"]) -- otherwise, it'll use this set instead
		end
		
	if SCMode == true then
        equip (sets.WS.SkillChain)
end		
		
		
	elseif spell.action_type == 'Magic' then 
		equip(sets.FastCast)
	elseif spell.name == 'Dismiss' and pet.hpp < 100 then		
		cancel_spell() -- Dismiss resets the Call Wyvern recast IF your Wyvern is at 100% HP; largely pointless otherwise
		windower.add_to_chat(50,'  '..pet.name..' is below full HP (<pethpp>), cancelling Dismiss!')
	elseif spell.name == 'Call Wyvern' then
		if pet.isvalid then
			cancel_spell() -- Uses Spirit Link instead when your Wyvern is already present
			send_command('input /ja "Spirit Link" <me>')
		else
			equip(sets.JA["Spirit Surge"]) -- Relic Body goes here; can just use Spirit Surge set if you have it augmented
		end
	elseif spell.name == 'Spirit Link' then
		if pet.isvalid then
			equip(sets.JA["Spirit Link"])
		else
			cancel_spell() -- Uses Call Wyvern instead when your Wyvern isn't present
			send_command('input /ja "Call Wyvern" <me>')
		end
	elseif string.find(spell.name,"Jump") then -- Any spell or ability with the word Jump in it
		if not pet.isvalid then -- If you don't have a pet
			if spell.name == "Spirit Jump" then -- Forces Spirit Jump into regular Jump when Wyvern is dead
				cancel_spell()
				send_command('input /ja "Jump" <t>')
				return
			elseif spell.name == "Soul Jump" then -- Forces Soul Jump into High Jump when Wyvern is dead
				cancel_spell()
				send_command('input /ja "High Jump" <t>')
				return
			end
		end
		if TP_ind == 2 then -- If using your Accuracy set
		equip(sets.JA['Jump Accuracy'])
		else
		equip(sets.JA['Jump'])
		end
	elseif sets.JA[spell.name] then 
		equip(sets.JA[spell.name])
	end
end            
 
-- Midcast: For magic, this section affects your spell's potency, accuracy, etc. Unnecessary for JA/WS.
function midcast(spell)
	if spell.action_type == 'Magic' then 
        equip(sets.Midcast)
	end
end

-- Pet Change: Occurs when your Pet is summoned or killed.
function pet_change(pet,gain)
	if gain == false and pet.name then
		-- General announcement for when your Wyvern is killed, Dimissed, or eaten by Spirit Surge
			end
end

-- Pet Midcast: If GearSwap sees your pet readying a WS, this occurs
function pet_midcast(spell)
	if string.find(spell.name,' Breath') then
		if string.find(spell.name,'Healing') then 
		Breath = sets.HealingBreath
		else
		Breath = sets.ElementalBreath
		end
		petcast = true
		equip_current()		
		windower.send_command('wait 1.2;gs c petcast')
		-- Wyvern Breath Delay: 1.25s http://forum.square-enix.com/ffxi/threads/47481
		-- Remove Status should still be 1s: http://forum.square-enix.com/ffxi/threads/44090
		-- pet_aftercast won't run if your Wyvern's WS is interrupted (disengaging, stunned, Amnesia, etc.), so I recommend this

	end
end
 
-- Aftercast: Occurs following the use of any WS, JA, Spell, Item, or Ranged Attack
function aftercast(spell)
	equip_current()
end

-- Status Change: When Engaging, Disengaging, Resting, Standing Up, etc.
function status_change()
	equip_current()
end

-- Pet Status Change
function pet_status_change(new,old)
	if new ~= "Engaged" then
	petcast = false
	end
end

-- A custom function that equips a set based on whether you're engaged or not.
function equip_current()
	if player.status == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	else
		equip(sets.Idle)
	end
	if petcast == true then 
		equip(Breath) -- This will equip your Breath gear on top of whichever other set you're currently wearing.
	end
end
 
-- Manual commands sent in-game with //gs c <command>
function self_command(command)
    tellMe(command)
	if command == 'toggle TP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		windower.add_to_chat(1,'<----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip_current()
	elseif command == 'reverse TP set' then
		TP_ind = TP_ind -1
		if TP_ind == 0 then TP_ind = #sets.TP.index end
		windower.add_to_chat(1,'<----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip_current()
	elseif command == 'petcast' and petcast then -- This command reverts to your regular gear 1.2 seconds after a Breath by default
		petcast = false
		equip_current() 
		end
		
	if command == 'Skillchain' then
        if SCMode == false then
            SCMode = true
            tellMe('Skill Chain mode On')
        else
            SCMode = false
            tellMe('Skill Chain mode Off')
        end
    end	
  end

function precast(spell)
        if spell.action_type == 'Magic' then
                equip(sets.FC)
				end
				end
