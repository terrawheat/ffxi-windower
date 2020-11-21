sets.geo_skill = {
  main = 'Solstice',
  sub = 'Sors Shield',
  neck = 'Bagua Charm +1',
  head = 'Azimuth Hood +1',
  hands = 'Geo. Mitaines +2',
  body = 'Bagua Tunic +1',
  legs = 'Azimuth Tights',
  back = 'Lifestream Cape',
  feet = 'Medium\'s Sabots',
  ring1 = 'Stikini Ring',
  ring2 = 'Stikini Ring'
}

sets.dt = {
  feet = 'Azimuth Gaiters +1'
};

sets.idle = {}
sets.idle.luo_active = {
  main = 'Malignance Pole',
  range = 'Dunna',
  head = 'Azimuth Hood +1',
  hands = 'Geo. Mitaines +2',
  body = 'Telchine Chas.',
  neck = 'Bagua Charm +1',
  legs = 'Telchine Braconi',
  feet = 'Telchine Pigaches',
  back = 'Nantosuelta\'s Cape',
  ear1 = 'Etiolation Earring',
  ear2 = 'Ethereal Earring',
  ring1 = 'Dark Ring',
  ring2 = "Warden's Ring"
}

sets.idle.no_luopan = set_combine(sets.idle.luo_active, {
  main = 'Malignance Pole',
  head = 'Befouled Crown',
  body = 'Jhakri Robe +1',
  hands = 'Bagua Mitaines +1',
  legs = 'Assid. Pants +1',
  back = 'Solemnity Cape',
  feet = 'Geo. Sandals +2'
})

sets.idle.luo_active_dt = set_combine(sets.idle.luo_active, {
  head = 'Blistering Sallet +1'
})

sets.precast = {}
sets.precast.base = {
  head = 'Merlinic Hood',
  back = 'Swith Cape',
  waist = 'Witful Belt',
  legs = 'Psycloth Lappas',
  ear1 = "Malignance Earring",
  ear2 = "Loquac. Earring",
  ring1 = 'Prolix Ring',
}

sets.precast.nuke = set_combine(sets.precast.base, {
  hands = 'Bagua Mitaines +1',
  feet = 'Mallquis Clogs +1'
})

sets.precast.cure = set_combine(sets.precast.base, {
  hands = 'Vanya Cuffs',
  body = 'Vanya Robe',
  legs = 'Vanya Slops',
})

sets.precast.debuff = set_combine(sets.precast.base, {

})

sets.cure = {}

sets.cure.base = {
  main = 'Gada',
  sub = 'Sors Shield',
  head = 'Vanya Hood',
  body = 'Vanya Robe',
  hands = 'Vanya Cuffs',
  legs = 'Vanya Slops',
  feet = 'Vanya Clogs',
  back = 'Solemnity Cape'
}

sets.cure.mid = set_combine(sets.cure.base, {})

sets.cure.regen = set_combine(sets.cure.base, {
  body = 'Telchine Chasuble'
})

sets.debuff = {}

sets.debuff.base = {
  main = 'Gada',
  sub = 'Sors Shield',
  head = 'Jhakri Coronal +2',
  neck = 'Bagua Charm +1',
  ear1 = 'Malignance Earring',
  ear2 = 'Enchntr. Earring +1',
  body = 'Jhakri Robe +1',
  hands = 'Jhakri Cuffs +2',
  ring1 = 'Stikini Ring',
  ring2 = 'Metamor. Ring +1',
  back = 'Lifestream Cape',
  legs = 'Psycloth Lappas',
  feet = 'Bagua Sandals +1',
}

sets.ja = {}

sets.ja.life_cycle = {
  head = 'Azimuth Hood +1',
  body = 'Geomancy Tunic +1',
  back = 'Nantosuelta\'s Cape'
}

sets.ja.radial_arcana = {
  feet = 'Bagua Sandals +1',
}

sets.ja.bolster = {
  body = 'Bagua Tunic +1'
}

sets.nuke = {}

sets.nuke.base = {
  main = 'Grioavolr',
  sub = 'Giuoco Grip',
  head = 'Merlinic Hood',
  neck = 'Saevus Pendant +1',
  body = 'Amalric Doublet',
  hands = 'Jhakri Cuffs +2',
  waist = "Penitent's Rope",
  legs = 'Jhakri Slops +1',
  feet = 'Jhakri Pigaches +2',
  back = 'Lifestream Cape',
  ear1 = 'Malignance Earring',
  ear2 = 'Friomisi Earring',
  ring1 = 'Acumen Ring',
  ring2 = 'Metamor. Ring +1'
}

sets.nuke.free_nuke = set_combine(sets.nuke.base, {
  feet = 'Mallquis Clogs +1',
  body = 'Mallquis Saio +1',
  legs = 'Mallquis Trews +1'
})

sets.nuke.dark = set_combine(sets.nuke.base, {
  head = 'Pixie Hairpin +1'
})

sets.nuke.aspir_drain = set_combine(sets.nuke.dark, {

})

sets.tp = {
  main="Malignance Pole",
  head="Jhakri Coronal +2",
  body="Jhakri Robe +1",
  hands="Jhakri Cuffs +2",
  legs="Jhakri Slops +1",
  feet="Jhakri Pigaches +2",
  neck="Sanctity Necklace",
  waist="Windbuffet Belt +1",
  left_ear="Mache Earring +1",
  right_ear="Ethereal Earring",
  left_ring="Petrov Ring",
  right_ring="Rajas Ring",
  back="Solemnity Cape",
}