function user_job_setup()
	autows = 'Red Lotus Blade'
	-- Options: Override default values
	state.OffenseMode:options('Normal', 'Enspell', 'EnspellOnly')
	state.HybridMode:options('Normal')
	state.WeaponskillMode:options('Match','Proc')
	state.AutoBuffMode:options('Off','Auto','AutoMelee')
	state.CastingMode:options('Normal','Resistant', 'Fodder', 'Proc')
	state.IdleMode:options('Normal','DynaRP','Turtle')
	state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None', 'SavageSpam', 'SeraphSpam','EnspellCheese')
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	
	select_default_macro_book()
end

default_sc_opener = 'Chant Du Cygne'
sc_openers = {
	RNG = 'Realmrazer',
	RNG_AM = 'Chant du Cygne',
	SCH = 'Chant du Cygne',
	COR = 'Chant du Cygne',
}

function user_job_self_command(commandArgs, eventArgs)
	local cmd = commandArgs[1];

	if cmd == 'FullBuff' then
			return send_command('gs c buffup')
	end

	if cmd == 'Rebuff' then
			return send_command('gs c buffup')
	end

	if cmd == 'Debuff' then
			return send_command('exec rdm/debuff.txt')
	end

	if cmd == 'Nuke1' then
		send_command('gs c elemental nuke')
	end

	if cmd == 'OpenSC' then
		if commandArgs[2] and sc_openers[commandArgs[2]] then
			send_command('input /ws "' .. sc_openers[commandArgs[2]] .. '" <t>')
		else
			send_command('input /ws "' .. default_sc_opener .. '" <t>')
		end
	end
end

ambu_cape_name = "Sucellos's Cape"

