sets.idle = {
  ear2 = "Infused earring",
  feet = "Pill. Poulaines +1"
}

sets.tp = {
  ammo="Ginsen",
  head="Adhemar Bonnet +1",
  body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
  hands="Adhemar Wristbands",
  legs="Samnuha Tights",
  feet={ name="Herculean Boots", augments={'Attack+17','"Triple Atk."+2','AGI+3','Accuracy+12',}},
  waist="Windbuffet Belt +1",
  left_ear="Mache Earring +1",
  right_ear="Brutal Earring",
  left_ring="Chirich Ring",
  right_ring="Rajas Ring",
  back="Bleating Mantle",
  neck = "Sanctity Necklace"
}

sets.weapon = {}
sets.weapon.indices = {'Damage', 'TH'}
sets.weapon.current = 1;
sets.weapon['Damage'] = {
  main = 'Shijo',
  sub = 'Nibiru Knife'
}

sets.weapon['TH'] = {
  main = 'Shijo',
  sub = 'Sandung'
}

sets.th_active = true
sets.tp_th = set_combine(sets.tp, {
  head = "Wh. Rarab Cap +1",
  feet = "Skulker's Poulaines"
})

sets.dt = {
  head="Meghanada Visor +1",
  body="Meghanada Cuirie",
  hands="Meg. Gloves +1",
  legs={ name="Iuitl Tights +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -4%','Crit.hit rate+1',}},
  feet={ name="Herculean Boots", augments={'Attack+17','"Triple Atk."+2','AGI+3','Accuracy+12',}},
  neck="Twilight Torque",
  left_ring = "Warden's Ring",
  right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%',}},
  back="Solemnity Cape",
}

sets.evisceration = {
  ammo="Falcon Eye",
  head="Pill. Bonnet +2",
  body="Pillager's Vest +1",
  hands="Mummu Wrists",
  legs="Pill. Culottes +1",
  feet="Mummu Gamash. +1",
  neck="Fotia Gorget",
  waist="Fotia Belt",
  left_ear="Mache Earring +1",
  right_ear="Odr Earring",
  left_ring="Mummu Ring",
  right_ring="Ramuh Ring",
  back="Bleating Mantle",
}

sets.exenterator = {
  ammo="Falcon Eye",
  head="Meghanada Visor +1",
  body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
  hands="Meg. Gloves +1",
  legs="Meg. Chausses +1",
  feet="Meg. Jam. +1",
  neck="Fotia Gorget",
  waist="Fotia Belt",
  left_ear="Brutal Earring",
  right_ear="Mache Earring +1",
  left_ring="Karieyh Ring",
  right_ring="Chirich Ring",
  back="Bleating Mantle",
}

sets.mandalic_rudra = {
  ammo="Jukukik Feather",
  head="Meghanada Visor +1",
  body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
  hands="Meg. Gloves +1",
  legs={ name="Herculean Trousers", augments={'Attack+24','Crit. hit damage +1%','DEX+8',}},
  feet="Meg. Jam. +1",
  left_ear="Ishvara Earring",
  right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
  left_ring="Karieyh Ring",
  right_ring="Ramuh Ring",
  back="Bleating Mantle",
}
