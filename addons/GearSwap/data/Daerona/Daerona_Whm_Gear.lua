-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Refresh','DT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MeleeWeapons')

		-- Additional local binds
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	gear.ambu = {
		general = { name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%'}}
	}
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = { main = "Nehushtan" }
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
		body = gear.inyanga.body,
		waist = "Embla Sash",
	}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
		main = "Queller Rod",
		sub = "Sors Shield",
		ear2 = "Mendi. Earring",
		body = "Vanya Robe",
		ring2 = "Lebeche Ring",
		back = "Pahtli Cape",
		legs = "Ebers Pant. +1",
		feet = "Vanya Clogs",
	})

	sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

	sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
	})

	sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {})

	-- Precast sets to enhance JAs
	sets.precast.JA.Benediction = {}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}
	
	sets.precast.WS.Dagan = {}
		
	sets.MaxTP = {}
	sets.MaxTP.Dagan = {}

	--sets.precast.WS['Flash Nova'] = {}

	--sets.precast.WS['Mystic Boon'] = {}

	-- Midcast Sets

	sets.Kiting = {}
	sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
	sets.MagicBurst = {}

	sets.midcast.FastRecast = {}
	
	-- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
		main = "Chatoyant Staff",
		head = "Ebers Cap +1",
		ear1 = "Nourish. Earring +1",
		ear2 = "Glorious Earring",
		body = "Ebers Bliaut +1",
		hands = "Weath. Cuffs +1",
		ring1 = "Janniston Ring",
		ring2 = "Lebeche Ring",
		back = gear.ambu.general,
		waist = "Hachirin-no-Obi",
		legs = "Ebers Pant. +1",
		feet = "Vanya Clogs",
	}
		
	sets.midcast.Cursna = {
		main = "Queller Rod",
		body = "Ebers Bliaut +1",
		back = gear.ambu.general,
		legs = "Theo. Pant. +1",
		feet = "Vanya Clogs",
	}
	
	sets.midcast.StatusRemoval = {
		head = "Ebers Cap +1",
	}
	
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {})
	
	-- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {
		neck = "Incanter's Torque",
		hands = gear.inyanga.hands,
		ring1 = "Stikini Ring",
		ring2 = "Stikini Ring",
		wiast = "Embla Sash",
		feet = "Theo. Duckbills +1",
	}
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {
	})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
		head = gear.inyanga.head,
		body = "Theo. Bliaut +1",
		hands = "Ebers Mitts +1",
		legs = "Theo. Pant. +1",
	})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
		head = "Ebers Cap +1",
		body = "Ebers Bliaut +1",
		hands = "Ebers Mitts +1",
		feet = "Ebers Duckbills +1"
	})

	sets.midcast.Impact = {}
		
	sets.midcast['Elemental Magic'] = {}

	sets.midcast['Elemental Magic'].Resistant = {}

	sets.midcast['Divine Magic'] = {
	}
		
	sets.midcast.Holy = {}

	sets.midcast['Dark Magic'] = {}

	sets.midcast.Drain = {}

	sets.midcast.Drain.Resistant = {}

	sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {}

	sets.midcast.Stun.Resistant = {}
		
	sets.midcast.Dispel = {}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {})

	sets.midcast['Enfeebling Magic'] = {
	}

	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
	}

	sets.idle.Refresh = set_combine(sets.idle, {
		main = "Queller Rod",
		ammo = "Homiliary",
		head = gear.inyanga.head,
		body = "Theo. Bliaut +1",
		hands = gear.inyanga.hands,
		ring1 = "Inyanga Ring",
		back = gear.ambu.general,
		legs = gear.inyanga.legs,
		feet = gear.inyanga.feet,
	})

	sets.idle.DT = set_combine(sets.idle, {
	})

	-- Defense sets

	sets.defense.PDT = sets.idle

	sets.defense.MDT = sets.idle

	sets.defense.MEVA = sets.idle
		
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Basic set for if no TP weapon is defined.
	sets.engaged = {
		head = "Blistering Sallet +1",
		ring2 = "Cacoethic Ring",
		back = "Mecisto. Mantle",
		feet = "Vanya Clogs",
	}

	sets.engaged.Acc = set_combine(sets.engaged, {})

	sets.engaged.DW = set_combine(sets.engaged, {})

	sets.engaged.DW.Acc = set_combine(sets.engaged, {})

	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Divine Caress'] = {
		hands = "Ebers Mitts +1",
	}

	sets.HPDown = {}

	sets.HPCure = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(3, 6)
end
function user_job_lockstyle()
	if global_lockstyle then
		windower.chat.input('/lockstyleset ' .. global_lockstyle)
	else
		windower.chat.input('/lockstyleset 3')
	end
end