function init_gear_sets()
	gear.ambu = {
		tp = { name = ambu_cape_name, augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10'}}
	}
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = { body = 'Viti. Tabard +2' } -- Relic Body
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
		main = "Sakpata's Sword",
		ammo = 'Sapience Orb',
		head = 'Carmine Mask +1',
		ear1 = 'Malignance Earring',
		ear2 = 'Loquac. Earring',
		body = 'Viti. Tabard +2',
		hands = 'Leyline Gloves',
		ring1 = 'Kishar Ring',
		ring2 = 'Prolix Ring',
		back = 'Swith Cape',
		waist = 'Embla Sash',
		feet = 'Taeon Boots',
	}
		
	sets.precast.FC['Enfeebling Magic'] = set_combine(sets.precast.FC, {
		head = 'Leth. Chappel +1',
	})
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, { main = 'Daybreak', sub = 'Genmei Shield' })
       
	-- Weaponskill sets
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {
		ammo = 'Hydrocera',
		head = gear.jhakri.head,
		neck = 'Fotia Gorget',
		ear1 = 'Sherida Earring',
		ear2 = 'Moonshade Earring',
		body = gear.jhakri.body,
		hands = gear.jhakri.hands,
		ring1 = 'Rufescent Ring',
		ring2 = 'Karieyh Ring +1',
		waist = 'Fotia Belt',
		legs = gear.jhakri.legs,
		feet = gear.jhakri.feet,
	}
	
	sets.precast.WS['Chant Du Cygne'] = {}
		
	sets.precast.WS['Evisceration'] = sets.precast.WS['Chant Du Cygne']

	sets.precast.WS['Savage Blade'] = {
		ammo = 'Coiste Bodhar',
		head = 'Viti. Chapeau +3',
		neck = 'Caro Necklace',
		ear1 = 'Ishvara Earring',
		ear2 = 'Moonshade Earring',
		body = "Viti. Tabard +2",
		hands = gear.jhakri.hands,
		ring1 = 'Rufescent Ring',
		ring2 = 'Karieyh Ring +1',
		waist = 'Sailfi Belt +1',
		legs = gear.jhakri.legs,
		feet = gear.jhakri.feet,
	}
		
	sets.precast.WS['Sanguine Blade'] = {
		ammo = 'Pemphredo Tathlum',
		head = gear.jhakri.head,
		neck = 'Sanctity Necklace',
		ear1 = 'Malignance Earring',
		ear2 = 'Moonshade Earring',
		body = gear.jhakri.body,
		hands = gear.jhakri.hands,
		ring1 = 'Archon Ring',
		ring2 = 'Metamor. Ring +1',
		waist = 'Fotia Belt',
		legs = gear.jhakri.legs,
		feet = gear.jhakri.feet,
	}

	sets.precast.WS['Requiescat'] = {
		head = "Viti. Chapeau +3",
		neck = "Fotia Gorget",
		ear2 = "Moonshade Earring",
		body = "Viti. Tabard +2",
		hands = "Viti. Gloves +1",
		ring1 = "Metamor. Ring +1",
		ring2 = "Rufescent Ring",
		waist = "Fotia Belt",
		feet = gear.jhakri.feet,
	}
		
	sets.precast.WS['Seraph Blade'] = set_combine(sets.precast.WS['Sanguine Blade'], {
	});
		
	sets.precast.WS['Aeolian Edge'] = {}

	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}
	
	-- Gear for Magic Burst mode.
	sets.MagicBurst = {}
	
	sets.midcast.FastRecast = sets.precast.FC

	sets.midcast.Cure = {
		main = 'Daybreak',
		sub = 'Sors Shield',
		ammo = 'Hydrocera',
		head = 'Vanya Hood',
		neck = 'Loricate Torque +1',
		ear1 = 'Malignance Earring',
		ear2 = 'Etiolation Earring',
		body = 'Vanya Robe',
		hands = 'Kaykaus Cuffs +1',
		ring1 = 'Lebeche Ring',
		ring2 = 'Stikini Ring',
		back = 'Solemnity Cape',
		legs = 'Chironic Hose',
		feet = 'Taeon Boots',
	}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		head = 'Vanya Hood',
		body = 'Viti. Tabard +2',
	})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = set_combine(sets.midcast.Cure, {
		waist = "Gishdubar Sash"
	})
	sets.Cure_Received = {
		waist = "Gishdubar Sash"
	}
	sets.Self_Refresh = {
		waist = "Gishdubar Sash"
	}

	sets.midcast['Enhancing Magic'] = {
		main = 'Pukulatmuj +1',
		ammo = 'Pemphredo Tathlum',
		head = 'Telchine Cap',
		neck = 'Dls. Torque +1',
		ear1 = 'Mimir Earring',
		ear2 = 'Andoaa Earring',
		body = 'Viti. Tabard +2',
		hands = 'Atrophy Gloves +1',
		ring1 = 'Kishar Ring',
		ring2 = 'Stikini Ring',
		back = 'Ghostfyre Cape',
		waist = 'Embla Sash',
		legs = 'Telchine Braconi',
		feet = 'Leth. Houseaux +1'
	}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = set_combine(sets.midcast['Enhancing Magic'], {
		head = 'Leth. Chappel +1',
		neck = 'Dls. Torque +1',
		body = 'Lethargy Sayon +1',
		hands = 'Leth. Gantherots +1',
		legs = 'Leth. Fuseau +1',
		feet = 'Leth. Houseaux +1'
	})
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {
		main = 'Pukulatmuj +1',
		sub = 'Pukulatmuj',
		neck = "Incanter's Torque",
		head = 'Befouled Crown',
		ear1 = 'Mimir Earring',
		ear2 = 'Andoaa Earring',
		body = 'Viti. Tabard +2',
		hands = 'Viti. Gloves +1',
		ring1 = 'Stikini Ring',
		ring2 = 'Stikini Ring',
		back = 'Ghostfyre Cape',
		waist = 'Olympus Sash',
		legs = 'Atrophy Tights +1',
		feet = 'Leth. Houseaux +1',
	}

	sets.midcast.Refresh = {
		body = 'Atrophy Tabard +2',
		legs = 'Leth. Fuseau +1',
	}

	sets.midcast.Aquaveil = {}
	sets.midcast.BarElement = {}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Enspell = sets.midcast.Temper
	sets.midcast.BoostStat = {}
	sets.midcast.Stoneskin = {}
	sets.midcast.Protect = {}
	sets.midcast.Shell = {}
	sets.midcast.Phalanx = {
		main = "Sakpata's Sword",
		neck = "Incanter's Torque",
		body = gear.taeon_phalanx_body,
		hands = gear.herculean_phalanx_hands,
		legs = gear.taeon_phalanx_legs,
	}
	
	-- Base set is potency+
	sets.midcast['Enfeebling Magic'] = {
		main = 'Daybreak',
		sub = 'Maxentius',
		ammo = 'Pemphredo Tathlum',
		head = 'Viti. Chapeau +3',
		neck = 'Dls. Torque +1',
		ear1 = 'Malignance Earring',
		ear2 = 'Snotra Earring',
		body = 'Lethargy Sayon +1',
		hands = 'Kaykaus Cuffs +1',
		ring1 = 'Metamor. Ring +1',
		ring2 = 'Stikini Ring',
		back = ambu_cape_name,
		waist = 'Eschan Stone',
		legs = gear.chironic_enfeeble_legs,
		feet = 'Vitiation Boots +2',
	}
	
	-- Frazzle2 cast in high acc to make it stick
	sets.midcast['Frazzle II'] = set_combine(sets.midcast['Enfeebling Magic'], {
		body = "Atrophy Tabard +2",
	})
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic']

	-- less MAcc and Skill, more Duration+
	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {
		body = 'Atrophy Tabard +2',
		ring1 = "Kishar Ring",
	})
		
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling, {})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{})
	
	-- Skill-based have variable potency based on skill
	
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {
	})
	
	gear.frazDistractPot = {
		-- TODO: ear1 = "Vor Earring",
		hands = "Leth. Gantherots +1",
		-- TODO: legs = "Psycloth Lappas",
	}
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.SkillBasedEnfeebling, gear.frazDistractPot)
	sets.midcast['Distract III'] = set_combine(sets.midcast.SkillBasedEnfeebling, gear.frazDistractPot)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

	gear.diaDuration = {
		head = "Leth. Chappel +1",
		neck = "Dls. Torque +1",
		ear2 = "Snotra Earring",
		body = "Lethargy Sayon +1",
		hands = "Leth. Gantherots +1",
		ring1 = "Kishar Ring",
		legs = "Leth. Fuseau +1",
		feet = "Leth. Houseaux +1",
	}

	sets.midcast.Dia = set_combine(gear.diaDuration, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(gear.diaDuration, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(gear.diaDuration, sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(gear.diaDuration, {})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {})

	sets.midcast['Elemental Magic'] = {
		main = 'Daybreak',
		sub = 'Maxentius',
		ammo = 'Pemphredo Tathlum',
		head = gear.jhakri.head,
		neck = 'Sanctity Necklace',
		ear1 = 'Malignance Earring',
		body = gear.jhakri.body,
		hands = gear.jhakri.hands,
		waist = "Eschan Stone",
		legs = gear.jhakri.legs,
		feet = "Vitiation Boots +2",
	}
		
	sets.midcast.Impact = {}

	sets.midcast['Dark Magic'] = {}

	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
		neck = "Erra Pendant",
		ear1 = "Malignance Earring",
		ear2 = "Loquac. Earring",
		ring1 = "Evanescence Ring",
		ring2 = "Archon Ring",
		waist = "Fucho-no-Obi",

	})

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {}
		
	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {
		hands = 'Leth. Gantherots +1',
	}

	sets.HPCure = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
	

	-- Idle sets
	sets.idle = {
		main = 'Daybreak',
		sub = 'Genmei Shield',
		ammo = 'Homiliary',
		head = 'Viti. Chapeau +3',
		neck = 'Loricate Torque +1',
		ear1 = 'Etiolation Earring',
		ear2 = 'Odnowa Earring +1',
		body = gear.jhakri.body,
		hands = 'Nyame Gauntlets',
		ring1 = 'Defending Ring',
		ring2 = 'Warden\'s Ring',
		back = 'Solemnity Cape',
		waist = 'Fucho-no-Obi',
		legs = 'Carmine Cuisses +1',
		feet = 'Nyame Sollerets',
	}

	sets.idle.Turtle = set_combine(sets.idle, {
		main = "Sakpata's Sword",
	})

	sets.idle.DynaRP = set_combine(sets.idle, {
		neck = 'Dls. Torque +1',
	})

	sets.Kiting = {}
	sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.SavageSpam = { main = 'Naegling', sub = 'Thibron', range = "Kaja Bow", ammo = "Chapuli Arrow" }
	sets.weapons.SeraphSpam = { main = 'Vitiation Sword', sub = 'Daybreak', range = "Kaja Bow", ammo = "Chapuli Arrow" }
	sets.weapons.EnspellCheese = { main = 'Wind Knife', sub = 'Wind Knife', range = "Kaja Bow", ammo = "Chapuli Arrow" }

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {ammo="Aurgelmir Orb +1",
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {
		ammo = 'Coiste Bodhar',
		head = 'Malignance Chapeau',
		neck = 'Anu Torque',
		ear1 = 'Sherida Earring',
		ear2 = 'Dedition Earring',
		body = 'Malignance Tabard',
		hands = 'Malignance Gloves',
		ring1 = 'Petrov Ring',
		ring2 = 'Chirich Ring +1',
		waist = 'Windbuffet Belt +1',
		legs = 'Nyame Flanchard',
		feet = 'Nyame Sollerets',
	}
	
	sets.engaged.DW = set_combine(sets.engaged, {
		ear1 = "Suppanomimi",
		back = gear.ambu.tp,
	})

	sets.engaged.DW.Enspell = set_combine(sets.engaged, {
		hands = "Aya. Manopolas +2",
		waist = "Hachirin-no-Obi",
	})

	sets.engaged.DW.EnspellOnly = set_combine(sets.engaged.DW, {
		neck = "Dls. Torque +1",
		ear1 = "Cessance Earring",
		ear2 = "Suppanomimi",
		ring1 = "Stikini Ring",
		waist = "Hachirin-no-Obi",
		legs = "Aya. Cosciales +2",
		feet = "Aya. Gambieras +2",
		-- legs = "Atrophy Tights +1",
	})
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'DNC' then
		set_macro_page(4, 8)
	elseif player.sub_job == 'NIN' then
		set_macro_page(4, 8)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 8)
	else
		set_macro_page(3, 8)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[984] < spell_latency and not have_trust("August") then
					windower.chat.input('/ma "August" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

function user_job_lockstyle()
	if global_lockstyle then
		windower.chat.input('/lockstyleset ' .. global_lockstyle)
	else
		windower.chat.input('/lockstyleset 12')
	end
end