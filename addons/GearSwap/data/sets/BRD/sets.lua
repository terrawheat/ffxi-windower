sets.tp = {
  head = 'Aya. Zucchetto',
  hands = 'Aya. Manopolas',
  body = 'Ayanmo Corazza',
  feet = 'Aya. Gambieras +1',
  legs = 'Aya. Cosciales',
  waist = 'Sailfi belt +1',
  ear1 = 'Brutal Earring',
  ear2 = 'Etiolation Earring',
  back = 'Bleating Mantle',
  ring1 = 'Rajas Ring',
  neck = 'Sanctity Necklace'
}

sets.dt = {}

sets.precast = {}

sets.precast.base = {
  main = 'Kali',
  body = 'Inyanga Jubbah +2',
  legs = 'Orvail Pants +1',
  hands = 'Gende. Gages +1',
  ear2 = 'Etiolation Earring',
  waist = 'Embla Sash'
}

sets.precast.song = set_combine(sets.precast.base, {
  head = 'Fili Calot +1',
  ear1 = "Aoidos' Earring",
  feet = 'Telchine Pigaches',
})

sets.midcast = {}

sets.midcast.base = {}

sets.midcast.song = {}
sets.midcast.spell = {}

sets.midcast.song.base = set_combine(sets.midcast.base, {
  main = 'Kali',
  range = 'Gjallarhorn',
  head = 'Fili Calot +1',
  neck = 'Moonbow Whistle',
  hands = 'Fili Manchettes',
  body = "Fili Hongreline +1",
  legs = 'Inyanga Shalwar +1',
  feet = 'Brioso Slippers +2'
})

sets.midcast.song.ballad = set_combine(sets.midcast.song.base, {
  range = 'Blurred Harp +1',
  legs = 'Fili Rhingrave +1'
})

sets.midcast.song.minne = set_combine(sets.midcast.song.base, {

})

sets.midcast.song.carol = set_combine(sets.midcast.song.base, {
  hands = 'Mousai Gages',
})

sets.midcast.song.mambo = set_combine(sets.midcast.song.base, {
  feet = 'Mousai Crackows',
})

sets.midcast.song.carol = set_combine(sets.midcast.song.base, {
  head = 'Mousai Turban',
})

sets.midcast.song.paeon = set_combine(sets.midcast.song.base, {
  range = 'Blurred Harp +1',
  legs = 'Brioso Roundlet +1'
})

sets.midcast.song.scherzo = set_combine(sets.midcast.song.base, {
  feet = 'Fili Cothurnes +1'
})

sets.midcast.song.debuff = set_combine(sets.midcast.song.base, {
  head = 'Inyanga Tiara +1',
  hands = 'Inyanga Dastanas +1',
  body = 'Inyanga Jubbah +2',
  feet = 'Inyanga Crackows +1',
  legs = 'Inyanga Shalwar +1',
})

sets.midcast.song.lullaby = set_combine(sets.midcast.song.debuff, {
  range = 'Blurred Harp +1',
  hands = 'Brioso Cuffs +2',
  feet = 'Brioso Slippers +2'
})

sets.midcast.song.threnody = set_combine(sets.midcast.song.debuff, {
  body = 'Mousai Manteel'
})

sets.midcast.spell.base = {}
sets.midcast.spell.enhancing = set_combine(sets.midcast.spell.base, {
  feet = 'Telchine Pigaches',
})

sets.midcast.spell.aquaveil = set_combine(sets.midcast.spell.enhancing, {
  head = 'Chironic Hat'
})

sets.midcast.spell.bar = set_combine(sets.midcast.spell.enhancing, {
  main = 'Pukulatmuj +1',
})

sets.idle = {
  main = 'Kali',
  head = 'Inyanga Tiara +1',
  body = 'Inyanga Jubbah +2',
  hands = 'Gende. Gages +1',
  feet = 'Fili Cothurnes +1',
  ear1 = 'Infused Earring',
  ear2 = 'Etiolation Earring',
  ring1 = 'Ayanmo Ring',
  ring2 = 'Setae Ring',
  back="Intarabus's Cape"
}

sets.domain_invasion = {
  head = 'Angantyr Beret',
  body = 'Angantyr Robe',
  hands = 'Angantyr Mittens',
  legs = 'Angantyr Tights',
  feet = 'Angantyr Boots',
}