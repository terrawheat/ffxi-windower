function user_job_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal')
	state.WeaponskillMode:options('Match')
	state.CastingMode:options('Normal','SIRD')
	state.Passive:options('None')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('BDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'Tank', 'Block', 'MEva')
	state.Weapons:options('None', 'Engaged')
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None'}
	
	-- Additional local binds
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	
	select_default_macro_book()
	update_defense_mode()
end

function init_gear_sets()
	sets.weapons.Engaged = { main = "Sakpata's Sword", sub = "Priwen" }
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	sets.Enmity = {
		main = 'Brilliance',
		ammo = 'Sapience Orb',
		head = 'Nyame Helm',
		neck = 'Loricate Torque +1',
		ear1 = 'Cryptic Earring',
		ear2 = 'Friomisi Earring',
		body = 'Souv. Cuirass +1',
		hands = 'Macabre Gaunt. +1',
		ring1 = 'Supershear Ring',
		ring2 = 'Vengeful Ring',
		back = 'Solemnity Cape',
		waist = 'Creed Baudrier',
		legs = 'Souv. Diechlings +1',
		feet = 'Eschite Greaves',
	}
	
	sets.Enmity.SIRD = set_combine(sets.Enmity, {
		feet = 'Karasutengu'
	})
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Invincible'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Sentinel'] = set_combine(sets.Enmity, { feet = 'Cab. Leggings +1' })
	sets.precast.JA['Rampart'] = set_combine(sets.Enmity, {}) --head="Valor Coronet" (Also Vit?)
	sets.precast.JA['Fealty'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Cover'] = set_combine(sets.Enmity, {}) --head="Rev. Coronet +1",

	-- add mnd for Chivalry
	sets.precast.JA['Chivalry'] = {}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, { hands = "Cab. Gauntlets +1" })		
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {})		
	sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Fast cast sets for spells
    
	sets.precast.FC = {
		main = 'Malignance Sword',
		ammo = 'Sapience Orb',
		head = 'Carmine Mask +1',
		neck = 'Loricate Torque +1',
		ear1 = 'Etiolation Earring',
		ear2 = 'Loquac. Earring',
		hands = 'Leyline Gloves',
		ring1 = 'Prolix Ring',
		ring2 = 'Kishar Ring',
		legs = 'Carmine Cuisses +1',
		feet = 'Karasutengu',
	}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
  
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		ear1 = 'Thrud Earring',
		ear2 = 'Moonshade Earring',
		body = "Sakpata's Plate",
		waist = 'Sailfi Belt +1',
		legs = "Sakpata's Cuisses",
		feet = "Sulev. Leggings +2",
	}

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = sets.precast.FC
		
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

	sets.midcast.Cure = {
		ammo = 'Staunch Tathlum',
		ear1 = 'Tuisto Earring',
		ear2 = 'Cryptic Earring',
		body = 'Souv. Cuirass +1',
		hands = 'Macabre Gaunt. +1',
		waist = 'Creed Baudrier',
		legs = 'Souv. Diechlings +1',
		feet = 'Odyssean Greaves',
	}
	
	sets.midcast.Cure.SIRD = set_combine(sets.midcast.Cure, {
		waist = 'Audumbla Sash',
		legs = 'Carmine Cuisses +1',
		feet = 'Karasutengu'
	})
		
	sets.midcast.Reprisal = {
		ammo = 'Sapience Orb',
		head = 'Carmine Mask +1',
		ear1 = 'Cryptic Earring',
		ear2 = 'Odnowa Earring +1',
		ring1 = 'Supershear Ring',
		ring2 = 'Defending Ring',
		waist = 'Audumbla Sash',
		legs = 'Souv. Diechlings +1',
		feet = 'Eschite Greaves',
	}

	sets.Self_Healing = sets.midcast.Cure

	sets.Cure_Received = {}
	sets.Self_Refresh = {
		waist = "Gishdubar Sash",
	}

	sets.midcast['Enhancing Magic'] = {
		neck = "Incanter's Torque",
		ear1 = 'Mimir Earring',
		ear2 = 'Andoaa Earring',
		ring1 = 'Stikini Ring',
		ring2 = 'Stikini Ring',
		waist = 'Olympus Sash',
	}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		main = "Sakpata's Sword",
		sub = "Priwen",
		legs = "Sakpata's Cuisses",
		feet = 'Souveran Schuhs +1',
	})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Idle sets
	sets.idle = {
		main = 'Nixxer',
		sub = 'Priwen',
		ammo = 'Staunch Tathlum',
		head = 'Nyame Helm',
		ear1 = 'Tuisto Earring',
		ear2 = 'Cryptic Earring',
		body = "Sakpata's Plate",
		hands = 'Nyame Gauntlets',
		ring1 = 'Moonbeam Ring',
		ring2 = 'Supershear Ring',
		waist = "Creed Baudrier",
		legs = "Sakpata's Cuisses",
		feet = 'Nyame Sollerets',
	}
	sets.idle.Tank = sets.idle

	sets.idle.MEva = set_combine(sets.idle.Tank, {
		body = 'Nyame Mail',
		legs = 'Nyame Flanchard',
	})

	sets.idle.Block = set_combine(sets.idle.Tank, {
		feet = 'Souveran Schuhs +1',
	})
		
	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
	-- Defense sets
	--------------------------------------
    
	
	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {
		head = "Flam. Zucchetto +2",
		neck = "Sanctity Necklace",
		ear1 = 'Cessance Earring',
		ear2 = 'Odnowa Earring +1',
		body = "Sakpata's Plate",
		ring1 = 'Moonbeam Ring',
		ring2 = 'Chirich Ring +1',
		waist = 'Sailfi Belt +1',
		legs = "Sakpata's Cuisses",
		feet = "Flam. Gambieras +2",
	}
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
	sets.buff.Cover = {}
end

function user_job_lockstyle()
	if global_lockstyle then
		windower.chat.input('/lockstyleset ' .. global_lockstyle)
	else
		windower.chat.input('/lockstyleset 11')
	end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(2, 4)
    elseif player.sub_job == 'RUN' then
        set_macro_page(9, 4)
    elseif player.sub_job == 'RDM' then
        set_macro_page(6, 4)
    elseif player.sub_job == 'BLU' then
        set_macro_page(8, 4)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 4)
    else
        set_macro_page(1, 4) --War/Etc
    end
end