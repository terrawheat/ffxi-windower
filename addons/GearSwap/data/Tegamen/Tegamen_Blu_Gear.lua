function user_job_setup()
	-- Options: Override default values
	autows = 'Savage Blade'
		
	state.OffenseMode:options('Fodder','Normal','Acc','FullAcc')
	state.HybridMode:options('Normal','DT', 'Weak')
	state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
	state.CastingMode:options('Normal','Resistant','Fodder','Proc')
	state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Savage','CDC','Nuking','Clubs','LowDmg')

	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

	-- Additional local binds
	send_command('bind !` input /ja "Burst Affinity" <me>')

	select_default_macro_book()
end

function user_job_self_command(commandArgs, eventArgs)
	local cmd = commandArgs[1];

	if cmd == 'FullBuff' then
			windower.add_to_chat(127, 'Performing full buff...')
			return send_command('exec blu/FullBuff.txt')
	end

	if cmd == 'Rebuff' then
			windower.add_to_chat(127, 'Performing full buff...')
			return send_command('exec blu/FullBuff.txt')
	end

	if cmd == 'CrowdControl' then
		return send_command('input /ma "Dream Flower" <t>')
	end
end

function user_job_lockstyle()
	if global_lockstyle then
		windower.chat.input('/lockstyleset ' .. global_lockstyle)
	else
		windower.chat.input('/lockstyleset 12')
	end
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	gear.ambuWSD = { name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%', 'STR+10'}}
	gear.ambuTP = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10'}}

	sets.buff['Burst Affinity'] = {} -- feet="Hashi. Basmak +1"
	sets.buff['Chain Affinity'] = {feet="Assim. Charuqs +2"}
	sets.buff.Convergence = {}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {} -- hands="Luh. Bazubands +1"


	-- Waltz set (chr and vit)
    sets.precast.Waltz = {}
	
	sets.Self_Waltz = {}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}

	sets.precast.Flourish1 = {}

	-- Fast cast sets for spells

	sets.precast.FC = {
		ammo = "Impatiens",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		neck = "Mirage Stole +1",
		body = "Taeon Tabard",
		hands = "Leyline Gloves",
		legs = "Psycloth Lappas",
		feet = "Taeon Boots",
		ear1 = "Etiolation Earring",
		ear2 = "Loquac. Earring",
		ring1 = "Prolix Ring",
		ring2 = "Kishar Ring",
		waist = "Embla Sash",
		back = "Swith Cape"
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +1"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}

	sets.precast.WS.Acc = {}

	sets.precast.WS.FullAcc = {}

	sets.precast.WS.DT = {}

	sets.precast.WS.Fodder = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {
		ammo = "Hydrocera",
		head = gear.jhakri.head,
		neck = "Fotia Gorget",
		left_ear = "Moonshade Earring",
		right_ear = "Brutal Earring",
		body = gear.jhakri.body,
		hands = gear.jhakri.hands,
		ring2 = "Rufescent Ring",
		ring1 = "Epona's Ring",
		back = "Bleating Mantle",
		waist = "Fotia Belt",
		legs= gear.jhakri.legs,
		feet = gear.jhakri.feet,
	}

	sets.precast.WS['Chant du Cygne'] = {
		ammo = "Jukukik Feather",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		left_ear = "Odr Earring",
		right_ear = "Mache Earring +1",
		body = gear.herculean_crit_body,
		hands = "Adhemar Wrist. +1",
		ring1 = "Epona's Ring",
		ring2 = "Begrudging Ring",
		back = "Bleating Mantle",
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = "Thereoid Greaves",
	}

	sets.precast.WS['Savage Blade'] = {
		ammo = "Coiste Bodhar",
		head = "Lilitu Headpiece",
		neck = "Mirage Stole +1",
		ear1 = "Moonshade Earring",
		ear2 = "Ishvara Earring",
		body = "Assim. Jubbah +2",
		hands = gear.jhakri.hands,
		ring1 = "Karieyh Ring +1",
		ring2 = "Rufescent Ring",
		back = gear.ambuWSD,
		waist = "Sailfi Belt +1",
		legs= "Luhlaza Shalwar +2",
		feet = gear.herculean_wsd_feet,
	}

	sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS['Savage Blade'], {
		head = gear.herculean_ws_head,
		back = "Bleating Mantle",
	})

	sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']

	sets.precast.WS['Expiacion'] = sets.precast.WS['Savage Blade']

	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.Requiescat, {
		head = gear.herculean_nuke_head,
		neck = "Sanctity Necklace",
		left_ear = "Friomisi Earring",
		right_ear = "Novio Earring",
		ring1 = "Metamor. Ring +1"
	})

	sets.precast.WS['Flash Nova'] = sets.precast.WS['Sanguine Blade']
					 
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {}

	-- Midcast Sets
	sets.midcast.FastRecast = sets.precast.FC

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {
		ammo = "Falcon Eye",
		head = "Malignance Chapeau",
		neck = "Mirage Stole +1",
		ring1 = "Apate Ring",
		ring2 = "Ifrit ring",
		waist = "Eschan Stone",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		legs = gear.jhakri.legs,
		feet = gear.jhakri.feet,
	}

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {
		ammo = "Pemphredo Tathlum",
		head = gear.herculean_nuke_head,
		body = gear.jhakri.body,
		hands = gear.jhakri.hands,
		legs= "Luhlaza Shalwar +2",
		feet = gear.jhakri.feet,
		neck = "Sanctity Necklace",
		waist = "Eschan Stone",
		left_ear = "Friomisi Earring",
		right_ear = "Novio Earring",
		ring1 = "Metamor. Ring +1",
		ring2 = "Acumen Ring",
		back = "Cornflower Cape",
	}
					 
	sets.midcast['Enfeebling Magic'] = {}

	sets.midcast['Dark Magic'] = {}

	sets.midcast['Enhancing Magic'] = {
		ear1 = 'Mimir Earring',
		ring1 = "Stikini Ring",
		ring2 = "Stikini Ring",
		waist = "Embla Sash",
	}
		
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
		body = gear.taeon_phalanx_body,
		hands = gear.herculean_phalanx_hands,
		legs = gear.taeon_phalanx_legs,
	})

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		waist = "Gishdubar Sash",
	})

	sets.midcast.Aquaveil = {}

	sets.midcast.Stoneskin = {}

	sets.midcast.BarElement = {}
	
	sets.midcast.Protect = {}
	sets.midcast.Protectra = {}
	sets.midcast.Shell = {}
	sets.midcast.Shellra = {}

	sets.midcast['Divine Magic'] = {}

	sets.midcast['Elemental Magic'] = {}

	sets.midcast['Elemental Magic'].Resistant = {}

	sets.midcast.Helix = sets.midcast['Elemental Magic']

	sets.element.Dark = {ring2="Archon Ring"}
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast.Cure = {}

	sets.midcast.Cursna =  {}

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = sets.midcast['Blue Magic'].Physical

	-- Other Specific Spells --

	sets.midcast['Blue Magic'].Healing = {}

	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {}

	sets.midcast['Blue Magic'].SkillBasedBuff = {
		head = "Mirage Keffiyeh",
		neck = "Mirage Stole +1",
		body = "Assim. Jubbah +2",
		hands = "Hashi. Bazu. +1",
		legs = "Hashishin Tayt +1",
		back = { name="Cornflower Cape", augments={'MP+16','DEX+4','Accuracy+4',}},
		feet = "Luhlaza Charuqs"
	}

	sets.midcast['Blue Magic'].Buff = {
		head = "Mirage Keffiyeh",
		neck = "Mirage Stole +1",
		body = "Assim. Jubbah +2",
		hands = "Hashi. Bazu. +1",
		legs = "Hashishin Tayt +1",
		back = { name="Cornflower Cape", augments={'MP+16','DEX+4','Accuracy+4',}},
		feet = "Luhlaza Charuqs"
	}

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {}

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		ammo = "Staunch Tathlum",
		head = "Rawhide Mask",
		neck = "Bathy Choker +1",
		ear1 = "Etiolation Earring",
		ear2 = "Infused Earring",
		body = gear.jhakri.body,
		hands = "Malignance Gloves",
		ring1 = 'Defending Ring',
		ring2 = "Dark Ring",
		back = 'Solemnity Cape',
		waist = "Fucho-no-Obi",
		legs = 'Carmine Cuisses +1',
		feet = "Nyame Sollerets",
	}
	
	sets.idle.PDT = set_combine(sets.idle, {
		head = "Malignance Chapeau",
		neck = "Loricate Torque +1",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		ring1 = 'Defending Ring',
		ring2 = "Gelatinous Ring",
		back = 'Solemnity Cape',
	})

	-- Defense sets
	sets.defense.PDT = sets.idle.PDT

	sets.defense.MDT = sets.idle.PDT

	sets.defense.MEVA = sets.idle.PDT

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {}

    -- Extra Melee sets.  Apply these on top of melee sets.
	sets.Knockback = {}
	sets.MP = {ear1="Suppanomimi", ear2="Ethereal Earring"}
	sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Savage = {main="Naegling",sub="Thibron"}
	sets.weapons.CDC = {main="Naegling",sub="Tanmogayi +1"}
	sets.weapons.Nuking = {main="Maxentius",sub="Naegling"}
	sets.weapons.Clubs = {main="Maxentius",sub="Thibron"}
	sets.weapons.LowDmg = {main="Ibushi Shinai",sub="Ash Club"}

	-- Engaged sets

	sets.engaged = {
		ammo = "Coiste Bodhar",
		head = "Adhemar Bonnet +1",
		neck = "Mirage Stole +1",
		ear1 = "Suppanomimi",
		ear2 = "Dedition Earring",
		body = "Malignance Tabard",
		hands = 'Adhemar Wrist. +1',
		legs = 'Samnuha Tights',
		feet = gear.herculean_ta_feet,
		waist = "Windbuffet Belt +1",
		ring2 = "Epona's Ring",
		ring1 = "Petrov Ring",
		back = gear.ambuTP,
	}

	sets.engaged.AM = {}


	sets.engaged.Acc = set_combine(sets.engaged, {
		ammo = "Falcon Eye",
		head = { name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		hands = "Malignance Gloves",
		legs = gear.jhakri.legs,
		feet = "Assim. Charuqs +2"
	})

	sets.engaged.Acc.AM = {}

	sets.engaged.FullAcc = set_combine(sets.engaged.Acc, {
		ear2 = "Brutal Earring",
	});

	sets.engaged.FullAcc.AM = {}

	sets.engaged.Fodder = sets.engaged

	sets.engaged.Fodder.AM = {}

	sets.engaged.DT = set_combine(sets.engaged, {
		ammo = "Staunch Tathlum",
		head = "Malignance Chapeau",
		hands = "Malignance Gloves",
		ring1 = 'Defending Ring',
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets",
	})

	sets.engaged.DT.AM = {}

	sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, {
		head = "Malignance Chapeau",
		ring1 = 'Defending Ring',
		feet = "Aya. Gambieras +2",
	})
				
	sets.engaged.Acc.DT.AM = {}

	sets.engaged.FullAcc.DT = set_combine(sets.engaged.FullAcc, {
		head = "Malignance Chapeau",
		ring1 = 'Defending Ring',
		feet = "Aya. Gambieras +2",
	})

	sets.engaged.Fodder.DT = set_combine(sets.engaged.Fodder, {
		head = "Malignance Chapeau",
		ring1 = 'Defending Ring',
		feet = "Aya. Gambieras +2",
	})

	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	sets.MagicBurst = {}
	sets.Phalanx_Received = {}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'THF' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 1)
	else
		set_macro_page(1, 1)
	end
end

function user_job_lockstyle()
	if global_lockstyle then
		windower.chat.input('/lockstyleset ' .. global_lockstyle)
	else
		windower.chat.input('/lockstyleset 1')
	end
end