-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	autows = 'Trueflight'
	autowstp = 1500
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DTLite','DT')
	state.RangedMode:options('Normal','Acc','Fodder')
	state.WeaponskillMode:options('Match','Normal', 'Acc')
	state.IdleMode:options('Normal', 'PDT', 'DynaRP')
	state.Weapons:options('Gastraphetes', 'Armageddon', 'SmoothBrain')
	
	options.ammo_warning_limit = 15
	ammostock = 198

	WeaponType =  {
			['Fomalhaut'] = "Gun",
			['Anarchy +2'] = "Gun",
			['Sparrowhawk +2'] = "Bow",
			['Gastraphetes'] = "Crossbow",
			['Armageddon'] = "Gun",
			['Shortbow'] = "Bow",
			['Light Crossbow'] = "Crossbow",
	}

	DefaultAmmo = {
		['Bow']  = {
			['Default'] = "Stone Arrow",
			['WS'] = "Stone Arrow",
			['Acc'] = "Stone Arrow",
			['Magic'] = "Stone Arrow",
			['MagicAcc'] = "Stone Arrow",
		},
		['Gun']  = {
			['Default'] = "Chrono Bullet",
			['WS'] = "Chrono Bullet",
			['Acc'] = "Chrono Bullet",
			['Magic'] = "Devastating Bullet",
			['MagicAcc'] = "Devastating Bullet",
		},					
		['Crossbow'] = {
			['Default'] = "Quelling Bolt",
			['WS'] = "Quelling Bolt",
			['Acc'] = "Quelling Bolt",
			['Magic'] = "Quelling Bolt",
			['MagicAcc'] = "Quelling Bolt",
		}
	}
	
	    -- Additional local binds
	send_command('bind @f7 gs c toggle RngHelper')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()

end

function user_job_self_command(commandArgs, eventArgs)
	local cmd = commandArgs[1];

	if cmd == "defdown" then
		equip({ ammo = 'Abrasion Bolt' })
		disable('ammo');
		windower.chat.input:schedule(0.6, '/ra <t>');
		enable:schedule(2, 'ammo')
	end
end

function user_job_buff_change(buff, gain)
	if buff:contains('Aftermath') and gain then
		windower.send_command('@timers c "Aftermath" 180 down spells/00894.png')
	end
end

