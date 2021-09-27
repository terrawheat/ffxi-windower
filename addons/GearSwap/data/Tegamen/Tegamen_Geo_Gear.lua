function user_job_setup()

	-- Options: Override default values
	state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
	state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None', 'TP', 'DualTP')

	gear.idle_jse_back = 'Nantosuelta\'s cape'
	
	autoindi = "Fury"
	autogeo = "Frailty"
	autoentrust = 'Refresh'
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	
	indi_duration = 290
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geo. Tunic +1",back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1",hands="Bagua Mitaines +1"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {
		head = 'Merlinic Hood',
		back = 'Swith Cape',
		waist = 'Embla Sash',
		legs = 'Psycloth Lappas',
		ear1 = "Malignance Earring",
		ear2 = "Loquac. Earring",
		ring1 = 'Prolix Ring',
		ring2 = "Kishar Ring",
	}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
		hands = 'Bagua Mitaines +1',
		feet = 'Mallquis Clogs +1'
	})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		hands = 'Vanya Cuffs',
		body = 'Vanya Robe',
		legs = 'Vanya Slops',
	})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = sets.precast.FC

	sets.midcast.Geomancy = {
		main = 'Solstice',
		sub = 'Genmei Shield',
		neck = 'Bagua Charm +1',
		head = 'Azimuth Hood +1',
		hands = 'Geo. Mitaines +2',
		body = 'Bagua Tunic +1',
		legs = 'Azimuth Tights',
		back = 'Lifestream Cape',
		ear1 = 'Etiolation Earring',
		ear2 = 'Genmei Earring',
		ring1 = 'Stikini Ring',
		ring2 = 'Stikini Ring'
	}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {back=gear.idle_jse_back,legs="Bagua Pants +1",feet="Azimuth Gaiters +1"})
		
	sets.midcast.Cure = {
		main = 'Gada',
		sub = 'Sors Shield',
		head = 'Vanya Hood',
		body = 'Vanya Robe',
		hands = 'Vanya Cuffs',
		legs = 'Vanya Slops',
		feet = 'Vanya Clogs',
		back = 'Solemnity Cape',
		ear1 = 'Etiolation Earring',
		ear2 = 'Genmei Earring',
	}

	sets.midcast.LightWeatherCure = sets.midcast.Cure
		
		--Cureset for if it's not light weather but is light day.
	sets.midcast.LightDayCure = sets.midcast.Cure

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  sets.midcast.Cure
	
	sets.midcast.StatusRemoval = sets.midcast.FastRecast
	
	sets.midcast['Elemental Magic'] = {
		main = 'Grioavolr',
		sub = 'Giuoco Grip',
		head = 'Merlinic Hood',
		neck = 'Saevus Pendant +1',
		hands = gear.jhakri.hands,
		waist = "Eschan Stone",
		back = 'Lifestream Cape',
		ear1 = 'Malignance Earring',
		ear2 = 'Barkaro. Earring',
		ring1 = 'Acumen Ring',
		ring2 = 'Metamor. Ring +1',
		feet = 'Mallquis Clogs +1',
		body = 'Mallquis Saio +2',
		legs = 'Mallquis Trews +1'
	}

	sets.midcast['Elemental Magic'].Resistant = sets.midcast['Elemental Magic']
		
	sets.midcast['Elemental Magic'].Proc = sets.midcast['Elemental Magic']
	
	sets.midcast['Elemental Magic'].Fodder = sets.midcast['Elemental Magic']
		
	sets.midcast['Elemental Magic'].HighTierNuke = {
		main = 'Grioavolr',
		sub = 'Giuoco Grip',
		range = empty,
		ammo = "Pemphredo Tathlum",
		head = 'Merlinic Hood',
		neck = 'Saevus Pendant +1',
		body = gear.jhakri.body,
		hands = gear.jhakri.hands,
		waist = "Eschan Stone",
		legs = 'Merlinic Shalwar',
		feet = 'Merlinic Crackows',
		back = 'Lifestream Cape',
		ear1 = 'Malignance Earring',
		ear2 = 'Friomisi Earring',
		ring1 = 'Acumen Ring',
		ring2 = 'Metamor. Ring +1'
	}
	
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = sets.midcast['Elemental Magic'].HighTierNuke

	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = sets.midcast['Elemental Magic'].HighTierNuke
		
	sets.midcast['Dark Magic'] = {}
		
	sets.midcast.Drain = {
		main = 'Grioavolr',
		sub = 'Giuoco Grip',
		head = 'Bagua Galero +1',
		neck = 'Saevus Pendant +1',
		body = gear.jhakri.body,
		hands = gear.jhakri.hands,
		waist = "Fucho-no-Obi",
		legs = 'Merlinic Shalwar',
		feet = 'Merlinic Crackows',
		back = 'Lifestream Cape',
		ear1 = 'Malignance Earring',
		ear2 = 'Friomisi Earring',
		ring1 = 'Archon Ring',
		ring2 = 'Metamor. Ring +1'
	}
	
	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {}
		
	sets.midcast.Impact = {}
		
	sets.midcast.Dispel = {}

	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {})
		
	sets.midcast['Enfeebling Magic'] = {
		main = 'Gada',
		sub = 'Sors Shield',
		range = empty,
		ammo = "Pemphredo Tathlum",
		head = gear.jhakri.head,
		neck = 'Bagua Charm +1',
		ear1 = 'Malignance Earring',
		ear2 = 'Barkaro. Earring',
		body = gear.jhakri.body,
		hands = gear.jhakri.hands,
		ring1 = 'Kishar Ring',
		ring2 = 'Metamor. Ring +1',
		back = 'Lifestream Cape',
		legs = 'Psycloth Lappas',
		feet = 'Bagua Sandals +1',
	}
		
	sets.midcast['Enhancing Magic'] = {
		ear1 = 'Mimir Earring',
		waist = 'Embla Sash',
	}

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
		main = 'Bolelabunga',
		sub = 'Genmei Shield',
	})


	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {}

	-- Idle sets

	sets.idle = {
		main = 'Malignance Pole',
		sub = 'Giuoco Grip',
		head = 'Befouled Crown',
		neck = 'Bagua Charm +1',
		ear1 = 'Etiolation Earring',
		ear2 = 'Ethereal Earring',
		body = gear.jhakri.body,
		hands = 'Bagua Mitaines +1',
		waist = "Fucho-no-Obi",
		ring2 = 'Dark Ring',
		ring1 = "Defending Ring",
		legs = 'Assid. Pants +1',
		back = 'Solemnity Cape',
		feet = 'Geo. Sandals +2'
	}
		
	sets.idle.PDT = set_combine(sets.idle, {
		neck = 'Twilight Torque',
		hands = 'Geomancy Mitaines +2',
		body = 'Mallquis Saio +1',
	})

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {
		main = 'Malignance Pole',
		range = 'Dunna',
		head = 'Azimuth Hood +1',
		hands = 'Geo. Mitaines +2',
		waist = "Fucho-no-Obi",
		body = 'Telchine Chas.',
		neck = 'Bagua Charm +1',
		legs = 'Telchine Braconi',
		feet = 'Telchine Pigaches',
		back = 'Nantosuelta\'s Cape',
		ear1 = 'Etiolation Earring',
		ear2 = 'Ethereal Earring',
		ring2 = 'Dark Ring',
		ring1 = "Defending Ring"
	}

	sets.idle.PDT.Pet = {
		main = 'Malignance Pole',
		range = 'Dunna',
		head = 'Azimuth Hood +1',
		hands = 'Geo. Mitaines +2',
		waist = "Fucho-no-Obi",
		body = 'Telchine Chas.',
		neck = 'Bagua Charm +1',
		legs = 'Telchine Braconi',
		feet = 'Telchine Pigaches',
		back = 'Nantosuelta\'s Cape',
		ear1 = 'Etiolation Earring',
		ear2 = 'Ethereal Earring',
		ring2 = 'Dark Ring',
		ring1 = "Defending Ring"
	}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {}

	-- Defense sets
	
	sets.defense.PDT = sets.idle.PDT

	sets.defense.MDT = sets.idle.PDT
		
	sets.defense.MEVA = sets.idle.PDT
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {}
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
		head = 'Nyame Helm',
		neck = "Sanctity Necklace",
		ear1 = "Brutal Earring",
		ear2 = "Cessance Earring",
		body = 'Nyame Mail',
		hands = 'Nyame Gauntlets',
		ring1 = "Petrov Ring",
		ring2 = "Chirich Ring +1",
		back = "Solemnity Cape",
		waist = "Windbuffet Belt +1",
		legs = gear.jhakri.legs,
		feet = 'Nyame Sollerets',
	}
		
	sets.engaged.DW = {}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}
	
	-- Gear for Magic Burst mode.
	sets.MagicBurst = set_combine(sets.midcast['Elemental Magic'], {
		ring1 = 'Locus Ring',
	})
	sets.ResistantMagicBurst = {}
	
	sets.buff.Sublimation = {}
	sets.buff.DTSublimation = {}
	
	-- Weapons sets
	sets.weapons.TP = { main = 'Daybreak', sub = "Genmei Shield" }
	sets.weapons.DualTP = { main = 'Daybreak', sub = "Ternion Dagger +1" }
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 5)
end