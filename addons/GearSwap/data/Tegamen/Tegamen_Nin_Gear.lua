-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_self_command(commandArgs, eventArgs)
    local cmd = commandArgs[1];

    if cmd == 'FullBuff' then
        return send_command('gs c buffup')
    end

    if cmd == 'Rebuff' then
        return send_command('gs c buffup')
    end

    if cmd == 'CrowdControl' then
    end

    if cmd == 'Nuke1' then
        send_command('gs c elemental nuke')
    end

    if cmd == 'Nuke2' then
    end

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
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
	state.RangedMode:options('Normal','Acc')
	state.WeaponskillMode:options('Match','Normal','Acc')
	state.CastingMode:options('Normal','Proc','Resistant')
	state.IdleMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Normal','ProcStaff','ProcDagger','ProcSword','ProcScythe','ProcClub','ProcPolearm','ProcGKat','ProcKatana','ProcGSword')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}
    state.HasteLevel = M{['description']='Haste Mode', 'N/A', 'NoHaste', 'LowHaste', 'MidHaste', 'MaxHaste'}

	send_command('bind ^` input /ja "Innin" <me>')
	send_command('bind !` input /ja "Yonin" <me>')
	send_command('bind @` gs c cycle SkillchainMode')

	utsusemi_cancel_delay = .3
	utsusemi_ni_cancel_delay = .06

	select_default_macro_book()
    init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoNukeMode","AutoStunMode","AutoDefenseMode","ElementalWheel",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","Stance","IdleMode","HasteLevel","Passive","RuneElement","ElementalMode","CastingMode","TreasureMode",})
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.Enmity = {
        ammo = "Agreqaq Bomblet",
        body = "Emet Harness +1",
        ring1 = "Petrov Ring",
        ring2 = "Supershear Ring",
    }

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {} --legs="Mochizuki Hakama",--main="Nagi"
    sets.precast.JA['Futae'] = {} -- hands="Hattori Tekko +1"
    sets.precast.JA['Sange'] = {} --legs="Mochizuki Chainmail"
    sets.precast.JA['Provoke'] = sets.Enmity
    sets.precast.JA['Warcry'] = sets.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {}

    sets.precast.Flourish1 = {}

    -- Fast cast sets for spells

    sets.precast.FC = {
        ammo = "Sapience Orb",
        head = gear.herculean_nuke_head,
        ear1 = "Loquac. Earring",
        ear2 = "Etiolation Earring",
        body = "Taeon Tabard",
        hands = "Leyline Gloves",
        ring1 = "Kishar Ring",
        ring2 = "Prolix Ring",
        legs = "Rawhide Trousers",
        feet = "Taeon Boots",
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {ammo="Staunch Tathlum"})

    -- Snapshot for ranged
    sets.precast.RA = {}
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {
        ammo = "Jukukik Feather",
        head = "Adhemar Bonnet +1",
        neck = "Fotia Gorget",
        ear1 = "Moonshade Earring",
        ear2 = "Lugra Earring +1",
        body = gear.herculean_wsd_body,
        hands = "Adhemar Wrist. +1",
        ring1 = "Epona's Ring",
        ring2 = "Karieyh Ring +1",
        back = "Bleating Mantle",
        waist = "Fotia Belt",
        legs = "Samnuha Tights",
        feet = gear.herculean_wsd_feet,
    })
    sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS['Blade: Shun'], {})

    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {
        ammo = "Seeth. Bomblet +1",
        head = "Hachi. Hatsu. +2",
        neck = "Caro Necklace",
        ear1 = "Moonshade Earring",
        ear2 = "Lugra Earring +1",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Epona's Ring",
        ring2 = "Karieyh Ring +1",
        back = "Bleating Mantle",
        waist = "Sailfi Belt +1",
        legs = "Samnuha Tights",
        feet = gear.herculean_wsd_feet,
    })

    sets.precast.WS['Blade: Chi'] = set_combine(sets.precast.WS, {
        ammo = "Seeth. Bomblet +1",
        head = gear.herculean_ws_head,
        neck = "Caro Necklace",
        ear1 = "Moonshade Earring",
        ear2 = "Lugra Earring +1",
        body = gear.herculean_wsd_body,
        hands = gear.herculean_ta_hands,
        ring1 = "Epona's Ring",
        ring2 = "Karieyh Ring +1",
        back = "Bleating Mantle",
        waist = "Sailfi Belt +1",
        legs = "Samnuha Tights",
        feet = gear.herculean_wsd_feet,
    })

    sets.precast.WS['Blade: Teki'] = sets.precast.WS['Blade: Chi']
    sets.precast.WS['Blade: To'] = sets.precast.WS['Blade: Chi']

    sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS, {
        ammo = "Seeth. Bomblet +1",
        head = "Hachi. Hatsu. +2",
        neck = "Caro Necklace",
        ear1 = "Moonshade Earring",
        ear2 = "Lugra Earring +1",
        body = gear.herculean_wsd_body,
        hands = "Malignance Gloves",
        ring1 = "Epona's Ring",
        ring2 = "Karieyh Ring +1",
        back = "Bleating Mantle",
        waist = "Sailfi Belt +1",
        legs = "Tatena. Haidate +1",
        feet = "Tatena. Sune. +1",
    })

    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {
        head = "Adhemar Bonnet +1",
        ear1 = "Odr Earring",
        ear2 = "Lugra Earring +1",
        waist = "Sailfi Belt +1",
    })

    sets.precast.WS['Aeolian Edge'] = {}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {
        ear1 = "Brutal Earring",
        ear2 = "Lugra Earring +1",
    }
	sets.AccMaxTP = {}
	sets.AccDayMaxTPWSEars = {}
	sets.DayMaxTPWSEars = {}
	sets.AccDayWSEars = {}
	sets.DayWSEars = {}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.ElementalNinjutsu = {
        ammo = "Pemphredo Tathlum",
        ear1 = "Friomisi Earring",
        waist = "Eschan Stone",
    }

	sets.MagicBurst = {ring2="Locus Ring"}

    sets.midcast.NinjutsuDebuff = {
        head = "Hachi. Hatsu. +2",
        neck = "Sanctity Necklace",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        waist = "Eschan Stone",
        feet = "Hachi. Kyahan +1",
    }

    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {})

    sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {}) -- back="Andartia's Mantle",feet="Hattori Kyahan +1"

    sets.midcast.RA = {}

    sets.midcast.RA.Acc = {}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {
        ammo = "Staunch Tathlum",
        head = "Malignance Chapeau",
        neck = "Loricate Torque +1",
        ear1 = "Etiolation Earring",
        ear2 = "Infused Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Defending Ring",
        ring2 = "Dark Ring",
        back = "Solemnity Cape",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
    }

    sets.defense.PDT = sets.idle
    sets.defense.MDT = sets.idle
	sets.defense.MEVA = sets.idle


    sets.Kiting = {}
	sets.DuskKiting = {}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        ammo = "Date Shuriken",
        head = "Adhemar Bonnet +1",
        neck = "Sanctity Necklace",
        ear1 = "Cessance Earring",
        ear2 = "Dedition Earring",
        body = "Malignance Tabard",
        hands = "Adhemar Wrist. +1",
        ring1 = "Petrov Ring",
        ring2 = "Epona's Ring",
        back = "Bleating Mantle",
        waist = "Windbuffet Belt +1",
        legs = "Samnuha Tights",
        feet = gear.herculean_ta_feet,
    }

    sets.engaged.MaxHaste = {
        ammo = "Date Shuriken",
        head = "Adhemar Bonnet +1",
        neck = "Sanctity Necklace",
        ear1 = "Crep. Earring",
        ear2 = "Brutal Earring",
        body = "Malignance Tabard",
        hands = "Adhemar Wrist. +1",
        ring1 = "Petrov Ring",
        ring2 = "Epona's Ring",
        back = "Bleating Mantle",
        waist = "Windbuffet Belt +1",
        legs = "Samnuha Tights",
        feet = gear.herculean_ta_feet,
    }

    sets.engaged.MidHaste = set_combine(sets.engaged.MaxHaste, {})
    sets.engaged.LowHaste = set_combine(sets.engaged.MaxHaste, {
        ear1 = "Eabani Earring",
        ear2 = "Suppanomimi",
    })
    sets.engaged.NoHaste = set_combine(sets.engaged.MaxHaste, {
        ear1 = "Eabani Earring",
        ear2 = "Suppanomimi",
    })

    
    sets.engaged.DT = set_combine(sets.engaged, {
        head = "Malignance Chapeau",
        hands = "Malignance Gloves",
        ring1 = "Defending Ring",
        feet = "Nyame Sollerets",
    })
    
    sets.engaged.Acc = set_combine(sets.engaged, {})
	sets.engaged.Acc.DT = set_combine(sets.engaged.DT, {})


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {} --body="Hattori Ningi +1"
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Futae = {}
    sets.buff.Yonin = {} -- legs="Hattori Hakama +1"
    sets.buff.Innin = {} --head="Hattori Zukin +1"

    -- Extra Melee sets.  Apply these on top of melee sets.
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

	-- Weapons sets
	sets.weapons.Normal = {main="Kunimitsu", sub="Ternion Dagger +1"}
	sets.weapons.ProcStaff = {main="Lamia Staff", sub="Utu Grip"}
	sets.weapons.ProcDagger = {main="Wind Knife", sub="Wind Knife"}
	sets.weapons.ProcSword = {main="Ibushi Shinai", sub="Wind Knife"}
	sets.weapons.ProcScythe = {main="Lost Sickle", sub="Utu Grip"}
	sets.weapons.ProcClub = {main="Ash Club", sub="Wind Knife"}
	sets.weapons.ProcPolearm = {main="Iapetus", sub="Utu Grip"}
	sets.weapons.ProcGKat = {main="Zanmato", sub="Utu Grip"}
	sets.weapons.ProcKatana = {main="Kunai", sub="Wind Knife"}
	sets.weapons.ProcGSword = {main="Lament", sub="Utu Grip"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 12)
    else
        set_macro_page(1, 12)
    end
end

buff_spell_lists = {
	Auto = {	
		{Name='Migawari: Ichi',Buff='Migawari',SpellID=510,When='Combat'},
        {Name='Myoshu: Ichi',Buff='Subtle Blow Plus',SpellID=507,When='Combat'},
		{Name='Kakka: Ichi',Buff='Store TP',SpellID=509,When='Combat'},
	},
	
	Default = {
		{Name='Myoshu: Ichi',Buff='Subtle Blow Plus',SpellID=507,Reapply=false},
		{Name='Kakka: Ichi',Buff='Store TP',SpellID=509,Reapply=false},
	},
}

function user_job_lockstyle()
	if global_lockstyle then
		windower.chat.input('/lockstyleset ' .. global_lockstyle)
	else
		windower.chat.input('/lockstyleset 7')
	end
end