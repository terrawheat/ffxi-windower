sets.idle = {
  head = "Assim. Keffiyeh +2",
  body = "Amalric Doublet",
  hands = "Assim. Bazu. +2",
  legs = "Rawhide Trousers",
  feet = "Aya. Gambieras +2",
  neck = "Twilight Torque",
  ear1 = "Etiolation Earring",
  ear2 = "Infused Earring",
  ring1 = "Karieyh Ring",
  ring2 = "Chirich Ring",
  back = "Solemnity Cape"
}

sets.dt = {
  hands = "Assim. Bazu. +2",
  feet = "Aya. Gambieras +2",
  neck = "Twilight Torque",
  back = "Solemnity Cape",
  ear1 = "Etiolation Earring",
  ear2 = "Ethereal earring",
  ring1 = "Warden's Ring",
  ring2 = { name="Dark Ring", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%',} },
  legs = { name="Iuitl Tights +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -4%','Crit.hit rate+1',}},
}

sets.weapon = {}
sets.weapon.indices = {'Savage Spam', 'CDC Spam', 'Magic'}
sets.weapon.current = 1;
sets.weapon['Savage Spam'] = {
  main = 'Naegling',
  sub = 'Thibron'
}

sets.weapon['CDC Spam'] = {
  main = 'Naegling',
  sub = 'Colada'
}

sets.weapon['Magic'] = {
  main = 'Naegling',
  sub = 'Vampirism'
}

sets.tp = {};
sets.tp.indices = {'normal', 'high'}
sets.tp.current = 1;

sets.tp.normal = {
  ammo = "Ginsen",
  head = "Adhemar bonnet +1",
  body = { name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
  hands = "Adhemar Wristbands",
  legs = 'Samnuha Tights',
  feet = { name="Herculean Boots", augments={'Attack+17','"Triple Atk."+2','AGI+3','Accuracy+12',}},
  neck = "Mirage Stole +1",
  waist = "Windbuffet Belt +1",
  ear1 = "Suppanomimi",
  ear2 = "Brutal Earring",
  ring2 = "Chirich Ring",
  ring1 = "Petrov Ring",
  back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
};

sets.tp.high = set_combine(sets.tp.normal, {
  ammo = "Falcon Eye",
  head = { name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
  legs = "Jhakri Slops +1",
  feet = "Assim. Charuqs +2"
})

sets.cdc_vorpal = {
  ammo = "Jukukik Feather",
  head = "Adhemar bonnet +1",
  body={ name="Herculean Vest", augments={'Crit. hit damage +3%','DEX+2','Attack+13',}},
  hands = "Adhemar Wristbands",
  legs="Samnuha Tights",
  feet = "Aya. Gambieras +2",
  neck = "Fotia Gorget",
  waist = "Fotia Belt",
  left_ear = "Odr Earring",
  right_ear = "Mache Earring +1",
  ring1 = "Rajas Ring",
  ring2 = "Ramuh Ring",
  back = "Bleating Mantle"
}

sets.savage_expiacion = {
  ammo = "Jukukik Feather",
  head = "Lilitu Headpiece",
  body = "Assim. Jubbah +2",
  hands = "Jhakri Cuffs +2",
  feet = { name="Herculean Boots", augments={'Attack+17','"Triple Atk."+2','AGI+3','Accuracy+12',}},
  legs= "Luhlaza Shalwar +2",
  neck = "Mirage Stole +1",
  waist = "Prosilio Belt",
  left_ear = { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
  right_ear = "Ishvara Earring",
  ring1 = "Karieyh Ring",
  ring2 = "Ifrit Ring",
  back = "Buquwik Cape"
}
sets.requiescat = {
  ammo = "Hydrocera",
  head = "Jhakri Coronal +2",
  neck = "Fotia Gorget",
  left_ear = { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
  right_ear = "Brutal Earring",
  body = "Amalric Doublet",
  hands = "Jhakri Cuffs +2",
  ring1 = "Karieyh Ring",
  back = "Bleating Mantle",
  waist = "Salire Belt",
  legs= "Luhlaza Shalwar +2",
  feet = "Jhakri Pigaches +2"
}

sets.sanguine = set_combine(sets.requiescat, {
  head = "Pixie Hairpin +1",
  neck = "Sanctity Necklace",
  left_ear = "Friomisi Earring",
  right_ear = "Novio Earring",
  ring1 = "Metamor. Ring +1"
})

sets.nuke = {
  ammo = "Ghastly Tathlum +1",
  head={ name="Herculean Helm", augments={'Mag. Acc.+18','INT+14','"Mag.Atk.Bns."+11',}},
  body = "Amalric Doublet",
  hands = "Jhakri Cuffs +2",
  legs= "Luhlaza Shalwar +2",
  feet = "Jhakri Pigaches +2",
  neck = "Sanctity Necklace",
  waist = "Penitent's Rope",
  left_ear = "Friomisi Earring",
  right_ear = "Novio Earring",
  ring1 = "Metamor. Ring +1",
  ring2 = "Acumen Ring",
  back = { name="Cornflower Cape", augments={'MP+16','DEX+4','Accuracy+4',}},
}

sets.magic = {}
sets.magic.nuke = sets.nuke;

sets.magic.acc = set_combine(sets.magic.nuke, {
  ammo = "Hydrocera",
  head = "Carmine Mask +1",
  neck = "Mirage Stole +1",
  ear1 = 'Enchntr. Earring +1',
  waist = "Salire Belt",
  legs = "Assim. Shalwar +2"
})

sets.magic.blu_phys = {
  ammo = "Falcon Eye",
  neck = "Mirage Stole +1",
  ring2 = "Ifrit ring",
  waist = "Prosilio Belt",
  head = "Adhemar bonnet +1",
  body = "Adhemar Jacket",
  hands = "Jhakri Cuffs +2",
  legs = "Jhakri Slops +1",
  feet = "Jhakri Pigaches +2"
}

sets.blu_mag_skill = {
  head = "Mirage Keffiyeh",
  neck = "Mirage Stole +1",
  body = "Assim. Jubbah +2",
  hands = "Hashi. Bazu. +1",
  legs = "Hashishin Tayt +1",
  back = { name="Cornflower Cape", augments={'MP+16','DEX+4','Accuracy+4',}},
  feet = "Luhlaza Charuqs"
}

sets.fastcast = {
  ammo = "Impatiens",
  head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
  neck = "Mirage Stole +1",
  body = "Taeon Tabard",
  hands = "Leyline Gloves",
  legs = "Psycloth Lappas",
  feet = "Taeon Boots",
  ear1 = "Enchntr. Earring +1",
  ear2 = "Loquac. Earring",
  ring1 = "Prolix Ring",
  waist = "Witful Belt",
  back = "Swith Cape"
}
