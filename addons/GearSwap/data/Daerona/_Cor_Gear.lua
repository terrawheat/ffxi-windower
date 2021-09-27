-- Setup vars that are user-dependent.  Can override this function in a sidecar file.

function user_job_self_command(commandArgs, eventArgs)
    local cmd = commandArgs[1];

    if cmd == 'gearinfo' then
        local dwRequired = tonumber(commandArgs[2])

        if not dwRequired then
            state.HasteLevel:set('N/A')
        else
            if dwRequired >= 67 then
                state.HasteLevel:set('NoHaste')
            elseif dwRequired >= 56 and dwRequired < 67 then
                state.HasteLevel:set('LowHaste')
            elseif dwRequired >= 36 and dwRequired < 56 then
                state.HasteLevel:set('MidHaste')
            elseif dwRequired < 36 and dwRequired > 0 then
                state.HasteLevel:set('MaxHaste')
            else
                state.HasteLevel:set('N/A')
            end
        end

        update_melee_groups();
    end
end

function update_melee_groups()
    classes.CustomMeleeGroups:clear()
    classes.CustomMeleeGroups:append(state.HasteLevel.value)
end

function user_job_setup()
    autows = 'Savage Blade'
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh', 'Regen', 'DynaRP')
	state.HybridMode:options('Normal','DT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('DualWield', 'SingleWield', 'Savage', 'Evisceration')
    state.CompensatorMode:options('Always','300','1000','Never')
    state.HasteLevel = M{['description']='Haste Mode', 'N/A', 'NoHaste', 'LowHaste', 'MidHaste', 'MaxHaste'}

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Devestating Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Animikii Bullet"

    options.ammo_warning_limit = 15

    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	send_command('bind @pause roller roll')

    select_default_macro_book()
    init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","RngHelper","AutoStunMode","AutoDefenseMode","LuzafRing",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","RangedMode","WeaponskillMode","ElementalMode","IdleMode","HasteLevel","Passive","RuneElement","CompensatorMode","TreasureMode",})
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    gear.LastStandAmbu = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%'}}
    gear.LeadenAmbu = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%','AGI+10'}}
    gear.TPAmbu = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%'}}
    gear.MidshotAmbu = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10'}}
    gear.PreshotAmbu = { name="Camulus's Mantle", augments={'"Snapshot"+10'}}

    -- Weapons sets
	sets.weapons.DualWield = { main = "Naegling", sub = "Blurred Knife +1", range = "Armageddon" }
	sets.weapons.SingleWield = { main = "Kustawi +1", sub = "Nusku Shield", range = "Armageddon" }
	sets.weapons.Savage = { main = "Naegling", sub = "Blurred Knife +1", range = "Anarchy +2" }
	sets.weapons.Evisceration = { main = "Tauret", sub = "Blurred Knife +1", range = "Anarchy +2" }

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
    sets.precast.JA['Snake Eye'] = {}
    sets.precast.JA['Wild Card'] = { feet = "Lanun Bottes +3" }
    sets.precast.JA['Random Deal'] = { body = "Lanun Frac +3" }
    sets.precast.FoldDoubleBust = {
        hands = 'Lanun Gants +1',
    }

    sets.precast.CorsairRoll = {
        range = 'Compensator',
        head = "Lanun Tricorne +3",
        neck = 'Loricate Torque +1',
        ear1 = 'Etiolation Earring',
        ear2 = "Odnowa Earring +1",
        hands = "Chasseur's Gants +1",
        ring1 = 'Barataria Ring',
        ring2 = "Defending Ring",
        back = "Camulus's Mantle",
        feet = 'Malignance Boots',
    }

    sets.precast.LuzafRing = set_combine(sets.precast.CorsairRoll, {
        ring2 = "Luzaf's Ring"
    })
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {
        head = "Chass. Tricorne +1"
    })
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {
        body = "Chasseur's Frac +1",
    })
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {
        hands = "Chasseur's Gants +1",
    })
    
    sets.precast.CorsairShot = {
        head = "Chass. Tricorne +1",
        neck = 'Iskur Gorget',
        ear1 = "Friomisi Earring",
        ear2 = "Crep. Earring",
        body = "Lanun Frac +3",
        hands = 'Carmine Fin. Ga. +1',
        ring1 = "Dingir Ring",
        ring2 = 'Crepuscular Ring',
        back = gear.LeadenAmbu,
        waist = 'Eschan Stone',
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
    }
    
	sets.precast.CorsairShot.Damage = sets.precast.CorsairShot
	
    sets.precast.CorsairShot.Proc = sets.precast.CorsairShot

    sets.precast.CorsairShot['Light Shot'] = {
        head = gear.mummu.head,
        neck = 'Comm. Charm +1',
        body = "Malignance Tabard",
        hands = gear.mummu.hands,
        ring1 = 'Arvina Ringlet +1',
        legs = gear.mummu.legs,
        feet = 'Lanun Bottes +3',
    }

    sets.precast.CorsairShot['Dark Shot'] = sets.precast.CorsairShot['Light Shot']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head = "Herculean Helm",
        ear2 = 'Etiolation Earring',
        ring1 = "Weather. Ring",
        ring2 = "Kishar Ring",
        legs = "Rawhide Trousers",
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        ear1 = "Mendi. Earring",
    })

    sets.precast.RA = {
        head = "Chass. Tricorne +1",
        neck = "Comm. Charm +1",
        body = "Laksa. Frac +3",
        hands = 'Lanun Gants +1',
        ring2 = 'Crepuscular Ring',
        back = gear.PreshotAmbu,
        waist = 'Yemaya Belt',
        legs = "Adhemar Kecks +1",
        feet = gear.meg.feet,
    }
    
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
        body = "Laksa. Frac +3",
    })
    
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {
        head = "Pursuer's Beret",
        body = "Laksa. Frac +3",
        hands = 'Carmine Fin. Ga. +1',
    })

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        hands = gear.mummu.hands,
    }
    sets.precast.WS.Acc = {}		
    sets.precast.WS.Proc = {}

    sets.precast.WS['Leaden Salute'] = {
        ammo = gear.MAbullet,
        head = 'Pixie Hairpin +1',
        neck = 'Comm. Charm +1',
        ear1 = 'Friomisi Earring',
        ear2 = 'Moonshade Earring',
        body = "Lanun Frac +3",
        hands = "Carmine Fin. Ga. +1",
        ring1 = 'Dingir Ring',
        ring2 = 'Archon Ring',
        back = gear.LeadenAmbu,
        waist = 'Eschan Stone',
        legs = "Nyame Flanchard",
        feet = 'Lanun Bottes +3',
    }
    
    sets.precast.WS['Wildfire'] = {
        ammo = gear.MAbullet,
        head = gear.herculean_mag_wsd_head,
        neck = 'Comm. Charm +1',
        ear1 = "Friomisi Earring",
        body = "Lanun Frac +3",
        hands = "Carmine Fin. Ga. +1",
        ring1 = 'Dingir Ring',
        ring2 = 'Ilabrat Ring',
        waist = 'Eschan Stone',
        legs = "Nyame Flanchard",
        feet = 'Lanun Bottes +3',
    }

    sets.precast.WS['Last Stand'] = {
        ammo = gear.WSbullet,
        head = "Lanun Tricorne +3",
        neck = 'Fotia Gorget',
        ear1 = 'Ishvara Earring',
        ear2 = 'Moonshade Earring',
        body = "Laksa. Frac +3",
        hands = gear.meg.hands,
        ring1 = 'Dingir Ring',
        ring2 = 'Apate Ring',
        back = gear.LastStandAmbu,
        waist = "Fotia Belt",
        legs = gear.herculean_wsd_legs,
        feet = 'Lanun Bottes +3',
    }

    sets.precast.WS['Hot Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']

    sets.precast.WS['Savage Blade'] = {
        head = gear.meg.head,
        neck = 'Comm. Charm +1',
        ear1 = "Ishvara Earring",
        ear2 = 'Moonshade Earring',
        body = "Laksa. Frac +3",
        hands = gear.meg.hands,
        ring1 = 'Rufescent Ring',
        ring2 = 'Apate Ring',
        legs = gear.meg.legs,
        feet = 'Lanun Bottes +3',
    }

    sets.precast.WS['Requiescat'] = {
        head = 'Adhemar Bonnet +1',
        neck = "Fotia Gorget",
        ear2 = 'Moonshade Earring',
        body = gear.meg.body,
        hands = gear.meg.hands,
        waist = "Fotia Belt",
        legs = gear.meg.legs,
        feet = gear.meg.feet,
    }

    sets.precast.WS['Aeolian Edge'] = {
        head = gear.herculean_mag_wsd_head,
        neck = 'Comm. Charm +1',
        ear2 = 'Moonshade Earring',
        body = "Lanun Frac +3",
        hands = gear.herculean_ws_hands,
        ring1 = 'Dingir Ring',
        ring2 = 'Arvina Ringlet +1',
        waist = 'Eschan Stone',
        legs = "Nyame Flanchard",
        feet = 'Lanun Bottes +3',
    }

    sets.precast.WS['Evisceration'] = {
        head = 'Adhemar Bonnet +1',
        neck = "Fotia Gorget",
        ear1 = "Mache Earring +1",
        ear2 = "Moonshade Earring",
        body = gear.mummu.body,
        hands = gear.mummu.hands,
        waist = "Fotia Belt",
        legs = gear.mummu.legs,
        feet = gear.mummu.feet,
    }
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear2 = "Ishvara Earring"}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {}
        
    -- Specific spells

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {
        head = "Ikenga's Hat",
        neck = "Iskur Gorget",
        ear1 = 'Crep. Earring',
        ear2 = 'Dedition Earring',
        body = "Malignance Tabard",
        hands = gear.meg.hands,
        ring1 = "Dingir Ring",
        ring2 = 'Ilabrat Ring',
        back = gear.MidshotAmbu,
        waist = 'Yemaya Belt',
        legs = "Ikenga's Trousers",
        feet = "Malignance Boots",
    }

    sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {
		ear2 = 'Beyla Earring',
		legs = "Malignance Tights",
	})

	sets.midcast.RA.AM = {
		head = gear.meg.head,
		neck = 'Iskur Gorget',
		ear1 = 'Crep. Earring',
		ear2 = 'Odr Earring',
		body = 'Nisroch Jerkin',
		hands = gear.mummu.hands,
        ring1 = 'Mummu Ring',
        ring2 = 'Dingir Ring',
		back = gear.ambuMidshot,
		waist = 'K. Kachina Belt +1',
		legs = "Darraigner's Brais",
		feet = "Osh. Leggings +1"
	}
		
	sets.buff['Triple Shot'] = {
        body = "Chasseur's Frac +1",
        feet = "Osh. Leggings +1"
    }
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {
        neck = "Loricate Torque +1",
        ear1 = 'Hearty Earring',
        ear2 = 'Odnowa Earring +1',
        body = "Malignance Tabard",
        ring1 = 'Defending Ring',
        ring2 = "Warden's Ring",
        legs = "Crimson Cuisses +1",
        feet = "Malignance Boots",
    }
    
    sets.idle.PDT = set_combine(sets.idle, {
        ear1 = 'Eabani Earring',
        ring1 = 'Gelatinous Ring',
        legs = "Malignance Tights",
    })
		
    sets.idle.Refresh = set_combine(sets.idle, {
        legs = 'Rawhide Trousers',
    })
    
    sets.idle.Regen = set_combine(sets.idle, {
        head = gear.meg.head,
        ear1 = 'Infused Earring',
        body = gear.meg.body,
        hands = gear.meg.hands,
        legs = gear.meg.legs,
        feet = gear.meg.feet,
    })

    sets.idle.DynaRP = set_combine(sets.idle, {
        neck = 'Comm. Charm +1',
    })
    
    -- Defense sets
    sets.defense.PDT = sets.idle.PDT

    sets.defense.MDT = set_combine(sets.defense.PDT, {
        ear2 = 'Etiolation Earring',
    })
		
    sets.defense.MEVA = set_combine(sets.defense.MDT, {})

    sets.Kiting = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group

    gear.DTMixin = {
        neck = 'Loricate Torque +1',
        ring1 = 'Defending Ring',
        legs = "Malignance Tights",
        feet = 'Nyame Sollerets'
    }

    gear.baseTP = {
        head = 'Adhemar Bonnet +1',
        neck = 'Iskur Gorget',
        ear1 = 'Suppanomimi',
        ear2 = 'Crep. Earring',
        body = "Malignance Tabard",
        hands = 'Adhemar Wrist. +1',
        ring1 = 'Rajas Ring',
        ring2 = "Petrov Ring",
        back = gear.TPAmbu,
        waist = 'Windbuffet Belt +1',
        legs = "Samnuha Tights",
        feet = gear.herc_tp_feet,
    }

    sets.engaged = {}
    sets.engaged.DW = {}

    sets.engaged.DW.MaxHaste = gear.baseTP
    sets.engaged.DW.MaxHaste.DT = set_combine(sets.engaged.DW.MaxHaste, gear.DTMixin)

    sets.engaged.DW.MidHaste = set_combine(sets.engaged.DW, {
        ear2 = 'Eabani Earring',
        feet = gear.taeon_tp_feet,
    })
    sets.engaged.DW.MidHaste.DT = set_combine(sets.engaged.DW.MidHaste, gear.DTMixin)

    sets.engaged.DW.LowHaste = set_combine(sets.engaged.DW, {
        ear2 = 'Eabani Earring',
        hands = 'Floral Gauntlets',
        legs = "Crimson Cuisses +1",
        feet = gear.taeon_tp_feet,
    })
    sets.engaged.DW.LowHaste.DT = set_combine(sets.engaged.DW.LowHaste, gear.DTMixin)

    sets.engaged.DW.NoHaste = set_combine(sets.engaged.DW, {
        ear2 = 'Eabani Earring',
        hands = 'Floral Gauntlets',
        legs = "Crimson Cuisses +1",
        feet = gear.taeon_tp_feet,
    })
    sets.engaged.DW.NoHaste.DT = set_combine(sets.engaged.DW.NoHaste, gear.DTMixin)
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1, 17)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 17)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 17)
    elseif player.sub_job == 'DRG' then
        set_macro_page(1, 17)
    else
        set_macro_page(1, 17)
    end
end

function user_job_lockstyle()
    windower.chat.input('/lockstyleset 5')	
end