-- Set up all gear sets.
function init_gear_sets()
	gear.ambuSnapshot = { name="Belenus's Cape", augments={'"Snapshot"+10'}}
	gear.ambuMidshot = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10'}}
	gear.ambuTrueflight = { name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%'}}
	gear.ambuLastStand = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%'}}
	gear.ambuCrit = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10'}}
	gear.ambuMeleeTP = { name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}}
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	-- Precast sets to enhance JAs
	sets.TreasureHunter = set_combine(sets.TreasureHunter, { ammo = "Abrasion Bolt" }) -- stop the egg being loaded!
	sets.precast.JA['Eagle Eye Shot'] = set_combine(sets.midcast.RA, { legs = "Arc. Braccae +3" })
	sets.precast.JA['Bounty Shot'] = set_combine(sets.TreasureHunter, {}) -- hands="Amini Glove. +1"
	sets.precast.JA['Camouflage'] = {
		body = "Orion Jerkin +1"
	} -- 
	sets.precast.JA['Scavenge'] = {feet = "Orion Socks +2"}
	sets.precast.JA['Shadowbind'] = {
		hands = "Orion Bracers +2"
	} -- 
	sets.precast.JA['Sharpshot'] = {
		legs = "Orion Braccae +2"
	} -- 
	sets.precast.JA['Double Shot'] = {}


	-- Fast cast sets for spells

	sets.precast.FC = {
		head = "Herculean Helm",
		ear2 = 'Etiolation Earring',
		ring1 = "Weather. Ring",
		ring2 = "Kishar Ring",
		legs = "Rawhide Trousers",
	}

	sets.precast.Waltz = {
		head = gear.mummu.head,
		neck = "Loricate Torque +1",
		ear1 = "Infused Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nisroch Jerkin",
		hands = "Orion Bracers +2",
		ring1 = "Metamor. Ring +1",
		ring2 = "Defending Ring",
		waist = "Chaac Belt",
		legs = "Nyame Flanchard",
		feet = "Rawhide Boots"
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head = gear.taeon_snapshot_head,
		neck = "Scout's Gorget +1",
		body = "Amini Caban +1",
		hands = 'Carmine Fin. Ga. +1',
		ring1 = 'Crepuscular Ring',
		back = gear.ambuSnapshot,
		waist = 'Yemaya Belt',
		legs = "Adhemar Kecks +1",
		feet = gear.meg.feet,
	}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
		head = "Orion Beret +2",
	})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {
		head = "Orion Beret +2",
		feet = "Arcadian Socks +3",
	})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
			head = "Orion Beret +2",
			neck = "Scout's Gorget +1",
			ear1 = 'Ishvara Earring',
			ear2 = 'Moonshade Earring',
			body = gear.herculean_wsd_body,
			hands = gear.meg.hands,
			ring1 = "Epaminondas's Ring",
			ring2 = 'Dingir Ring',
			back = gear.ambuLastStand,
			waist = "Fotia Belt",
			legs = 'Arc. Braccae +3',
			feet = gear.herculean_wsd_feet,
		}

		sets.precast.WS['Last Stand'] = sets.precast.WS
		
    sets.precast.WS['Trueflight'] = {
			head = empty,
			neck = "Scout's Gorget +1",
			ear1 = "Friomisi Earring",
			ear2 = "Moonshade Earring",
			body = "Cohort Cloak +1",
			hands = 'Carmine Fin. Ga. +1',
			ring1 = "Epaminondas's Ring",
			ring2 = 'Weather. Ring',
			back = gear.ambuTrueflight,
			waist = 'Eschan Stone',
			legs = "Arc. Braccae +3",
			feet = gear.herculean_wsd_feet,
    }

    sets.precast.WS['Wildfire'] = {
			head = empty,
			neck = "Scout's Gorget +1",
			ear1 = "Friomisi Earring",
			body = "Cohort Cloak +1",
			hands = 'Carmine Fin. Ga. +1',
			ring1 = "Epaminondas's Ring",
			ring2 = 'Dingir Ring',
			back = gear.ambuTrueflight,
			waist = 'Eschan Stone',
			legs = "Arc. Braccae +3",
			feet = gear.herculean_wsd_feet,
    }

    sets.precast.WS['Hot Shot'] = {
			head = empty,
			neck = "Scout's Gorget +1",
			ear1 = "Friomisi Earring",
			ear2 = "Moonshade Earring",
			body = "Cohort Cloak +1",
			hands = 'Carmine Fin. Ga. +1',
			ring1 = "Epaminondas's Ring",
			ring2 = 'Dingir Ring',
			back = gear.ambuTrueflight,
			waist = 'Fotia Belt',
			legs = "Arc. Braccae +3",
			feet = gear.herculean_wsd_feet,
    }

		sets.precast.WS['Flaming Arrow'] = sets.precast.WS['Hot Shot']
		
    sets.precast.WS['Aeolian Edge'] = sets.precast.WS['Trueflight']
		sets.precast.WS['Savage Blade'] = {
			head = "Orion Beret +2",
			neck = "Scout's Gorget +1",
			ear1 = "Moonshade Earring",
			ear2 = "Ishvara Earring",
			body = gear.meg.body,
			hands = gear.meg.hands,
			ring1 = "Epaminondas's Ring",
			ring2 = 'Rufescent Ring',
			back = gear.ambuMidshot,
			legs = 'Arc. Braccae +3',
			feet = gear.meg.feet,
		}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
	sets.midcast.FastRecast = sets.precast.FC
		
	-- Ranged sets

	sets.midcast.RA = {
		head = "Arcadian Beret +3",
		neck = "Scout's Gorget +1",
		ear1 = 'Crep. Earring',
		ear2 = 'Dedition Earring',
		body = "Nisroch Jerkin",
		hands = 'Malignance Gloves',
		ring1 = 'Crepuscular Ring',
		ring2 = "Ilabrat Ring",
		back = gear.ambuMidshot,
		waist = 'Yemaya Belt',
		legs = "Ikenga's Trousers",
		feet = "Malignance Boots",
	}

	sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {
		head = "Orion Beret +2",
		ear2 = 'Beyla Earring',
		legs = "Malignance Tights",
		feet = "Orion Socks +2",
	})

	sets.midcast.RA.Armageddon = sets.midcast.RA
	sets.midcast.RA.Armageddon.AM = {
		head = gear.meg.head,
		neck = "Scout's Gorget +1",
		ear1 = 'Crep. Earring',
		ear2 = 'Odr Earring',
		body = 'Nisroch Jerkin',
		hands = gear.mummu.hands,
		ring1 = 'Dingir Ring',
		ring2 = 'Mummu Ring',
		back = gear.ambuCrit,
		waist = 'K. Kachina Belt +1',
		legs = "Darraigner's Brais",
		feet = "Osh. Leggings +1"
	}
		
	--These sets will overlay based on accuracy level, regardless of other options.
	sets.buff.Camouflage = {
	}

	sets.buff['Double Shot'] = set_combine(sets.midcast.RA, {
		body = "Arc. Jerkin +3",
	})

	sets.buff['Double Shot'].Armageddon = sets.buff['Double Shot'];
	sets.buff['Double Shot'].Armageddon.AM = set_combine(sets.midcast.RA.AM, {
		body = "Arc. Jerkin +3",
		ring2 = 'Begrudging Ring',
		feet = "Osh. Leggings +1"
	});

	sets.buff.Barrage = {
		head = "Orion Beret +2",
		-- body = "Orion Jerkin +1",
		hands = "Orion Bracers +2",
		feet = "Orion Socks +2",
	}
	sets.TreasureHunter = {
		waist = "Chaac Belt",
	}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
	sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		head = gear.meg.head,
		neck = "Loricate Torque +1",
		ear1 = 'Infused Earring',
		ear2 = 'Odnowa Earring +1',
		body = "Malignance Tabard",
		hands = gear.meg.hands,
		ring1 = 'Defending Ring',
		ring2 = "Warden's Ring",
		back = gear.ambuMidshot,
		waist = 'Eschan Stone',
		legs = "Carmine Cuisses +1",
		feet = "Orion Socks +2",
	}

	sets.idle.DynaRP = set_combine(sets.idle, {
		neck = 'Scout\'s Gorget +1',
	})
	
	-- Defense sets
	sets.idle.PDT = set_combine(sets.idle, {
		ear1 = 'Eabani Earring',
		ring1 = 'Gelatinous Ring',
		legs = "Malignance Tights",
		feet = 'Nyame Sollerets'
	})
	
	sets.Kiting = {
		legs = "Carmine Cuisses +1",
	}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Armageddon = {main="Oneiros Knife",sub="Nusku Shield",range="Armageddon"}
	sets.weapons.Gastraphetes = {main="Malevolence",sub="Tauret",range="Gastraphetes"}
	sets.weapons.SmoothBrain = {main="Naegling", sub="Blurred Knife +1",range="Sparrowhawk +2",ammo="Hauksbok Arrow"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    -- Normal melee group
	sets.engaged = {
		head = 'Adhemar Bonnet +1',
		neck = 'Iskur Gorget',
		ear1 = 'Sherida Earring',
		ear2 = 'Crep. Earring',
		body = "Malignance Tabard",
		hands = 'Adhemar Wrist. +1',
		ring1 = 'Ilabrat Ring',
		ring2 = "Epona's Ring",
		waist = 'Windbuffet Belt +1',
		legs = "Samnuha Tights",
		feet = "Malignance Boots",
	}
    
	sets.engaged.DTLite = set_combine(sets.engaged, {
		neck = 'Loricate Torque +1',
		ring1 = 'Defending Ring',
		legs = "Malignance Tights",
	})
		
	sets.engaged.DW = set_combine(sets.engaged, {})
	sets.engaged.DW.DTLite = set_combine(sets.engaged, {
		neck = 'Loricate Torque +1',
		ring1 = 'Defending Ring',
		legs = "Malignance Tights",
})

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1, 19)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 19)
    elseif player.sub_job == 'DRG' then
        set_macro_page(3, 19)
    else
        set_macro_page(1, 19)
    end
end

function user_job_lockstyle()
	if global_lockstyle then
		windower.chat.input('/lockstyleset ' .. global_lockstyle)
	else
		windower.chat.input('/lockstyleset 7')
	end
end