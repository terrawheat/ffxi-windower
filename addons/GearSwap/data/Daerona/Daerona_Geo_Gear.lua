function user_job_setup()
	autows = 'Judgment'
	-- Options: Override default values
	state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','FiteGEO')

	autoindi = "Acumen"
	autogeo = "Malaise"
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	
	indi_duration = 312

	gear.ambuPetIdle = { name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5'}}
	
	select_default_macro_book()
end

function user_job_self_command(commandArgs, eventArgs)
	local cmd = commandArgs[1];

	if cmd == 'Nuke1' then
		send_command('gs c elemental nuke')
	end
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {
		body = "Bagua Tunic +1",
	}
	sets.precast.JA['Life Cycle'] = {
		body = "Geo. Tunic +1"
	}
	sets.precast.JA['Radial Arcana'] = {}
	sets.precast.JA['Mending Halation'] = {}
	sets.precast.JA['Full Circle'] = { head = "Azimuth Hood" }
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {
		main = "Solstice",
		head = "Vanya Hood",
		body = "Merlinic Jubbah",
		waist = "Embla Sash",
		legs = "Geo. Pants +1",
		back = "Lifestream Cape",
	}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {})
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
		head = gear.mallquis.head,
		body = "Merlinic Jubbah",
		hands = "Bagua Mitaines",
		ring1 = "Mallquis Ring",
		legs = gear.mallquis.legs,
		feet = gear.mallquis.feet,
	})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		sub = "Sors Shield",
		ear2 = "Mendi. Earring",
		body = "Vanya Robe",
		ring2 = "Lebeche Ring",
		back = "Pahtli Cape",
		legs = "Vanya Slops",
		feet = "Vanya Clogs",
	})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {}
		
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}

	MAB_WS = {
		ear1 = "Friomisi Earring",
	}

	sets.precast.WS['Flash Nova'] = MAB_WS
	sets.precast.WS['Seraph Strike'] = MAB_WS
	sets.precast.WS['Shining Strike'] = MAB_WS


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = sets.precast.FC

	sets.midcast.Geomancy = {
		main = "Solstice",
		range = "Dunna",
		head = "Azimuth Hood",
		neck = "Incanter's Torque",
		ear1 = "Gifted Earring",
		body = "Bagua Tunic +1",
		hands = "Geo. Mitaines +1",
		ring1 = "Stikini Ring",
		ring2 = "Stikini Ring",
		back = "Lifestream Cape",
		legs = "Vanya Slops",
		feet = "Vanya Clogs"
	}
	
	
	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
		legs = "Bagua Pants +1",
		feet = "Azimuth Gaiters"
	})
		
	sets.midcast.Cure = {
		main = "Tamaxchi",
		sub = "Sors Shield",
		head = "Vanya Hood",
		ear1 = "Gifted Earring",
		ear2 = "Mendi. Earring",
		body = "Vanya Robe",
		hands = "Weath. Cuffs +1",
		ring1 = "Janniston Ring",
		ring2 = "Lebeche Ring",
		legs = "Vanya Slops",
		feet = "Vanya Clogs",
	}
		
	sets.midcast.LightWeatherCure = {}
		
		--Cureset for if it's not light weather but is light day.
	sets.midcast.LightDayCure = {}

	sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
	sets.midcast['Elemental Magic'] = {
		main = "Solstice",
		neck = "Mizu. Kubikazari",
		ear1 = "Gifted Earring",
		ear2 = "Friomisi Earring",
		head = gear.mallquis.head,
		body = gear.mallquis.body,
		hands = gear.mallquis.hands,
		ring = "Mallquis Ring",
		legs = gear.mallquis.legs,
		feet = gear.mallquis.feet,
	}

	sets.midcast['Elemental Magic'].HighTierNuke = {
		head = "Bagua Galero",
		hands = "Bagua Mitaines"
	}
	
	sets.midcast['Dark Magic'] = {}
	
	sets.midcast.Drain = {
		head = "Bagua Galero",
	}
	
	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Dispel = {}

	sets.midcast['Enfeebling Magic'] = {
		head = "Geo. Galero +1",
		hands = "Geo. Mitaines +1",
		feet = "Bagua Sandals",
	}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast['Enhancing Magic'] = {
		waist = "Embla Sash",
	}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {}

	-- Idle sets

	sets.idle = {
		body = 'Geo. Tunic +1',
		hands = 'Bagua Mitaines',
		feet = "Geo. Sandals +1"
	}
	
	sets.idle.PDT = set_combine(sets.idle, {
		head = "Blistering Sallet +1",
		body = gear.mallquis.body,
		feet = gear.mallquis.feet,
	})

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {
		main = "Solstice",
		head = "Telchine Cap",
		ear1 = "Handler's Earring +1",
		ear2 = "Handler's Earring",
		body = "Telchine Chas.",
		hands = "Geo. Mitaines +1",
		back = gear.ambuPetIdle,
		legs = "Telchine Braconi",
		feet = "Telchine Pigaches",
	}

	sets.idle.PDT.Pet = set_combine(sets.idle.Pet, {
		head = "Blistering Sallet +1",
		ear1 = "Handler's Earring +1",
	})

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {}

	-- Defense sets
	sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {
		head = "Blistering Sallet +1",
	}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}
	
	-- Gear for Magic Burst mode.
	sets.MagicBurst = {
		neck = "Mizu. Kubikazari",
	}
	
	-- Weapons sets

	sets.weapons.FiteGEO = { main = "Nehushtan", sub = "" }
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(4, 10)
end

function user_job_lockstyle()
	if global_lockstyle then
		windower.chat.input('/lockstyleset ' .. global_lockstyle)
	else
		windower.chat.input('/lockstyleset 6')
	end
end