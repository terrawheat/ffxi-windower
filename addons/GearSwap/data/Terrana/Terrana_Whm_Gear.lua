-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','Acc')
	state.CastingMode:options('Normal','Resistant')
	state.IdleMode:options('Refresh','DT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons')

		-- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {}
	sets.weapons.DualWeapons = {}
	
	sets.buff.Sublimation = {waist="Embla Sash"} 
	sets.buff.DTSublimation = {waist="Embla Sash"} 
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
		head = 'Nahtirah Hat',
		body = gear.inyanga.body,
		hands = "Gende. Gages +1",
		legs = gear.inyanga.legs,
		ear1 = "Malignance Earring",
		ear2 = "Etiolation Earring",
	}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
		legs = "Ebers Pant. +1",
		back = "Disperser's Cape",
		ear2 = "Nourish. Earring +1",
	})

	sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

	sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		feet = 'Vanya Clogs',
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
		main = 'Iridal Staff',
		sub = 'Enki Strap',
		head = 'Ebers Cap +1',
		ear2 = "Nourish. Earring +1",
		body = 'Ebers Bliaud +1',
		hands = 'Vanya Cuffs',
		waist = 'Hachirin-no-Obi',
		legs = 'Ebers Pant. +1',
		feet = 'Vanya Clogs',
		ring1 = 'Lebeche Ring',
	}
		
	sets.midcast.CureSolace = set_combine(sets.midcast.Cure, {})

	sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {})

	sets.midcast.LightWeatherCureSolace = set_combine(sets.midcast.Cure, {})
		
	sets.midcast.LightDayCureSolace = set_combine(sets.midcast.Cure, {})

	sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {})

	sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})
		
	sets.midcast.LightWeatherCuraga = set_combine(sets.midcast.Cure, {})
		
	sets.midcast.LightDayCuraga = set_combine(sets.midcast.Cure, {})

	sets.midcast.Cure.DT = set_combine(sets.midcast.Cure, {})
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {})

	sets.midcast.Cursna = {
		hands = 'Ebers Mitts +1',
		legs = 'Ebers Pant. +1',
		feet = 'Vanya Clogs',
		back = 'Mending Cape',
	}
	
	sets.midcast.StatusRemoval = {
		hands = 'Ebers Mitts +1',
		legs = 'Ebers Pant. +1',
	}
	
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {})
	
	-- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {
		head = "Telchine Cap",
		body = "Telchine Chas.",
		hands = "Telchine Gloves",
		ear2 = 'Andoaa Earring',
		legs = "Telchine Braconi",
		feet = "Telchine Pigaches",
		waist = 'Embla Sash',
	}
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {
		feet = 'Ebers Duckbills +1',
	})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
		main = 'Bolelabunga',
		sub = 'Culminus',
		head = gear.inyanga.head,
		hands = 'Ebers Mitts +1',
	})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
		main = "Beneficus",
		head = 'Ebers Cap +1',
		body = 'Ebers Bliaud +1',
		hands = 'Ebers Mitts +1',
		legs = 'Ebers Pant. +1',
		feet = 'Ebers Duckbills +1',
	})

	sets.midcast.Impact = {}
		
	sets.midcast['Elemental Magic'] = {}

	sets.midcast['Elemental Magic'].Resistant = {}

	sets.midcast['Divine Magic'] = {
		body = 'Vanya Robe',
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
		main = 'Iridal Staff',
		sub = 'Enki Strap',
		head = gear.inyanga.head,
		body = 'Vanya Robe',
	}

	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
    head = gear.inyanga.head,
    body = 'Ebers Bliaud +1',
    hands = gear.inyanga.hands,
    legs = gear.inyanga.legs,
    feet = gear.inyanga.feet,
    neck = "Sanctity Necklace",
    left_ear = "Etiolation Earring",
    right_ear = "Hearty Earring",
    left_ring = "Inyanga Ring",
    right_ring = "Warden's Ring",
	}

	sets.idle.Refresh = set_combine(sets.idle, {
		main = 'Bolelabunga',
		sub = 'Culminus',
	})

	sets.idle.DT = set_combine(sets.idle, {
		main = "Malignance Pole",
    sub = "Mensch Strap",
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
		head = gear.ayanmo.head,
		hands = gear.ayanmo.hands,
		body = gear.ayanmo.body,
		feet = gear.ayanmo.feet,
		legs = gear.ayanmo.legs,
		waist = 'Sailfi belt +1',
		ear1 = 'Brutal Earring',
		ear2 = 'Etiolation Earring',
		back = 'Bleating Mantle',
		ring1 = 'Rajas Ring',
		ring2 = "Warden's Ring",
		neck = 'Sanctity Necklace'
	}

	sets.engaged.Acc = set_combine(sets.engaged, {})

	sets.engaged.DW = set_combine(sets.engaged, {})

	sets.engaged.DW.Acc = set_combine(sets.engaged, {})

	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Divine Caress'] = {
		back = 'Mending Cape',
	}

	sets.HPDown = {}

	sets.HPCure = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(3, 6)
end